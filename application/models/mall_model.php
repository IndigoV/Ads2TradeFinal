<?php

/**
 * Created by PhpStorm.
 * User: keith
 * Date: 2015/01/18
 * Time: 6:19
 */
class Mall_model extends CI_Model {

	public function __construct() {
		parent::__construct();

	}

	public function load($id, $user_id) {

		//Retrieve the mall data first
		$result = array();
		$sql = 'SELECT Mall.* FROM mall Mall WHERE Mall.mall_id = ? AND Mall.user_id = ?';
		$mall_query = $this->db->query($sql, array($id, $user_id));
		if ($mall_query->num_rows() > 0) {
			$row = $mall_query->row();
			$result['id'] = $row->mall_id;
			$result['name'] = $row->mall_name;
			$result['latitude'] = $row->mall_latitude;
			$result['longitude'] = $row->mall_longitude;
			$result['levels'] = array();

		} else {
			return $result;
		}

		//Now retrieve the levels for the mall
		$sql = 'SELECT MallLevel.* FROM mall_levels MallLevel WHERE MallLevel.mall_id = ?';
		$level_query = $this->db->query($sql, array($result['id']));

		if ($level_query->num_rows() > 0) {
			foreach ($level_query->result_array() as $row) {
				$result['levels'][$row['mall_level_id']] = array(
					'id'                => $row['mall_level_id'],
					'floor_description' => $row['mall_level_description'],
					'floor_name'        => $row['mall_level_floor_name'],
					'floor_number'      => $row['mall_level_floor_number'],
					'image_url'         => $row['mall_level_image_url'],
					'assets'            => array()
				);
			}
		} else {
			return $result;
		}


		//Now retrieve and insert the assets for the mall on each level
		$level_ids = array_keys($result['levels']);
		$assets = $this->get_assets($level_ids);
		foreach ($assets as $row) {
			$level_id = $row['mall_level_id'];
			$result['levels'][$level_id]['assets'][] = array(
				'id'       => $row['mall_level_asset_id'],
				'asset_id' => $row['asset_id'],
				'x'        => $row['mall_level_asset_x_coordinate'],
				'y'        => $row['mall_level_asset_y_coordinate']
			);
		}
		return $result;
	}

	public function save_mall($data, $user_id) {
		$result = array(
			'id'       => false,
			'success'  => false,
			'messages' => array(),
			'data'     => array()
		);
		if (empty($data)) {
			$result['messages'][] = 'Please submit data.';
			return $result;
		}

		$mall_data = array();
		if (array_key_exists('mall', $data)) {
			$mall_data = $data['mall'];
		}
		if (empty($mall_data)) {
			$result['messages'][] = 'Please submit valid mall data.';
			return $result;
		}

		$this->db->trans_start();
		$levels = $mall_data['levels'];
		unset($mall_data['levels']);
		if (array_key_exists('mall_id', $mall_data) && $mall_data['mall_id'] > 0) {
			//We're updating
			$result['id'] = $mall_data['mall_id'];
			$this->db->where('mall_id', $mall_data['mall_id']);
			$result['success'] = $this->db->update('mall', $mall_data);
		} else {
			unset($mall_data['mall_id']);
			$mall_data['user_id'] = $user_id;
			$result['success'] = $this->db->insert('mall', $mall_data);
			$result['id'] = $this->db->insert_id();

		}


		if ($result['success']) {
			foreach ($levels as $key => $level) {
				$levels[$key]['mall_id'] = $result['id'];
			}
			$this->save_levels($levels);
		}

		if ($this->db->trans_status() === FALSE) {
			$this->db->trans_rollback();
		} else {
			$this->db->trans_commit();
			$result['data'] = $this->load($result['id'], $user_id);
		}
		return $result;
	}

	public function save_levels($levels) {
		foreach ($levels as $level) {

			$assets = $level['assets'];
			unset($level['assets']);
			if (array_key_exists('mall_level_id', $level) && $level['mall_level_id'] > 0) {
				//Update
				$mall_level_id = $level['mall_level_id'];
				$this->db->where('mall_level_id', $level['mall_level_id']);
				$this->db->update('mall_levels', $level);
			} else {
				//Insert
				$this->db->insert('mall_levels', $level);
				$mall_level_id = $this->db->insert_id();
			}
			//Now insert the assets
			foreach ($assets as $key => $asset) {
				$assets[$key]['mall_level_id'] = $mall_level_id;
			}
			$this->save_assets($assets);

		}
	}

	public function save_assets($assets) {
		foreach ($assets as $asset) {
			if (array_key_exists('mall_level_asset_id', $asset) && $asset['mall_level_asset_id'] > 0) {
				//Update
				$this->db->where('mall_level_asset_id', $asset['mall_level_asset_id']);
				$this->db->update('mall_level_asset', $asset);
			} else {
				$this->db->insert('mall_level_asset', $asset);
			}
		}
	}

	public function get_assets($level_ids, $field = false) {
		$assets = array();
		$level_ids = (array)$level_ids;
		$this->db->where_in('mall_level_id', $level_ids);
		$query = $this->db->get('mall_level_asset');
		if ($query->num_rows() > 0) {
			foreach ($query->result_array() as $row) {
				if ($field !== false) {
					if (array_key_exists($field, $row)) {
						$assets[] = $row[$field];
					}
				} else {
					$assets[] = $row;
				}
			}
		}
		return $assets;
	}

	public function get_assets_for_mall_id($level_ids, $field = false) {
		$assets = array();
		$level_ids = (array)$level_ids;
		$this->db->where_in('mall_level_id', $level_ids);
		$query = $this->db->get('mall_level_asset');
		if ($query->num_rows() > 0) {
			foreach ($query->result_array() as $row) {
				if ($field !== false) {
					if (array_key_exists($field, $row)) {
						$assets[] = $row[$field];
					}
				} else {
					$assets[] = $row;
				}
			}
		}
		return $assets;
	}

	/**
	 * First delete all the assets for all the levels
	 * Now delete all the levels
	 * @param $levels
	 */
	public function delete_levels($levels) {
		$levels = (array)$levels;
		$this->db->where_in('mall_level_id', $levels);
		$this->db->delete('mall_level_asset');

		$this->db->where_in('mall_level_id', $levels);
		$this->db->delete('mall_levels');
		return true;
	}

	/**
	 * Delete the assets
	 * @param $assets
	 * @return bool
	 */
	public function delete_assets($assets) {
		$assets = (array)$assets;
		if (!empty($assets)) {
			$this->db->where_in('mall_level_asset_id', $assets);
			return $this->db->delete('mall_level_asset');
		}
		return false;


	}
}