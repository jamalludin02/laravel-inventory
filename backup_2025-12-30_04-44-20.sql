-- Database Backup: laravel_inventory
-- Date: 2025-12-30 04:44:20



CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `activity_log` VALUES('1','default','created','App\\Models\\Satuan','created','1',NULL,NULL,'{\"attributes\": {\"id\": 1, \"satuan\": \"KRT\", \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:05.000000Z\", \"updated_at\": \"2025-12-29T08:10:05.000000Z\"}}',NULL,'2025-12-29 08:10:05','2025-12-29 08:10:05');
INSERT INTO `activity_log` VALUES('2','default','created','App\\Models\\Satuan','created','2',NULL,NULL,'{\"attributes\": {\"id\": 2, \"satuan\": \"PAK\", \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:05.000000Z\", \"updated_at\": \"2025-12-29T08:10:05.000000Z\"}}',NULL,'2025-12-29 08:10:05','2025-12-29 08:10:05');
INSERT INTO `activity_log` VALUES('3','default','created','App\\Models\\Satuan','created','3',NULL,NULL,'{\"attributes\": {\"id\": 3, \"satuan\": \"PCS\", \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:05.000000Z\", \"updated_at\": \"2025-12-29T08:10:05.000000Z\"}}',NULL,'2025-12-29 08:10:06','2025-12-29 08:10:06');
INSERT INTO `activity_log` VALUES('4','default','created','App\\Models\\Jenis','created','1',NULL,NULL,'{\"attributes\": {\"id\": 1, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:06.000000Z\", \"updated_at\": \"2025-12-29T08:10:06.000000Z\", \"jenis_barang\": \"KACANG\"}}',NULL,'2025-12-29 08:10:06','2025-12-29 08:10:06');
INSERT INTO `activity_log` VALUES('5','default','created','App\\Models\\Barang','created','1',NULL,NULL,'{\"attributes\": {\"id\": 1, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 1, \"deskripsi\": \"DUA KELINCI KC KULIT\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:06.000000Z\", \"updated_at\": \"2025-12-29T08:10:06.000000Z\", \"kode_barang\": \"BRG-00001\", \"nama_barang\": \"DUA KELINCI KC KULIT\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:06','2025-12-29 08:10:06');
INSERT INTO `activity_log` VALUES('6','default','created','App\\Models\\Jenis','created','2',NULL,NULL,'{\"attributes\": {\"id\": 2, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:06.000000Z\", \"updated_at\": \"2025-12-29T08:10:06.000000Z\", \"jenis_barang\": \"KACANG BERSALUT\"}}',NULL,'2025-12-29 08:10:06','2025-12-29 08:10:06');
INSERT INTO `activity_log` VALUES('7','default','created','App\\Models\\Barang','created','2',NULL,NULL,'{\"attributes\": {\"id\": 2, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"DUA KELINCI BIJIAN\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:06.000000Z\", \"updated_at\": \"2025-12-29T08:10:06.000000Z\", \"kode_barang\": \"BRG-00002\", \"nama_barang\": \"DUA KELINCI BIJIAN\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:06','2025-12-29 08:10:06');
INSERT INTO `activity_log` VALUES('8','default','created','App\\Models\\Barang','created','3',NULL,NULL,'{\"attributes\": {\"id\": 3, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"SUKRO REGULER\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:07.000000Z\", \"updated_at\": \"2025-12-29T08:10:07.000000Z\", \"kode_barang\": \"BRG-00003\", \"nama_barang\": \"SUKRO REGULER\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:07','2025-12-29 08:10:07');
INSERT INTO `activity_log` VALUES('9','default','created','App\\Models\\Barang','created','4',NULL,NULL,'{\"attributes\": {\"id\": 4, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"SUKRO OVEN\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:07.000000Z\", \"updated_at\": \"2025-12-29T08:10:07.000000Z\", \"kode_barang\": \"BRG-00004\", \"nama_barang\": \"SUKRO OVEN\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:07','2025-12-29 08:10:07');
INSERT INTO `activity_log` VALUES('10','default','created','App\\Models\\Jenis','created','3',NULL,NULL,'{\"attributes\": {\"id\": 3, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:07.000000Z\", \"updated_at\": \"2025-12-29T08:10:07.000000Z\", \"jenis_barang\": \"WAFER\"}}',NULL,'2025-12-29 08:10:07','2025-12-29 08:10:07');
INSERT INTO `activity_log` VALUES('11','default','created','App\\Models\\Barang','created','5',NULL,NULL,'{\"attributes\": {\"id\": 5, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 3, \"deskripsi\": \"DEKA\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:07.000000Z\", \"updated_at\": \"2025-12-29T08:10:07.000000Z\", \"kode_barang\": \"BRG-00005\", \"nama_barang\": \"DEKA\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:07','2025-12-29 08:10:07');
INSERT INTO `activity_log` VALUES('12','default','created','App\\Models\\Jenis','created','4',NULL,NULL,'{\"attributes\": {\"id\": 4, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:08.000000Z\", \"updated_at\": \"2025-12-29T08:10:08.000000Z\", \"jenis_barang\": \"SNACK\"}}',NULL,'2025-12-29 08:10:08','2025-12-29 08:10:08');
INSERT INTO `activity_log` VALUES('13','default','created','App\\Models\\Barang','created','6',NULL,NULL,'{\"attributes\": {\"id\": 6, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 4, \"deskripsi\": \"TIC TAC\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:08.000000Z\", \"updated_at\": \"2025-12-29T08:10:08.000000Z\", \"kode_barang\": \"BRG-00006\", \"nama_barang\": \"TIC TAC\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:08','2025-12-29 08:10:08');
INSERT INTO `activity_log` VALUES('14','default','created','App\\Models\\Barang','created','7',NULL,NULL,'{\"attributes\": {\"id\": 7, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 4, \"deskripsi\": \"PILUS\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:08.000000Z\", \"updated_at\": \"2025-12-29T08:10:08.000000Z\", \"kode_barang\": \"BRG-00007\", \"nama_barang\": \"PILUS\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:08','2025-12-29 08:10:08');
INSERT INTO `activity_log` VALUES('15','default','created','App\\Models\\Jenis','created','5',NULL,NULL,'{\"attributes\": {\"id\": 5, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:08.000000Z\", \"updated_at\": \"2025-12-29T08:10:08.000000Z\", \"jenis_barang\": \"EKSTRUDER SNACK\"}}',NULL,'2025-12-29 08:10:08','2025-12-29 08:10:08');
INSERT INTO `activity_log` VALUES('16','default','created','App\\Models\\Barang','created','8',NULL,NULL,'{\"attributes\": {\"id\": 8, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 5, \"deskripsi\": \"RONI\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"kode_barang\": \"BRG-00008\", \"nama_barang\": \"RONI\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:09','2025-12-29 08:10:09');
INSERT INTO `activity_log` VALUES('17','default','created','App\\Models\\Barang','created','9',NULL,NULL,'{\"attributes\": {\"id\": 9, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 1, \"deskripsi\": \"SUPER NUT (N/A)\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"kode_barang\": \"BRG-00009\", \"nama_barang\": \"SUPER NUT (N/A)\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:09','2025-12-29 08:10:09');
INSERT INTO `activity_log` VALUES('18','default','created','App\\Models\\Jenis','created','6',NULL,NULL,'{\"attributes\": {\"id\": 6, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"jenis_barang\": \"BEVERAGE\"}}',NULL,'2025-12-29 08:10:09','2025-12-29 08:10:09');
INSERT INTO `activity_log` VALUES('19','default','created','App\\Models\\Barang','created','10',NULL,NULL,'{\"attributes\": {\"id\": 10, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 6, \"deskripsi\": \"SIR JUS (N/A)\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"kode_barang\": \"BRG-00010\", \"nama_barang\": \"SIR JUS (N/A)\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:09','2025-12-29 08:10:09');
INSERT INTO `activity_log` VALUES('20','default','created','App\\Models\\Jenis','created','7',NULL,NULL,'{\"attributes\": {\"id\": 7, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"jenis_barang\": \"CHIPS\"}}',NULL,'2025-12-29 08:10:10','2025-12-29 08:10:10');
INSERT INTO `activity_log` VALUES('21','default','created','App\\Models\\Barang','created','11',NULL,NULL,'{\"attributes\": {\"id\": 11, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 7, \"deskripsi\": \"KRIP KRIP\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:10.000000Z\", \"updated_at\": \"2025-12-29T08:10:10.000000Z\", \"kode_barang\": \"BRG-00011\", \"nama_barang\": \"KRIP KRIP\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:10','2025-12-29 08:10:10');
INSERT INTO `activity_log` VALUES('22','default','created','App\\Models\\Barang','created','12',NULL,NULL,'{\"attributes\": {\"id\": 12, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 7, \"deskripsi\": \"TOS TOS\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:10.000000Z\", \"updated_at\": \"2025-12-29T08:10:10.000000Z\", \"kode_barang\": \"BRG-00012\", \"nama_barang\": \"TOS TOS\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:10','2025-12-29 08:10:10');
INSERT INTO `activity_log` VALUES('23','default','created','App\\Models\\Barang','created','13',NULL,NULL,'{\"attributes\": {\"id\": 13, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 4, \"deskripsi\": \"USAGI\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:10.000000Z\", \"updated_at\": \"2025-12-29T08:10:10.000000Z\", \"kode_barang\": \"BRG-00013\", \"nama_barang\": \"USAGI\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:10','2025-12-29 08:10:10');
INSERT INTO `activity_log` VALUES('24','default','created','App\\Models\\Barang','created','14',NULL,NULL,'{\"attributes\": {\"id\": 14, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 5, \"deskripsi\": \"TATO TATO\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:10.000000Z\", \"updated_at\": \"2025-12-29T08:10:10.000000Z\", \"kode_barang\": \"BRG-00014\", \"nama_barang\": \"TATO TATO\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:10','2025-12-29 08:10:10');
INSERT INTO `activity_log` VALUES('25','default','created','App\\Models\\Barang','created','15',NULL,NULL,'{\"attributes\": {\"id\": 15, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 5, \"deskripsi\": \"KREZO TWIST\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"kode_barang\": \"BRG-00015\", \"nama_barang\": \"KREZO TWIST\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:11','2025-12-29 08:10:11');
INSERT INTO `activity_log` VALUES('26','default','created','App\\Models\\Jenis','created','8',NULL,NULL,'{\"attributes\": {\"id\": 8, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"jenis_barang\": \"NOODLE SNACK\"}}',NULL,'2025-12-29 08:10:11','2025-12-29 08:10:11');
INSERT INTO `activity_log` VALUES('27','default','created','App\\Models\\Barang','created','16',NULL,NULL,'{\"attributes\": {\"id\": 16, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 8, \"deskripsi\": \"KREZO MIE\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"kode_barang\": \"BRG-00016\", \"nama_barang\": \"KREZO MIE\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:11','2025-12-29 08:10:11');
INSERT INTO `activity_log` VALUES('28','default','created','App\\Models\\Jenis','created','9',NULL,NULL,'{\"attributes\": {\"id\": 9, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"jenis_barang\": \"SEASONAL\"}}',NULL,'2025-12-29 08:10:11','2025-12-29 08:10:11');
INSERT INTO `activity_log` VALUES('29','default','created','App\\Models\\Barang','created','17',NULL,NULL,'{\"attributes\": {\"id\": 17, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 9, \"deskripsi\": \"SEASONAL\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"kode_barang\": \"BRG-00017\", \"nama_barang\": \"SEASONAL\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:12','2025-12-29 08:10:12');
INSERT INTO `activity_log` VALUES('30','default','created','App\\Models\\Barang','created','18',NULL,NULL,'{\"attributes\": {\"id\": 18, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"ATOM PILUS (N/A)\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:12.000000Z\", \"updated_at\": \"2025-12-29T08:10:12.000000Z\", \"kode_barang\": \"BRG-00018\", \"nama_barang\": \"ATOM PILUS (N/A)\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:12','2025-12-29 08:10:12');
INSERT INTO `activity_log` VALUES('31','default','created','App\\Models\\Barang','created','19',NULL,NULL,'{\"attributes\": {\"id\": 19, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"KATOM (N/A)\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:12.000000Z\", \"updated_at\": \"2025-12-29T08:10:12.000000Z\", \"kode_barang\": \"BRG-00019\", \"nama_barang\": \"KATOM (N/A)\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:12','2025-12-29 08:10:12');
INSERT INTO `activity_log` VALUES('32','default','created','App\\Models\\Jenis','created','10',NULL,NULL,'{\"attributes\": {\"id\": 10, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:12.000000Z\", \"updated_at\": \"2025-12-29T08:10:12.000000Z\", \"jenis_barang\": \"BIJI BIJIAN\"}}',NULL,'2025-12-29 08:10:12','2025-12-29 08:10:12');
INSERT INTO `activity_log` VALUES('33','default','created','App\\Models\\Barang','created','20',NULL,NULL,'{\"attributes\": {\"id\": 20, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 10, \"deskripsi\": \"FUZO\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:12.000000Z\", \"updated_at\": \"2025-12-29T08:10:12.000000Z\", \"kode_barang\": \"BRG-00020\", \"nama_barang\": \"FUZO\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:13','2025-12-29 08:10:13');
INSERT INTO `activity_log` VALUES('34','default','created','App\\Models\\Jenis','created','11',NULL,NULL,'{\"attributes\": {\"id\": 11, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:13.000000Z\", \"updated_at\": \"2025-12-29T08:10:13.000000Z\", \"jenis_barang\": \"PROMOSI\"}}',NULL,'2025-12-29 08:10:13','2025-12-29 08:10:13');
INSERT INTO `activity_log` VALUES('35','default','created','App\\Models\\Barang','created','21',NULL,NULL,'{\"attributes\": {\"id\": 21, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 11, \"deskripsi\": \"PROMOSI\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:13.000000Z\", \"updated_at\": \"2025-12-29T08:10:13.000000Z\", \"kode_barang\": \"BRG-00021\", \"nama_barang\": \"PROMOSI\", \"stok_minimum\": 10}}',NULL,'2025-12-29 08:10:13','2025-12-29 08:10:13');
INSERT INTO `activity_log` VALUES('36','default','created','App\\Models\\Order','created','1','App\\Models\\User','5','{\"attributes\": {\"status\": \"draft\", \"order_no\": \"ORD-20251229001\", \"order_date\": \"2025-12-29\", \"customer_id\": 2, \"total_amount\": \"0.00\"}}',NULL,'2025-12-29 08:18:00','2025-12-29 08:18:00');
INSERT INTO `activity_log` VALUES('37','default','created','App\\Models\\OrderDetail','created','1','App\\Models\\User','5','{\"attributes\": {\"order_id\": 1, \"quantity\": 7, \"barang_id\": 1, \"unit_price\": \"50250.00\", \"total_price\": \"351750.00\"}}',NULL,'2025-12-29 08:18:00','2025-12-29 08:18:00');
INSERT INTO `activity_log` VALUES('38','default','created','App\\Models\\OrderDetail','created','2','App\\Models\\User','5','{\"attributes\": {\"order_id\": 1, \"quantity\": 6, \"barang_id\": 2, \"unit_price\": \"67500.00\", \"total_price\": \"405000.00\"}}',NULL,'2025-12-29 08:18:00','2025-12-29 08:18:00');
INSERT INTO `activity_log` VALUES('39','default','created','App\\Models\\OrderDetail','created','3','App\\Models\\User','5','{\"attributes\": {\"order_id\": 1, \"quantity\": 9, \"barang_id\": 3, \"unit_price\": \"73500.00\", \"total_price\": \"661500.00\"}}',NULL,'2025-12-29 08:18:00','2025-12-29 08:18:00');
INSERT INTO `activity_log` VALUES('40','default','created','App\\Models\\OrderDetail','created','4','App\\Models\\User','5','{\"attributes\": {\"order_id\": 1, \"quantity\": 10, \"barang_id\": 4, \"unit_price\": \"58000.00\", \"total_price\": \"580000.00\"}}',NULL,'2025-12-29 08:18:00','2025-12-29 08:18:00');
INSERT INTO `activity_log` VALUES('41','default','updated','App\\Models\\Order','updated','1','App\\Models\\User','5','{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"1998250.00\"}}',NULL,'2025-12-29 08:18:00','2025-12-29 08:18:00');
INSERT INTO `activity_log` VALUES('42','default','updated','App\\Models\\Order','updated','1','App\\Models\\User','5','{\"old\": {\"status\": \"draft\"}, \"attributes\": {\"status\": \"post\"}}',NULL,'2025-12-29 08:18:07','2025-12-29 08:18:07');
INSERT INTO `activity_log` VALUES('43','default','updated','App\\Models\\Order','updated','1','App\\Models\\User','3','{\"old\": {\"status\": \"post\"}, \"attributes\": {\"status\": \"confirmed\"}}',NULL,'2025-12-29 09:50:03','2025-12-29 09:50:03');
INSERT INTO `activity_log` VALUES('44','default','updated','App\\Models\\OrderDetail','updated','1','App\\Models\\User','4','{\"old\": {\"quantity\": 7, \"total_price\": \"351750.00\"}, \"attributes\": {\"quantity\": 5, \"total_price\": \"251250.00\"}}',NULL,'2025-12-29 09:55:23','2025-12-29 09:55:23');
INSERT INTO `activity_log` VALUES('45','default','updated','App\\Models\\Order','updated','1','App\\Models\\User','4','{\"old\": {\"total_amount\": \"1998250.00\"}, \"attributes\": {\"total_amount\": \"1897750.00\"}}',NULL,'2025-12-29 09:55:23','2025-12-29 09:55:23');
INSERT INTO `activity_log` VALUES('46','default','updated','App\\Models\\Order','updated','1','App\\Models\\User','4','{\"old\": {\"status\": \"confirmed\"}, \"attributes\": {\"status\": \"shipped\"}}',NULL,'2025-12-29 09:56:20','2025-12-29 09:56:20');
INSERT INTO `activity_log` VALUES('47','default','created','App\\Models\\BarangKeluar','created','1','App\\Models\\User','4','{\"attributes\": {\"id\": 1, \"user_id\": 4, \"order_no\": \"ORD-20251229001\", \"created_at\": \"2025-12-29T09:56:21.000000Z\", \"updated_at\": \"2025-12-29T09:56:21.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI KC KULIT\", \"jumlah_keluar\": 5, \"kode_transaksi\": \"TRX-OUT-2025-12-29-9594\", \"tanggal_keluar\": \"2025-12-29\"}}',NULL,'2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `activity_log` VALUES('48','default','updated','App\\Models\\Barang','updated','1','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:06.000000Z\"}, \"attributes\": {\"stok\": 25, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}}',NULL,'2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `activity_log` VALUES('49','default','created','App\\Models\\BarangKeluar','created','2','App\\Models\\User','4','{\"attributes\": {\"id\": 2, \"user_id\": 4, \"order_no\": \"ORD-20251229001\", \"created_at\": \"2025-12-29T09:56:21.000000Z\", \"updated_at\": \"2025-12-29T09:56:21.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI BIJIAN\", \"jumlah_keluar\": 6, \"kode_transaksi\": \"TRX-OUT-2025-12-29-5748\", \"tanggal_keluar\": \"2025-12-29\"}}',NULL,'2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `activity_log` VALUES('50','default','updated','App\\Models\\Barang','updated','2','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:06.000000Z\"}, \"attributes\": {\"stok\": 24, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}}',NULL,'2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `activity_log` VALUES('51','default','created','App\\Models\\BarangKeluar','created','3','App\\Models\\User','4','{\"attributes\": {\"id\": 3, \"user_id\": 4, \"order_no\": \"ORD-20251229001\", \"created_at\": \"2025-12-29T09:56:21.000000Z\", \"updated_at\": \"2025-12-29T09:56:21.000000Z\", \"customer_id\": 2, \"nama_barang\": \"SUKRO REGULER\", \"jumlah_keluar\": 9, \"kode_transaksi\": \"TRX-OUT-2025-12-29-2089\", \"tanggal_keluar\": \"2025-12-29\"}}',NULL,'2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `activity_log` VALUES('52','default','updated','App\\Models\\Barang','updated','3','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:07.000000Z\"}, \"attributes\": {\"stok\": 21, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}}',NULL,'2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `activity_log` VALUES('53','default','created','App\\Models\\BarangKeluar','created','4','App\\Models\\User','4','{\"attributes\": {\"id\": 4, \"user_id\": 4, \"order_no\": \"ORD-20251229001\", \"created_at\": \"2025-12-29T09:56:21.000000Z\", \"updated_at\": \"2025-12-29T09:56:21.000000Z\", \"customer_id\": 2, \"nama_barang\": \"SUKRO OVEN\", \"jumlah_keluar\": 10, \"kode_transaksi\": \"TRX-OUT-2025-12-29-2039\", \"tanggal_keluar\": \"2025-12-29\"}}',NULL,'2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `activity_log` VALUES('54','default','updated','App\\Models\\Barang','updated','4','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:07.000000Z\"}, \"attributes\": {\"stok\": 20, \"updated_at\": \"2025-12-29T09:56:22.000000Z\"}}',NULL,'2025-12-29 09:56:22','2025-12-29 09:56:22');
INSERT INTO `activity_log` VALUES('55','default','created','App\\Models\\Order','created','2','App\\Models\\User','5','{\"attributes\": {\"status\": \"draft\", \"order_no\": \"ORD-20251230001\", \"order_date\": \"2025-12-30\", \"customer_id\": 2, \"total_amount\": \"0.00\"}}',NULL,'2025-12-30 03:39:13','2025-12-30 03:39:13');
INSERT INTO `activity_log` VALUES('56','default','created','App\\Models\\OrderDetail','created','5','App\\Models\\User','5','{\"attributes\": {\"order_id\": 2, \"quantity\": 5, \"barang_id\": 1, \"unit_price\": \"50250.00\", \"total_price\": \"251250.00\"}}',NULL,'2025-12-30 03:39:13','2025-12-30 03:39:13');
INSERT INTO `activity_log` VALUES('57','default','created','App\\Models\\OrderDetail','created','6','App\\Models\\User','5','{\"attributes\": {\"order_id\": 2, \"quantity\": 7, \"barang_id\": 3, \"unit_price\": \"73500.00\", \"total_price\": \"514500.00\"}}',NULL,'2025-12-30 03:39:13','2025-12-30 03:39:13');
INSERT INTO `activity_log` VALUES('58','default','created','App\\Models\\OrderDetail','created','7','App\\Models\\User','5','{\"attributes\": {\"order_id\": 2, \"quantity\": 6, \"barang_id\": 20, \"unit_price\": \"75500.00\", \"total_price\": \"453000.00\"}}',NULL,'2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `activity_log` VALUES('59','default','created','App\\Models\\OrderDetail','created','8','App\\Models\\User','5','{\"attributes\": {\"order_id\": 2, \"quantity\": 4, \"barang_id\": 18, \"unit_price\": \"72000.00\", \"total_price\": \"288000.00\"}}',NULL,'2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `activity_log` VALUES('60','default','created','App\\Models\\OrderDetail','created','9','App\\Models\\User','5','{\"attributes\": {\"order_id\": 2, \"quantity\": 2, \"barang_id\": 2, \"unit_price\": \"67500.00\", \"total_price\": \"135000.00\"}}',NULL,'2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `activity_log` VALUES('61','default','created','App\\Models\\OrderDetail','created','10','App\\Models\\User','5','{\"attributes\": {\"order_id\": 2, \"quantity\": 8, \"barang_id\": 1, \"unit_price\": \"50250.00\", \"total_price\": \"402000.00\"}}',NULL,'2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `activity_log` VALUES('62','default','created','App\\Models\\OrderDetail','created','11','App\\Models\\User','5','{\"attributes\": {\"order_id\": 2, \"quantity\": 7, \"barang_id\": 16, \"unit_price\": \"54000.00\", \"total_price\": \"378000.00\"}}',NULL,'2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `activity_log` VALUES('63','default','updated','App\\Models\\Order','updated','2','App\\Models\\User','5','{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"2421750.00\"}}',NULL,'2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `activity_log` VALUES('64','default','updated','App\\Models\\Order','updated','2','App\\Models\\User','5','{\"old\": {\"status\": \"draft\"}, \"attributes\": {\"status\": \"post\"}}',NULL,'2025-12-30 03:39:20','2025-12-30 03:39:20');
INSERT INTO `activity_log` VALUES('65','default','updated','App\\Models\\Order','updated','2','App\\Models\\User','3','{\"old\": {\"status\": \"post\"}, \"attributes\": {\"status\": \"confirmed\"}}',NULL,'2025-12-30 03:45:32','2025-12-30 03:45:32');
INSERT INTO `activity_log` VALUES('66','default','updated','App\\Models\\Order','updated','2','App\\Models\\User','4','{\"old\": {\"status\": \"confirmed\"}, \"attributes\": {\"status\": \"shipped\"}}',NULL,'2025-12-30 04:05:16','2025-12-30 04:05:16');
INSERT INTO `activity_log` VALUES('67','default','created','App\\Models\\BarangKeluar','created','5','App\\Models\\User','4','{\"attributes\": {\"id\": 5, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:16.000000Z\", \"updated_at\": \"2025-12-30T04:05:16.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI KC KULIT\", \"jumlah_keluar\": 5, \"kode_transaksi\": \"TRX-OUT-2025-12-30-6327\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:05:16','2025-12-30 04:05:16');
INSERT INTO `activity_log` VALUES('68','default','updated','App\\Models\\Barang','updated','1','App\\Models\\User','4','{\"old\": {\"stok\": 25, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}, \"attributes\": {\"stok\": 20, \"updated_at\": \"2025-12-30T04:05:16.000000Z\"}}',NULL,'2025-12-30 04:05:16','2025-12-30 04:05:16');
INSERT INTO `activity_log` VALUES('69','default','created','App\\Models\\BarangKeluar','created','6','App\\Models\\User','4','{\"attributes\": {\"id\": 6, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:16.000000Z\", \"updated_at\": \"2025-12-30T04:05:16.000000Z\", \"customer_id\": 2, \"nama_barang\": \"SUKRO REGULER\", \"jumlah_keluar\": 7, \"kode_transaksi\": \"TRX-OUT-2025-12-30-1347\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:05:16','2025-12-30 04:05:16');
INSERT INTO `activity_log` VALUES('70','default','updated','App\\Models\\Barang','updated','3','App\\Models\\User','4','{\"old\": {\"stok\": 21, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}, \"attributes\": {\"stok\": 14, \"updated_at\": \"2025-12-30T04:05:16.000000Z\"}}',NULL,'2025-12-30 04:05:16','2025-12-30 04:05:16');
INSERT INTO `activity_log` VALUES('71','default','created','App\\Models\\BarangKeluar','created','7','App\\Models\\User','4','{\"attributes\": {\"id\": 7, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:16.000000Z\", \"updated_at\": \"2025-12-30T04:05:16.000000Z\", \"customer_id\": 2, \"nama_barang\": \"FUZO\", \"jumlah_keluar\": 6, \"kode_transaksi\": \"TRX-OUT-2025-12-30-7808\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:05:16','2025-12-30 04:05:16');
INSERT INTO `activity_log` VALUES('72','default','updated','App\\Models\\Barang','updated','20','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:12.000000Z\"}, \"attributes\": {\"stok\": 24, \"updated_at\": \"2025-12-30T04:05:17.000000Z\"}}',NULL,'2025-12-30 04:05:17','2025-12-30 04:05:17');
INSERT INTO `activity_log` VALUES('73','default','created','App\\Models\\BarangKeluar','created','8','App\\Models\\User','4','{\"attributes\": {\"id\": 8, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:17.000000Z\", \"updated_at\": \"2025-12-30T04:05:17.000000Z\", \"customer_id\": 2, \"nama_barang\": \"ATOM PILUS (N/A)\", \"jumlah_keluar\": 4, \"kode_transaksi\": \"TRX-OUT-2025-12-30-3027\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:05:17','2025-12-30 04:05:17');
INSERT INTO `activity_log` VALUES('74','default','updated','App\\Models\\Barang','updated','18','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:12.000000Z\"}, \"attributes\": {\"stok\": 26, \"updated_at\": \"2025-12-30T04:05:17.000000Z\"}}',NULL,'2025-12-30 04:05:17','2025-12-30 04:05:17');
INSERT INTO `activity_log` VALUES('75','default','created','App\\Models\\BarangKeluar','created','9','App\\Models\\User','4','{\"attributes\": {\"id\": 9, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:17.000000Z\", \"updated_at\": \"2025-12-30T04:05:17.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI BIJIAN\", \"jumlah_keluar\": 2, \"kode_transaksi\": \"TRX-OUT-2025-12-30-3590\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:05:17','2025-12-30 04:05:17');
INSERT INTO `activity_log` VALUES('76','default','updated','App\\Models\\Barang','updated','2','App\\Models\\User','4','{\"old\": {\"stok\": 24, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}, \"attributes\": {\"stok\": 22, \"updated_at\": \"2025-12-30T04:05:17.000000Z\"}}',NULL,'2025-12-30 04:05:17','2025-12-30 04:05:17');
INSERT INTO `activity_log` VALUES('77','default','created','App\\Models\\BarangKeluar','created','10','App\\Models\\User','4','{\"attributes\": {\"id\": 10, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:17.000000Z\", \"updated_at\": \"2025-12-30T04:05:17.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI KC KULIT\", \"jumlah_keluar\": 8, \"kode_transaksi\": \"TRX-OUT-2025-12-30-6140\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:05:17','2025-12-30 04:05:17');
INSERT INTO `activity_log` VALUES('78','default','updated','App\\Models\\Barang','updated','1','App\\Models\\User','4','{\"old\": {\"stok\": 25, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}, \"attributes\": {\"stok\": 17, \"updated_at\": \"2025-12-30T04:05:18.000000Z\"}}',NULL,'2025-12-30 04:05:18','2025-12-30 04:05:18');
INSERT INTO `activity_log` VALUES('79','default','created','App\\Models\\BarangKeluar','created','11','App\\Models\\User','4','{\"attributes\": {\"id\": 11, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:18.000000Z\", \"updated_at\": \"2025-12-30T04:05:18.000000Z\", \"customer_id\": 2, \"nama_barang\": \"KREZO MIE\", \"jumlah_keluar\": 7, \"kode_transaksi\": \"TRX-OUT-2025-12-30-8184\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:05:18','2025-12-30 04:05:18');
INSERT INTO `activity_log` VALUES('80','default','updated','App\\Models\\Barang','updated','16','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:11.000000Z\"}, \"attributes\": {\"stok\": 23, \"updated_at\": \"2025-12-30T04:05:18.000000Z\"}}',NULL,'2025-12-30 04:05:18','2025-12-30 04:05:18');
INSERT INTO `activity_log` VALUES('81','default','updated','App\\Models\\Order','updated','2','App\\Models\\User','5','{\"old\": {\"status\": \"shipped\"}, \"attributes\": {\"status\": \"completed\"}}',NULL,'2025-12-30 04:13:08','2025-12-30 04:13:08');
INSERT INTO `activity_log` VALUES('82','default','updated','App\\Models\\Order','updated','1','App\\Models\\User','5','{\"old\": {\"status\": \"shipped\"}, \"attributes\": {\"status\": \"completed\"}}',NULL,'2025-12-30 04:13:13','2025-12-30 04:13:13');
INSERT INTO `activity_log` VALUES('83','default','created','App\\Models\\Order','created','3','App\\Models\\User','5','{\"attributes\": {\"status\": \"draft\", \"order_no\": \"ORD-20251230002\", \"order_date\": \"2025-12-30\", \"customer_id\": 19, \"total_amount\": \"0.00\"}}',NULL,'2025-12-30 04:34:09','2025-12-30 04:34:09');
INSERT INTO `activity_log` VALUES('84','default','created','App\\Models\\OrderDetail','created','12','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 1, \"barang_id\": 1, \"unit_price\": \"50250.00\", \"total_price\": \"50250.00\"}}',NULL,'2025-12-30 04:34:09','2025-12-30 04:34:09');
INSERT INTO `activity_log` VALUES('85','default','created','App\\Models\\OrderDetail','created','13','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 1, \"barang_id\": 2, \"unit_price\": \"67500.00\", \"total_price\": \"67500.00\"}}',NULL,'2025-12-30 04:34:09','2025-12-30 04:34:09');
INSERT INTO `activity_log` VALUES('86','default','created','App\\Models\\OrderDetail','created','14','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 3, \"barang_id\": 3, \"unit_price\": \"73500.00\", \"total_price\": \"220500.00\"}}',NULL,'2025-12-30 04:34:09','2025-12-30 04:34:09');
INSERT INTO `activity_log` VALUES('87','default','created','App\\Models\\OrderDetail','created','15','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 5, \"barang_id\": 4, \"unit_price\": \"58000.00\", \"total_price\": \"290000.00\"}}',NULL,'2025-12-30 04:34:09','2025-12-30 04:34:09');
INSERT INTO `activity_log` VALUES('88','default','created','App\\Models\\OrderDetail','created','16','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 2, \"barang_id\": 5, \"unit_price\": \"79950.00\", \"total_price\": \"159900.00\"}}',NULL,'2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `activity_log` VALUES('89','default','created','App\\Models\\OrderDetail','created','17','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 3, \"barang_id\": 6, \"unit_price\": \"51250.00\", \"total_price\": \"153750.00\"}}',NULL,'2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `activity_log` VALUES('90','default','created','App\\Models\\OrderDetail','created','18','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 1, \"barang_id\": 7, \"unit_price\": \"69000.00\", \"total_price\": \"69000.00\"}}',NULL,'2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `activity_log` VALUES('91','default','created','App\\Models\\OrderDetail','created','19','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 2, \"barang_id\": 8, \"unit_price\": \"74500.00\", \"total_price\": \"149000.00\"}}',NULL,'2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `activity_log` VALUES('92','default','created','App\\Models\\OrderDetail','created','20','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 3, \"barang_id\": 9, \"unit_price\": \"59500.00\", \"total_price\": \"178500.00\"}}',NULL,'2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `activity_log` VALUES('93','default','created','App\\Models\\OrderDetail','created','21','App\\Models\\User','5','{\"attributes\": {\"order_id\": 3, \"quantity\": 2, \"barang_id\": 15, \"unit_price\": \"78500.00\", \"total_price\": \"157000.00\"}}',NULL,'2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `activity_log` VALUES('94','default','updated','App\\Models\\Order','updated','3','App\\Models\\User','5','{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"1495400.00\"}}',NULL,'2025-12-30 04:34:11','2025-12-30 04:34:11');
INSERT INTO `activity_log` VALUES('95','default','updated','App\\Models\\Order','updated','3','App\\Models\\User','5','{\"old\": {\"status\": \"draft\"}, \"attributes\": {\"status\": \"post\"}}',NULL,'2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `activity_log` VALUES('96','default','updated','App\\Models\\Order','updated','3','App\\Models\\User','3','{\"old\": {\"status\": \"post\"}, \"attributes\": {\"status\": \"confirmed\"}}',NULL,'2025-12-30 04:34:25','2025-12-30 04:34:25');
INSERT INTO `activity_log` VALUES('97','default','updated','App\\Models\\Order','updated','3','App\\Models\\User','4','{\"old\": {\"status\": \"confirmed\"}, \"attributes\": {\"status\": \"shipped\"}}',NULL,'2025-12-30 04:34:35','2025-12-30 04:34:35');
INSERT INTO `activity_log` VALUES('98','default','created','App\\Models\\BarangKeluar','created','12','App\\Models\\User','4','{\"attributes\": {\"id\": 12, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:35.000000Z\", \"updated_at\": \"2025-12-30T04:34:35.000000Z\", \"customer_id\": 19, \"nama_barang\": \"DUA KELINCI KC KULIT\", \"jumlah_keluar\": 1, \"kode_transaksi\": \"TRX-OUT-2025-12-30-8565\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:35','2025-12-30 04:34:35');
INSERT INTO `activity_log` VALUES('99','default','updated','App\\Models\\Barang','updated','1','App\\Models\\User','4','{\"old\": {\"stok\": 17, \"updated_at\": \"2025-12-30T04:05:18.000000Z\"}, \"attributes\": {\"stok\": 16, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}}',NULL,'2025-12-30 04:34:36','2025-12-30 04:34:36');
INSERT INTO `activity_log` VALUES('100','default','created','App\\Models\\BarangKeluar','created','13','App\\Models\\User','4','{\"attributes\": {\"id\": 13, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:36.000000Z\", \"updated_at\": \"2025-12-30T04:34:36.000000Z\", \"customer_id\": 19, \"nama_barang\": \"DUA KELINCI BIJIAN\", \"jumlah_keluar\": 1, \"kode_transaksi\": \"TRX-OUT-2025-12-30-6215\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:36','2025-12-30 04:34:36');
INSERT INTO `activity_log` VALUES('101','default','updated','App\\Models\\Barang','updated','2','App\\Models\\User','4','{\"old\": {\"stok\": 22, \"updated_at\": \"2025-12-30T04:05:17.000000Z\"}, \"attributes\": {\"stok\": 21, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}}',NULL,'2025-12-30 04:34:36','2025-12-30 04:34:36');
INSERT INTO `activity_log` VALUES('102','default','created','App\\Models\\BarangKeluar','created','14','App\\Models\\User','4','{\"attributes\": {\"id\": 14, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:36.000000Z\", \"updated_at\": \"2025-12-30T04:34:36.000000Z\", \"customer_id\": 19, \"nama_barang\": \"SUKRO REGULER\", \"jumlah_keluar\": 3, \"kode_transaksi\": \"TRX-OUT-2025-12-30-4119\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:36','2025-12-30 04:34:36');
INSERT INTO `activity_log` VALUES('103','default','updated','App\\Models\\Barang','updated','3','App\\Models\\User','4','{\"old\": {\"stok\": 14, \"updated_at\": \"2025-12-30T04:05:16.000000Z\"}, \"attributes\": {\"stok\": 11, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}}',NULL,'2025-12-30 04:34:36','2025-12-30 04:34:36');
INSERT INTO `activity_log` VALUES('104','default','created','App\\Models\\BarangKeluar','created','15','App\\Models\\User','4','{\"attributes\": {\"id\": 15, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:36.000000Z\", \"updated_at\": \"2025-12-30T04:34:36.000000Z\", \"customer_id\": 19, \"nama_barang\": \"SUKRO OVEN\", \"jumlah_keluar\": 5, \"kode_transaksi\": \"TRX-OUT-2025-12-30-0850\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:36','2025-12-30 04:34:36');
INSERT INTO `activity_log` VALUES('105','default','updated','App\\Models\\Barang','updated','4','App\\Models\\User','4','{\"old\": {\"stok\": 20, \"updated_at\": \"2025-12-29T09:56:22.000000Z\"}, \"attributes\": {\"stok\": 15, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}}',NULL,'2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `activity_log` VALUES('106','default','created','App\\Models\\BarangKeluar','created','16','App\\Models\\User','4','{\"attributes\": {\"id\": 16, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:37.000000Z\", \"updated_at\": \"2025-12-30T04:34:37.000000Z\", \"customer_id\": 19, \"nama_barang\": \"DEKA\", \"jumlah_keluar\": 2, \"kode_transaksi\": \"TRX-OUT-2025-12-30-8391\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `activity_log` VALUES('107','default','updated','App\\Models\\Barang','updated','5','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:07.000000Z\"}, \"attributes\": {\"stok\": 28, \"updated_at\": \"2025-12-30T04:34:37.000000Z\"}}',NULL,'2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `activity_log` VALUES('108','default','created','App\\Models\\BarangKeluar','created','17','App\\Models\\User','4','{\"attributes\": {\"id\": 17, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:37.000000Z\", \"updated_at\": \"2025-12-30T04:34:37.000000Z\", \"customer_id\": 19, \"nama_barang\": \"TIC TAC\", \"jumlah_keluar\": 3, \"kode_transaksi\": \"TRX-OUT-2025-12-30-1088\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `activity_log` VALUES('109','default','updated','App\\Models\\Barang','updated','6','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:08.000000Z\"}, \"attributes\": {\"stok\": 27, \"updated_at\": \"2025-12-30T04:34:37.000000Z\"}}',NULL,'2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `activity_log` VALUES('110','default','created','App\\Models\\BarangKeluar','created','18','App\\Models\\User','4','{\"attributes\": {\"id\": 18, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:37.000000Z\", \"updated_at\": \"2025-12-30T04:34:37.000000Z\", \"customer_id\": 19, \"nama_barang\": \"PILUS\", \"jumlah_keluar\": 1, \"kode_transaksi\": \"TRX-OUT-2025-12-30-8961\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `activity_log` VALUES('111','default','updated','App\\Models\\Barang','updated','7','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:08.000000Z\"}, \"attributes\": {\"stok\": 29, \"updated_at\": \"2025-12-30T04:34:37.000000Z\"}}',NULL,'2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `activity_log` VALUES('112','default','created','App\\Models\\BarangKeluar','created','19','App\\Models\\User','4','{\"attributes\": {\"id\": 19, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:38.000000Z\", \"updated_at\": \"2025-12-30T04:34:38.000000Z\", \"customer_id\": 19, \"nama_barang\": \"RONI\", \"jumlah_keluar\": 2, \"kode_transaksi\": \"TRX-OUT-2025-12-30-1050\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:38','2025-12-30 04:34:38');
INSERT INTO `activity_log` VALUES('113','default','updated','App\\Models\\Barang','updated','8','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:09.000000Z\"}, \"attributes\": {\"stok\": 28, \"updated_at\": \"2025-12-30T04:34:38.000000Z\"}}',NULL,'2025-12-30 04:34:38','2025-12-30 04:34:38');
INSERT INTO `activity_log` VALUES('114','default','created','App\\Models\\BarangKeluar','created','20','App\\Models\\User','4','{\"attributes\": {\"id\": 20, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:38.000000Z\", \"updated_at\": \"2025-12-30T04:34:38.000000Z\", \"customer_id\": 19, \"nama_barang\": \"SUPER NUT (N/A)\", \"jumlah_keluar\": 3, \"kode_transaksi\": \"TRX-OUT-2025-12-30-9515\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:38','2025-12-30 04:34:38');
INSERT INTO `activity_log` VALUES('115','default','updated','App\\Models\\Barang','updated','9','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:09.000000Z\"}, \"attributes\": {\"stok\": 27, \"updated_at\": \"2025-12-30T04:34:38.000000Z\"}}',NULL,'2025-12-30 04:34:38','2025-12-30 04:34:38');
INSERT INTO `activity_log` VALUES('116','default','created','App\\Models\\BarangKeluar','created','21','App\\Models\\User','4','{\"attributes\": {\"id\": 21, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:38.000000Z\", \"updated_at\": \"2025-12-30T04:34:38.000000Z\", \"customer_id\": 19, \"nama_barang\": \"KREZO TWIST\", \"jumlah_keluar\": 2, \"kode_transaksi\": \"TRX-OUT-2025-12-30-1480\", \"tanggal_keluar\": \"2025-12-30\"}}',NULL,'2025-12-30 04:34:38','2025-12-30 04:34:38');
INSERT INTO `activity_log` VALUES('117','default','updated','App\\Models\\Barang','updated','15','App\\Models\\User','4','{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:11.000000Z\"}, \"attributes\": {\"stok\": 28, \"updated_at\": \"2025-12-30T04:34:38.000000Z\"}}',NULL,'2025-12-30 04:34:38','2025-12-30 04:34:38');
INSERT INTO `activity_log` VALUES('118','default','updated','App\\Models\\Order','updated','3','App\\Models\\User','5','{\"old\": {\"status\": \"shipped\"}, \"attributes\": {\"status\": \"completed\"}}',NULL,'2025-12-30 04:34:43','2025-12-30 04:34:43');


CREATE TABLE `barang_keluars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_keluar` date NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_keluar` int NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barang_keluars_kode_transaksi_unique` (`kode_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `barang_keluars` VALUES('1','TRX-OUT-2025-12-29-9594','ORD-20251229001','2025-12-29','DUA KELINCI KC KULIT','5','2','4','2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `barang_keluars` VALUES('2','TRX-OUT-2025-12-29-5748','ORD-20251229001','2025-12-29','DUA KELINCI BIJIAN','6','2','4','2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `barang_keluars` VALUES('3','TRX-OUT-2025-12-29-2089','ORD-20251229001','2025-12-29','SUKRO REGULER','9','2','4','2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `barang_keluars` VALUES('4','TRX-OUT-2025-12-29-2039','ORD-20251229001','2025-12-29','SUKRO OVEN','10','2','4','2025-12-29 09:56:21','2025-12-29 09:56:21');
INSERT INTO `barang_keluars` VALUES('5','TRX-OUT-2025-12-30-6327','ORD-20251230001','2025-12-30','DUA KELINCI KC KULIT','5','2','4','2025-12-30 04:05:16','2025-12-30 04:05:16');
INSERT INTO `barang_keluars` VALUES('6','TRX-OUT-2025-12-30-1347','ORD-20251230001','2025-12-30','SUKRO REGULER','7','2','4','2025-12-30 04:05:16','2025-12-30 04:05:16');
INSERT INTO `barang_keluars` VALUES('7','TRX-OUT-2025-12-30-7808','ORD-20251230001','2025-12-30','FUZO','6','2','4','2025-12-30 04:05:16','2025-12-30 04:05:16');
INSERT INTO `barang_keluars` VALUES('8','TRX-OUT-2025-12-30-3027','ORD-20251230001','2025-12-30','ATOM PILUS (N/A)','4','2','4','2025-12-30 04:05:17','2025-12-30 04:05:17');
INSERT INTO `barang_keluars` VALUES('9','TRX-OUT-2025-12-30-3590','ORD-20251230001','2025-12-30','DUA KELINCI BIJIAN','2','2','4','2025-12-30 04:05:17','2025-12-30 04:05:17');
INSERT INTO `barang_keluars` VALUES('10','TRX-OUT-2025-12-30-6140','ORD-20251230001','2025-12-30','DUA KELINCI KC KULIT','8','2','4','2025-12-30 04:05:17','2025-12-30 04:05:17');
INSERT INTO `barang_keluars` VALUES('11','TRX-OUT-2025-12-30-8184','ORD-20251230001','2025-12-30','KREZO MIE','7','2','4','2025-12-30 04:05:18','2025-12-30 04:05:18');
INSERT INTO `barang_keluars` VALUES('12','TRX-OUT-2025-12-30-8565','ORD-20251230002','2025-12-30','DUA KELINCI KC KULIT','1','19','4','2025-12-30 04:34:35','2025-12-30 04:34:35');
INSERT INTO `barang_keluars` VALUES('13','TRX-OUT-2025-12-30-6215','ORD-20251230002','2025-12-30','DUA KELINCI BIJIAN','1','19','4','2025-12-30 04:34:36','2025-12-30 04:34:36');
INSERT INTO `barang_keluars` VALUES('14','TRX-OUT-2025-12-30-4119','ORD-20251230002','2025-12-30','SUKRO REGULER','3','19','4','2025-12-30 04:34:36','2025-12-30 04:34:36');
INSERT INTO `barang_keluars` VALUES('15','TRX-OUT-2025-12-30-0850','ORD-20251230002','2025-12-30','SUKRO OVEN','5','19','4','2025-12-30 04:34:36','2025-12-30 04:34:36');
INSERT INTO `barang_keluars` VALUES('16','TRX-OUT-2025-12-30-8391','ORD-20251230002','2025-12-30','DEKA','2','19','4','2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `barang_keluars` VALUES('17','TRX-OUT-2025-12-30-1088','ORD-20251230002','2025-12-30','TIC TAC','3','19','4','2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `barang_keluars` VALUES('18','TRX-OUT-2025-12-30-8961','ORD-20251230002','2025-12-30','PILUS','1','19','4','2025-12-30 04:34:37','2025-12-30 04:34:37');
INSERT INTO `barang_keluars` VALUES('19','TRX-OUT-2025-12-30-1050','ORD-20251230002','2025-12-30','RONI','2','19','4','2025-12-30 04:34:38','2025-12-30 04:34:38');
INSERT INTO `barang_keluars` VALUES('20','TRX-OUT-2025-12-30-9515','ORD-20251230002','2025-12-30','SUPER NUT (N/A)','3','19','4','2025-12-30 04:34:38','2025-12-30 04:34:38');
INSERT INTO `barang_keluars` VALUES('21','TRX-OUT-2025-12-30-1480','ORD-20251230002','2025-12-30','KREZO TWIST','2','19','4','2025-12-30 04:34:38','2025-12-30 04:34:38');


CREATE TABLE `barang_masuks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_masuk` int NOT NULL,
  `supplier_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barang_masuks_kode_transaksi_unique` (`kode_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `barangs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stok_minimum` int NOT NULL,
  `stok` int DEFAULT '0',
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `user_id` bigint unsigned NOT NULL,
  `jenis_id` bigint unsigned NOT NULL,
  `satuan_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barangs_kode_barang_unique` (`kode_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `barangs` VALUES('1','BRG-00001','DUA KELINCI KC KULIT','DUA KELINCI KC KULIT',NULL,'10','16','50250.00','1','1','1','2025-12-29 08:10:06','2025-12-30 04:34:36');
INSERT INTO `barangs` VALUES('2','BRG-00002','DUA KELINCI BIJIAN','DUA KELINCI BIJIAN',NULL,'10','21','67500.00','1','2','1','2025-12-29 08:10:06','2025-12-30 04:34:36');
INSERT INTO `barangs` VALUES('3','BRG-00003','SUKRO REGULER','SUKRO REGULER',NULL,'10','11','73500.00','1','2','1','2025-12-29 08:10:07','2025-12-30 04:34:36');
INSERT INTO `barangs` VALUES('4','BRG-00004','SUKRO OVEN','SUKRO OVEN',NULL,'10','15','58000.00','1','2','1','2025-12-29 08:10:07','2025-12-30 04:34:36');
INSERT INTO `barangs` VALUES('5','BRG-00005','DEKA','DEKA',NULL,'10','28','79950.00','1','3','1','2025-12-29 08:10:07','2025-12-30 04:34:37');
INSERT INTO `barangs` VALUES('6','BRG-00006','TIC TAC','TIC TAC',NULL,'10','27','51250.00','1','4','1','2025-12-29 08:10:08','2025-12-30 04:34:37');
INSERT INTO `barangs` VALUES('7','BRG-00007','PILUS','PILUS',NULL,'10','29','69000.00','1','4','1','2025-12-29 08:10:08','2025-12-30 04:34:37');
INSERT INTO `barangs` VALUES('8','BRG-00008','RONI','RONI',NULL,'10','28','74500.00','1','5','1','2025-12-29 08:10:09','2025-12-30 04:34:38');
INSERT INTO `barangs` VALUES('9','BRG-00009','SUPER NUT (N/A)','SUPER NUT (N/A)',NULL,'10','27','59500.00','1','1','1','2025-12-29 08:10:09','2025-12-30 04:34:38');
INSERT INTO `barangs` VALUES('10','BRG-00010','SIR JUS (N/A)','SIR JUS (N/A)',NULL,'10','30','77500.00','1','6','1','2025-12-29 08:10:09','2025-12-29 08:10:09');
INSERT INTO `barangs` VALUES('11','BRG-00011','KRIP KRIP','KRIP KRIP',NULL,'10','30','52500.00','1','7','1','2025-12-29 08:10:10','2025-12-29 08:10:10');
INSERT INTO `barangs` VALUES('12','BRG-00012','TOS TOS','TOS TOS',NULL,'10','30','71500.00','1','7','1','2025-12-29 08:10:10','2025-12-29 08:10:10');
INSERT INTO `barangs` VALUES('13','BRG-00013','USAGI','USAGI',NULL,'10','30','76500.00','1','4','1','2025-12-29 08:10:10','2025-12-29 08:10:10');
INSERT INTO `barangs` VALUES('14','BRG-00014','TATO TATO','TATO TATO',NULL,'10','30','56000.00','1','5','1','2025-12-29 08:10:10','2025-12-29 08:10:10');
INSERT INTO `barangs` VALUES('15','BRG-00015','KREZO TWIST','KREZO TWIST',NULL,'10','28','78500.00','1','5','1','2025-12-29 08:10:11','2025-12-30 04:34:38');
INSERT INTO `barangs` VALUES('16','BRG-00016','KREZO MIE','KREZO MIE',NULL,'10','23','54000.00','1','8','1','2025-12-29 08:10:11','2025-12-30 04:05:18');
INSERT INTO `barangs` VALUES('17','BRG-00017','SEASONAL','SEASONAL',NULL,'10','30','65500.00','1','9','1','2025-12-29 08:10:11','2025-12-29 08:10:11');
INSERT INTO `barangs` VALUES('18','BRG-00018','ATOM PILUS (N/A)','ATOM PILUS (N/A)',NULL,'10','26','72000.00','1','2','1','2025-12-29 08:10:12','2025-12-30 04:05:17');
INSERT INTO `barangs` VALUES('19','BRG-00019','KATOM (N/A)','KATOM (N/A)',NULL,'10','30','60500.00','1','2','1','2025-12-29 08:10:12','2025-12-29 08:10:12');
INSERT INTO `barangs` VALUES('20','BRG-00020','FUZO','FUZO',NULL,'10','24','75500.00','1','10','1','2025-12-29 08:10:12','2025-12-30 04:05:17');
INSERT INTO `barangs` VALUES('21','BRG-00021','PROMOSI','PROMOSI',NULL,'10','30','53500.00','1','11','1','2025-12-29 08:10:13','2025-12-29 08:10:13');


CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `customers` VALUES('1','PT  ANUGERAH SINERGI RAYA','TAMAN TEKNO BSD SEKTOR XI J3  NO. 17-18, SETU SETU KOTA TANGERANG SELATAN','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('2','PT  HARTANI RAPI','PASAR ATUM THP.5/ LT I ST.1021T BONGKARAN PABEAN CANTIAN','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('3','PT  SUBUR RITELINDO  SEJAHTERA','JL BARU KM 6 NO.168 RT 004 R .006 KELURAHAN NAGASARI KRCAMATAN KARAWANG BARAT','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('4','PT  SUBUR RITELINDO SEJAHTERA','JL. BARU KM.6 NO.168 RT 04 / RW 06 KELURAHAN NAGASARI KEC.KARAWANG BARAT,KAB.KARAWANG','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('5','PT  TRANS RETAIL INDONESIA','GEDUNG CARREFOUR JL LEBAK BULUS RAYA NO.8 KEBAYORAN LAMA JAKARTA SELATAN','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('6','PT ADAPERKASA SAHITAGUNA','JL.MGR SUGIYOPRANOTO NO58-60','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('7','PT ADTEK TRADING INDONESIA','Jl. Pluit Selatan Raya,  De Ploeit Centra Lt. 7 No. 703 Pluit Penjaringan','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('8','PT AEON INDONESIA','RATU PLAZA OFFICE BUILDING LT26 JL JEND SUDIRMAN KAV 9','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('9','PT AGUNG RAYA','JL. RAYA CAKUNG CILINCING NO.11','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('10','PT AIRLOCK INDONESIA JAYA RAYA','Kawasan Industri Jababeka Tahap VI Jl. East Park Boulevard Block C1B  No. 7, Jatireja Cikarang Timur','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('11','PT AKERLUND RAUSING PACKAGING INDO','KAWASAN INDUSTRI BAWEN JALAN MAJU JAYA BLOK A-1 RT 000 RW 000 HARJOSARI BAWEN','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('12','PT AKUR PRATAMA','JL. PAHLAWAN REVOLUSI NO 15 PONDOK BAMBU-DUREN SAWIT','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('13','PT ALAM NYIUR NUSA PERMAI','JL. Raya Pemda Tiga Raksa,  Pergudangan Bizlink12 BlockO,No10-12','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('14','PT ALDMIC INDONESIA','RUKO KEDOYA ELOK PLAZA BLOK D D NO 64 JL PANJANG JAKBAR','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('15','PT ALFA  RETAILINDO','GEDUNG CARREFOUR  JL.LEBAK BULUS NO 8 PONDOK PINANG KEBAYORAN LAMA JAKARTA SELATAN','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('16','PT ALFA RETAILINDO','GEDUNG CARREFOUR JL.LEBAK BULUS NO 8 PONDOK PINANG KEBAYORAN LAMA JAKARTA SELATAN','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('17','PT ALFA RETALINDO','GEDUNG CARREFOUR JL.LEBAK BULUS NO.8 PONDOK PINANG','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('18','PT ALMEGA SEJAHTERA','JL SUMATRA NO. 33','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('19','PT ALTAR MAS','TAMAN TEKNO BLOK M NO.26 BSD SERPONG','1','2025-12-29 08:12:05',NULL);
INSERT INTO `customers` VALUES('20','PT ALTAR MASS','TAMAN TEKNO BSD SEKTOR XI  BLOK M/26 SETU-SETU','1','2025-12-29 08:12:05',NULL);


CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `jenis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jenis_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jenis` VALUES('1','KACANG','1','2025-12-29 08:10:06','2025-12-29 08:10:06');
INSERT INTO `jenis` VALUES('2','KACANG BERSALUT','1','2025-12-29 08:10:06','2025-12-29 08:10:06');
INSERT INTO `jenis` VALUES('3','WAFER','1','2025-12-29 08:10:07','2025-12-29 08:10:07');
INSERT INTO `jenis` VALUES('4','SNACK','1','2025-12-29 08:10:08','2025-12-29 08:10:08');
INSERT INTO `jenis` VALUES('5','EKSTRUDER SNACK','1','2025-12-29 08:10:08','2025-12-29 08:10:08');
INSERT INTO `jenis` VALUES('6','BEVERAGE','1','2025-12-29 08:10:09','2025-12-29 08:10:09');
INSERT INTO `jenis` VALUES('7','CHIPS','1','2025-12-29 08:10:09','2025-12-29 08:10:09');
INSERT INTO `jenis` VALUES('8','NOODLE SNACK','1','2025-12-29 08:10:11','2025-12-29 08:10:11');
INSERT INTO `jenis` VALUES('9','SEASONAL','1','2025-12-29 08:10:11','2025-12-29 08:10:11');
INSERT INTO `jenis` VALUES('10','BIJI BIJIAN','1','2025-12-29 08:10:12','2025-12-29 08:10:12');
INSERT INTO `jenis` VALUES('11','PROMOSI','1','2025-12-29 08:10:13','2025-12-29 08:10:13');


CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO `migrations` VALUES('2','2014_10_12_100000_create_password_reset_tokens_table','1');
INSERT INTO `migrations` VALUES('3','2019_08_19_000000_create_failed_jobs_table','1');
INSERT INTO `migrations` VALUES('4','2019_12_14_000001_create_personal_access_tokens_table','1');
INSERT INTO `migrations` VALUES('5','2023_04_30_113736_create_barangs_table','1');
INSERT INTO `migrations` VALUES('6','2023_05_08_012945_create_jenis_table','1');
INSERT INTO `migrations` VALUES('7','2023_05_12_002014_create_satuans_table','1');
INSERT INTO `migrations` VALUES('8','2023_05_12_232201_create_suppliers_table','1');
INSERT INTO `migrations` VALUES('9','2023_05_13_003355_create_customers_table','1');
INSERT INTO `migrations` VALUES('10','2023_05_13_013458_create_barang_masuks_table','1');
INSERT INTO `migrations` VALUES('11','2023_05_17_135554_create_barang_keluars_table','1');
INSERT INTO `migrations` VALUES('12','2023_05_28_095805_create_roles_table','1');
INSERT INTO `migrations` VALUES('13','2023_05_30_124154_create_activity_log_table','1');
INSERT INTO `migrations` VALUES('14','2023_05_30_124155_add_event_column_to_activity_log_table','1');
INSERT INTO `migrations` VALUES('15','2023_05_30_124156_add_batch_uuid_column_to_activity_log_table','1');
INSERT INTO `migrations` VALUES('16','2025_12_24_083952_create_sales_orders_table','1');
INSERT INTO `migrations` VALUES('17','2025_12_24_083956_create_sales_order_details_table','1');
INSERT INTO `migrations` VALUES('18','2025_12_24_094310_add_price_to_barangs_table','1');
INSERT INTO `migrations` VALUES('19','2025_12_26_062209_rename_nik_to_username_in_users_table','1');
INSERT INTO `migrations` VALUES('20','2025_12_26_063438_update_roles_table_names','1');
INSERT INTO `migrations` VALUES('21','2025_12_26_064234_update_sales_order_statuses','1');
INSERT INTO `migrations` VALUES('22','2025_12_26_064918_create_sales_order_histories_table','1');
INSERT INTO `migrations` VALUES('23','2025_12_26_064920_add_post_status_to_sales_orders','1');
INSERT INTO `migrations` VALUES('24','2025_12_26_152938_add_sales_order_no_to_barang_keluars_table','1');
INSERT INTO `migrations` VALUES('25','2025_12_29_015350_rename_sales_orders_to_orders','1');
INSERT INTO `migrations` VALUES('26','2025_12_29_021411_create_order_produk_table','1');
INSERT INTO `migrations` VALUES('27','2025_12_30_034157_add_status_dates_to_orders_table','2');


CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `barang_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_details_sales_order_id_foreign` (`order_id`),
  KEY `sales_order_details_barang_id_foreign` (`barang_id`),
  CONSTRAINT `sales_order_details_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_order_details_sales_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `order_details` VALUES('1','1','1','5','50250.00','251250.00','2025-12-29 08:18:00','2025-12-29 09:55:23');
INSERT INTO `order_details` VALUES('2','1','2','6','67500.00','405000.00','2025-12-29 08:18:00','2025-12-29 08:18:00');
INSERT INTO `order_details` VALUES('3','1','3','9','73500.00','661500.00','2025-12-29 08:18:00','2025-12-29 08:18:00');
INSERT INTO `order_details` VALUES('4','1','4','10','58000.00','580000.00','2025-12-29 08:18:00','2025-12-29 08:18:00');
INSERT INTO `order_details` VALUES('5','2','1','5','50250.00','251250.00','2025-12-30 03:39:13','2025-12-30 03:39:13');
INSERT INTO `order_details` VALUES('6','2','3','7','73500.00','514500.00','2025-12-30 03:39:13','2025-12-30 03:39:13');
INSERT INTO `order_details` VALUES('7','2','20','6','75500.00','453000.00','2025-12-30 03:39:13','2025-12-30 03:39:13');
INSERT INTO `order_details` VALUES('8','2','18','4','72000.00','288000.00','2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `order_details` VALUES('9','2','2','2','67500.00','135000.00','2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `order_details` VALUES('10','2','1','8','50250.00','402000.00','2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `order_details` VALUES('11','2','16','7','54000.00','378000.00','2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `order_details` VALUES('12','3','1','1','50250.00','50250.00','2025-12-30 04:34:09','2025-12-30 04:34:09');
INSERT INTO `order_details` VALUES('13','3','2','1','67500.00','67500.00','2025-12-30 04:34:09','2025-12-30 04:34:09');
INSERT INTO `order_details` VALUES('14','3','3','3','73500.00','220500.00','2025-12-30 04:34:09','2025-12-30 04:34:09');
INSERT INTO `order_details` VALUES('15','3','4','5','58000.00','290000.00','2025-12-30 04:34:09','2025-12-30 04:34:09');
INSERT INTO `order_details` VALUES('16','3','5','2','79950.00','159900.00','2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `order_details` VALUES('17','3','6','3','51250.00','153750.00','2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `order_details` VALUES('18','3','7','1','69000.00','69000.00','2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `order_details` VALUES('19','3','8','2','74500.00','149000.00','2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `order_details` VALUES('20','3','9','3','59500.00','178500.00','2025-12-30 04:34:10','2025-12-30 04:34:10');
INSERT INTO `order_details` VALUES('21','3','15','2','78500.00','157000.00','2025-12-30 04:34:10','2025-12-30 04:34:10');


CREATE TABLE `order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_order_histories_sales_order_id_foreign` (`order_id`),
  KEY `sales_order_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `sales_order_histories_sales_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sales_order_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `order_histories` VALUES('1','1','5','Created Order','Initial creation','2025-12-29 08:18:01','2025-12-29 08:18:01');
INSERT INTO `order_histories` VALUES('2','1','5','Posted to Warehouse','Ready for stock verification','2025-12-29 08:18:08','2025-12-29 08:18:08');
INSERT INTO `order_histories` VALUES('3','1','3','Confirmed by Warehouse','Stock verified and ready for shipping','2025-12-29 09:50:03','2025-12-29 09:50:03');
INSERT INTO `order_histories` VALUES('4','1','4','Updated Item: DUA KELINCI KC KULIT (Qty: 7 -> 5)','2 rusak packing','2025-12-29 09:55:23','2025-12-29 09:55:23');
INSERT INTO `order_histories` VALUES('5','1','4','Shipped','Order shipped by Warehouse Staff','2025-12-29 09:56:22','2025-12-29 09:56:22');
INSERT INTO `order_histories` VALUES('6','2','5','Created Order','Initial creation','2025-12-30 03:39:14','2025-12-30 03:39:14');
INSERT INTO `order_histories` VALUES('7','2','5','Posted to Warehouse','Ready for stock verification','2025-12-30 03:39:21','2025-12-30 03:39:21');
INSERT INTO `order_histories` VALUES('8','2','3','Confirmed by Warehouse','Stock verified and ready for shipping','2025-12-30 03:45:32','2025-12-30 03:45:32');
INSERT INTO `order_histories` VALUES('9','2','4','Shipped','Order shipped by Warehouse Staff','2025-12-30 04:05:18','2025-12-30 04:05:18');
INSERT INTO `order_histories` VALUES('10','2','5','Completed','Order received by customer','2025-12-30 04:13:08','2025-12-30 04:13:08');
INSERT INTO `order_histories` VALUES('11','1','5','Completed','Order received by customer','2025-12-30 04:13:13','2025-12-30 04:13:13');
INSERT INTO `order_histories` VALUES('12','3','5','Created Order','Initial creation','2025-12-30 04:34:11','2025-12-30 04:34:11');
INSERT INTO `order_histories` VALUES('13','3','5','Posted to Warehouse','Ready for stock verification','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_histories` VALUES('14','3','3','Confirmed by Warehouse','Stock verified and ready for shipping','2025-12-30 04:34:25','2025-12-30 04:34:25');
INSERT INTO `order_histories` VALUES('15','3','4','Shipped','Order shipped by Warehouse Staff','2025-12-30 04:34:38','2025-12-30 04:34:38');
INSERT INTO `order_histories` VALUES('16','3','5','Completed','Order received by customer','2025-12-30 04:34:43','2025-12-30 04:34:43');


CREATE TABLE `order_produk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `barang_id` bigint unsigned NOT NULL,
  `order_date` date NOT NULL,
  `qty` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_produk_order_id_foreign` (`order_id`),
  KEY `order_produk_customer_id_foreign` (`customer_id`),
  KEY `order_produk_barang_id_foreign` (`barang_id`),
  CONSTRAINT `order_produk_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_produk_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_produk_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `order_produk` VALUES('1','1','2','1','2025-12-29','7','2025-12-29 08:18:08','2025-12-29 08:18:08');
INSERT INTO `order_produk` VALUES('2','1','2','2','2025-12-29','6','2025-12-29 08:18:08','2025-12-29 08:18:08');
INSERT INTO `order_produk` VALUES('3','1','2','3','2025-12-29','9','2025-12-29 08:18:08','2025-12-29 08:18:08');
INSERT INTO `order_produk` VALUES('4','1','2','4','2025-12-29','10','2025-12-29 08:18:08','2025-12-29 08:18:08');
INSERT INTO `order_produk` VALUES('5','2','2','1','2025-12-30','5','2025-12-30 03:39:20','2025-12-30 03:39:20');
INSERT INTO `order_produk` VALUES('6','2','2','3','2025-12-30','7','2025-12-30 03:39:21','2025-12-30 03:39:21');
INSERT INTO `order_produk` VALUES('7','2','2','20','2025-12-30','6','2025-12-30 03:39:21','2025-12-30 03:39:21');
INSERT INTO `order_produk` VALUES('8','2','2','18','2025-12-30','4','2025-12-30 03:39:21','2025-12-30 03:39:21');
INSERT INTO `order_produk` VALUES('9','2','2','2','2025-12-30','2','2025-12-30 03:39:21','2025-12-30 03:39:21');
INSERT INTO `order_produk` VALUES('10','2','2','1','2025-12-30','8','2025-12-30 03:39:21','2025-12-30 03:39:21');
INSERT INTO `order_produk` VALUES('11','2','2','16','2025-12-30','7','2025-12-30 03:39:21','2025-12-30 03:39:21');
INSERT INTO `order_produk` VALUES('12','3','19','1','2025-12-30','1','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_produk` VALUES('13','3','19','2','2025-12-30','1','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_produk` VALUES('14','3','19','3','2025-12-30','3','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_produk` VALUES('15','3','19','4','2025-12-30','5','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_produk` VALUES('16','3','19','5','2025-12-30','2','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_produk` VALUES('17','3','19','6','2025-12-30','3','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_produk` VALUES('18','3','19','7','2025-12-30','1','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_produk` VALUES('19','3','19','8','2025-12-30','2','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_produk` VALUES('20','3','19','9','2025-12-30','3','2025-12-30 04:34:17','2025-12-30 04:34:17');
INSERT INTO `order_produk` VALUES('21','3','19','15','2025-12-30','2','2025-12-30 04:34:17','2025-12-30 04:34:17');


CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` enum('draft','post','confirmed','processing','shipped','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `date_post` timestamp NULL DEFAULT NULL,
  `date_confirm` timestamp NULL DEFAULT NULL,
  `date_shipped` timestamp NULL DEFAULT NULL,
  `date_complete` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_orders_sales_order_no_unique` (`order_no`),
  KEY `sales_orders_customer_id_foreign` (`customer_id`),
  CONSTRAINT `sales_orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `orders` VALUES('1','ORD-20251229001','2','2025-12-23','1897750.00','completed',NULL,NULL,NULL,'2025-12-30 04:13:13','2025-12-29 08:18:00','2025-12-30 04:13:13');
INSERT INTO `orders` VALUES('2','ORD-20251230001','2','2025-12-25','2421750.00','completed',NULL,'2025-12-30 03:45:32','2025-12-30 04:05:16','2025-12-30 04:13:07','2025-12-30 03:39:13','2025-12-30 04:13:07');
INSERT INTO `orders` VALUES('3','ORD-20251230002','19','2025-12-27','1495400.00','completed','2025-12-30 04:34:17','2025-12-30 04:34:25','2025-12-30 04:34:35','2025-12-30 04:34:43','2025-12-30 04:34:09','2025-12-30 04:34:43');


CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` VALUES('1','super_admin','Superadmin memiliki kendali penuh pada aplikasi termasuk manajemen User',NULL,NULL);
INSERT INTO `roles` VALUES('2','kepala_gudang','Kepala gudang memiliki akses untuk mengelola dan mencetak laporan stok, barang masuk, dan barang keluar',NULL,NULL);
INSERT INTO `roles` VALUES('3','admin_gudang','Admin gudang memiliki akses untuk mengelola stok, barang masuk, barang keluar dan laporannya',NULL,NULL);
INSERT INTO `roles` VALUES('4','staff_gudang','Staff gudang memiliki akses terbatas untuk mengelola stok',NULL,NULL);
INSERT INTO `roles` VALUES('5','admin_sales','Admin sales mengelola data customer dan distribusi barang',NULL,NULL);


;

INSERT INTO `safety_stock_product` VALUES('1','BRG-00001','DUA KELINCI KC KULIT','16','8','5','6','18');
INSERT INTO `safety_stock_product` VALUES('2','BRG-00002','DUA KELINCI BIJIAN','21','6','3','6','18');
INSERT INTO `safety_stock_product` VALUES('3','BRG-00003','SUKRO REGULER','11','9','6','6','18');
INSERT INTO `safety_stock_product` VALUES('4','BRG-00004','SUKRO OVEN','15','10','8','6','12');
INSERT INTO `safety_stock_product` VALUES('5','BRG-00005','DEKA','28','2','2','6','0');
INSERT INTO `safety_stock_product` VALUES('6','BRG-00006','TIC TAC','27','3','3','6','0');
INSERT INTO `safety_stock_product` VALUES('7','BRG-00007','PILUS','29','1','1','6','0');
INSERT INTO `safety_stock_product` VALUES('8','BRG-00008','RONI','28','2','2','6','0');
INSERT INTO `safety_stock_product` VALUES('9','BRG-00009','SUPER NUT (N/A)','27','3','3','6','0');
INSERT INTO `safety_stock_product` VALUES('10','BRG-00010','SIR JUS (N/A)','30','0','0','0','0');
INSERT INTO `safety_stock_product` VALUES('11','BRG-00011','KRIP KRIP','30','0','0','0','0');
INSERT INTO `safety_stock_product` VALUES('12','BRG-00012','TOS TOS','30','0','0','0','0');
INSERT INTO `safety_stock_product` VALUES('13','BRG-00013','USAGI','30','0','0','0','0');
INSERT INTO `safety_stock_product` VALUES('14','BRG-00014','TATO TATO','30','0','0','0','0');
INSERT INTO `safety_stock_product` VALUES('15','BRG-00015','KREZO TWIST','28','2','2','6','0');
INSERT INTO `safety_stock_product` VALUES('16','BRG-00016','KREZO MIE','23','7','7','6','0');
INSERT INTO `safety_stock_product` VALUES('17','BRG-00017','SEASONAL','30','0','0','0','0');
INSERT INTO `safety_stock_product` VALUES('18','BRG-00018','ATOM PILUS (N/A)','26','4','4','6','0');
INSERT INTO `safety_stock_product` VALUES('19','BRG-00019','KATOM (N/A)','30','0','0','0','0');
INSERT INTO `safety_stock_product` VALUES('20','BRG-00020','FUZO','24','6','6','6','0');
INSERT INTO `safety_stock_product` VALUES('21','BRG-00021','PROMOSI','30','0','0','0','0');


CREATE TABLE `satuans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `satuans` VALUES('1','2025-12-29 08:10:05','2025-12-29 08:10:05','KRT','1');
INSERT INTO `satuans` VALUES('2','2025-12-29 08:10:05','2025-12-29 08:10:05','PAK','1');
INSERT INTO `satuans` VALUES('3','2025-12-29 08:10:05','2025-12-29 08:10:05','PCS','1');


CREATE TABLE `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_nik_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` VALUES('1','Super Admin','super_admin','$2y$10$VJJ9f0uOKpnisZiGuLqLLO4zwAxm3DsbXmy7NA9BSvUuFcVjkZP9K','1',NULL,NULL,NULL);
INSERT INTO `users` VALUES('2','Kepala Gudang','kepala_gudang','$2y$10$p62WVr4QA3EXPiTdI3rAQOFkJYTezQ20u5jkKjpuMNTpjBqq9UKPC','2',NULL,NULL,NULL);
INSERT INTO `users` VALUES('3','Admin Gudang','admin_gudang','$2y$10$vt3fuZv/wTMnCcY5XZum..XZCDF7b2KJCQsjPIf3sr3/38bNQmL7.','3',NULL,NULL,NULL);
INSERT INTO `users` VALUES('4','Staff Gudang','staff_gudang','$2y$10$DqgzNj5bC7e/y62dh08fTOLNMtym6/WIdvoeweLZxwqIbF0ZvCyV.','4',NULL,NULL,NULL);
INSERT INTO `users` VALUES('5','Admin Sales','admin_sales','$2y$10$E1VdwC3AJs.1q/MbCSRJxexnktD96TL8ABfoRKoAv7Ll7.r.yXGVe','5',NULL,NULL,NULL);
