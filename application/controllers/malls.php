<?php
/**
 * User: Locotec
 * Date: 2015/01/17
 * Time: 6:16
 */

class Malls extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->load->model('messages_model'); //Already autoloaded in Events library
		$this->load->model('Mall_model', 'Mall', true);
		$this->load->model('assets', 'Asset');
		$this->load->model('duration');
	}

	public function index() {
		$user_id = $this->session->userdata('user_id');
		$query = $this->Mall->db->get_where('mall', array('user_id' => $user_id));
		$asset['asset'] = $this->assets->getAssetByuserId($user_id, 1); //get only malls
		$malls = array();
		foreach ($query->result_array() as $row) {
			$malls[] = $row;
		}
		$this->layouts->view('auction/index', null, array_merge(compact('malls'),$asset),false);
	}
	
	public function mall($mall_id = false) {
		$user_id = $this->session->userdata('user_id');

		//$mall_assets = $this->Asset->getMallAssets();
		$is_mall = 0; //only get assets that themselves are not the actual mall
		$mall_assets = $this->Asset->getAllAsset($user_id, $is_mall);
		$data['durations'] = $this->duration->getDudarion();
		if (!$mall_assets) {
			$mall_assets = array();
		}
		$view_data = array(
			'assets' => $mall_assets,
			'mall_id' => $mall_id
		);
		//print_r($view_data); exit;
		$this->layouts->view('malls/mall', null, array_merge($view_data, $data));
	}

	public function json_load($id) {
		$user_id = $this->session->userdata('user_id');
		$mall = $this->Mall->load($id, $user_id);
		echo json_encode($mall);
		die();
	}

	/**
	 * Add or edit mall
	 * @param bool $id
	 */
	public function json_save_mall() {
		$user_id = $this->session->userdata('user_id');
		$data = $this->input->post();
		$result = array(
		);
		if (!empty($data)) {
			//Store the mall
			if (!empty($data['mall'])) {
				$result = $this->Mall->save_mall($data, $user_id);
			}
		}
		echo json_encode($result);
		die();
	}

	public function json_delete_asset($asset_id) {
		$result = array(
			'success' => $this->Mall->delete_assets($asset_id),
		);
		echo json_encode($result);
		die();
	}

	public function json_delete_level($level_id) {
		$result = array(
			'success' => $this->Mall->delete_levels($level_id),
	);
		echo json_encode($result);
		die();
	}

	public function upload_mall_image() {
		$files = array();
		$result = array(
			'id' => 0,//mall_level id
			'image_url' => ''
		);
		if (!empty($_FILES)) {
			$files = $this->formatPostFiles($_FILES['file']);
		}
		$dest_path = FCPATH . '/assets/mall/upload/';

		foreach ($files as $file) {
			$pathinfo = pathinfo($file['name']);
			do {
				$unique_filename = uniqid() . '.' . $pathinfo['extension'];
				$full_filename = $dest_path . $unique_filename;

			}while (file_exists($full_filename));

			move_uploaded_file($file['tmp_name'], $full_filename);
			$result['image_url'] = $unique_filename;
		}
		echo json_encode($result);


	}

	private function formatPostFiles($file_post)
	{
		$files = array();
		$file_count = count($file_post['name']);
		$file_keys = array_keys($file_post);

		for ($i = 0; $i < $file_count; $i++) {
			foreach ($file_keys as $key) {
				$files[$i][$key] = $file_post[$key][$i];
			}
		}

		return $files;
	}
}
