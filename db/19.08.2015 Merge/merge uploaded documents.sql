ALTER table uploaded_documents
ADD `upd_date`  timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP;