-- Database Backup: 2025-12-30 09:24:56

DROP TABLE IF EXISTS `activity_log`;
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `activity_log` VALUES 
('1', 'default', 'created', 'App\\Models\\Satuan', 'created', '1', NULL, NULL, '{\"attributes\": {\"id\": 1, \"satuan\": \"KRT\", \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:05.000000Z\", \"updated_at\": \"2025-12-29T08:10:05.000000Z\"}}', NULL, '2025-12-29 08:10:05', '2025-12-29 08:10:05'),
('2', 'default', 'created', 'App\\Models\\Satuan', 'created', '2', NULL, NULL, '{\"attributes\": {\"id\": 2, \"satuan\": \"PAK\", \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:05.000000Z\", \"updated_at\": \"2025-12-29T08:10:05.000000Z\"}}', NULL, '2025-12-29 08:10:05', '2025-12-29 08:10:05'),
('3', 'default', 'created', 'App\\Models\\Satuan', 'created', '3', NULL, NULL, '{\"attributes\": {\"id\": 3, \"satuan\": \"PCS\", \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:05.000000Z\", \"updated_at\": \"2025-12-29T08:10:05.000000Z\"}}', NULL, '2025-12-29 08:10:06', '2025-12-29 08:10:06'),
('4', 'default', 'created', 'App\\Models\\Jenis', 'created', '1', NULL, NULL, '{\"attributes\": {\"id\": 1, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:06.000000Z\", \"updated_at\": \"2025-12-29T08:10:06.000000Z\", \"jenis_barang\": \"KACANG\"}}', NULL, '2025-12-29 08:10:06', '2025-12-29 08:10:06'),
('5', 'default', 'created', 'App\\Models\\Barang', 'created', '1', NULL, NULL, '{\"attributes\": {\"id\": 1, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 1, \"deskripsi\": \"DUA KELINCI KC KULIT\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:06.000000Z\", \"updated_at\": \"2025-12-29T08:10:06.000000Z\", \"kode_barang\": \"BRG-00001\", \"nama_barang\": \"DUA KELINCI KC KULIT\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:06', '2025-12-29 08:10:06'),
('6', 'default', 'created', 'App\\Models\\Jenis', 'created', '2', NULL, NULL, '{\"attributes\": {\"id\": 2, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:06.000000Z\", \"updated_at\": \"2025-12-29T08:10:06.000000Z\", \"jenis_barang\": \"KACANG BERSALUT\"}}', NULL, '2025-12-29 08:10:06', '2025-12-29 08:10:06'),
('7', 'default', 'created', 'App\\Models\\Barang', 'created', '2', NULL, NULL, '{\"attributes\": {\"id\": 2, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"DUA KELINCI BIJIAN\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:06.000000Z\", \"updated_at\": \"2025-12-29T08:10:06.000000Z\", \"kode_barang\": \"BRG-00002\", \"nama_barang\": \"DUA KELINCI BIJIAN\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:06', '2025-12-29 08:10:06'),
('8', 'default', 'created', 'App\\Models\\Barang', 'created', '3', NULL, NULL, '{\"attributes\": {\"id\": 3, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"SUKRO REGULER\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:07.000000Z\", \"updated_at\": \"2025-12-29T08:10:07.000000Z\", \"kode_barang\": \"BRG-00003\", \"nama_barang\": \"SUKRO REGULER\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:07', '2025-12-29 08:10:07'),
('9', 'default', 'created', 'App\\Models\\Barang', 'created', '4', NULL, NULL, '{\"attributes\": {\"id\": 4, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"SUKRO OVEN\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:07.000000Z\", \"updated_at\": \"2025-12-29T08:10:07.000000Z\", \"kode_barang\": \"BRG-00004\", \"nama_barang\": \"SUKRO OVEN\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:07', '2025-12-29 08:10:07'),
('10', 'default', 'created', 'App\\Models\\Jenis', 'created', '3', NULL, NULL, '{\"attributes\": {\"id\": 3, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:07.000000Z\", \"updated_at\": \"2025-12-29T08:10:07.000000Z\", \"jenis_barang\": \"WAFER\"}}', NULL, '2025-12-29 08:10:07', '2025-12-29 08:10:07'),
('11', 'default', 'created', 'App\\Models\\Barang', 'created', '5', NULL, NULL, '{\"attributes\": {\"id\": 5, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 3, \"deskripsi\": \"DEKA\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:07.000000Z\", \"updated_at\": \"2025-12-29T08:10:07.000000Z\", \"kode_barang\": \"BRG-00005\", \"nama_barang\": \"DEKA\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:07', '2025-12-29 08:10:07'),
('12', 'default', 'created', 'App\\Models\\Jenis', 'created', '4', NULL, NULL, '{\"attributes\": {\"id\": 4, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:08.000000Z\", \"updated_at\": \"2025-12-29T08:10:08.000000Z\", \"jenis_barang\": \"SNACK\"}}', NULL, '2025-12-29 08:10:08', '2025-12-29 08:10:08'),
('13', 'default', 'created', 'App\\Models\\Barang', 'created', '6', NULL, NULL, '{\"attributes\": {\"id\": 6, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 4, \"deskripsi\": \"TIC TAC\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:08.000000Z\", \"updated_at\": \"2025-12-29T08:10:08.000000Z\", \"kode_barang\": \"BRG-00006\", \"nama_barang\": \"TIC TAC\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:08', '2025-12-29 08:10:08'),
('14', 'default', 'created', 'App\\Models\\Barang', 'created', '7', NULL, NULL, '{\"attributes\": {\"id\": 7, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 4, \"deskripsi\": \"PILUS\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:08.000000Z\", \"updated_at\": \"2025-12-29T08:10:08.000000Z\", \"kode_barang\": \"BRG-00007\", \"nama_barang\": \"PILUS\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:08', '2025-12-29 08:10:08'),
('15', 'default', 'created', 'App\\Models\\Jenis', 'created', '5', NULL, NULL, '{\"attributes\": {\"id\": 5, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:08.000000Z\", \"updated_at\": \"2025-12-29T08:10:08.000000Z\", \"jenis_barang\": \"EKSTRUDER SNACK\"}}', NULL, '2025-12-29 08:10:08', '2025-12-29 08:10:08'),
('16', 'default', 'created', 'App\\Models\\Barang', 'created', '8', NULL, NULL, '{\"attributes\": {\"id\": 8, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 5, \"deskripsi\": \"RONI\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"kode_barang\": \"BRG-00008\", \"nama_barang\": \"RONI\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:09', '2025-12-29 08:10:09'),
('17', 'default', 'created', 'App\\Models\\Barang', 'created', '9', NULL, NULL, '{\"attributes\": {\"id\": 9, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 1, \"deskripsi\": \"SUPER NUT (N/A)\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"kode_barang\": \"BRG-00009\", \"nama_barang\": \"SUPER NUT (N/A)\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:09', '2025-12-29 08:10:09'),
('18', 'default', 'created', 'App\\Models\\Jenis', 'created', '6', NULL, NULL, '{\"attributes\": {\"id\": 6, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"jenis_barang\": \"BEVERAGE\"}}', NULL, '2025-12-29 08:10:09', '2025-12-29 08:10:09'),
('19', 'default', 'created', 'App\\Models\\Barang', 'created', '10', NULL, NULL, '{\"attributes\": {\"id\": 10, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 6, \"deskripsi\": \"SIR JUS (N/A)\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"kode_barang\": \"BRG-00010\", \"nama_barang\": \"SIR JUS (N/A)\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:09', '2025-12-29 08:10:09'),
('20', 'default', 'created', 'App\\Models\\Jenis', 'created', '7', NULL, NULL, '{\"attributes\": {\"id\": 7, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:09.000000Z\", \"updated_at\": \"2025-12-29T08:10:09.000000Z\", \"jenis_barang\": \"CHIPS\"}}', NULL, '2025-12-29 08:10:10', '2025-12-29 08:10:10'),
('21', 'default', 'created', 'App\\Models\\Barang', 'created', '11', NULL, NULL, '{\"attributes\": {\"id\": 11, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 7, \"deskripsi\": \"KRIP KRIP\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:10.000000Z\", \"updated_at\": \"2025-12-29T08:10:10.000000Z\", \"kode_barang\": \"BRG-00011\", \"nama_barang\": \"KRIP KRIP\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:10', '2025-12-29 08:10:10'),
('22', 'default', 'created', 'App\\Models\\Barang', 'created', '12', NULL, NULL, '{\"attributes\": {\"id\": 12, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 7, \"deskripsi\": \"TOS TOS\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:10.000000Z\", \"updated_at\": \"2025-12-29T08:10:10.000000Z\", \"kode_barang\": \"BRG-00012\", \"nama_barang\": \"TOS TOS\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:10', '2025-12-29 08:10:10'),
('23', 'default', 'created', 'App\\Models\\Barang', 'created', '13', NULL, NULL, '{\"attributes\": {\"id\": 13, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 4, \"deskripsi\": \"USAGI\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:10.000000Z\", \"updated_at\": \"2025-12-29T08:10:10.000000Z\", \"kode_barang\": \"BRG-00013\", \"nama_barang\": \"USAGI\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:10', '2025-12-29 08:10:10'),
('24', 'default', 'created', 'App\\Models\\Barang', 'created', '14', NULL, NULL, '{\"attributes\": {\"id\": 14, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 5, \"deskripsi\": \"TATO TATO\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:10.000000Z\", \"updated_at\": \"2025-12-29T08:10:10.000000Z\", \"kode_barang\": \"BRG-00014\", \"nama_barang\": \"TATO TATO\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:10', '2025-12-29 08:10:10'),
('25', 'default', 'created', 'App\\Models\\Barang', 'created', '15', NULL, NULL, '{\"attributes\": {\"id\": 15, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 5, \"deskripsi\": \"KREZO TWIST\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"kode_barang\": \"BRG-00015\", \"nama_barang\": \"KREZO TWIST\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:11', '2025-12-29 08:10:11'),
('26', 'default', 'created', 'App\\Models\\Jenis', 'created', '8', NULL, NULL, '{\"attributes\": {\"id\": 8, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"jenis_barang\": \"NOODLE SNACK\"}}', NULL, '2025-12-29 08:10:11', '2025-12-29 08:10:11'),
('27', 'default', 'created', 'App\\Models\\Barang', 'created', '16', NULL, NULL, '{\"attributes\": {\"id\": 16, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 8, \"deskripsi\": \"KREZO MIE\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"kode_barang\": \"BRG-00016\", \"nama_barang\": \"KREZO MIE\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:11', '2025-12-29 08:10:11'),
('28', 'default', 'created', 'App\\Models\\Jenis', 'created', '9', NULL, NULL, '{\"attributes\": {\"id\": 9, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"jenis_barang\": \"SEASONAL\"}}', NULL, '2025-12-29 08:10:11', '2025-12-29 08:10:11'),
('29', 'default', 'created', 'App\\Models\\Barang', 'created', '17', NULL, NULL, '{\"attributes\": {\"id\": 17, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 9, \"deskripsi\": \"SEASONAL\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:11.000000Z\", \"updated_at\": \"2025-12-29T08:10:11.000000Z\", \"kode_barang\": \"BRG-00017\", \"nama_barang\": \"SEASONAL\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:12', '2025-12-29 08:10:12'),
('30', 'default', 'created', 'App\\Models\\Barang', 'created', '18', NULL, NULL, '{\"attributes\": {\"id\": 18, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"ATOM PILUS (N/A)\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:12.000000Z\", \"updated_at\": \"2025-12-29T08:10:12.000000Z\", \"kode_barang\": \"BRG-00018\", \"nama_barang\": \"ATOM PILUS (N/A)\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:12', '2025-12-29 08:10:12'),
('31', 'default', 'created', 'App\\Models\\Barang', 'created', '19', NULL, NULL, '{\"attributes\": {\"id\": 19, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 2, \"deskripsi\": \"KATOM (N/A)\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:12.000000Z\", \"updated_at\": \"2025-12-29T08:10:12.000000Z\", \"kode_barang\": \"BRG-00019\", \"nama_barang\": \"KATOM (N/A)\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:12', '2025-12-29 08:10:12'),
('32', 'default', 'created', 'App\\Models\\Jenis', 'created', '10', NULL, NULL, '{\"attributes\": {\"id\": 10, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:12.000000Z\", \"updated_at\": \"2025-12-29T08:10:12.000000Z\", \"jenis_barang\": \"BIJI BIJIAN\"}}', NULL, '2025-12-29 08:10:12', '2025-12-29 08:10:12'),
('33', 'default', 'created', 'App\\Models\\Barang', 'created', '20', NULL, NULL, '{\"attributes\": {\"id\": 20, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 10, \"deskripsi\": \"FUZO\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:12.000000Z\", \"updated_at\": \"2025-12-29T08:10:12.000000Z\", \"kode_barang\": \"BRG-00020\", \"nama_barang\": \"FUZO\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:13', '2025-12-29 08:10:13'),
('34', 'default', 'created', 'App\\Models\\Jenis', 'created', '11', NULL, NULL, '{\"attributes\": {\"id\": 11, \"user_id\": 1, \"created_at\": \"2025-12-29T08:10:13.000000Z\", \"updated_at\": \"2025-12-29T08:10:13.000000Z\", \"jenis_barang\": \"PROMOSI\"}}', NULL, '2025-12-29 08:10:13', '2025-12-29 08:10:13'),
('35', 'default', 'created', 'App\\Models\\Barang', 'created', '21', NULL, NULL, '{\"attributes\": {\"id\": 21, \"stok\": 0, \"price\": \"0.00\", \"gambar\": null, \"user_id\": 1, \"jenis_id\": 11, \"deskripsi\": \"PROMOSI\", \"satuan_id\": 1, \"created_at\": \"2025-12-29T08:10:13.000000Z\", \"updated_at\": \"2025-12-29T08:10:13.000000Z\", \"kode_barang\": \"BRG-00021\", \"nama_barang\": \"PROMOSI\", \"stok_minimum\": 10}}', NULL, '2025-12-29 08:10:13', '2025-12-29 08:10:13'),
('36', 'default', 'created', 'App\\Models\\Order', 'created', '1', 'App\\Models\\User', '5', '{\"attributes\": {\"status\": \"draft\", \"order_no\": \"ORD-20251229001\", \"order_date\": \"2025-12-29\", \"customer_id\": 2, \"total_amount\": \"0.00\"}}', NULL, '2025-12-29 08:18:00', '2025-12-29 08:18:00'),
('37', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '1', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 1, \"quantity\": 7, \"barang_id\": 1, \"unit_price\": \"50250.00\", \"total_price\": \"351750.00\"}}', NULL, '2025-12-29 08:18:00', '2025-12-29 08:18:00'),
('38', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '2', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 1, \"quantity\": 6, \"barang_id\": 2, \"unit_price\": \"67500.00\", \"total_price\": \"405000.00\"}}', NULL, '2025-12-29 08:18:00', '2025-12-29 08:18:00'),
('39', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '3', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 1, \"quantity\": 9, \"barang_id\": 3, \"unit_price\": \"73500.00\", \"total_price\": \"661500.00\"}}', NULL, '2025-12-29 08:18:00', '2025-12-29 08:18:00'),
('40', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '4', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 1, \"quantity\": 10, \"barang_id\": 4, \"unit_price\": \"58000.00\", \"total_price\": \"580000.00\"}}', NULL, '2025-12-29 08:18:00', '2025-12-29 08:18:00'),
('41', 'default', 'updated', 'App\\Models\\Order', 'updated', '1', 'App\\Models\\User', '5', '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"1998250.00\"}}', NULL, '2025-12-29 08:18:00', '2025-12-29 08:18:00'),
('42', 'default', 'updated', 'App\\Models\\Order', 'updated', '1', 'App\\Models\\User', '5', '{\"old\": {\"status\": \"draft\"}, \"attributes\": {\"status\": \"post\"}}', NULL, '2025-12-29 08:18:07', '2025-12-29 08:18:07'),
('43', 'default', 'updated', 'App\\Models\\Order', 'updated', '1', 'App\\Models\\User', '3', '{\"old\": {\"status\": \"post\"}, \"attributes\": {\"status\": \"confirmed\"}}', NULL, '2025-12-29 09:50:03', '2025-12-29 09:50:03'),
('44', 'default', 'updated', 'App\\Models\\OrderDetail', 'updated', '1', 'App\\Models\\User', '4', '{\"old\": {\"quantity\": 7, \"total_price\": \"351750.00\"}, \"attributes\": {\"quantity\": 5, \"total_price\": \"251250.00\"}}', NULL, '2025-12-29 09:55:23', '2025-12-29 09:55:23'),
('45', 'default', 'updated', 'App\\Models\\Order', 'updated', '1', 'App\\Models\\User', '4', '{\"old\": {\"total_amount\": \"1998250.00\"}, \"attributes\": {\"total_amount\": \"1897750.00\"}}', NULL, '2025-12-29 09:55:23', '2025-12-29 09:55:23'),
('46', 'default', 'updated', 'App\\Models\\Order', 'updated', '1', 'App\\Models\\User', '4', '{\"old\": {\"status\": \"confirmed\"}, \"attributes\": {\"status\": \"shipped\"}}', NULL, '2025-12-29 09:56:20', '2025-12-29 09:56:20'),
('47', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '1', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 1, \"user_id\": 4, \"order_no\": \"ORD-20251229001\", \"created_at\": \"2025-12-29T09:56:21.000000Z\", \"updated_at\": \"2025-12-29T09:56:21.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI KC KULIT\", \"jumlah_keluar\": 5, \"kode_transaksi\": \"TRX-OUT-2025-12-29-9594\", \"tanggal_keluar\": \"2025-12-29\"}}', NULL, '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('48', 'default', 'updated', 'App\\Models\\Barang', 'updated', '1', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:06.000000Z\"}, \"attributes\": {\"stok\": 25, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}}', NULL, '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('49', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '2', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 2, \"user_id\": 4, \"order_no\": \"ORD-20251229001\", \"created_at\": \"2025-12-29T09:56:21.000000Z\", \"updated_at\": \"2025-12-29T09:56:21.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI BIJIAN\", \"jumlah_keluar\": 6, \"kode_transaksi\": \"TRX-OUT-2025-12-29-5748\", \"tanggal_keluar\": \"2025-12-29\"}}', NULL, '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('50', 'default', 'updated', 'App\\Models\\Barang', 'updated', '2', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:06.000000Z\"}, \"attributes\": {\"stok\": 24, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}}', NULL, '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('51', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '3', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 3, \"user_id\": 4, \"order_no\": \"ORD-20251229001\", \"created_at\": \"2025-12-29T09:56:21.000000Z\", \"updated_at\": \"2025-12-29T09:56:21.000000Z\", \"customer_id\": 2, \"nama_barang\": \"SUKRO REGULER\", \"jumlah_keluar\": 9, \"kode_transaksi\": \"TRX-OUT-2025-12-29-2089\", \"tanggal_keluar\": \"2025-12-29\"}}', NULL, '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('52', 'default', 'updated', 'App\\Models\\Barang', 'updated', '3', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:07.000000Z\"}, \"attributes\": {\"stok\": 21, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}}', NULL, '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('53', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '4', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 4, \"user_id\": 4, \"order_no\": \"ORD-20251229001\", \"created_at\": \"2025-12-29T09:56:21.000000Z\", \"updated_at\": \"2025-12-29T09:56:21.000000Z\", \"customer_id\": 2, \"nama_barang\": \"SUKRO OVEN\", \"jumlah_keluar\": 10, \"kode_transaksi\": \"TRX-OUT-2025-12-29-2039\", \"tanggal_keluar\": \"2025-12-29\"}}', NULL, '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('54', 'default', 'updated', 'App\\Models\\Barang', 'updated', '4', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:07.000000Z\"}, \"attributes\": {\"stok\": 20, \"updated_at\": \"2025-12-29T09:56:22.000000Z\"}}', NULL, '2025-12-29 09:56:22', '2025-12-29 09:56:22'),
('55', 'default', 'created', 'App\\Models\\Order', 'created', '2', 'App\\Models\\User', '5', '{\"attributes\": {\"status\": \"draft\", \"order_no\": \"ORD-20251230001\", \"order_date\": \"2025-12-30\", \"customer_id\": 2, \"total_amount\": \"0.00\"}}', NULL, '2025-12-30 03:39:13', '2025-12-30 03:39:13'),
('56', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '5', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 2, \"quantity\": 5, \"barang_id\": 1, \"unit_price\": \"50250.00\", \"total_price\": \"251250.00\"}}', NULL, '2025-12-30 03:39:13', '2025-12-30 03:39:13'),
('57', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '6', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 2, \"quantity\": 7, \"barang_id\": 3, \"unit_price\": \"73500.00\", \"total_price\": \"514500.00\"}}', NULL, '2025-12-30 03:39:13', '2025-12-30 03:39:13'),
('58', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '7', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 2, \"quantity\": 6, \"barang_id\": 20, \"unit_price\": \"75500.00\", \"total_price\": \"453000.00\"}}', NULL, '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('59', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '8', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 2, \"quantity\": 4, \"barang_id\": 18, \"unit_price\": \"72000.00\", \"total_price\": \"288000.00\"}}', NULL, '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('60', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '9', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 2, \"quantity\": 2, \"barang_id\": 2, \"unit_price\": \"67500.00\", \"total_price\": \"135000.00\"}}', NULL, '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('61', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '10', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 2, \"quantity\": 8, \"barang_id\": 1, \"unit_price\": \"50250.00\", \"total_price\": \"402000.00\"}}', NULL, '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('62', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '11', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 2, \"quantity\": 7, \"barang_id\": 16, \"unit_price\": \"54000.00\", \"total_price\": \"378000.00\"}}', NULL, '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('63', 'default', 'updated', 'App\\Models\\Order', 'updated', '2', 'App\\Models\\User', '5', '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"2421750.00\"}}', NULL, '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('64', 'default', 'updated', 'App\\Models\\Order', 'updated', '2', 'App\\Models\\User', '5', '{\"old\": {\"status\": \"draft\"}, \"attributes\": {\"status\": \"post\"}}', NULL, '2025-12-30 03:39:20', '2025-12-30 03:39:20'),
('65', 'default', 'updated', 'App\\Models\\Order', 'updated', '2', 'App\\Models\\User', '3', '{\"old\": {\"status\": \"post\"}, \"attributes\": {\"status\": \"confirmed\"}}', NULL, '2025-12-30 03:45:32', '2025-12-30 03:45:32'),
('66', 'default', 'updated', 'App\\Models\\Order', 'updated', '2', 'App\\Models\\User', '4', '{\"old\": {\"status\": \"confirmed\"}, \"attributes\": {\"status\": \"shipped\"}}', NULL, '2025-12-30 04:05:16', '2025-12-30 04:05:16'),
('67', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '5', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 5, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:16.000000Z\", \"updated_at\": \"2025-12-30T04:05:16.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI KC KULIT\", \"jumlah_keluar\": 5, \"kode_transaksi\": \"TRX-OUT-2025-12-30-6327\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:05:16', '2025-12-30 04:05:16'),
('68', 'default', 'updated', 'App\\Models\\Barang', 'updated', '1', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 25, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}, \"attributes\": {\"stok\": 20, \"updated_at\": \"2025-12-30T04:05:16.000000Z\"}}', NULL, '2025-12-30 04:05:16', '2025-12-30 04:05:16'),
('69', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '6', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 6, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:16.000000Z\", \"updated_at\": \"2025-12-30T04:05:16.000000Z\", \"customer_id\": 2, \"nama_barang\": \"SUKRO REGULER\", \"jumlah_keluar\": 7, \"kode_transaksi\": \"TRX-OUT-2025-12-30-1347\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:05:16', '2025-12-30 04:05:16'),
('70', 'default', 'updated', 'App\\Models\\Barang', 'updated', '3', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 21, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}, \"attributes\": {\"stok\": 14, \"updated_at\": \"2025-12-30T04:05:16.000000Z\"}}', NULL, '2025-12-30 04:05:16', '2025-12-30 04:05:16'),
('71', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '7', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 7, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:16.000000Z\", \"updated_at\": \"2025-12-30T04:05:16.000000Z\", \"customer_id\": 2, \"nama_barang\": \"FUZO\", \"jumlah_keluar\": 6, \"kode_transaksi\": \"TRX-OUT-2025-12-30-7808\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:05:16', '2025-12-30 04:05:16'),
('72', 'default', 'updated', 'App\\Models\\Barang', 'updated', '20', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:12.000000Z\"}, \"attributes\": {\"stok\": 24, \"updated_at\": \"2025-12-30T04:05:17.000000Z\"}}', NULL, '2025-12-30 04:05:17', '2025-12-30 04:05:17'),
('73', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '8', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 8, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:17.000000Z\", \"updated_at\": \"2025-12-30T04:05:17.000000Z\", \"customer_id\": 2, \"nama_barang\": \"ATOM PILUS (N/A)\", \"jumlah_keluar\": 4, \"kode_transaksi\": \"TRX-OUT-2025-12-30-3027\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:05:17', '2025-12-30 04:05:17'),
('74', 'default', 'updated', 'App\\Models\\Barang', 'updated', '18', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:12.000000Z\"}, \"attributes\": {\"stok\": 26, \"updated_at\": \"2025-12-30T04:05:17.000000Z\"}}', NULL, '2025-12-30 04:05:17', '2025-12-30 04:05:17'),
('75', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '9', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 9, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:17.000000Z\", \"updated_at\": \"2025-12-30T04:05:17.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI BIJIAN\", \"jumlah_keluar\": 2, \"kode_transaksi\": \"TRX-OUT-2025-12-30-3590\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:05:17', '2025-12-30 04:05:17'),
('76', 'default', 'updated', 'App\\Models\\Barang', 'updated', '2', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 24, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}, \"attributes\": {\"stok\": 22, \"updated_at\": \"2025-12-30T04:05:17.000000Z\"}}', NULL, '2025-12-30 04:05:17', '2025-12-30 04:05:17'),
('77', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '10', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 10, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:17.000000Z\", \"updated_at\": \"2025-12-30T04:05:17.000000Z\", \"customer_id\": 2, \"nama_barang\": \"DUA KELINCI KC KULIT\", \"jumlah_keluar\": 8, \"kode_transaksi\": \"TRX-OUT-2025-12-30-6140\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:05:17', '2025-12-30 04:05:17'),
('78', 'default', 'updated', 'App\\Models\\Barang', 'updated', '1', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 25, \"updated_at\": \"2025-12-29T09:56:21.000000Z\"}, \"attributes\": {\"stok\": 17, \"updated_at\": \"2025-12-30T04:05:18.000000Z\"}}', NULL, '2025-12-30 04:05:18', '2025-12-30 04:05:18'),
('79', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '11', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 11, \"user_id\": 4, \"order_no\": \"ORD-20251230001\", \"created_at\": \"2025-12-30T04:05:18.000000Z\", \"updated_at\": \"2025-12-30T04:05:18.000000Z\", \"customer_id\": 2, \"nama_barang\": \"KREZO MIE\", \"jumlah_keluar\": 7, \"kode_transaksi\": \"TRX-OUT-2025-12-30-8184\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:05:18', '2025-12-30 04:05:18'),
('80', 'default', 'updated', 'App\\Models\\Barang', 'updated', '16', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:11.000000Z\"}, \"attributes\": {\"stok\": 23, \"updated_at\": \"2025-12-30T04:05:18.000000Z\"}}', NULL, '2025-12-30 04:05:18', '2025-12-30 04:05:18'),
('81', 'default', 'updated', 'App\\Models\\Order', 'updated', '2', 'App\\Models\\User', '5', '{\"old\": {\"status\": \"shipped\"}, \"attributes\": {\"status\": \"completed\"}}', NULL, '2025-12-30 04:13:08', '2025-12-30 04:13:08'),
('82', 'default', 'updated', 'App\\Models\\Order', 'updated', '1', 'App\\Models\\User', '5', '{\"old\": {\"status\": \"shipped\"}, \"attributes\": {\"status\": \"completed\"}}', NULL, '2025-12-30 04:13:13', '2025-12-30 04:13:13'),
('83', 'default', 'created', 'App\\Models\\Order', 'created', '3', 'App\\Models\\User', '5', '{\"attributes\": {\"status\": \"draft\", \"order_no\": \"ORD-20251230002\", \"order_date\": \"2025-12-30\", \"customer_id\": 19, \"total_amount\": \"0.00\"}}', NULL, '2025-12-30 04:34:09', '2025-12-30 04:34:09'),
('84', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '12', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 1, \"barang_id\": 1, \"unit_price\": \"50250.00\", \"total_price\": \"50250.00\"}}', NULL, '2025-12-30 04:34:09', '2025-12-30 04:34:09'),
('85', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '13', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 1, \"barang_id\": 2, \"unit_price\": \"67500.00\", \"total_price\": \"67500.00\"}}', NULL, '2025-12-30 04:34:09', '2025-12-30 04:34:09'),
('86', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '14', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 3, \"barang_id\": 3, \"unit_price\": \"73500.00\", \"total_price\": \"220500.00\"}}', NULL, '2025-12-30 04:34:09', '2025-12-30 04:34:09'),
('87', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '15', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 5, \"barang_id\": 4, \"unit_price\": \"58000.00\", \"total_price\": \"290000.00\"}}', NULL, '2025-12-30 04:34:09', '2025-12-30 04:34:09'),
('88', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '16', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 2, \"barang_id\": 5, \"unit_price\": \"79950.00\", \"total_price\": \"159900.00\"}}', NULL, '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('89', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '17', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 3, \"barang_id\": 6, \"unit_price\": \"51250.00\", \"total_price\": \"153750.00\"}}', NULL, '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('90', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '18', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 1, \"barang_id\": 7, \"unit_price\": \"69000.00\", \"total_price\": \"69000.00\"}}', NULL, '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('91', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '19', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 2, \"barang_id\": 8, \"unit_price\": \"74500.00\", \"total_price\": \"149000.00\"}}', NULL, '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('92', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '20', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 3, \"barang_id\": 9, \"unit_price\": \"59500.00\", \"total_price\": \"178500.00\"}}', NULL, '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('93', 'default', 'created', 'App\\Models\\OrderDetail', 'created', '21', 'App\\Models\\User', '5', '{\"attributes\": {\"order_id\": 3, \"quantity\": 2, \"barang_id\": 15, \"unit_price\": \"78500.00\", \"total_price\": \"157000.00\"}}', NULL, '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('94', 'default', 'updated', 'App\\Models\\Order', 'updated', '3', 'App\\Models\\User', '5', '{\"old\": {\"total_amount\": 0}, \"attributes\": {\"total_amount\": \"1495400.00\"}}', NULL, '2025-12-30 04:34:11', '2025-12-30 04:34:11'),
('95', 'default', 'updated', 'App\\Models\\Order', 'updated', '3', 'App\\Models\\User', '5', '{\"old\": {\"status\": \"draft\"}, \"attributes\": {\"status\": \"post\"}}', NULL, '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('96', 'default', 'updated', 'App\\Models\\Order', 'updated', '3', 'App\\Models\\User', '3', '{\"old\": {\"status\": \"post\"}, \"attributes\": {\"status\": \"confirmed\"}}', NULL, '2025-12-30 04:34:25', '2025-12-30 04:34:25'),
('97', 'default', 'updated', 'App\\Models\\Order', 'updated', '3', 'App\\Models\\User', '4', '{\"old\": {\"status\": \"confirmed\"}, \"attributes\": {\"status\": \"shipped\"}}', NULL, '2025-12-30 04:34:35', '2025-12-30 04:34:35'),
('98', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '12', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 12, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:35.000000Z\", \"updated_at\": \"2025-12-30T04:34:35.000000Z\", \"customer_id\": 19, \"nama_barang\": \"DUA KELINCI KC KULIT\", \"jumlah_keluar\": 1, \"kode_transaksi\": \"TRX-OUT-2025-12-30-8565\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:35', '2025-12-30 04:34:35'),
('99', 'default', 'updated', 'App\\Models\\Barang', 'updated', '1', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 17, \"updated_at\": \"2025-12-30T04:05:18.000000Z\"}, \"attributes\": {\"stok\": 16, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}}', NULL, '2025-12-30 04:34:36', '2025-12-30 04:34:36'),
('100', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '13', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 13, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:36.000000Z\", \"updated_at\": \"2025-12-30T04:34:36.000000Z\", \"customer_id\": 19, \"nama_barang\": \"DUA KELINCI BIJIAN\", \"jumlah_keluar\": 1, \"kode_transaksi\": \"TRX-OUT-2025-12-30-6215\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:36', '2025-12-30 04:34:36'),
('101', 'default', 'updated', 'App\\Models\\Barang', 'updated', '2', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 22, \"updated_at\": \"2025-12-30T04:05:17.000000Z\"}, \"attributes\": {\"stok\": 21, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}}', NULL, '2025-12-30 04:34:36', '2025-12-30 04:34:36'),
('102', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '14', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 14, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:36.000000Z\", \"updated_at\": \"2025-12-30T04:34:36.000000Z\", \"customer_id\": 19, \"nama_barang\": \"SUKRO REGULER\", \"jumlah_keluar\": 3, \"kode_transaksi\": \"TRX-OUT-2025-12-30-4119\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:36', '2025-12-30 04:34:36'),
('103', 'default', 'updated', 'App\\Models\\Barang', 'updated', '3', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 14, \"updated_at\": \"2025-12-30T04:05:16.000000Z\"}, \"attributes\": {\"stok\": 11, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}}', NULL, '2025-12-30 04:34:36', '2025-12-30 04:34:36'),
('104', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '15', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 15, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:36.000000Z\", \"updated_at\": \"2025-12-30T04:34:36.000000Z\", \"customer_id\": 19, \"nama_barang\": \"SUKRO OVEN\", \"jumlah_keluar\": 5, \"kode_transaksi\": \"TRX-OUT-2025-12-30-0850\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:36', '2025-12-30 04:34:36'),
('105', 'default', 'updated', 'App\\Models\\Barang', 'updated', '4', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 20, \"updated_at\": \"2025-12-29T09:56:22.000000Z\"}, \"attributes\": {\"stok\": 15, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}}', NULL, '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('106', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '16', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 16, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:37.000000Z\", \"updated_at\": \"2025-12-30T04:34:37.000000Z\", \"customer_id\": 19, \"nama_barang\": \"DEKA\", \"jumlah_keluar\": 2, \"kode_transaksi\": \"TRX-OUT-2025-12-30-8391\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('107', 'default', 'updated', 'App\\Models\\Barang', 'updated', '5', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:07.000000Z\"}, \"attributes\": {\"stok\": 28, \"updated_at\": \"2025-12-30T04:34:37.000000Z\"}}', NULL, '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('108', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '17', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 17, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:37.000000Z\", \"updated_at\": \"2025-12-30T04:34:37.000000Z\", \"customer_id\": 19, \"nama_barang\": \"TIC TAC\", \"jumlah_keluar\": 3, \"kode_transaksi\": \"TRX-OUT-2025-12-30-1088\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('109', 'default', 'updated', 'App\\Models\\Barang', 'updated', '6', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:08.000000Z\"}, \"attributes\": {\"stok\": 27, \"updated_at\": \"2025-12-30T04:34:37.000000Z\"}}', NULL, '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('110', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '18', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 18, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:37.000000Z\", \"updated_at\": \"2025-12-30T04:34:37.000000Z\", \"customer_id\": 19, \"nama_barang\": \"PILUS\", \"jumlah_keluar\": 1, \"kode_transaksi\": \"TRX-OUT-2025-12-30-8961\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('111', 'default', 'updated', 'App\\Models\\Barang', 'updated', '7', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:08.000000Z\"}, \"attributes\": {\"stok\": 29, \"updated_at\": \"2025-12-30T04:34:37.000000Z\"}}', NULL, '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('112', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '19', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 19, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:38.000000Z\", \"updated_at\": \"2025-12-30T04:34:38.000000Z\", \"customer_id\": 19, \"nama_barang\": \"RONI\", \"jumlah_keluar\": 2, \"kode_transaksi\": \"TRX-OUT-2025-12-30-1050\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:38', '2025-12-30 04:34:38'),
('113', 'default', 'updated', 'App\\Models\\Barang', 'updated', '8', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:09.000000Z\"}, \"attributes\": {\"stok\": 28, \"updated_at\": \"2025-12-30T04:34:38.000000Z\"}}', NULL, '2025-12-30 04:34:38', '2025-12-30 04:34:38'),
('114', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '20', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 20, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:38.000000Z\", \"updated_at\": \"2025-12-30T04:34:38.000000Z\", \"customer_id\": 19, \"nama_barang\": \"SUPER NUT (N/A)\", \"jumlah_keluar\": 3, \"kode_transaksi\": \"TRX-OUT-2025-12-30-9515\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:38', '2025-12-30 04:34:38'),
('115', 'default', 'updated', 'App\\Models\\Barang', 'updated', '9', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:09.000000Z\"}, \"attributes\": {\"stok\": 27, \"updated_at\": \"2025-12-30T04:34:38.000000Z\"}}', NULL, '2025-12-30 04:34:38', '2025-12-30 04:34:38'),
('116', 'default', 'created', 'App\\Models\\BarangKeluar', 'created', '21', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 21, \"user_id\": 4, \"order_no\": \"ORD-20251230002\", \"created_at\": \"2025-12-30T04:34:38.000000Z\", \"updated_at\": \"2025-12-30T04:34:38.000000Z\", \"customer_id\": 19, \"nama_barang\": \"KREZO TWIST\", \"jumlah_keluar\": 2, \"kode_transaksi\": \"TRX-OUT-2025-12-30-1480\", \"tanggal_keluar\": \"2025-12-30\"}}', NULL, '2025-12-30 04:34:38', '2025-12-30 04:34:38'),
('117', 'default', 'updated', 'App\\Models\\Barang', 'updated', '15', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:11.000000Z\"}, \"attributes\": {\"stok\": 28, \"updated_at\": \"2025-12-30T04:34:38.000000Z\"}}', NULL, '2025-12-30 04:34:38', '2025-12-30 04:34:38'),
('118', 'default', 'updated', 'App\\Models\\Order', 'updated', '3', 'App\\Models\\User', '5', '{\"old\": {\"status\": \"shipped\"}, \"attributes\": {\"status\": \"completed\"}}', NULL, '2025-12-30 04:34:43', '2025-12-30 04:34:43'),
('119', 'default', 'created', 'App\\Models\\Supplier', 'created', '1', 'App\\Models\\User', '3', '{\"attributes\": {\"id\": 1, \"alamat\": \"Jl. Kudus - Pati No.Km 6, RW.3, Lumpur, Bumirejo, Kec. Margorejo, Kabupaten Pati, Jawa Tengah 59163\", \"user_id\": 3, \"supplier\": \"PT Dua Kelinci\", \"created_at\": \"2025-12-30T08:15:59.000000Z\", \"updated_at\": \"2025-12-30T08:15:59.000000Z\"}}', NULL, '2025-12-30 08:15:59', '2025-12-30 08:15:59'),
('120', 'default', 'created', 'App\\Models\\BarangMasuk', 'created', '1', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 1, \"user_id\": 4, \"created_at\": \"2025-12-30T08:26:26.000000Z\", \"updated_at\": \"2025-12-30T08:26:26.000000Z\", \"nama_barang\": \"DUA KELINCI KC KULIT\", \"supplier_id\": 1, \"jumlah_masuk\": 1, \"tanggal_masuk\": \"2025-12-30\", \"kode_transaksi\": \"TRX-IN-2025-12-30-6144\"}}', NULL, '2025-12-30 08:26:26', '2025-12-30 08:26:26'),
('121', 'default', 'updated', 'App\\Models\\Barang', 'updated', '1', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 16, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}, \"attributes\": {\"stok\": 17, \"updated_at\": \"2025-12-30T08:26:26.000000Z\"}}', NULL, '2025-12-30 08:26:26', '2025-12-30 08:26:26'),
('122', 'default', 'created', 'App\\Models\\BarangMasuk', 'created', '2', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 2, \"user_id\": 4, \"created_at\": \"2025-12-30T08:26:26.000000Z\", \"updated_at\": \"2025-12-30T08:26:26.000000Z\", \"nama_barang\": \"SUKRO REGULER\", \"supplier_id\": 1, \"jumlah_masuk\": 7, \"tanggal_masuk\": \"2025-12-30\", \"kode_transaksi\": \"TRX-IN-2025-12-30-4932\"}}', NULL, '2025-12-30 08:26:27', '2025-12-30 08:26:27'),
('123', 'default', 'updated', 'App\\Models\\Barang', 'updated', '3', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 11, \"updated_at\": \"2025-12-30T04:34:36.000000Z\"}, \"attributes\": {\"stok\": 18, \"updated_at\": \"2025-12-30T08:26:27.000000Z\"}}', NULL, '2025-12-30 08:26:27', '2025-12-30 08:26:27'),
('124', 'default', 'created', 'App\\Models\\BarangMasuk', 'created', '3', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 3, \"user_id\": 4, \"created_at\": \"2025-12-30T08:26:27.000000Z\", \"updated_at\": \"2025-12-30T08:26:27.000000Z\", \"nama_barang\": \"TATO TATO\", \"supplier_id\": 1, \"jumlah_masuk\": 10, \"tanggal_masuk\": \"2025-12-30\", \"kode_transaksi\": \"TRX-IN-2025-12-30-7012\"}}', NULL, '2025-12-30 08:26:27', '2025-12-30 08:26:27'),
('125', 'default', 'updated', 'App\\Models\\Barang', 'updated', '14', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:10.000000Z\"}, \"attributes\": {\"stok\": 40, \"updated_at\": \"2025-12-30T08:26:27.000000Z\"}}', NULL, '2025-12-30 08:26:27', '2025-12-30 08:26:27'),
('126', 'default', 'created', 'App\\Models\\BarangMasuk', 'created', '4', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 4, \"user_id\": 4, \"created_at\": \"2025-12-30T08:26:27.000000Z\", \"updated_at\": \"2025-12-30T08:26:27.000000Z\", \"nama_barang\": \"PROMOSI\", \"supplier_id\": 1, \"jumlah_masuk\": 12, \"tanggal_masuk\": \"2025-12-30\", \"kode_transaksi\": \"TRX-IN-2025-12-30-4451\"}}', NULL, '2025-12-30 08:26:27', '2025-12-30 08:26:27'),
('127', 'default', 'updated', 'App\\Models\\Barang', 'updated', '21', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:13.000000Z\"}, \"attributes\": {\"stok\": 42, \"updated_at\": \"2025-12-30T08:26:27.000000Z\"}}', NULL, '2025-12-30 08:26:27', '2025-12-30 08:26:27'),
('128', 'default', 'created', 'App\\Models\\BarangMasuk', 'created', '5', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 5, \"user_id\": 4, \"created_at\": \"2025-12-30T08:26:28.000000Z\", \"updated_at\": \"2025-12-30T08:26:28.000000Z\", \"nama_barang\": \"ATOM PILUS (N/A)\", \"supplier_id\": 1, \"jumlah_masuk\": 5, \"tanggal_masuk\": \"2025-12-30\", \"kode_transaksi\": \"TRX-IN-2025-12-30-2687\"}}', NULL, '2025-12-30 08:26:28', '2025-12-30 08:26:28'),
('129', 'default', 'updated', 'App\\Models\\Barang', 'updated', '18', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 26, \"updated_at\": \"2025-12-30T04:05:17.000000Z\"}, \"attributes\": {\"stok\": 31, \"updated_at\": \"2025-12-30T08:26:28.000000Z\"}}', NULL, '2025-12-30 08:26:28', '2025-12-30 08:26:28'),
('130', 'default', 'created', 'App\\Models\\BarangMasuk', 'created', '6', 'App\\Models\\User', '4', '{\"attributes\": {\"id\": 6, \"user_id\": 4, \"created_at\": \"2025-12-30T08:26:28.000000Z\", \"updated_at\": \"2025-12-30T08:26:28.000000Z\", \"nama_barang\": \"SEASONAL\", \"supplier_id\": 1, \"jumlah_masuk\": 7, \"tanggal_masuk\": \"2025-12-30\", \"kode_transaksi\": \"TRX-IN-2025-12-30-6469\"}}', NULL, '2025-12-30 08:26:28', '2025-12-30 08:26:28'),
('131', 'default', 'updated', 'App\\Models\\Barang', 'updated', '17', 'App\\Models\\User', '4', '{\"old\": {\"stok\": 30, \"updated_at\": \"2025-12-29T08:10:11.000000Z\"}, \"attributes\": {\"stok\": 37, \"updated_at\": \"2025-12-30T08:26:28.000000Z\"}}', NULL, '2025-12-30 08:26:28', '2025-12-30 08:26:28');

DROP TABLE IF EXISTS `barang_keluars`;
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

INSERT INTO `barang_keluars` VALUES 
('1', 'TRX-OUT-2025-12-29-9594', 'ORD-20251229001', '2025-12-29', 'DUA KELINCI KC KULIT', '5', '2', '4', '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('2', 'TRX-OUT-2025-12-29-5748', 'ORD-20251229001', '2025-12-29', 'DUA KELINCI BIJIAN', '6', '2', '4', '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('3', 'TRX-OUT-2025-12-29-2089', 'ORD-20251229001', '2025-12-29', 'SUKRO REGULER', '9', '2', '4', '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('4', 'TRX-OUT-2025-12-29-2039', 'ORD-20251229001', '2025-12-29', 'SUKRO OVEN', '10', '2', '4', '2025-12-29 09:56:21', '2025-12-29 09:56:21'),
('5', 'TRX-OUT-2025-12-30-6327', 'ORD-20251230001', '2025-12-30', 'DUA KELINCI KC KULIT', '5', '2', '4', '2025-12-30 04:05:16', '2025-12-30 04:05:16'),
('6', 'TRX-OUT-2025-12-30-1347', 'ORD-20251230001', '2025-12-30', 'SUKRO REGULER', '7', '2', '4', '2025-12-30 04:05:16', '2025-12-30 04:05:16'),
('7', 'TRX-OUT-2025-12-30-7808', 'ORD-20251230001', '2025-12-30', 'FUZO', '6', '2', '4', '2025-12-30 04:05:16', '2025-12-30 04:05:16'),
('8', 'TRX-OUT-2025-12-30-3027', 'ORD-20251230001', '2025-12-30', 'ATOM PILUS (N/A)', '4', '2', '4', '2025-12-30 04:05:17', '2025-12-30 04:05:17'),
('9', 'TRX-OUT-2025-12-30-3590', 'ORD-20251230001', '2025-12-30', 'DUA KELINCI BIJIAN', '2', '2', '4', '2025-12-30 04:05:17', '2025-12-30 04:05:17'),
('10', 'TRX-OUT-2025-12-30-6140', 'ORD-20251230001', '2025-12-30', 'DUA KELINCI KC KULIT', '8', '2', '4', '2025-12-30 04:05:17', '2025-12-30 04:05:17'),
('11', 'TRX-OUT-2025-12-30-8184', 'ORD-20251230001', '2025-12-30', 'KREZO MIE', '7', '2', '4', '2025-12-30 04:05:18', '2025-12-30 04:05:18'),
('12', 'TRX-OUT-2025-12-30-8565', 'ORD-20251230002', '2025-12-30', 'DUA KELINCI KC KULIT', '1', '19', '4', '2025-12-30 04:34:35', '2025-12-30 04:34:35'),
('13', 'TRX-OUT-2025-12-30-6215', 'ORD-20251230002', '2025-12-30', 'DUA KELINCI BIJIAN', '1', '19', '4', '2025-12-30 04:34:36', '2025-12-30 04:34:36'),
('14', 'TRX-OUT-2025-12-30-4119', 'ORD-20251230002', '2025-12-30', 'SUKRO REGULER', '3', '19', '4', '2025-12-30 04:34:36', '2025-12-30 04:34:36'),
('15', 'TRX-OUT-2025-12-30-0850', 'ORD-20251230002', '2025-12-30', 'SUKRO OVEN', '5', '19', '4', '2025-12-30 04:34:36', '2025-12-30 04:34:36'),
('16', 'TRX-OUT-2025-12-30-8391', 'ORD-20251230002', '2025-12-30', 'DEKA', '2', '19', '4', '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('17', 'TRX-OUT-2025-12-30-1088', 'ORD-20251230002', '2025-12-30', 'TIC TAC', '3', '19', '4', '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('18', 'TRX-OUT-2025-12-30-8961', 'ORD-20251230002', '2025-12-30', 'PILUS', '1', '19', '4', '2025-12-30 04:34:37', '2025-12-30 04:34:37'),
('19', 'TRX-OUT-2025-12-30-1050', 'ORD-20251230002', '2025-12-30', 'RONI', '2', '19', '4', '2025-12-30 04:34:38', '2025-12-30 04:34:38'),
('20', 'TRX-OUT-2025-12-30-9515', 'ORD-20251230002', '2025-12-30', 'SUPER NUT (N/A)', '3', '19', '4', '2025-12-30 04:34:38', '2025-12-30 04:34:38'),
('21', 'TRX-OUT-2025-12-30-1480', 'ORD-20251230002', '2025-12-30', 'KREZO TWIST', '2', '19', '4', '2025-12-30 04:34:38', '2025-12-30 04:34:38');

DROP TABLE IF EXISTS `barang_masuks`;
CREATE TABLE `barang_masuks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `po_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_masuk` date NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_masuk` int NOT NULL,
  `supplier_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barang_masuks_kode_transaksi_unique` (`kode_transaksi`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `barang_masuks` VALUES 
('1', 'TRX-IN-2025-12-30-6144', 'PO-20251230001', '2025-12-30', 'DUA KELINCI KC KULIT', '1', '1', '4', '2025-12-30 08:26:26', '2025-12-30 08:26:26'),
('2', 'TRX-IN-2025-12-30-4932', 'PO-20251230001', '2025-12-30', 'SUKRO REGULER', '7', '1', '4', '2025-12-30 08:26:26', '2025-12-30 08:26:26'),
('3', 'TRX-IN-2025-12-30-7012', 'PO-20251230001', '2025-12-30', 'TATO TATO', '10', '1', '4', '2025-12-30 08:26:27', '2025-12-30 08:26:27'),
('4', 'TRX-IN-2025-12-30-4451', 'PO-20251230001', '2025-12-30', 'PROMOSI', '12', '1', '4', '2025-12-30 08:26:27', '2025-12-30 08:26:27'),
('5', 'TRX-IN-2025-12-30-2687', 'PO-20251230001', '2025-12-30', 'ATOM PILUS (N/A)', '5', '1', '4', '2025-12-30 08:26:28', '2025-12-30 08:26:28'),
('6', 'TRX-IN-2025-12-30-6469', 'PO-20251230001', '2025-12-30', 'SEASONAL', '7', '1', '4', '2025-12-30 08:26:28', '2025-12-30 08:26:28');

DROP TABLE IF EXISTS `barangs`;
CREATE TABLE `barangs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `barangs` VALUES 
('1', 'BRG-00001', 'DUA KELINCI KC KULIT', 'DUA KELINCI KC KULIT', NULL, '17', '50250.00', '1', '1', '1', '2025-12-29 08:10:06', '2025-12-30 08:26:26'),
('2', 'BRG-00002', 'DUA KELINCI BIJIAN', 'DUA KELINCI BIJIAN', NULL, '21', '67500.00', '1', '2', '1', '2025-12-29 08:10:06', '2025-12-30 04:34:36'),
('3', 'BRG-00003', 'SUKRO REGULER', 'SUKRO REGULER', NULL, '18', '73500.00', '1', '2', '1', '2025-12-29 08:10:07', '2025-12-30 08:26:27'),
('4', 'BRG-00004', 'SUKRO OVEN', 'SUKRO OVEN', NULL, '15', '58000.00', '1', '2', '1', '2025-12-29 08:10:07', '2025-12-30 04:34:36'),
('5', 'BRG-00005', 'DEKA', 'DEKA', NULL, '28', '79950.00', '1', '3', '1', '2025-12-29 08:10:07', '2025-12-30 04:34:37'),
('6', 'BRG-00006', 'TIC TAC', 'TIC TAC', NULL, '27', '51250.00', '1', '4', '1', '2025-12-29 08:10:08', '2025-12-30 04:34:37'),
('7', 'BRG-00007', 'PILUS', 'PILUS', NULL, '29', '69000.00', '1', '4', '1', '2025-12-29 08:10:08', '2025-12-30 04:34:37'),
('8', 'BRG-00008', 'RONI', 'RONI', NULL, '28', '74500.00', '1', '5', '1', '2025-12-29 08:10:09', '2025-12-30 04:34:38'),
('9', 'BRG-00009', 'SUPER NUT (N/A)', 'SUPER NUT (N/A)', NULL, '27', '59500.00', '1', '1', '1', '2025-12-29 08:10:09', '2025-12-30 04:34:38'),
('10', 'BRG-00010', 'SIR JUS (N/A)', 'SIR JUS (N/A)', NULL, '30', '77500.00', '1', '6', '1', '2025-12-29 08:10:09', '2025-12-29 08:10:09'),
('11', 'BRG-00011', 'KRIP KRIP', 'KRIP KRIP', NULL, '30', '52500.00', '1', '7', '1', '2025-12-29 08:10:10', '2025-12-29 08:10:10'),
('12', 'BRG-00012', 'TOS TOS', 'TOS TOS', NULL, '30', '71500.00', '1', '7', '1', '2025-12-29 08:10:10', '2025-12-29 08:10:10'),
('13', 'BRG-00013', 'USAGI', 'USAGI', NULL, '30', '76500.00', '1', '4', '1', '2025-12-29 08:10:10', '2025-12-29 08:10:10'),
('14', 'BRG-00014', 'TATO TATO', 'TATO TATO', NULL, '40', '56000.00', '1', '5', '1', '2025-12-29 08:10:10', '2025-12-30 08:26:27'),
('15', 'BRG-00015', 'KREZO TWIST', 'KREZO TWIST', NULL, '28', '78500.00', '1', '5', '1', '2025-12-29 08:10:11', '2025-12-30 04:34:38'),
('16', 'BRG-00016', 'KREZO MIE', 'KREZO MIE', NULL, '23', '54000.00', '1', '8', '1', '2025-12-29 08:10:11', '2025-12-30 04:05:18'),
('17', 'BRG-00017', 'SEASONAL', 'SEASONAL', NULL, '37', '65500.00', '1', '9', '1', '2025-12-29 08:10:11', '2025-12-30 08:26:28'),
('18', 'BRG-00018', 'ATOM PILUS (N/A)', 'ATOM PILUS (N/A)', NULL, '31', '72000.00', '1', '2', '1', '2025-12-29 08:10:12', '2025-12-30 08:26:28'),
('19', 'BRG-00019', 'KATOM (N/A)', 'KATOM (N/A)', NULL, '30', '60500.00', '1', '2', '1', '2025-12-29 08:10:12', '2025-12-29 08:10:12'),
('20', 'BRG-00020', 'FUZO', 'FUZO', NULL, '24', '75500.00', '1', '10', '1', '2025-12-29 08:10:12', '2025-12-30 04:05:17'),
('21', 'BRG-00021', 'PROMOSI', 'PROMOSI', NULL, '42', '53500.00', '1', '11', '1', '2025-12-29 08:10:13', '2025-12-30 08:26:27');

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `customers` VALUES 
('1', 'PT  ANUGERAH SINERGI RAYA', 'TAMAN TEKNO BSD SEKTOR XI J3  NO. 17-18, SETU SETU KOTA TANGERANG SELATAN', '1', '2025-12-29 08:12:05', NULL),
('2', 'PT  HARTANI RAPI', 'PASAR ATUM THP.5/ LT I ST.1021T BONGKARAN PABEAN CANTIAN', '1', '2025-12-29 08:12:05', NULL),
('3', 'PT  SUBUR RITELINDO  SEJAHTERA', 'JL BARU KM 6 NO.168 RT 004 R .006 KELURAHAN NAGASARI KRCAMATAN KARAWANG BARAT', '1', '2025-12-29 08:12:05', NULL),
('4', 'PT  SUBUR RITELINDO SEJAHTERA', 'JL. BARU KM.6 NO.168 RT 04 / RW 06 KELURAHAN NAGASARI KEC.KARAWANG BARAT,KAB.KARAWANG', '1', '2025-12-29 08:12:05', NULL),
('5', 'PT  TRANS RETAIL INDONESIA', 'GEDUNG CARREFOUR JL LEBAK BULUS RAYA NO.8 KEBAYORAN LAMA JAKARTA SELATAN', '1', '2025-12-29 08:12:05', NULL),
('6', 'PT ADAPERKASA SAHITAGUNA', 'JL.MGR SUGIYOPRANOTO NO58-60', '1', '2025-12-29 08:12:05', NULL),
('7', 'PT ADTEK TRADING INDONESIA', 'Jl. Pluit Selatan Raya,  De Ploeit Centra Lt. 7 No. 703 Pluit Penjaringan', '1', '2025-12-29 08:12:05', NULL),
('8', 'PT AEON INDONESIA', 'RATU PLAZA OFFICE BUILDING LT26 JL JEND SUDIRMAN KAV 9', '1', '2025-12-29 08:12:05', NULL),
('9', 'PT AGUNG RAYA', 'JL. RAYA CAKUNG CILINCING NO.11', '1', '2025-12-29 08:12:05', NULL),
('10', 'PT AIRLOCK INDONESIA JAYA RAYA', 'Kawasan Industri Jababeka Tahap VI Jl. East Park Boulevard Block C1B  No. 7, Jatireja Cikarang Timur', '1', '2025-12-29 08:12:05', NULL),
('11', 'PT AKERLUND RAUSING PACKAGING INDO', 'KAWASAN INDUSTRI BAWEN JALAN MAJU JAYA BLOK A-1 RT 000 RW 000 HARJOSARI BAWEN', '1', '2025-12-29 08:12:05', NULL),
('12', 'PT AKUR PRATAMA', 'JL. PAHLAWAN REVOLUSI NO 15 PONDOK BAMBU-DUREN SAWIT', '1', '2025-12-29 08:12:05', NULL),
('13', 'PT ALAM NYIUR NUSA PERMAI', 'JL. Raya Pemda Tiga Raksa,  Pergudangan Bizlink12 BlockO,No10-12', '1', '2025-12-29 08:12:05', NULL),
('14', 'PT ALDMIC INDONESIA', 'RUKO KEDOYA ELOK PLAZA BLOK D D NO 64 JL PANJANG JAKBAR', '1', '2025-12-29 08:12:05', NULL),
('15', 'PT ALFA  RETAILINDO', 'GEDUNG CARREFOUR  JL.LEBAK BULUS NO 8 PONDOK PINANG KEBAYORAN LAMA JAKARTA SELATAN', '1', '2025-12-29 08:12:05', NULL),
('16', 'PT ALFA RETAILINDO', 'GEDUNG CARREFOUR JL.LEBAK BULUS NO 8 PONDOK PINANG KEBAYORAN LAMA JAKARTA SELATAN', '1', '2025-12-29 08:12:05', NULL),
('17', 'PT ALFA RETALINDO', 'GEDUNG CARREFOUR JL.LEBAK BULUS NO.8 PONDOK PINANG', '1', '2025-12-29 08:12:05', NULL),
('18', 'PT ALMEGA SEJAHTERA', 'JL SUMATRA NO. 33', '1', '2025-12-29 08:12:05', NULL),
('19', 'PT ALTAR MAS', 'TAMAN TEKNO BLOK M NO.26 BSD SERPONG', '1', '2025-12-29 08:12:05', NULL),
('20', 'PT ALTAR MASS', 'TAMAN TEKNO BSD SEKTOR XI  BLOK M/26 SETU-SETU', '1', '2025-12-29 08:12:05', NULL);

DROP TABLE IF EXISTS `failed_jobs`;
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

DROP TABLE IF EXISTS `jenis`;
CREATE TABLE `jenis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jenis_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jenis` VALUES 
('1', 'KACANG', '1', '2025-12-29 08:10:06', '2025-12-29 08:10:06'),
('2', 'KACANG BERSALUT', '1', '2025-12-29 08:10:06', '2025-12-29 08:10:06'),
('3', 'WAFER', '1', '2025-12-29 08:10:07', '2025-12-29 08:10:07'),
('4', 'SNACK', '1', '2025-12-29 08:10:08', '2025-12-29 08:10:08'),
('5', 'EKSTRUDER SNACK', '1', '2025-12-29 08:10:08', '2025-12-29 08:10:08'),
('6', 'BEVERAGE', '1', '2025-12-29 08:10:09', '2025-12-29 08:10:09'),
('7', 'CHIPS', '1', '2025-12-29 08:10:09', '2025-12-29 08:10:09'),
('8', 'NOODLE SNACK', '1', '2025-12-29 08:10:11', '2025-12-29 08:10:11'),
('9', 'SEASONAL', '1', '2025-12-29 08:10:11', '2025-12-29 08:10:11'),
('10', 'BIJI BIJIAN', '1', '2025-12-29 08:10:12', '2025-12-29 08:10:12'),
('11', 'PROMOSI', '1', '2025-12-29 08:10:13', '2025-12-29 08:10:13');

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `menus` VALUES 
('1', 'Dashboard', '/', 'fas fa-fire', NULL, '1', '1', 'menu', '2025-12-30 07:30:37', '2025-12-30 07:30:37'),
('2', 'DATA MASTER', NULL, NULL, NULL, '2', '1', 'header', '2025-12-30 07:30:37', '2025-12-30 07:30:37'),
('3', 'Data Barang', NULL, 'fas fa-thin fa-cubes', '2', '1', '1', 'menu', '2025-12-30 07:30:38', '2025-12-30 07:34:48'),
('4', 'Product', '/barang', NULL, '3', '1', '1', 'menu', '2025-12-30 07:30:38', '2025-12-30 07:30:38'),
('5', 'Jenis', '/jenis-barang', NULL, '3', '2', '1', 'menu', '2025-12-30 07:30:38', '2025-12-30 07:30:38'),
('6', 'Satuan', '/satuan-barang', NULL, '3', '3', '1', 'menu', '2025-12-30 07:30:38', '2025-12-30 07:30:38'),
('7', 'Perusahaan', NULL, 'fa fa-sharp fa-solid fa-building', NULL, '3', '1', 'menu', '2025-12-30 07:30:38', '2025-12-30 07:34:48'),
('8', 'Supplier', '/supplier', NULL, '7', '1', '1', 'menu', '2025-12-30 07:30:38', '2025-12-30 07:30:38'),
('9', 'Customer', '/customer', NULL, '7', '2', '1', 'menu', '2025-12-30 07:30:38', '2025-12-30 07:30:38'),
('10', 'TRANSAKSI BARANG MASUK', NULL, NULL, NULL, '4', '1', 'header', '2025-12-30 07:30:38', '2025-12-30 07:34:48'),
('11', 'Purchase Order', '/purchase-order', 'fa fa-file-invoice-dollar', '10', '1', '1', 'menu', '2025-12-30 07:30:38', '2025-12-30 07:34:48'),
('12', 'TRANSAKSI BARANG KELUAR', NULL, NULL, NULL, '5', '1', 'header', '2025-12-30 07:30:39', '2025-12-30 07:34:48'),
('13', 'Sales Order', '/order', 'fa fa-file-invoice-dollar', '12', '1', '1', 'menu', '2025-12-30 07:30:39', '2025-12-30 07:34:48'),
('14', 'LAPORAN', NULL, NULL, NULL, '6', '1', 'header', '2025-12-30 07:30:39', '2025-12-30 07:34:48'),
('15', 'Stok', '/laporan-stok', 'fa fa-sharp fa-reguler fa-file', '14', '1', '1', 'menu', '2025-12-30 07:30:39', '2025-12-30 07:34:49'),
('16', 'Barang Masuk', '/laporan-barang-masuk', 'fa fa-regular fa-file-import', '14', '2', '1', 'menu', '2025-12-30 07:30:39', '2025-12-30 07:34:49'),
('17', 'Barang Keluar', '/laporan-barang-keluar', 'fa fa-sharp fa-regular fa-file-export', '14', '3', '1', 'menu', '2025-12-30 07:30:39', '2025-12-30 07:34:49'),
('18', 'MANAJEMEN USER', NULL, NULL, NULL, '7', '1', 'header', '2025-12-30 07:30:39', '2025-12-30 07:34:49'),
('19', 'Data Pengguna', '/data-pengguna', 'fa fa-solid fa-users', '18', '1', '1', 'menu', '2025-12-30 07:30:39', '2025-12-30 07:34:49'),
('20', 'Hak Akses/Role', '/hak-akses', 'fa fa-solid fa-user-lock', '18', '2', '1', 'menu', '2025-12-30 07:30:39', '2025-12-30 07:34:49'),
('21', 'Menu Management', '/menu-management', 'fa fa-solid fa-bars', '18', '3', '1', 'menu', '2025-12-30 07:30:40', '2025-12-30 07:34:49'),
('22', 'Aktivitas User', '/aktivitas-user', 'fa fa-address-book', '18', '4', '1', 'menu', '2025-12-30 07:30:40', '2025-12-30 07:44:59');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` VALUES 
('1', '2014_10_12_000000_create_users_table', '1'),
('2', '2014_10_12_100000_create_password_reset_tokens_table', '1'),
('3', '2019_08_19_000000_create_failed_jobs_table', '1'),
('4', '2019_12_14_000001_create_personal_access_tokens_table', '1'),
('5', '2023_04_30_113736_create_barangs_table', '1'),
('6', '2023_05_08_012945_create_jenis_table', '1'),
('7', '2023_05_12_002014_create_satuans_table', '1'),
('8', '2023_05_12_232201_create_suppliers_table', '1'),
('9', '2023_05_13_003355_create_customers_table', '1'),
('10', '2023_05_13_013458_create_barang_masuks_table', '1'),
('11', '2023_05_17_135554_create_barang_keluars_table', '1'),
('12', '2023_05_28_095805_create_roles_table', '1'),
('13', '2023_05_30_124154_create_activity_log_table', '1'),
('14', '2023_05_30_124155_add_event_column_to_activity_log_table', '1'),
('15', '2023_05_30_124156_add_batch_uuid_column_to_activity_log_table', '1'),
('16', '2025_12_24_083952_create_sales_orders_table', '1'),
('17', '2025_12_24_083956_create_sales_order_details_table', '1'),
('18', '2025_12_24_094310_add_price_to_barangs_table', '1'),
('19', '2025_12_26_062209_rename_nik_to_username_in_users_table', '1'),
('20', '2025_12_26_063438_update_roles_table_names', '1'),
('21', '2025_12_26_064234_update_sales_order_statuses', '1'),
('22', '2025_12_26_064918_create_sales_order_histories_table', '1'),
('23', '2025_12_26_064920_add_post_status_to_sales_orders', '1'),
('24', '2025_12_26_152938_add_sales_order_no_to_barang_keluars_table', '1'),
('25', '2025_12_29_015350_rename_sales_orders_to_orders', '1'),
('26', '2025_12_29_021411_create_order_produk_table', '1'),
('27', '2025_12_30_034157_add_status_dates_to_orders_table', '2'),
('28', '2025_12_30_044730_create_safety_stock_view_and_drop_stok_minimum', '3'),
('29', '2025_12_30_065104_create_purchase_orders_table', '4'),
('30', '2025_12_30_065105_create_purchase_order_details_table', '4'),
('31', '2025_12_30_065106_create_purchase_order_histories_table', '4'),
('32', '2025_12_30_071502_create_menus_table', '5'),
('33', '2025_12_30_071502_create_role_menu_table', '5'),
('34', '2025_12_30_082843_add_po_no_to_barang_masuks_table', '6'),
('35', '2025_12_30_092138_create_reorder_point_view_and_drop_safety_stock_view', '7');

DROP TABLE IF EXISTS `order_details`;
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

INSERT INTO `order_details` VALUES 
('1', '1', '1', '5', '50250.00', '251250.00', '2025-12-29 08:18:00', '2025-12-29 09:55:23'),
('2', '1', '2', '6', '67500.00', '405000.00', '2025-12-29 08:18:00', '2025-12-29 08:18:00'),
('3', '1', '3', '9', '73500.00', '661500.00', '2025-12-29 08:18:00', '2025-12-29 08:18:00'),
('4', '1', '4', '10', '58000.00', '580000.00', '2025-12-29 08:18:00', '2025-12-29 08:18:00'),
('5', '2', '1', '5', '50250.00', '251250.00', '2025-12-30 03:39:13', '2025-12-30 03:39:13'),
('6', '2', '3', '7', '73500.00', '514500.00', '2025-12-30 03:39:13', '2025-12-30 03:39:13'),
('7', '2', '20', '6', '75500.00', '453000.00', '2025-12-30 03:39:13', '2025-12-30 03:39:13'),
('8', '2', '18', '4', '72000.00', '288000.00', '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('9', '2', '2', '2', '67500.00', '135000.00', '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('10', '2', '1', '8', '50250.00', '402000.00', '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('11', '2', '16', '7', '54000.00', '378000.00', '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('12', '3', '1', '1', '50250.00', '50250.00', '2025-12-30 04:34:09', '2025-12-30 04:34:09'),
('13', '3', '2', '1', '67500.00', '67500.00', '2025-12-30 04:34:09', '2025-12-30 04:34:09'),
('14', '3', '3', '3', '73500.00', '220500.00', '2025-12-30 04:34:09', '2025-12-30 04:34:09'),
('15', '3', '4', '5', '58000.00', '290000.00', '2025-12-30 04:34:09', '2025-12-30 04:34:09'),
('16', '3', '5', '2', '79950.00', '159900.00', '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('17', '3', '6', '3', '51250.00', '153750.00', '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('18', '3', '7', '1', '69000.00', '69000.00', '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('19', '3', '8', '2', '74500.00', '149000.00', '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('20', '3', '9', '3', '59500.00', '178500.00', '2025-12-30 04:34:10', '2025-12-30 04:34:10'),
('21', '3', '15', '2', '78500.00', '157000.00', '2025-12-30 04:34:10', '2025-12-30 04:34:10');

DROP TABLE IF EXISTS `order_histories`;
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

INSERT INTO `order_histories` VALUES 
('1', '1', '5', 'Created Order', 'Initial creation', '2025-12-29 08:18:01', '2025-12-29 08:18:01'),
('2', '1', '5', 'Posted to Warehouse', 'Ready for stock verification', '2025-12-29 08:18:08', '2025-12-29 08:18:08'),
('3', '1', '3', 'Confirmed by Warehouse', 'Stock verified and ready for shipping', '2025-12-29 09:50:03', '2025-12-29 09:50:03'),
('4', '1', '4', 'Updated Item: DUA KELINCI KC KULIT (Qty: 7 -> 5)', '2 rusak packing', '2025-12-29 09:55:23', '2025-12-29 09:55:23'),
('5', '1', '4', 'Shipped', 'Order shipped by Warehouse Staff', '2025-12-29 09:56:22', '2025-12-29 09:56:22'),
('6', '2', '5', 'Created Order', 'Initial creation', '2025-12-30 03:39:14', '2025-12-30 03:39:14'),
('7', '2', '5', 'Posted to Warehouse', 'Ready for stock verification', '2025-12-30 03:39:21', '2025-12-30 03:39:21'),
('8', '2', '3', 'Confirmed by Warehouse', 'Stock verified and ready for shipping', '2025-12-30 03:45:32', '2025-12-30 03:45:32'),
('9', '2', '4', 'Shipped', 'Order shipped by Warehouse Staff', '2025-12-30 04:05:18', '2025-12-30 04:05:18'),
('10', '2', '5', 'Completed', 'Order received by customer', '2025-12-30 04:13:08', '2025-12-30 04:13:08'),
('11', '1', '5', 'Completed', 'Order received by customer', '2025-12-30 04:13:13', '2025-12-30 04:13:13'),
('12', '3', '5', 'Created Order', 'Initial creation', '2025-12-30 04:34:11', '2025-12-30 04:34:11'),
('13', '3', '5', 'Posted to Warehouse', 'Ready for stock verification', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('14', '3', '3', 'Confirmed by Warehouse', 'Stock verified and ready for shipping', '2025-12-30 04:34:25', '2025-12-30 04:34:25'),
('15', '3', '4', 'Shipped', 'Order shipped by Warehouse Staff', '2025-12-30 04:34:38', '2025-12-30 04:34:38'),
('16', '3', '5', 'Completed', 'Order received by customer', '2025-12-30 04:34:43', '2025-12-30 04:34:43');

DROP TABLE IF EXISTS `order_produk`;
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

INSERT INTO `order_produk` VALUES 
('1', '1', '2', '1', '2025-12-29', '7', '2025-12-29 08:18:08', '2025-12-29 08:18:08'),
('2', '1', '2', '2', '2025-12-29', '6', '2025-12-29 08:18:08', '2025-12-29 08:18:08'),
('3', '1', '2', '3', '2025-12-29', '9', '2025-12-29 08:18:08', '2025-12-29 08:18:08'),
('4', '1', '2', '4', '2025-12-29', '10', '2025-12-29 08:18:08', '2025-12-29 08:18:08'),
('5', '2', '2', '1', '2025-12-30', '5', '2025-12-30 03:39:20', '2025-12-30 03:39:20'),
('6', '2', '2', '3', '2025-12-30', '7', '2025-12-30 03:39:21', '2025-12-30 03:39:21'),
('7', '2', '2', '20', '2025-12-30', '6', '2025-12-30 03:39:21', '2025-12-30 03:39:21'),
('8', '2', '2', '18', '2025-12-30', '4', '2025-12-30 03:39:21', '2025-12-30 03:39:21'),
('9', '2', '2', '2', '2025-12-30', '2', '2025-12-30 03:39:21', '2025-12-30 03:39:21'),
('10', '2', '2', '1', '2025-12-30', '8', '2025-12-30 03:39:21', '2025-12-30 03:39:21'),
('11', '2', '2', '16', '2025-12-30', '7', '2025-12-30 03:39:21', '2025-12-30 03:39:21'),
('12', '3', '19', '1', '2025-12-30', '1', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('13', '3', '19', '2', '2025-12-30', '1', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('14', '3', '19', '3', '2025-12-30', '3', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('15', '3', '19', '4', '2025-12-30', '5', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('16', '3', '19', '5', '2025-12-30', '2', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('17', '3', '19', '6', '2025-12-30', '3', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('18', '3', '19', '7', '2025-12-30', '1', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('19', '3', '19', '8', '2025-12-30', '2', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('20', '3', '19', '9', '2025-12-30', '3', '2025-12-30 04:34:17', '2025-12-30 04:34:17'),
('21', '3', '19', '15', '2025-12-30', '2', '2025-12-30 04:34:17', '2025-12-30 04:34:17');

DROP TABLE IF EXISTS `orders`;
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

INSERT INTO `orders` VALUES 
('1', 'ORD-20251229001', '2', '2025-12-23', '1897750.00', 'completed', NULL, NULL, NULL, '2025-12-30 04:13:13', '2025-12-29 08:18:00', '2025-12-30 04:13:13'),
('2', 'ORD-20251230001', '2', '2025-12-25', '2421750.00', 'completed', NULL, '2025-12-30 03:45:32', '2025-12-30 04:05:16', '2025-12-30 04:13:07', '2025-12-30 03:39:13', '2025-12-30 04:13:07'),
('3', 'ORD-20251230002', '19', '2025-12-27', '1495400.00', 'completed', '2025-12-30 04:34:17', '2025-12-30 04:34:25', '2025-12-30 04:34:35', '2025-12-30 04:34:43', '2025-12-30 04:34:09', '2025-12-30 04:34:43');

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
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

DROP TABLE IF EXISTS `purchase_order_details`;
CREATE TABLE `purchase_order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint unsigned NOT NULL,
  `barang_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_details_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_details_barang_id_foreign` (`barang_id`),
  CONSTRAINT `purchase_order_details_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_order_details_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `purchase_order_details` VALUES 
('1', '1', '1', '1', '50250.00', '50250.00', '2025-12-30 08:19:14', '2025-12-30 08:26:25'),
('2', '1', '3', '7', '73500.00', '514500.00', '2025-12-30 08:19:14', '2025-12-30 08:26:25'),
('3', '1', '14', '10', '56000.00', '560000.00', '2025-12-30 08:19:14', '2025-12-30 08:26:26'),
('4', '1', '21', '12', '53500.00', '642000.00', '2025-12-30 08:19:14', '2025-12-30 08:26:26'),
('5', '1', '18', '5', '72000.00', '360000.00', '2025-12-30 08:19:14', '2025-12-30 08:26:26'),
('6', '1', '17', '7', '65500.00', '458500.00', '2025-12-30 08:19:14', '2025-12-30 08:26:26');

DROP TABLE IF EXISTS `purchase_order_histories`;
CREATE TABLE `purchase_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_order_histories_purchase_order_id_foreign` (`purchase_order_id`),
  KEY `purchase_order_histories_user_id_foreign` (`user_id`),
  CONSTRAINT `purchase_order_histories_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_order_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `purchase_order_histories` VALUES 
('1', '1', '3', 'Created Purchase Order', 'Initial creation', '2025-12-30 08:19:14', '2025-12-30 08:19:14'),
('2', '1', '3', 'Posted Purchase Order', 'Sent to Warehouse for receiving', '2025-12-30 08:19:31', '2025-12-30 08:19:31'),
('3', '1', '4', 'Received with Adjustments', 'Adjusted DUA KELINCI KC KULIT: 2 -> 1. Reason: dikurangi 1 karna rusak', '2025-12-30 08:26:26', '2025-12-30 08:26:26');

DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE `purchase_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `po_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` bigint unsigned NOT NULL,
  `po_date` date NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` enum('draft','post','received') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_by` bigint unsigned NOT NULL,
  `date_post` timestamp NULL DEFAULT NULL,
  `date_received` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_orders_po_no_unique` (`po_no`),
  KEY `purchase_orders_supplier_id_foreign` (`supplier_id`),
  KEY `purchase_orders_created_by_foreign` (`created_by`),
  CONSTRAINT `purchase_orders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_orders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `purchase_orders` VALUES 
('1', 'PO-20251230001', '1', '2025-12-30', '2585250.00', 'received', '3', '2025-12-30 08:19:31', '2025-12-30 08:26:26', '2025-12-30 08:19:14', '2025-12-30 08:26:26');

DROP TABLE IF EXISTS `reorder_point`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `reorder_point` AS with `daily_demand_stats` as (select `b`.`barang_id` AS `barang_id`,coalesce(round(avg(`b`.`qty`),0),0) AS `avg_daily_demand`,coalesce(max(`b`.`qty`),0) AS `max_daily_demand` from `order_produk` `b` where (`b`.`order_date` >= (now() - interval 90 day)) group by `b`.`barang_id`), `lead_time_calc` as (select coalesce(round(avg(((to_days(`orders`.`date_complete`) - to_days(`orders`.`order_date`)) + 1)),0),0) AS `lead_time_days` from `orders` where (`orders`.`date_complete` is not null)) select `br`.`id` AS `barang_id`,`br`.`kode_barang` AS `kode_barang`,`br`.`nama_barang` AS `nama_barang`,coalesce(`d`.`avg_daily_demand`,0) AS `avg_daily_demand`,coalesce(`d`.`max_daily_demand`,0) AS `max_daily_demand`,`l`.`lead_time_days` AS `lead_time_days`,(case when (`d`.`barang_id` is null) then 0 else greatest(0,((coalesce(`d`.`max_daily_demand`,0) - coalesce(`d`.`avg_daily_demand`,0)) * `l`.`lead_time_days`)) end) AS `safety_stock`,round(((coalesce(`d`.`avg_daily_demand`,0) * `l`.`lead_time_days`) + greatest(0,((coalesce(`d`.`max_daily_demand`,0) - coalesce(`d`.`avg_daily_demand`,0)) * `l`.`lead_time_days`))),0) AS `reorder_point` from ((`barangs` `br` left join `daily_demand_stats` `d` on((`br`.`id` = `d`.`barang_id`))) join `lead_time_calc` `l`);

DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned NOT NULL,
  `menu_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_menu_role_id_foreign` (`role_id`),
  KEY `role_menu_menu_id_foreign` (`menu_id`),
  CONSTRAINT `role_menu_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_menu_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_menu` VALUES 
('1', '1', '1', NULL, NULL),
('2', '2', '1', NULL, NULL),
('3', '3', '1', NULL, NULL),
('4', '4', '1', NULL, NULL),
('5', '5', '1', NULL, NULL),
('6', '1', '2', NULL, NULL),
('7', '2', '2', NULL, NULL),
('10', '1', '3', NULL, NULL),
('11', '2', '3', NULL, NULL),
('14', '1', '4', NULL, NULL),
('15', '2', '4', NULL, NULL),
('18', '1', '5', NULL, NULL),
('19', '2', '5', NULL, NULL),
('22', '1', '6', NULL, NULL),
('23', '2', '6', NULL, NULL),
('26', '1', '7', NULL, NULL),
('27', '2', '7', NULL, NULL),
('30', '1', '8', NULL, NULL),
('31', '2', '8', NULL, NULL),
('34', '1', '9', NULL, NULL),
('35', '2', '9', NULL, NULL),
('38', '1', '10', NULL, NULL),
('39', '2', '10', NULL, NULL),
('40', '4', '10', NULL, NULL),
('42', '1', '11', NULL, NULL),
('43', '2', '11', NULL, NULL),
('44', '4', '11', NULL, NULL),
('46', '1', '12', NULL, NULL),
('47', '2', '12', NULL, NULL),
('48', '4', '12', NULL, NULL),
('49', '5', '12', NULL, NULL),
('50', '1', '13', NULL, NULL),
('51', '2', '13', NULL, NULL),
('52', '4', '13', NULL, NULL),
('53', '5', '13', NULL, NULL),
('54', '1', '14', NULL, NULL),
('55', '2', '14', NULL, NULL),
('56', '3', '14', NULL, NULL),
('57', '4', '14', NULL, NULL),
('58', '5', '14', NULL, NULL),
('59', '1', '15', NULL, NULL),
('60', '2', '15', NULL, NULL),
('61', '3', '15', NULL, NULL),
('62', '4', '15', NULL, NULL),
('63', '5', '15', NULL, NULL),
('64', '1', '16', NULL, NULL),
('65', '2', '16', NULL, NULL),
('66', '3', '16', NULL, NULL),
('67', '4', '16', NULL, NULL),
('68', '5', '16', NULL, NULL),
('69', '1', '17', NULL, NULL),
('70', '2', '17', NULL, NULL),
('71', '3', '17', NULL, NULL),
('72', '4', '17', NULL, NULL),
('73', '5', '17', NULL, NULL),
('74', '1', '18', NULL, NULL),
('75', '2', '18', NULL, NULL),
('76', '1', '19', NULL, NULL),
('77', '1', '20', NULL, NULL),
('78', '1', '21', NULL, NULL),
('79', '1', '22', NULL, NULL),
('80', '2', '22', NULL, NULL),
('81', '3', '2', NULL, NULL),
('82', '3', '3', NULL, NULL),
('83', '3', '7', NULL, NULL),
('84', '3', '8', NULL, NULL),
('85', '3', '9', NULL, NULL),
('86', '3', '10', NULL, NULL),
('87', '3', '11', NULL, NULL),
('88', '3', '12', NULL, NULL),
('89', '3', '13', NULL, NULL);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` VALUES 
('1', 'super_admin', 'Superadmin memiliki kendali penuh pada aplikasi termasuk manajemen User', NULL, NULL),
('2', 'kepala_gudang', 'Kepala gudang memiliki akses untuk mengelola dan mencetak laporan stok, barang masuk, dan barang keluar', NULL, NULL),
('3', 'admin_gudang', 'Admin gudang memiliki akses untuk mengelola stok, barang masuk, barang keluar dan laporannya', NULL, NULL),
('4', 'staff_gudang', 'Staff gudang memiliki akses terbatas untuk mengelola stok', NULL, NULL),
('5', 'admin_sales', 'Admin sales mengelola data customer dan distribusi barang', NULL, NULL);

DROP TABLE IF EXISTS `safety_stock_product`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `safety_stock_product` AS with `max_order_per_week` as (select `a`.`id` AS `id`,week(`b`.`order_date`,0) AS `week`,year(`b`.`order_date`) AS `year`,coalesce(max(`b`.`qty`),0) AS `qty_order_maks` from (`barangs` `a` left join `order_produk` `b` on((`a`.`id` = `b`.`barang_id`))) where ((`b`.`order_date` is null) or (week(`b`.`order_date`,0) = week(now(),0))) group by `a`.`id`,week(`b`.`order_date`,0),year(`b`.`order_date`)), `avg_order_per_week` as (select `a`.`id` AS `id`,week(`b`.`order_date`,0) AS `week`,year(`b`.`order_date`) AS `year`,coalesce(round(avg(`b`.`qty`),0),0) AS `qty_order_average` from (`barangs` `a` left join `order_produk` `b` on((`a`.`id` = `b`.`barang_id`))) where ((`b`.`order_date` is null) or (week(`b`.`order_date`,0) = week(now(),0))) group by `a`.`id`,week(`b`.`order_date`,0),year(`b`.`order_date`)), `lead_time_calc` as (select coalesce(round(avg(((to_days(`orders`.`date_complete`) - to_days(`orders`.`order_date`)) + 1)),0),0) AS `lead_time` from `orders`) select `br`.`id` AS `id`,`br`.`kode_barang` AS `kode_barang`,`br`.`nama_barang` AS `nama_barang`,`br`.`stok` AS `qty`,coalesce(`m`.`qty_order_maks`,0) AS `qty_order_maks`,coalesce(`a`.`qty_order_average`,0) AS `qty_order_average`,(case when ((`m`.`qty_order_maks` is null) or (`m`.`qty_order_maks` = 0)) then 0 else `l`.`lead_time` end) AS `lead_time`,(case when ((`m`.`id` is null) or (`a`.`id` is null)) then 0 else greatest(0,((coalesce(`m`.`qty_order_maks`,0) - coalesce(`a`.`qty_order_average`,0)) * `l`.`lead_time`)) end) AS `safety_stock` from (((`barangs` `br` left join `max_order_per_week` `m` on((`br`.`id` = `m`.`id`))) left join `avg_order_per_week` `a` on(((`br`.`id` = `a`.`id`) and (coalesce(`m`.`week`,0) = coalesce(`a`.`week`,0)) and (coalesce(`m`.`year`,0) = coalesce(`a`.`year`,0))))) join `lead_time_calc` `l`) order by `br`.`id`;

DROP TABLE IF EXISTS `satuans`;
CREATE TABLE `satuans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `satuans` VALUES 
('1', '2025-12-29 08:10:05', '2025-12-29 08:10:05', 'KRT', '1'),
('2', '2025-12-29 08:10:05', '2025-12-29 08:10:05', 'PAK', '1'),
('3', '2025-12-29 08:10:05', '2025-12-29 08:10:05', 'PCS', '1');

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `suppliers` VALUES 
('1', 'PT Dua Kelinci', 'Jl. Kudus - Pati No.Km 6, RW.3, Lumpur, Bumirejo, Kec. Margorejo, Kabupaten Pati, Jawa Tengah 59163', '3', '2025-12-30 08:15:59', '2025-12-30 08:15:59');

DROP TABLE IF EXISTS `users`;
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

INSERT INTO `users` VALUES 
('1', 'Super Admin', 'super_admin', '$2y$10$VJJ9f0uOKpnisZiGuLqLLO4zwAxm3DsbXmy7NA9BSvUuFcVjkZP9K', '1', NULL, NULL, NULL),
('2', 'Kepala Gudang', 'kepala_gudang', '$2y$10$p62WVr4QA3EXPiTdI3rAQOFkJYTezQ20u5jkKjpuMNTpjBqq9UKPC', '2', NULL, NULL, NULL),
('3', 'Admin Gudang', 'admin_gudang', '$2y$10$vt3fuZv/wTMnCcY5XZum..XZCDF7b2KJCQsjPIf3sr3/38bNQmL7.', '3', NULL, NULL, NULL),
('4', 'Staff Gudang', 'staff_gudang', '$2y$10$DqgzNj5bC7e/y62dh08fTOLNMtym6/WIdvoeweLZxwqIbF0ZvCyV.', '4', NULL, NULL, NULL),
('5', 'Admin Sales', 'admin_sales', '$2y$10$E1VdwC3AJs.1q/MbCSRJxexnktD96TL8ABfoRKoAv7Ll7.r.yXGVe', '5', NULL, NULL, NULL);

