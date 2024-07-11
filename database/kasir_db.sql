/*
 Navicat Premium Data Transfer

 Source Server         : db_office
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : kasir_db

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 11/07/2024 11:56:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for master_barangs
-- ----------------------------
DROP TABLE IF EXISTS `master_barangs`;
CREATE TABLE `master_barangs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_satuan` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_barangs
-- ----------------------------
INSERT INTO `master_barangs` VALUES (1, 'Sabun batang', 3000, NULL, NULL, NULL);
INSERT INTO `master_barangs` VALUES (2, 'Mi Instan', 2000, NULL, NULL, NULL);
INSERT INTO `master_barangs` VALUES (3, 'Pensil', 1000, NULL, NULL, NULL);
INSERT INTO `master_barangs` VALUES (4, 'Kopi sachet', 1500, NULL, NULL, NULL);
INSERT INTO `master_barangs` VALUES (5, 'Air minum galon', 20000, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2024_06_29_084642_create_rumah_sakit_table', 1);
INSERT INTO `migrations` VALUES (6, '2024_06_29_084724_create_pasien_table', 1);
INSERT INTO `migrations` VALUES (7, '2024_07_11_033910_create_master_barangs_table', 1);
INSERT INTO `migrations` VALUES (8, '2024_07_11_033911_create_transaksi_pembelians_table', 1);
INSERT INTO `migrations` VALUES (9, '2024_07_11_035708_create_transaksi_pembelian_barangs_table', 1);

-- ----------------------------
-- Table structure for pasien
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rumah_sakit_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pasien_rumah_sakit_id_foreign`(`rumah_sakit_id` ASC) USING BTREE,
  CONSTRAINT `pasien_rumah_sakit_id_foreign` FOREIGN KEY (`rumah_sakit_id`) REFERENCES `rumah_sakit` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pasien
-- ----------------------------
INSERT INTO `pasien` VALUES (1, 'Dr. Jimmie Langosh IV', '665 Lueilwitz Run\nAntonettemouth, NH 43992', '1-956-506-5479', 9, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (2, 'Gordon Howell', '243 Howell Isle Suite 548\nJacinthebury, GA 26797-2240', '+1 (934) 291-7981', 14, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (3, 'Ewald Zieme', '1897 Dereck Court\nGregoriaside, AL 72562-3946', '+1.947.906.4218', 5, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (4, 'Tressa Maggio IV', '56613 Noemi Dam Suite 680\nSouth Shane, OH 86657', '+19844241038', 15, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (5, 'Casimer Waelchi', '57090 Bashirian Villages\nWest Lorine, AZ 54029-0600', '+1.774.540.8814', 14, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (6, 'Mr. Toni Wunsch', '55820 Floy Junctions\nSchummstad, IL 95388-6524', '1-678-627-9069', 20, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (7, 'Kenna Batz', '1698 Fay Mill\nRogahnstad, WA 89705-9592', '+1 (323) 647-3955', 1, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (8, 'Dr. Keshawn Murray', '58987 Lindsay Forge\nOceanechester, NJ 36773', '+1.484.426.8905', 17, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (9, 'Walker Gerhold', '17583 Douglas Radial Suite 185\nWildermanstad, UT 12042', '409.420.0512', 16, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (10, 'Finn King', '20723 Jonathon River\nShaniaport, OR 00210', '205.260.4172', 18, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (11, 'Tom Mitchell Jr.', '9502 Koch Land\nMollymouth, HI 90009', '725-736-4168', 16, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (12, 'Freeda Murphy', '47820 Oren Crescent\nMillerton, CA 76930', '(304) 831-8415', 2, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (13, 'Dr. Maurice Rolfson', '3249 Hattie Park Apt. 857\nLedahaven, MN 99377', '+1-763-597-9991', 11, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (14, 'Bailey Schoen', '6000 Bartoletti Island Suite 826\nJakubowskichester, NY 17527-6404', '(210) 894-2331', 10, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (15, 'Sarah Quitzon', '68459 Devante Avenue Suite 842\nConroyside, SD 81282', '628-588-0235', 12, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (16, 'Anabel Bechtelar', '475 Mathilde Street\nDamonberg, NE 14061-5960', '279-481-8125', 1, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (17, 'Chelsie Altenwerth', '8323 Rashad Meadows Suite 518\nSouth Tamia, KY 01446-7465', '202.930.1121', 10, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (18, 'Jarret Welch MD', '800 Terrell Brook\nEast Mathildetown, AR 63935-9969', '1-689-274-3374', 6, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (19, 'Tressie Lebsack', '560 Freddie Circle\nSouth Danikahaven, IL 63414', '1-575-918-5564', 15, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `pasien` VALUES (20, 'Mervin Rolfson', '123 Nader River Suite 826\nPort Isaiah, IL 48720-3649', '+1-979-918-4904', 16, '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for rumah_sakit
-- ----------------------------
DROP TABLE IF EXISTS `rumah_sakit`;
CREATE TABLE `rumah_sakit`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rumah_sakit
-- ----------------------------
INSERT INTO `rumah_sakit` VALUES (1, 'Ritchie-Carroll', '7077 Karley Mill\nJerroldchester, ME 55559', 'connelly.sarah@walter.com', '+14067804952', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (2, 'Powlowski and Sons', '667 Stanley Flats Suite 611\nNew Jerrold, OH 49779-8812', 'donna.rau@kovacek.com', '+1.930.609.7519', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (3, 'Jones, Ferry and Rempel', '10500 Pedro Grove\nMayeberg, NV 96809', 'zweber@dicki.com', '443.543.5240', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (4, 'Eichmann Group', '2017 Hand Pines\nBinsland, AR 25922', 'morar.rick@wehner.com', '+1.716.277.0141', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (5, 'Kshlerin and Sons', '691 Alvina Forest Suite 109\nPort Shaniyaborough, OR 46330-2575', 'murazik.ozella@legros.net', '+1-567-283-3015', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (6, 'Wisozk, Green and Torp', '3332 Paolo Stravenue\nRebeccaside, OK 60378', 'stehr.adalberto@schroeder.com', '+1-667-917-2211', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (7, 'Maggio, Hettinger and Ferry', '835 Satterfield Lodge\nLake Stevie, MS 24377', 'ritchie.dannie@schiller.biz', '424.326.8395', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (8, 'Considine Ltd', '188 Hudson Flat\nWest Zoe, AR 56593', 'aiden47@swift.com', '(515) 375-6807', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (9, 'Kuvalis, Graham and Carter', '53653 Howell Expressway Apt. 964\nNorth Emie, MO 76433-5363', 'qschamberger@moore.info', '+13092445724', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (10, 'Shields Group', '8506 Oliver Station\nReichertview, CO 85975', 'malika.bartoletti@schimmel.com', '(520) 236-4733', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (11, 'Schoen-Botsford', '1067 Josh Walk Suite 192\nKirlinville, CT 86758', 'beryl57@borer.com', '458-310-2206', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (12, 'Harvey Ltd', '41376 Wunsch Ports\nWest Clinton, LA 19169', 'maynard41@brakus.info', '+15512133189', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (13, 'Gutkowski, Okuneva and Kutch', '6983 Georgianna Coves Suite 520\nAdahhaven, ND 38453-7908', 'rbarrows@keebler.com', '920.712.8531', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (14, 'Smitham, Friesen and Cartwright', '457 Brody Ridges Suite 556\nPort Brionna, SD 13012', 'pskiles@champlin.com', '+1 (848) 493-9328', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (15, 'Hyatt and Sons', '684 Rogahn Fords Suite 351\nO\'Reillybury, NV 63586', 'grover.frami@schamberger.net', '+1.980.675.6224', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (16, 'Crooks, Senger and Ruecker', '7436 Pfeffer Mews\nWest Aubrey, UT 23890', 'will.ari@rath.com', '+1.657.446.5281', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (17, 'Stehr-Tillman', '167 Schamberger Wall\nGarrickshire, NY 91975-3679', 'rita89@blick.com', '+17704948854', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (18, 'Yundt, Beer and Ryan', '2045 Mueller Crossroad Apt. 115\nYeseniaside, AZ 07518', 'clara39@price.com', '240.823.4010', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (19, 'Jakubowski, Turcotte and Waelchi', '1394 Raul Junction\nNew Cortez, IN 10061-2381', 'wgerhold@langosh.com', '1-828-487-4325', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);
INSERT INTO `rumah_sakit` VALUES (20, 'Larson-O\'Kon', '7221 Kuhic Walks\nAdriennebury, TN 55212', 'jolie.lowe@carter.org', '+1-561-584-6191', '2024-07-11 04:00:43', '2024-07-11 04:00:43', NULL);

-- ----------------------------
-- Table structure for transaksi_pembelian_barangs
-- ----------------------------
DROP TABLE IF EXISTS `transaksi_pembelian_barangs`;
CREATE TABLE `transaksi_pembelian_barangs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_harga` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi_pembelian_barangs
-- ----------------------------
INSERT INTO `transaksi_pembelian_barangs` VALUES (1, 13000, '2024-07-11 04:14:57', '2024-07-11 04:14:57', NULL);
INSERT INTO `transaksi_pembelian_barangs` VALUES (2, 13000, '2024-07-11 04:31:28', '2024-07-11 04:31:28', NULL);
INSERT INTO `transaksi_pembelian_barangs` VALUES (3, 3000, '2024-07-11 04:31:49', '2024-07-11 04:31:49', NULL);
INSERT INTO `transaksi_pembelian_barangs` VALUES (4, 25000, '2024-07-11 04:32:58', '2024-07-11 04:32:58', NULL);

-- ----------------------------
-- Table structure for transaksi_pembelians
-- ----------------------------
DROP TABLE IF EXISTS `transaksi_pembelians`;
CREATE TABLE `transaksi_pembelians`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaksi_pembelian_id` bigint UNSIGNED NOT NULL,
  `master_barang_id` bigint UNSIGNED NOT NULL,
  `jumlah` int NOT NULL,
  `harga_satuan` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaksi_pembelians_transaksi_pembelian_id_foreign`(`transaksi_pembelian_id` ASC) USING BTREE,
  INDEX `transaksi_pembelians_master_barang_id_foreign`(`master_barang_id` ASC) USING BTREE,
  CONSTRAINT `transaksi_pembelians_master_barang_id_foreign` FOREIGN KEY (`master_barang_id`) REFERENCES `master_barangs` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transaksi_pembelians_transaksi_pembelian_id_foreign` FOREIGN KEY (`transaksi_pembelian_id`) REFERENCES `transaksi_pembelians` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi_pembelians
-- ----------------------------
INSERT INTO `transaksi_pembelians` VALUES (1, 1, 1, 1, 3000, '2024-07-11 04:14:57', '2024-07-11 04:14:57', NULL);
INSERT INTO `transaksi_pembelians` VALUES (2, 1, 1, 2, 3000, '2024-07-11 04:14:57', '2024-07-11 04:14:57', NULL);
INSERT INTO `transaksi_pembelians` VALUES (3, 1, 2, 2, 2000, '2024-07-11 04:14:57', '2024-07-11 04:14:57', NULL);
INSERT INTO `transaksi_pembelians` VALUES (4, 2, 1, 1, 3000, '2024-07-11 04:31:28', '2024-07-11 04:31:28', NULL);
INSERT INTO `transaksi_pembelians` VALUES (5, 2, 2, 2, 2000, '2024-07-11 04:31:28', '2024-07-11 04:31:28', NULL);
INSERT INTO `transaksi_pembelians` VALUES (6, 2, 2, 3, 2000, '2024-07-11 04:31:28', '2024-07-11 04:31:28', NULL);
INSERT INTO `transaksi_pembelians` VALUES (7, 3, 3, 1, 1000, '2024-07-11 04:31:49', '2024-07-11 04:31:49', NULL);
INSERT INTO `transaksi_pembelians` VALUES (8, 3, 2, 1, 2000, '2024-07-11 04:31:49', '2024-07-11 04:31:49', NULL);
INSERT INTO `transaksi_pembelians` VALUES (9, 4, 1, 1, 3000, '2024-07-11 04:32:58', '2024-07-11 04:32:58', NULL);
INSERT INTO `transaksi_pembelians` VALUES (10, 4, 2, 2, 2000, '2024-07-11 04:32:58', '2024-07-11 04:32:58', NULL);
INSERT INTO `transaksi_pembelians` VALUES (11, 4, 2, 4, 2000, '2024-07-11 04:32:58', '2024-07-11 04:32:58', NULL);
INSERT INTO `transaksi_pembelians` VALUES (12, 4, 2, 5, 2000, '2024-07-11 04:32:58', '2024-07-11 04:32:58', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username` ASC) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Deni Hadiya', 'Deni', 'denihadiya@gmail.com', NULL, '$2y$12$6Gvxidt//PNiTdhF7imTYOa.6SLraLibqnx6.hO9j/I8RTPVTykDC', NULL, '2024-07-11 04:01:59', '2024-07-11 04:01:59', NULL);

SET FOREIGN_KEY_CHECKS = 1;
