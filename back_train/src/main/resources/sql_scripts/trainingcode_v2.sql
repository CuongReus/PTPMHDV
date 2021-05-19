/*
 Navicat MySQL Data Transfer

 Source Server         : Logsik
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : trainingcode

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 06/08/2019 15:11:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of company
-- ----------------------------
BEGIN;
INSERT INTO `company` VALUES (3, 'Tâm An', 'Công Ty TNHH Xây Dựng Trang Trí Nội Thất Tâm An', 'TA');
INSERT INTO `company` VALUES (4, 'PCO', 'Công Ty TNHH Thương Mại Dịch Vụ Xây Dựng PCO', 'PCO');
COMMIT;

-- ----------------------------
-- Table structure for file_upload
-- ----------------------------
DROP TABLE IF EXISTS `file_upload`;
CREATE TABLE `file_upload` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `crm_table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crm_link_id` bigint(20) DEFAULT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `file_location` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=811 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of file_upload
-- ----------------------------
BEGIN;
INSERT INTO `file_upload` VALUES (474, 'UserImage', 27, '2019-07-11-10-49-44_51014184_286166278739671_6773587738496073728_n.jpg', 34243, '/api/downloadUserImage/2019-07-11-10-49-44_51014184_286166278739671_6773587738496073728_n.jpg', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (475, 'Quotation', 18, '2019-07-11-11-41-43_190620 - Báo giá nội thất AVN Sóng thần.pdf', 404620, '/api/downloadQuotationFile/2019-07-11-11-41-43_190620 - Báo giá nội thất AVN Sóng thần.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (476, 'Approval', 13, '2019-07-11-11-44-17_190620 - Báo giá nội thất AVN Sóng thần.pdf', 404620, '/api/downloadApprovalFile/2019-07-11-11-44-17_190620 - Báo giá nội thất AVN Sóng thần.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (477, 'Quotation', 19, '2019-07-11-12-00-26_190502- ATP- Lưới bao che Aeon Bike và Wellness.pdf', 145755, '/api/downloadQuotationFile/2019-07-11-12-00-26_190502- ATP- Lưới bao che Aeon Bike và Wellness.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (478, 'Approval', 14, '2019-07-11-12-06-09_190502- ATP- Lưới bao che Aeon Bike và Wellness.pdf', 145755, '/api/downloadApprovalFile/2019-07-11-12-06-09_190502- ATP- Lưới bao che Aeon Bike và Wellness.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (479, 'CloseWorkDone', 18, '2019-07-11-16-31-14_190709 - AVN Song Than - hop dien Modun.pdf', 318247, '/api/downloadCloseProjectFile/2019-07-11-16-31-14_190709 - AVN Song Than - hop dien Modun.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (480, 'CloseWorkDone', 19, '2019-07-11-16-38-04_190705 - Luoi bao che ATP - Luoi Nguyen Ut.pdf', 754860, '/api/downloadCloseProjectFile/2019-07-11-16-38-04_190705 - Luoi bao che ATP - Luoi Nguyen Ut.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (481, 'Quotation', 20, '2019-07-11-23-33-06_20190628 - BL_Scope tang lung (báo lần 2).xlsx', 639833, '/api/downloadQuotationFile/2019-07-11-23-33-06_20190628 - BL_Scope tang lung (báo lần 2).xlsx', 'Admin@pco.asia');
INSERT INTO `file_upload` VALUES (482, 'Draft', 15, '2019-07-11-23-39-14_LOA-DCC_TA-20190711-RV00- Thu trao thau thi cong hoan thien tang lung.pdf', 149433, '/api/downloadContractFile/2019-07-11-23-39-14_LOA-DCC_TA-20190711-RV00- Thu trao thau thi cong hoan thien tang lung.pdf', 'Admin@pco.asia');
INSERT INTO `file_upload` VALUES (483, 'Efficient_HandoverWork', 15, '2019-07-11-23-44-38_SCHEDULE FIT OUT AND MEP WORKS L1M-Subcons.pdf', 105269, '/api/downloadEfficiencyFile/2019-07-11-23-44-38_SCHEDULE FIT OUT AND MEP WORKS L1M-Subcons.pdf', 'Admin@pco.asia');
INSERT INTO `file_upload` VALUES (484, 'Quotation', 21, '2019-07-11-23-46-47_190701- JAB1901- BOQ Sơn ngoại thất Phase 1- Kansai proposal .xlsx', 39616, '/api/downloadQuotationFile/2019-07-11-23-46-47_190701- JAB1901- BOQ Sơn ngoại thất Phase 1- Kansai proposal .xlsx', 'Admin@pco.asia');
INSERT INTO `file_upload` VALUES (486, 'Quotation', 22, '2019-07-11-23-58-06_ECO GREEN- BOQ combine.pdf', 942284, '/api/downloadQuotationFile/2019-07-11-23-58-06_ECO GREEN- BOQ combine.pdf', 'Admin@pco.asia');
INSERT INTO `file_upload` VALUES (487, 'Quotation', 23, '2019-07-12-00-17-55_190711-  PCO - bao gia Aurora Q8.final .pdf', 841795, '/api/downloadQuotationFile/2019-07-12-00-17-55_190711-  PCO - bao gia Aurora Q8.final .pdf', 'Admin@pco.asia');
INSERT INTO `file_upload` VALUES (488, 'Quotation', 24, '2019-07-12-23-42-30_190614- ATP- Cắt trần 1200x1200 .pdf', 215286, '/api/downloadQuotationFile/2019-07-12-23-42-30_190614- ATP- Cắt trần 1200x1200 .pdf', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (489, 'Quotation', 25, '2019-07-12-23-48-43_190602- ATP- thay gạch 47 viên .xlsx', 13335, '/api/downloadQuotationFile/2019-07-12-23-48-43_190602- ATP- thay gạch 47 viên .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (490, 'Quotation', 26, '2019-07-12-23-52-16_190621- ATPEX- BOQ - Trải bạt .xlsx', 13345, '/api/downloadQuotationFile/2019-07-12-23-52-16_190621- ATPEX- BOQ - Trải bạt .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (491, 'Quotation', 27, '2019-07-12-23-57-19_190607- ATP- Trụ phân làn giao thông .xlsx', 14205, '/api/downloadQuotationFile/2019-07-12-23-57-19_190607- ATP- Trụ phân làn giao thông .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (492, 'Quotation', 28, '2019-07-13-00-00-24_190605- ATP- Trụ chống và inox thang cuốn .xlsx', 13363, '/api/downloadQuotationFile/2019-07-13-00-00-24_190605- ATP- Trụ chống và inox thang cuốn .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (493, 'UserImage', 24, '2019-07-13-16-03-45_IMG_6399.JPG', 451841, '/api/downloadUserImage/2019-07-13-16-03-45_IMG_6399.JPG', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (494, 'InvoiceVer3', 9, '2019-07-13-16-22-22_YCTT HD 059.xlsx', 13073, '/api/downloadInvoiceVer3File/2019-07-13-16-22-22_YCTT HD 059.xlsx', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (495, 'InvoiceVer3', 9, '2019-07-13-16-22-32_01GTKT0_0000059.pdf', 275348, '/api/downloadInvoiceVer3File/2019-07-13-16-22-32_01GTKT0_0000059.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (496, 'Quotation', 30, '2019-07-13-16-31-13_190404- QHUB- BOQ for Exterior wall - Cracks and Logo .pdf', 446214, '/api/downloadQuotationFile/2019-07-13-16-31-13_190404- QHUB- BOQ for Exterior wall - Cracks and Logo .pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (497, 'InvoiceVer3', 10, '2019-07-13-16-43-13_01GTKT0_0000058.pdf', 276764, '/api/downloadInvoiceVer3File/2019-07-13-16-43-13_01GTKT0_0000058.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (498, 'Quotation', 31, '2019-07-13-16-52-12_190321- QHUB- BOQ for access panel .pdf', 405546, '/api/downloadQuotationFile/2019-07-13-16-52-12_190321- QHUB- BOQ for access panel .pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (499, 'Quotation', 31, '2019-07-13-16-52-16_190321- QHUB- BOQ for access panel .xlsx', 13674, '/api/downloadQuotationFile/2019-07-13-16-52-16_190321- QHUB- BOQ for access panel .xlsx', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (500, 'InvoiceVer3', 11, '2019-07-13-16-59-16_01GTKT0_0000058.pdf', 276764, '/api/downloadInvoiceVer3File/2019-07-13-16-59-16_01GTKT0_0000058.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (501, 'Quotation', 32, '2019-07-14-14-41-00_190514- ATP-Thay cửa nhôm   .xlsx', 13073, '/api/downloadQuotationFile/2019-07-14-14-41-00_190514- ATP-Thay cửa nhôm   .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (502, 'Quotation', 33, '2019-07-14-14-43-06_190512- ATP- Lắp đặt kho lưới backyard   .xlsx', 13487, '/api/downloadQuotationFile/2019-07-14-14-43-06_190512- ATP- Lắp đặt kho lưới backyard   .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (503, 'Quotation', 34, '2019-07-14-14-46-00_190427- ATP- Báo giá thay gạch sàn GMS .xlsx', 13245, '/api/downloadQuotationFile/2019-07-14-14-46-00_190427- ATP- Báo giá thay gạch sàn GMS .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (504, 'Quotation', 35, '2019-07-14-14-47-49_190417- ATP- sơn vách vàng .xlsx', 13581, '/api/downloadQuotationFile/2019-07-14-14-47-49_190417- ATP- sơn vách vàng .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (505, 'Quotation', 36, '2019-07-14-14-51-56_190417- ATP- Hoarding- VNPT.xlsx', 13759, '/api/downloadQuotationFile/2019-07-14-14-51-56_190417- ATP- Hoarding- VNPT.xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (506, 'Quotation', 37, '2019-07-14-14-55-13_190417- ATP- Hoarding- RS11.xlsx', 13748, '/api/downloadQuotationFile/2019-07-14-14-55-13_190417- ATP- Hoarding- RS11.xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (507, 'Quotation', 38, '2019-07-14-14-57-55_190408- ATP- Hoarding.xlsx', 13648, '/api/downloadQuotationFile/2019-07-14-14-57-55_190408- ATP- Hoarding.xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (508, 'Quotation', 39, '2019-07-14-15-01-12_190408- ATPEX- Hoarding 3FL .xlsx', 13509, '/api/downloadQuotationFile/2019-07-14-15-01-12_190408- ATPEX- Hoarding 3FL .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (509, 'Quotation', 40, '2019-07-14-15-04-49_190427- ATP- Hoarding.xlsx', 21706, '/api/downloadQuotationFile/2019-07-14-15-04-49_190427- ATP- Hoarding.xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (510, 'Quotation', 41, '2019-07-14-15-08-08_190328- ATP- Tháo vách BMS .xlsx', 13411, '/api/downloadQuotationFile/2019-07-14-15-08-08_190328- ATP- Tháo vách BMS .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (511, 'Quotation', 42, '2019-07-14-15-10-52_190203- ATP- Báo giá thay gạch sàn GMS- sửa thạch cao cột .xlsx', 13849, '/api/downloadQuotationFile/2019-07-14-15-10-52_190203- ATP- Báo giá thay gạch sàn GMS- sửa thạch cao cột .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (512, 'Quotation', 43, '2019-07-14-15-13-33_190317- ATPEX- BOQ - Trải bạt .xlsx', 13546, '/api/downloadQuotationFile/2019-07-14-15-13-33_190317- ATPEX- BOQ - Trải bạt .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (513, 'Quotation', 44, '2019-07-14-15-16-31_190305- ATP- Di dời nội thất Pizza .xlsx', 13205, '/api/downloadQuotationFile/2019-07-14-15-16-31_190305- ATP- Di dời nội thất Pizza .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (514, 'Acceptance', 9, '2019-07-15-14-35-29_BBNT ATP-KLS-002-07152019031538.pdf', 351999, '/api/downloadAcceptanceFile/2019-07-15-14-35-29_BBNT ATP-KLS-002-07152019031538.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (515, 'InvoiceVer3', 12, '2019-07-15-14-37-17_YCTT HD 055.xlsx', 13046, '/api/downloadInvoiceVer3File/2019-07-15-14-37-17_YCTT HD 055.xlsx', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (516, 'Acceptance', 10, '2019-07-15-15-07-51_BBNT ATP-TG05-001-07152019035122.pdf', 356361, '/api/downloadAcceptanceFile/2019-07-15-15-07-51_BBNT ATP-TG05-001-07152019035122.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (517, 'InvoiceVer3', 13, '2019-07-15-15-10-27_HD54-07152019035021.pdf', 541605, '/api/downloadInvoiceVer3File/2019-07-15-15-10-27_HD54-07152019035021.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (518, 'Quotation', 45, '2019-07-15-16-43-58_ATP-Bakery-Tile.pdf', 308620, '/api/downloadQuotationFile/2019-07-15-16-43-58_ATP-Bakery-Tile.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (519, 'InvoiceVer3', 14, '2019-07-15-16-45-37_Hóa đơn 188.pdf', 350415, '/api/downloadInvoiceVer3File/2019-07-15-16-45-37_Hóa đơn 188.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (520, 'Acceptance', 11, '2019-07-15-16-47-19_BBNT ATP-Bakery-Tile.pdf', 241566, '/api/downloadAcceptanceFile/2019-07-15-16-47-19_BBNT ATP-Bakery-Tile.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (521, 'Quotation', 46, '2019-07-15-16-48-29_Báo giá EX-VSMT.pdf', 282094, '/api/downloadQuotationFile/2019-07-15-16-48-29_Báo giá EX-VSMT.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (522, 'Official', 19, '2019-07-15-16-50-54_Hợp đồng.pdf', 4831390, '/api/downloadContractFile/2019-07-15-16-50-54_Hợp đồng.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (525, 'InvoiceVer3', 15, '2019-07-15-17-14-41_01GTKT0_0000025.pdf', 275119, '/api/downloadInvoiceVer3File/2019-07-15-17-14-41_01GTKT0_0000025.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (526, 'Quotation', 47, '2019-07-15-17-41-13_Báo giá ATP-Bak-CNT.pdf', 270832, '/api/downloadQuotationFile/2019-07-15-17-41-13_Báo giá ATP-Bak-CNT.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (527, 'Acceptance', 13, '2019-07-15-17-43-22_BBNT ATP-Bak-CNT.pdf', 218474, '/api/downloadAcceptanceFile/2019-07-15-17-43-22_BBNT ATP-Bak-CNT.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (528, 'InvoiceVer3', 16, '2019-07-15-17-44-13_01GTKT0_0000006.pdf', 273400, '/api/downloadInvoiceVer3File/2019-07-15-17-44-13_01GTKT0_0000006.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (529, 'Quotation', 48, '2019-07-15-18-14-35_Báo giá ATP-GMS-Tile.pdf', 332070, '/api/downloadQuotationFile/2019-07-15-18-14-35_Báo giá ATP-GMS-Tile.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (530, 'Acceptance', 14, '2019-07-15-18-16-06_BBNT ATP-GMS-Tile.pdf', 274772, '/api/downloadAcceptanceFile/2019-07-15-18-16-06_BBNT ATP-GMS-Tile.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (531, 'InvoiceVer3', 17, '2019-07-15-18-16-55_01GTKT0_0000003.pdf', 272676, '/api/downloadInvoiceVer3File/2019-07-15-18-16-55_01GTKT0_0000003.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (532, 'Quotation', 49, '2019-07-15-18-41-15_BOQ  KINGDOM-S28.pdf', 362444, '/api/downloadQuotationFile/2019-07-15-18-41-15_BOQ  KINGDOM-S28.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (533, 'Approval', 29, '2019-07-15-18-42-17_BOQ  KINGDOM-S28.pdf', 362444, '/api/downloadApprovalFile/2019-07-15-18-42-17_BOQ  KINGDOM-S28.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (534, 'Acceptance', 15, '2019-07-15-18-42-47_BBNT KINGDOM S28.pdf', 252938, '/api/downloadAcceptanceFile/2019-07-15-18-42-47_BBNT KINGDOM S28.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (535, 'InvoiceVer3', 18, '2019-07-15-18-44-01_01GTKT0_0000001.pdf', 274035, '/api/downloadInvoiceVer3File/2019-07-15-18-44-01_01GTKT0_0000001.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (536, 'Quotation', 50, '2019-07-15-18-45-56_BOQ TINIWORLD S12.pdf', 356962, '/api/downloadQuotationFile/2019-07-15-18-45-56_BOQ TINIWORLD S12.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (537, 'Approval', 30, '2019-07-15-18-47-56_BOQ TINIWORLD S12.pdf', 356962, '/api/downloadApprovalFile/2019-07-15-18-47-56_BOQ TINIWORLD S12.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (538, 'Acceptance', 16, '2019-07-15-18-48-53_BBNT TINIWORLD S12.pdf', 275632, '/api/downloadAcceptanceFile/2019-07-15-18-48-53_BBNT TINIWORLD S12.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (539, 'InvoiceVer3', 19, '2019-07-15-18-51-00_Hóa đơn 189.pdf', 349526, '/api/downloadInvoiceVer3File/2019-07-15-18-51-00_Hóa đơn 189.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (540, 'Quotation', 51, '2019-07-15-19-44-07_190620 - Báo giá nội thất AVN Sóng thần.pdf', 404620, '/api/downloadQuotationFile/2019-07-15-19-44-07_190620 - Báo giá nội thất AVN Sóng thần.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (541, 'Approval', 31, '2019-07-15-19-46-28_190620 - Báo giá nội thất AVN Sóng thần.pdf', 404620, '/api/downloadApprovalFile/2019-07-15-19-46-28_190620 - Báo giá nội thất AVN Sóng thần.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (542, 'StockMovementReport_NHAP_KHO', 18, '2019-07-16-09-54-45_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-09-54-45_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (543, 'StockMovementReport_NHAP_KHO', 19, '2019-07-16-09-57-21_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-09-57-21_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (544, 'StockMovementReport_NHAP_KHO', 20, '2019-07-16-09-58-31_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-09-58-31_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (545, 'StockMovementReport_NHAP_KHO', 21, '2019-07-16-09-59-12_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-09-59-12_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (546, 'StockMovementReport_NHAP_KHO', 22, '2019-07-16-09-59-49_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-09-59-49_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (547, 'StockMovementReport_NHAP_KHO', 23, '2019-07-16-10-00-27_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-00-27_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (548, 'StockMovementReport_NHAP_KHO', 24, '2019-07-16-10-01-11_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-01-11_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (549, 'StockMovementReport_NHAP_KHO', 25, '2019-07-16-10-01-52_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-01-52_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (550, 'StockMovementReport_NHAP_KHO', 26, '2019-07-16-10-02-27_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-02-27_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (551, 'StockMovementReport_NHAP_KHO', 27, '2019-07-16-10-03-00_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-03-00_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (552, 'StockMovementReport_NHAP_KHO', 28, '2019-07-16-10-03-34_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-03-34_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (553, 'StockMovementReport_NHAP_KHO', 6, '2019-07-16-10-05-33_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-05-33_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (554, 'StockMovementReport_NHAP_KHO', 29, '2019-07-16-10-10-55_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-10-55_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (555, 'StockMovementReport_NHAP_KHO', 30, '2019-07-16-10-11-51_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-11-51_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (556, 'StockMovementReport_NHAP_KHO', 31, '2019-07-16-10-12-39_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-12-39_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (557, 'StockMovementReport_NHAP_KHO', 32, '2019-07-16-10-13-19_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-13-19_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (558, 'StockMovementReport_NHAP_KHO', 33, '2019-07-16-10-13-58_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-13-58_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (559, 'StockMovementReport_NHAP_KHO', 34, '2019-07-16-10-14-34_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-14-34_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (560, 'StockMovementReport_NHAP_KHO', 35, '2019-07-16-10-15-11_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-15-11_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (561, 'StockMovementReport_NHAP_KHO', 36, '2019-07-16-10-15-41_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-15-41_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (562, 'StockMovementReport_NHAP_KHO', 37, '2019-07-16-10-16-30_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-16-30_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (563, 'StockMovementReport_NHAP_KHO', 38, '2019-07-16-10-17-24_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-17-24_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (564, 'StockMovementReport_NHAP_KHO', 39, '2019-07-16-10-18-05_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-18-05_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (565, 'StockMovementReport_NHAP_KHO', 40, '2019-07-16-10-18-35_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-18-35_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (566, 'StockMovementReport_NHAP_KHO', 41, '2019-07-16-10-19-06_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-19-06_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (567, 'StockMovementReport_NHAP_KHO', 42, '2019-07-16-10-19-49_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-19-49_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (568, 'StockMovementReport_NHAP_KHO', 43, '2019-07-16-10-20-18_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-20-18_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (569, 'StockMovementReport_NHAP_KHO', 44, '2019-07-16-10-21-08_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-21-08_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (570, 'StockMovementReport_NHAP_KHO', 45, '2019-07-16-10-21-44_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-21-44_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (571, 'StockMovementReport_NHAP_KHO', 46, '2019-07-16-10-23-06_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-23-06_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (572, 'StockMovementReport_NHAP_KHO', 47, '2019-07-16-10-23-47_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-23-47_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (573, 'StockMovementReport_NHAP_KHO', 48, '2019-07-16-10-24-41_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-24-41_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (574, 'StockMovementReport_NHAP_KHO', 49, '2019-07-16-10-25-27_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-25-27_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (575, 'StockMovementReport_NHAP_KHO', 50, '2019-07-16-10-35-00_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-35-00_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (576, 'StockMovementReport_NHAP_KHO', 51, '2019-07-16-10-35-32_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-35-32_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (577, 'StockMovementReport_NHAP_KHO', 52, '2019-07-16-10-36-41_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-36-41_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (578, 'StockMovementReport_NHAP_KHO', 53, '2019-07-16-10-37-10_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-37-10_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (579, 'StockMovementReport_NHAP_KHO', 54, '2019-07-16-10-37-39_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-37-39_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (580, 'StockMovementReport_NHAP_KHO', 55, '2019-07-16-10-38-20_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-38-20_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (581, 'StockMovementReport_NHAP_KHO', 56, '2019-07-16-10-38-55_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-38-55_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (582, 'StockMovementReport_NHAP_KHO', 57, '2019-07-16-10-40-07_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-40-07_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (583, 'StockMovementReport_NHAP_KHO', 58, '2019-07-16-10-40-43_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-40-43_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (584, 'StockMovementReport_NHAP_KHO', 59, '2019-07-16-10-41-08_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-41-08_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (585, 'StockMovementReport_NHAP_KHO', 60, '2019-07-16-10-41-58_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-41-58_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (586, 'StockMovementReport_NHAP_KHO', 61, '2019-07-16-10-42-24_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-42-24_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (587, 'StockMovementReport_NHAP_KHO', 62, '2019-07-16-10-43-03_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-43-03_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (588, 'StockMovementReport_NHAP_KHO', 63, '2019-07-16-10-43-32_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-43-32_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (589, 'StockMovementReport_NHAP_KHO', 64, '2019-07-16-10-44-01_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-44-01_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (590, 'StockMovementReport_NHAP_KHO', 65, '2019-07-16-10-44-39_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-10-44-39_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (591, 'InputVer3', 20, '2019-07-16-11-14-20_0001841-Hòa Phát Sài Gòn-190715.pdf', 1424005, '/api/downloadInvoiceVer3File/2019-07-16-11-14-20_0001841-Hòa Phát Sài Gòn-190715.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (592, 'StockMovementReport_NHAP_KHO', 66, '2019-07-16-11-25-38_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-11-25-38_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (593, 'StockMovementReport_NHAP_KHO', 67, '2019-07-16-11-26-32_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-11-26-32_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (594, 'StockMovementReport_NHAP_KHO', 68, '2019-07-16-11-27-40_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-11-27-40_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (595, 'StockMovementReport_NHAP_KHO', 69, '2019-07-16-11-28-57_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-16-11-28-57_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (596, 'Quotation', 52, '2019-07-16-15-41-34_180312- ATP- Cải tạo vách cửa lầu 3 (1).pdf', 223581, '/api/downloadQuotationFile/2019-07-16-15-41-34_180312- ATP- Cải tạo vách cửa lầu 3 (1).pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (597, 'Quotation', 52, '2019-07-16-15-41-40_190401__ATP__Cải_tạo_vp_lầu_1__Reno.pdf', 250389, '/api/downloadQuotationFile/2019-07-16-15-41-40_190401__ATP__Cải_tạo_vp_lầu_1__Reno.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (598, 'Quotation', 52, '2019-07-16-15-41-52_190401__ATP__Cải_tạo_vp_lầu_2__Reno.pdf', 143846, '/api/downloadQuotationFile/2019-07-16-15-41-52_190401__ATP__Cải_tạo_vp_lầu_2__Reno.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (599, 'Quotation', 52, '2019-07-16-15-42-01_190515__ATP__Cấp_cửa_gỗ__và_hoàn_thiện_vách_.pdf', 222930, '/api/downloadQuotationFile/2019-07-16-15-42-01_190515__ATP__Cấp_cửa_gỗ__và_hoàn_thiện_vách_.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (600, 'Approval', 32, '2019-07-16-15-46-35_190312- ATP- Cải tạo vách cửa lầu 3 (1).pdf', 223581, '/api/downloadApprovalFile/2019-07-16-15-46-35_190312- ATP- Cải tạo vách cửa lầu 3 (1).pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (601, 'Approval', 32, '2019-07-16-15-46-46_190401__ATP__Cải_tạo_vp_lầu_1__Reno.pdf', 250389, '/api/downloadApprovalFile/2019-07-16-15-46-46_190401__ATP__Cải_tạo_vp_lầu_1__Reno.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (602, 'Approval', 32, '2019-07-16-15-46-56_190401__ATP__Cải_tạo_vp_lầu_2__Reno.pdf', 143846, '/api/downloadApprovalFile/2019-07-16-15-46-56_190401__ATP__Cải_tạo_vp_lầu_2__Reno.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (603, 'Approval', 32, '2019-07-16-15-47-02_190515__ATP__Cấp_cửa_gỗ__và_hoàn_thiện_vách_.pdf', 222930, '/api/downloadApprovalFile/2019-07-16-15-47-02_190515__ATP__Cấp_cửa_gỗ__và_hoàn_thiện_vách_.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (604, 'Quotation', 53, '2019-07-16-17-41-19_190715- ATP- Dán decal cảnh báo cửa cuốn .xlsx', 13404, '/api/downloadQuotationFile/2019-07-16-17-41-19_190715- ATP- Dán decal cảnh báo cửa cuốn .xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (606, 'Approval', 34, '2019-07-17-09-28-28_PCO - make opening TINI world.pdf', 75728, '/api/downloadApprovalFile/2019-07-17-09-28-28_PCO - make opening TINI world.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (607, 'Quotation', 54, '2019-07-17-09-29-45_191107 - PCO BAO GIA DUC LO TUONG.pdf', 237873, '/api/downloadQuotationFile/2019-07-17-09-29-45_191107 - PCO BAO GIA DUC LO TUONG.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (608, 'Quotation', 55, '2019-07-17-09-39-33_260619 - PCO - BOQ thảm cỏ - nẹp nhôm.pdf', 396644, '/api/downloadQuotationFile/2019-07-17-09-39-33_260619 - PCO - BOQ thảm cỏ - nẹp nhôm.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (609, 'Approval', 35, '2019-07-17-09-44-22_PCO - báo giá thảm cỏ - nẹp nhôm ( approved ).pdf', 224782, '/api/downloadApprovalFile/2019-07-17-09-44-22_PCO - báo giá thảm cỏ - nẹp nhôm ( approved ).pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (610, 'InputVer1', 10, '2019-07-17-09-48-21_pco - HD nẹp nhôm.jpg', 1112613, '/api/downloadInvoiceVer1File/2019-07-17-09-48-21_pco - HD nẹp nhôm.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (611, 'InputVer1', 10, '2019-07-17-09-48-25_pco - HD thảm cỏ.jpg', 1644887, '/api/downloadInvoiceVer1File/2019-07-17-09-48-25_pco - HD thảm cỏ.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (613, 'StockMovementReport_XUAT_KHO', 70, '2019-07-17-14-59-25_PXK 355- MR.KHÔI - THẢO ĐIỀN Q2.pdf', 149066, '/api/downloadStockMovementReport/2019-07-17-14-59-25_PXK 355- MR.KHÔI - THẢO ĐIỀN Q2.pdf', NULL);
INSERT INTO `file_upload` VALUES (614, 'StockMovementReport_XUAT_KHO', 71, '2019-07-17-15-10-22_PXK 356- MR.CƯỜNG - HIỆP ĐỨC TÀI.pdf', 293614, '/api/downloadStockMovementReport/2019-07-17-15-10-22_PXK 356- MR.CƯỜNG - HIỆP ĐỨC TÀI.pdf', NULL);
INSERT INTO `file_upload` VALUES (615, 'StockMovementReport_XUAT_KHO', 72, '2019-07-17-15-11-26_PXK 356- MR.CƯỜNG - HIỆP ĐỨC TÀI.pdf', 293614, '/api/downloadStockMovementReport/2019-07-17-15-11-26_PXK 356- MR.CƯỜNG - HIỆP ĐỨC TÀI.pdf', NULL);
INSERT INTO `file_upload` VALUES (616, 'Draft', 24, '2019-07-17-15-26-05_PCO-001 913mil.doc', 172544, '/api/downloadContractFile/2019-07-17-15-26-05_PCO-001 913mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (617, 'Official', 24, '2019-07-17-15-26-16_PCO-001 913mil.doc', 172544, '/api/downloadContractFile/2019-07-17-15-26-16_PCO-001 913mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (618, 'Quotation', 58, '2019-07-17-15-32-09_180901- PCO- BOQ-  Sơn Roadline  HD 002 - send.pdf', 451387, '/api/downloadQuotationFile/2019-07-17-15-32-09_180901- PCO- BOQ-  Sơn Roadline  HD 002 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (619, 'Approval', 37, '2019-07-17-15-35-29_PCO - HD 002 - approved.pdf', 1588430, '/api/downloadApprovalFile/2019-07-17-15-35-29_PCO - HD 002 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (620, 'Official', 25, '2019-07-17-15-40-53_PCO-002 176mil.doc', 173568, '/api/downloadContractFile/2019-07-17-15-40-53_PCO-002 176mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (621, 'PaymentVer1', 12, '2019-07-17-15-50-37_Yêu cầu thanh toán 02 30% đầu.pdf', 366300, '/api/downloadInvoiceVer1File/2019-07-17-15-50-37_Yêu cầu thanh toán 02 30% đầu.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (622, 'Quotation', 59, '2019-07-17-15-54-36_PCO - HD 003 - approved.pdf', 264850, '/api/downloadQuotationFile/2019-07-17-15-54-36_PCO - HD 003 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (623, 'Approval', 38, '2019-07-17-15-56-45_PCO - HD 003 - approved.pdf', 264850, '/api/downloadApprovalFile/2019-07-17-15-56-45_PCO - HD 003 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (624, 'Official', 26, '2019-07-17-16-00-36_PCO-003 1.450 bil.doc', 173056, '/api/downloadContractFile/2019-07-17-16-00-36_PCO-003 1.450 bil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (625, 'PaymentVer1', 13, '2019-07-17-16-02-10_Yêu cầu thanh toán 03 30% đầu.pdf', 366233, '/api/downloadInvoiceVer1File/2019-07-17-16-02-10_Yêu cầu thanh toán 03 30% đầu.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (626, 'Quotation', 60, '2019-07-17-16-03-13_180902- PCO- BOQ- Roadline Hd 004 - send.pdf', 477221, '/api/downloadQuotationFile/2019-07-17-16-03-13_180902- PCO- BOQ- Roadline Hd 004 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (627, 'Approval', 39, '2019-07-17-16-04-34_PCO - HD 004 - approved.pdf', 2171405, '/api/downloadApprovalFile/2019-07-17-16-04-34_PCO - HD 004 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (628, 'Official', 27, '2019-07-17-16-05-32_PCO-004 1,045mil.doc', 173056, '/api/downloadContractFile/2019-07-17-16-05-32_PCO-004 1,045mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (629, 'Quotation', 61, '2019-07-17-16-07-29_181022- PCO- HD 005 - send.pdf', 500827, '/api/downloadQuotationFile/2019-07-17-16-07-29_181022- PCO- HD 005 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (630, 'Official', 28, '2019-07-17-16-12-32_PCO-005 964,860 mil.doc', 181248, '/api/downloadContractFile/2019-07-17-16-12-32_PCO-005 964,860 mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (631, 'Quotation', 62, '2019-07-17-16-14-24_181009-HD 006 - approved.pdf', 489962, '/api/downloadQuotationFile/2019-07-17-16-14-24_181009-HD 006 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (632, 'Approval', 41, '2019-07-17-16-16-08_181009-HD 006 - approved.pdf', 489962, '/api/downloadApprovalFile/2019-07-17-16-16-08_181009-HD 006 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (633, 'Draft', 29, '2019-07-17-16-19-20_PCO-006 491mil.doc', 172544, '/api/downloadContractFile/2019-07-17-16-19-20_PCO-006 491mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (634, 'Quotation', 63, '2019-07-17-16-24-57_190502- ATP- Lưới bao che Aeon Bike và Wellness .pdf', 145755, '/api/downloadQuotationFile/2019-07-17-16-24-57_190502- ATP- Lưới bao che Aeon Bike và Wellness .pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (635, 'InvoiceVer3', 21, '2019-07-17-16-29-13_01GTKT0_0000059.pdf', 275348, '/api/downloadInvoiceVer3File/2019-07-17-16-29-13_01GTKT0_0000059.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (636, 'InvoiceVer3', 22, '2019-07-17-16-43-03_01GTKT0_0000024.pdf', 274821, '/api/downloadInvoiceVer3File/2019-07-17-16-43-03_01GTKT0_0000024.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (637, 'Quotation', 64, '2019-07-17-16-54-42_BOQ - HD 007 - send.pdf', 331950, '/api/downloadQuotationFile/2019-07-17-16-54-42_BOQ - HD 007 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (639, 'Approval', 44, '2019-07-17-17-00-31_PCO- 007 209mil.doc', 171008, '/api/downloadApprovalFile/2019-07-17-17-00-31_PCO- 007 209mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (640, 'Draft', 31, '2019-07-17-17-01-02_PCO- 007 209mil.doc', 171008, '/api/downloadContractFile/2019-07-17-17-01-02_PCO- 007 209mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (641, 'Official', 31, '2019-07-17-17-01-13_PCO- 007 209mil.doc', 171008, '/api/downloadContractFile/2019-07-17-17-01-13_PCO- 007 209mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (642, 'Quotation', 65, '2019-07-17-17-02-45_BOQ - HD 008 - send.pdf', 3763318, '/api/downloadQuotationFile/2019-07-17-17-02-45_BOQ - HD 008 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (643, 'Approval', 45, '2019-07-17-17-04-26_BOQ - HD 008 - approved.pdf', 369685, '/api/downloadApprovalFile/2019-07-17-17-04-26_BOQ - HD 008 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (644, 'Approval', 46, '2019-07-17-17-04-26_BOQ ATPEX-GFL-TB.pdf', 355585, '/api/downloadApprovalFile/2019-07-17-17-04-26_BOQ ATPEX-GFL-TB.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (645, 'Acceptance', 17, '2019-07-17-17-05-23_BBNT ATPEX_GFL_TB.pdf', 234067, '/api/downloadAcceptanceFile/2019-07-17-17-05-23_BBNT ATPEX_GFL_TB.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (646, 'Official', 32, '2019-07-17-17-05-36_PCO- 008 187mil.doc', 172032, '/api/downloadContractFile/2019-07-17-17-05-36_PCO- 008 187mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (647, 'PaymentVer1', 18, '2019-07-17-17-06-16_Yêu cầu thanh toán 08 - Copy.doc', 40448, '/api/downloadInvoiceVer1File/2019-07-17-17-06-16_Yêu cầu thanh toán 08 - Copy.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (648, 'InvoiceVer3', 23, '2019-07-17-17-06-38_01GTKT0_0000019.pdf', 274978, '/api/downloadInvoiceVer3File/2019-07-17-17-06-38_01GTKT0_0000019.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (649, 'Quotation', 66, '2019-07-17-17-14-27_BOQ  KINGDOM-S28.pdf', 362444, '/api/downloadQuotationFile/2019-07-17-17-14-27_BOQ  KINGDOM-S28.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (650, 'Approval', 47, '2019-07-17-17-15-38_BOQ  KINGDOM-S28.pdf', 362444, '/api/downloadApprovalFile/2019-07-17-17-15-38_BOQ  KINGDOM-S28.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (651, 'Acceptance', 18, '2019-07-17-17-16-09_BBNT KINGDOM S28.pdf', 252938, '/api/downloadAcceptanceFile/2019-07-17-17-16-09_BBNT KINGDOM S28.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (652, 'InputVer3', 24, '2019-07-17-17-17-06_01GTKT0_0000001.pdf', 274035, '/api/downloadInvoiceVer3File/2019-07-17-17-17-06_01GTKT0_0000001.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (655, 'InvoiceVer3', 25, '2019-07-17-17-23-40_Hóa đơn 189.pdf', 349526, '/api/downloadInvoiceVer3File/2019-07-17-17-23-40_Hóa đơn 189.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (656, 'Acceptance', 19, '2019-07-17-17-24-40_BBNT TINIWORLD S12.pdf', 275632, '/api/downloadAcceptanceFile/2019-07-17-17-24-40_BBNT TINIWORLD S12.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (657, 'Approval', 48, '2019-07-17-17-25-16_BOQ TINIWORLD S12.pdf', 356962, '/api/downloadApprovalFile/2019-07-17-17-25-16_BOQ TINIWORLD S12.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (658, 'Quotation', 67, '2019-07-17-17-25-34_BOQ TINIWORLD S12.pdf', 356962, '/api/downloadQuotationFile/2019-07-17-17-25-34_BOQ TINIWORLD S12.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (659, 'Quotation', 68, '2019-07-17-17-28-18_BOQ GOGI F33.pdf', 383275, '/api/downloadQuotationFile/2019-07-17-17-28-18_BOQ GOGI F33.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (660, 'Approval', 49, '2019-07-17-17-30-20_BOQ GOGI F33.pdf', 383275, '/api/downloadApprovalFile/2019-07-17-17-30-20_BOQ GOGI F33.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (661, 'Acceptance', 20, '2019-07-17-17-31-51_BBNT GOGI F33.pdf', 278031, '/api/downloadAcceptanceFile/2019-07-17-17-31-51_BBNT GOGI F33.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (662, 'InvoiceVer3', 26, '2019-07-17-17-32-52_Hóa đơn 195.pdf', 370527, '/api/downloadInvoiceVer3File/2019-07-17-17-32-52_Hóa đơn 195.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (663, 'Quotation', 69, '2019-07-17-17-39-00_ATP-G16A-MOV.pdf', 394304, '/api/downloadQuotationFile/2019-07-17-17-39-00_ATP-G16A-MOV.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (664, 'Approval', 50, '2019-07-17-17-40-23_ATP-G16A-MOV.pdf', 394304, '/api/downloadApprovalFile/2019-07-17-17-40-23_ATP-G16A-MOV.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (665, 'Acceptance', 21, '2019-07-17-17-40-58_NT005.pdf', 308112, '/api/downloadAcceptanceFile/2019-07-17-17-40-58_NT005.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (666, 'InvoiceVer3', 27, '2019-07-17-17-42-00_01GTKT0_0000005.pdf', 273028, '/api/downloadInvoiceVer3File/2019-07-17-17-42-00_01GTKT0_0000005.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (667, 'Quotation', 70, '2019-07-17-17-44-58_ATPEX-S64-HOAR.pdf', 448067, '/api/downloadQuotationFile/2019-07-17-17-44-58_ATPEX-S64-HOAR.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (668, 'Approval', 51, '2019-07-17-17-46-21_ATPEX-S64-HOAR.pdf', 448067, '/api/downloadApprovalFile/2019-07-17-17-46-21_ATPEX-S64-HOAR.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (669, 'Acceptance', 23, '2019-07-17-17-46-49_NT016.pdf', 369482, '/api/downloadAcceptanceFile/2019-07-17-17-46-49_NT016.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (670, 'InvoiceVer3', 28, '2019-07-17-17-48-09_01GTKT0_0000016.pdf', 274720, '/api/downloadInvoiceVer3File/2019-07-17-17-48-09_01GTKT0_0000016.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (672, 'PaymentVer2', 11, '2019-07-17-18-06-16_Yêu cầu thanh toán hd006- 40%- yctt34.doc', 40448, '/api/downloadInvoiceVer2File/2019-07-17-18-06-16_Yêu cầu thanh toán hd006- 40%- yctt34.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (673, 'InvoiceVer3', 30, '2019-07-17-18-08-36_Yêu cầu thanh toán hd005- 70% fn- yctt29.doc', 40960, '/api/downloadInvoiceVer3File/2019-07-17-18-08-36_Yêu cầu thanh toán hd005- 70% fn- yctt29.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (674, 'Acceptance', 25, '2019-07-17-18-10-08_BiEN BAN NGHIEM THU- SƠN NƯỚC - HD005.doc', 43520, '/api/downloadAcceptanceFile/2019-07-17-18-10-08_BiEN BAN NGHIEM THU- SƠN NƯỚC - HD005.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (675, 'Quotation', 71, '2019-07-17-18-12-50_ATP-KR-HOAR.pdf', 437201, '/api/downloadQuotationFile/2019-07-17-18-12-50_ATP-KR-HOAR.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (676, 'Approval', 52, '2019-07-17-18-15-03_ATP-KR-HOAR.pdf', 437201, '/api/downloadApprovalFile/2019-07-17-18-15-03_ATP-KR-HOAR.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (677, 'Acceptance', 26, '2019-07-17-18-15-38_NT018.pdf', 313977, '/api/downloadAcceptanceFile/2019-07-17-18-15-38_NT018.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (678, 'InvoiceVer3', 31, '2019-07-17-18-16-00_01GTKT0_0000018.pdf', 274645, '/api/downloadInvoiceVer3File/2019-07-17-18-16-00_01GTKT0_0000018.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (679, 'Quotation', 72, '2019-07-17-19-45-37_BOQ - HD 009.1 - send.pdf', 1096265, '/api/downloadQuotationFile/2019-07-17-19-45-37_BOQ - HD 009.1 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (680, 'Quotation', 72, '2019-07-17-19-45-44_BOQ - HD009.2 - send.pdf', 1066021, '/api/downloadQuotationFile/2019-07-17-19-45-44_BOQ - HD009.2 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (681, 'Approval', 53, '2019-07-17-19-48-52_PCO- HD 009 - approved.pdf', 419520, '/api/downloadApprovalFile/2019-07-17-19-48-52_PCO- HD 009 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (682, 'Official', 33, '2019-07-17-19-49-58_PCO- 009 480.7mil.doc', 173056, '/api/downloadContractFile/2019-07-17-19-49-58_PCO- 009 480.7mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (683, 'PaymentVer1', 19, '2019-07-17-19-58-33_Yêu cầu thanh toán HD009 30%.doc', 43520, '/api/downloadInvoiceVer1File/2019-07-17-19-58-33_Yêu cầu thanh toán HD009 30%.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (684, 'Acceptance', 27, '2019-07-17-19-59-18_BiEN BAN NGHIEM THU- ĐÈN CHÂU Á , LAN CAN.doc', 43520, '/api/downloadAcceptanceFile/2019-07-17-19-59-18_BiEN BAN NGHIEM THU- ĐÈN CHÂU Á , LAN CAN.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (685, 'Quotation', 73, '2019-07-17-20-28-34_BOQ - HD 010 - send.pdf', 348174, '/api/downloadQuotationFile/2019-07-17-20-28-34_BOQ - HD 010 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (686, 'Approval', 54, '2019-07-17-20-30-31_07012019- HD 010 - approved.pdf', 415284, '/api/downloadApprovalFile/2019-07-17-20-30-31_07012019- HD 010 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (687, 'Official', 34, '2019-07-17-20-31-36_PCO- 010- 66mil .doc', 172032, '/api/downloadContractFile/2019-07-17-20-31-36_PCO- 010- 66mil .doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (688, 'PaymentVer1', 20, '2019-07-17-20-33-10_Yêu cầu thanh toán HD010 .doc', 38912, '/api/downloadInvoiceVer1File/2019-07-17-20-33-10_Yêu cầu thanh toán HD010 .doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (689, 'Acceptance', 29, '2019-07-17-20-35-11_BiEN BAN NGHIEM THU- hd001.doc', 43520, '/api/downloadAcceptanceFile/2019-07-17-20-35-11_BiEN BAN NGHIEM THU- hd001.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (690, 'Acceptance', 30, '2019-07-17-20-36-22_BiEN BAN NGHIEM THU-VẠCH GIAO THÔNG - HD002.doc', 44544, '/api/downloadAcceptanceFile/2019-07-17-20-36-22_BiEN BAN NGHIEM THU-VẠCH GIAO THÔNG - HD002.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (691, 'Acceptance', 31, '2019-07-17-20-36-56_BiEN BAN NGHIEM THU- hd003.doc', 43520, '/api/downloadAcceptanceFile/2019-07-17-20-36-56_BiEN BAN NGHIEM THU- hd003.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (692, 'Acceptance', 32, '2019-07-17-20-37-22_BiEN BAN NGHIEM THU-VẠCH GIAO THÔNG - HD004 (2).doc', 44032, '/api/downloadAcceptanceFile/2019-07-17-20-37-22_BiEN BAN NGHIEM THU-VẠCH GIAO THÔNG - HD004 (2).doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (693, 'InvoiceVer1', 11, '2019-07-18-11-45-38_Hd001 -30% đầu.jpg', 302587, '/api/downloadInvoiceVer1File/2019-07-18-11-45-38_Hd001 -30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (694, 'PaymentVer2', 13, '2019-07-18-11-47-24_Hd001 -40%.jpg', 291834, '/api/downloadInvoiceVer2File/2019-07-18-11-47-24_Hd001 -40%.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (695, 'InvoiceVer3', 32, '2019-07-18-11-48-34_Hd001 -30% cuối.jpg', 292570, '/api/downloadInvoiceVer3File/2019-07-18-11-48-34_Hd001 -30% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (696, 'InvoiceVer1', 12, '2019-07-18-11-50-17_Hd002-30% đầu.jpg', 275292, '/api/downloadInvoiceVer1File/2019-07-18-11-50-17_Hd002-30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (698, 'InvoiceVer1', 13, '2019-07-18-11-52-48_Hd003 -30% đầu.jpg', 280892, '/api/downloadInvoiceVer1File/2019-07-18-11-52-48_Hd003 -30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (699, 'PaymentVer2', 15, '2019-07-18-11-53-40_Hd003 -40%.jpg', 282554, '/api/downloadInvoiceVer2File/2019-07-18-11-53-40_Hd003 -40%.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (700, 'InvoiceVer3', 34, '2019-07-18-11-54-17_Hd003 -30% cuối.jpg', 286968, '/api/downloadInvoiceVer3File/2019-07-18-11-54-17_Hd003 -30% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (701, 'InvoiceVer1', 14, '2019-07-18-11-57-13_Hd004 -30% đầu.jpg', 274837, '/api/downloadInvoiceVer1File/2019-07-18-11-57-13_Hd004 -30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (703, 'InvoiceVer1', 16, '2019-07-18-12-49-19_Hd006 -30% đầu.jpg', 288553, '/api/downloadInvoiceVer1File/2019-07-18-12-49-19_Hd006 -30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (705, 'Acceptance', 24, '2019-07-18-12-51-22_BiEN BAN NGHIEM THU- hd006.doc', 43520, '/api/downloadAcceptanceFile/2019-07-18-12-51-22_BiEN BAN NGHIEM THU- hd006.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (707, 'Acceptance', 33, '2019-07-18-12-54-20_BiEN BAN NGHIEM THU- hd007.doc', 43008, '/api/downloadAcceptanceFile/2019-07-18-12-54-20_BiEN BAN NGHIEM THU- hd007.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (709, 'InvoiceVer1', 18, '2019-07-18-12-56-35_Hd008 -30% đầu.jpg', 270671, '/api/downloadInvoiceVer1File/2019-07-18-12-56-35_Hd008 -30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (710, 'Acceptance', 34, '2019-07-18-12-57-21_BiEN BAN NGHIEM THU- HD008 - 70%.doc', 43520, '/api/downloadAcceptanceFile/2019-07-18-12-57-21_BiEN BAN NGHIEM THU- HD008 - 70%.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (712, 'InvoiceVer1', 19, '2019-07-18-13-02-09_Hd009 -30% đầu.jpg', 273637, '/api/downloadInvoiceVer1File/2019-07-18-13-02-09_Hd009 -30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (713, 'InvoiceVer3', 38, '2019-07-18-13-02-57_Hd009-70% cuối.jpg', 279742, '/api/downloadInvoiceVer3File/2019-07-18-13-02-57_Hd009-70% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (714, 'InvoiceVer1', 20, '2019-07-18-13-04-25_Hd010 - 100%.jpg', 266758, '/api/downloadInvoiceVer1File/2019-07-18-13-04-25_Hd010 - 100%.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (715, 'PaymentVer2', 18, '2019-07-18-13-07-51_Hd008-70% cuối.jpg', 277889, '/api/downloadInvoiceVer2File/2019-07-18-13-07-51_Hd008-70% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (716, 'InvoiceVer1', 17, '2019-07-18-13-14-05_Hd007-70% cuối.jpg', 277192, '/api/downloadInvoiceVer1File/2019-07-18-13-14-05_Hd007-70% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (717, 'PaymentVer2', 17, '2019-07-18-13-14-28_Hd007 -30% đầu.jpg', 271730, '/api/downloadInvoiceVer2File/2019-07-18-13-14-28_Hd007 -30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (718, 'PaymentVer2', 11, '2019-07-18-13-16-23_Hd006-70% cuối.jpg', 292980, '/api/downloadInvoiceVer2File/2019-07-18-13-16-23_Hd006-70% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (719, 'PaymentVer2', 16, '2019-07-18-13-20-21_Hd004-70% cuối.jpg', 297525, '/api/downloadInvoiceVer2File/2019-07-18-13-20-21_Hd004-70% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (720, 'PaymentVer2', 14, '2019-07-18-14-13-17_Hd002-70% cuối.jpg', 296793, '/api/downloadInvoiceVer2File/2019-07-18-14-13-17_Hd002-70% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (721, 'InputVer3', 40, '2019-07-19-11-13-28_190718 - In nhanh Lam Son - 0001698.jpg', 884351, '/api/downloadInvoiceVer3File/2019-07-19-11-13-28_190718 - In nhanh Lam Son - 0001698.jpg', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (722, 'Quotation', 74, '2019-07-19-14-43-24_PCO - HD 011 - send.pdf', 298286, '/api/downloadQuotationFile/2019-07-19-14-43-24_PCO - HD 011 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (723, 'Approval', 55, '2019-07-19-14-46-35_181217- PCO- HD 011 - approved.pdf', 272414, '/api/downloadApprovalFile/2019-07-19-14-46-35_181217- PCO- HD 011 - approved.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (724, 'StockMovementReport_NHAP_KHO', 73, '2019-07-19-14-48-53_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-14-48-53_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (725, 'StockMovementReport_NHAP_KHO', 74, '2019-07-19-14-54-02_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-14-54-02_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (726, 'StockMovementReport_NHAP_KHO', 75, '2019-07-19-14-54-59_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-14-54-59_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (727, 'Official', 35, '2019-07-19-14-55-33_PCO- 011- 115.5mil .doc', 172544, '/api/downloadContractFile/2019-07-19-14-55-33_PCO- 011- 115.5mil .doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (728, 'StockMovementReport_NHAP_KHO', 76, '2019-07-19-14-56-26_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-14-56-26_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (729, 'StockMovementReport_NHAP_KHO', 77, '2019-07-19-14-57-26_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-14-57-26_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (730, 'PaymentVer1', 21, '2019-07-19-14-56-32_Yêu cầu thanh toán HD011 30%.doc', 38912, '/api/downloadInvoiceVer1File/2019-07-19-14-56-32_Yêu cầu thanh toán HD011 30%.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (731, 'InvoiceVer1', 21, '2019-07-19-14-57-05_Hd011 -30% đầu.jpg', 287760, '/api/downloadInvoiceVer1File/2019-07-19-14-57-05_Hd011 -30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (732, 'StockMovementReport_NHAP_KHO', 78, '2019-07-19-14-58-16_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-14-58-16_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (733, 'StockMovementReport_NHAP_KHO', 79, '2019-07-19-14-58-46_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-14-58-46_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (734, 'StockMovementReport_NHAP_KHO', 80, '2019-07-19-14-59-21_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-14-59-21_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (735, 'PaymentVer2', 21, '2019-07-19-14-58-38_Yêu cầu thanh toán HD011 70%.doc', 39936, '/api/downloadInvoiceVer2File/2019-07-19-14-58-38_Yêu cầu thanh toán HD011 70%.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (736, 'PaymentVer2', 21, '2019-07-19-14-59-12_Hd008-70% cuối.jpg', 277889, '/api/downloadInvoiceVer2File/2019-07-19-14-59-12_Hd008-70% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (737, 'StockMovementReport_NHAP_KHO', 81, '2019-07-19-15-00-06_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-00-06_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (738, 'Acceptance', 35, '2019-07-19-15-00-56_BiEN BAN NGHIEM THU- DEN TREO CHAU AU.doc', 38912, '/api/downloadAcceptanceFile/2019-07-19-15-00-56_BiEN BAN NGHIEM THU- DEN TREO CHAU AU.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (739, 'StockMovementReport_NHAP_KHO', 82, '2019-07-19-15-02-12_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-02-12_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (740, 'StockMovementReport_NHAP_KHO', 83, '2019-07-19-15-05-13_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-05-13_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (741, 'StockMovementReport_NHAP_KHO', 84, '2019-07-19-15-06-35_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-06-35_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (742, 'StockMovementReport_NHAP_KHO', 85, '2019-07-19-15-07-20_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-07-20_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (743, 'StockMovementReport_NHAP_KHO', 86, '2019-07-19-15-08-02_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-08-02_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (744, 'Quotation', 75, '2019-07-19-15-07-26_PCO - BOQ NẸP CẦU THANG - HD 012 - send.pdf', 348701, '/api/downloadQuotationFile/2019-07-19-15-07-26_PCO - BOQ NẸP CẦU THANG - HD 012 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (745, 'Approval', 56, '2019-07-19-15-09-40_PCO - BOQ NẸP CẦU THANG - HD 012 - send.pdf', 348701, '/api/downloadApprovalFile/2019-07-19-15-09-40_PCO - BOQ NẸP CẦU THANG - HD 012 - send.pdf', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (746, 'Official', 36, '2019-07-19-15-12-11_PCO- 012- 253mil.doc', 173056, '/api/downloadContractFile/2019-07-19-15-12-11_PCO- 012- 253mil.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (747, 'PaymentVer1', 22, '2019-07-19-15-13-13_Yêu cầu thanh toán HD012 .doc', 39936, '/api/downloadInvoiceVer1File/2019-07-19-15-13-13_Yêu cầu thanh toán HD012 .doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (748, 'InvoiceVer1', 22, '2019-07-19-15-14-04_Hd012-30% đầu.jpg', 279738, '/api/downloadInvoiceVer1File/2019-07-19-15-14-04_Hd012-30% đầu.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (749, 'PaymentVer2', 22, '2019-07-19-15-15-25_Hd012-70% cuối.jpg', 287066, '/api/downloadInvoiceVer2File/2019-07-19-15-15-25_Hd012-70% cuối.jpg', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (750, 'Acceptance', 36, '2019-07-19-15-21-25_BiEN BAN NGHIEM THU- nẹp cầu thang.doc', 43008, '/api/downloadAcceptanceFile/2019-07-19-15-21-25_BiEN BAN NGHIEM THU- nẹp cầu thang.doc', 'xuananh@pco.asia');
INSERT INTO `file_upload` VALUES (751, 'StockMovementReport_NHAP_KHO', 87, '2019-07-19-15-37-25_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-37-25_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (752, 'StockMovementReport_NHAP_KHO', 88, '2019-07-19-15-38-07_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-38-07_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (753, 'StockMovementReport_NHAP_KHO', 89, '2019-07-19-15-39-02_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-39-02_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (754, 'StockMovementReport_NHAP_KHO', 90, '2019-07-19-15-39-49_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-39-49_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (755, 'StockMovementReport_NHAP_KHO', 91, '2019-07-19-15-40-30_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-40-30_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (756, 'StockMovementReport_NHAP_KHO', 92, '2019-07-19-15-41-26_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-41-26_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (757, 'StockMovementReport_NHAP_KHO', 93, '2019-07-19-15-42-41_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', 158741, '/api/downloadStockMovementReport/2019-07-19-15-42-41_190715_SỐ LƯỢNG SƠN VÀ BỘT CỦA 2 KHO.pdf', NULL);
INSERT INTO `file_upload` VALUES (758, 'Quotation', 76, '2019-07-19-16-11-00_190323-G63A-Variation Quo Rev04.pdf', 206855, '/api/downloadQuotationFile/2019-07-19-16-11-00_190323-G63A-Variation Quo Rev04.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (759, 'Quotation', 77, '2019-07-19-16-14-34_190420- ATP- Hoarding + Demolish - Kumon.pdf', 172131, '/api/downloadQuotationFile/2019-07-19-16-14-34_190420- ATP- Hoarding + Demolish - Kumon.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (760, 'Quotation', 78, '2019-07-19-16-17-48_190619- ABT- Thay gạch thu ngân 11.pdf', 119933, '/api/downloadQuotationFile/2019-07-19-16-17-48_190619- ABT- Thay gạch thu ngân 11.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (761, 'InputVer3', 43, '2019-07-19-16-19-41_01GTKT0_0000060.pdf', 274634, '/api/downloadInvoiceVer3File/2019-07-19-16-19-41_01GTKT0_0000060.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (762, 'Approval', 58, '2019-07-19-16-19-01_190323-G63A-Variation Quo Rev04.pdf', 206855, '/api/downloadApprovalFile/2019-07-19-16-19-01_190323-G63A-Variation Quo Rev04.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (763, 'Approval', 59, '2019-07-19-16-28-51_190420- ATP- Hoarding + Demolish - Kumon.pdf', 172131, '/api/downloadApprovalFile/2019-07-19-16-28-51_190420- ATP- Hoarding + Demolish - Kumon.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (764, 'Quotation', 79, '2019-07-19-16-43-43_190328- ATPEX- Đèn spotlight .pdf', 125661, '/api/downloadQuotationFile/2019-07-19-16-43-43_190328- ATPEX- Đèn spotlight .pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (765, 'Approval', 60, '2019-07-19-16-44-28_190328- ATPEX- Đèn spotlight .pdf', 125661, '/api/downloadApprovalFile/2019-07-19-16-44-28_190328- ATPEX- Đèn spotlight .pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (766, 'Quotation', 80, '2019-07-19-16-48-38_190321- ATP- BOQ - Tu locker - Tam An.pdf', 219440, '/api/downloadQuotationFile/2019-07-19-16-48-38_190321- ATP- BOQ - Tu locker - Tam An.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (767, 'Approval', 61, '2019-07-19-16-49-25_190321- ATP- BOQ - Tu locker - Tam An.pdf', 219440, '/api/downloadApprovalFile/2019-07-19-16-49-25_190321- ATP- BOQ - Tu locker - Tam An.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (768, 'Quotation', 81, '2019-07-19-16-48-59_190614- ABT- thay gạch daiso .pdf', 119230, '/api/downloadQuotationFile/2019-07-19-16-48-59_190614- ABT- thay gạch daiso .pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (769, 'InvoiceVer3', 44, '2019-07-19-16-51-46_01GTKT0_0000061.pdf', 275911, '/api/downloadInvoiceVer3File/2019-07-19-16-51-46_01GTKT0_0000061.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (770, 'InvoiceVer3', 45, '2019-07-19-16-58-52_01GTKT0_0000032.pdf', 274873, '/api/downloadInvoiceVer3File/2019-07-19-16-58-52_01GTKT0_0000032.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (771, 'Quotation', 82, '2019-07-19-17-03-11_190706- ABT- Thay gạch trước Lot T33.pdf', 120474, '/api/downloadQuotationFile/2019-07-19-17-03-11_190706- ABT- Thay gạch trước Lot T33.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (772, 'InvoiceVer3', 46, '2019-07-19-17-07-29_01GTKT0_0000062.pdf', 274830, '/api/downloadInvoiceVer3File/2019-07-19-17-07-29_01GTKT0_0000062.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (773, 'Quotation', 56, '2019-07-19-17-08-52_190626___Bao_gia_NTVP_07___Taman_rev02.pdf', 221228, '/api/downloadQuotationFile/2019-07-19-17-08-52_190626___Bao_gia_NTVP_07___Taman_rev02.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (774, 'Approval', 64, '2019-07-19-17-10-44_190626___Bao_gia_NTVP_07___Taman_rev02.pdf', 221228, '/api/downloadApprovalFile/2019-07-19-17-10-44_190626___Bao_gia_NTVP_07___Taman_rev02.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (775, 'CloseWorkDone', 35, '2019-07-19-17-27-53_190718 - In nhanh Lam Son - 0001698.jpg', 884351, '/api/downloadCloseProjectFile/2019-07-19-17-27-53_190718 - In nhanh Lam Son - 0001698.jpg', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (776, 'Quotation', 83, '2019-07-19-17-33-38_GAP-G16A.pdf', 443536, '/api/downloadQuotationFile/2019-07-19-17-33-38_GAP-G16A.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (777, 'Acceptance', 40, '2019-07-19-17-39-04_NT190.pdf', 361928, '/api/downloadAcceptanceFile/2019-07-19-17-39-04_NT190.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (778, 'InvoiceVer3', 47, '2019-07-19-17-40-33_bf9d7a17bff55bab02e4.jpg', 155311, '/api/downloadInvoiceVer3File/2019-07-19-17-40-33_bf9d7a17bff55bab02e4.jpg', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (779, 'Quotation', 84, '2019-07-19-17-45-23_ATP-G33B-G3A-DEL.pdf', 507008, '/api/downloadQuotationFile/2019-07-19-17-45-23_ATP-G33B-G3A-DEL.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (780, 'Acceptance', 41, '2019-07-19-17-47-58_NT191.pdf', 384744, '/api/downloadAcceptanceFile/2019-07-19-17-47-58_NT191.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (781, 'InvoiceVer3', 48, '2019-07-19-17-49-02_19b93b3bfed91a8743c8.jpg', 163741, '/api/downloadInvoiceVer3File/2019-07-19-17-49-02_19b93b3bfed91a8743c8.jpg', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (782, 'Quotation', 85, '2019-07-19-17-53-24_ATP-G33A-DEL.pdf', 470567, '/api/downloadQuotationFile/2019-07-19-17-53-24_ATP-G33A-DEL.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (783, 'Acceptance', 42, '2019-07-19-17-55-56_NT192.pdf', 338114, '/api/downloadAcceptanceFile/2019-07-19-17-55-56_NT192.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (784, 'InvoiceVer3', 49, '2019-07-19-17-57-03_4727cca70945ed1bb454.jpg', 158868, '/api/downloadInvoiceVer3File/2019-07-19-17-57-03_4727cca70945ed1bb454.jpg', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (785, 'Quotation', 86, '2019-07-19-17-59-35_GFL-GMS2.pdf', 515103, '/api/downloadQuotationFile/2019-07-19-17-59-35_GFL-GMS2.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (786, 'InvoiceVer3', 50, '2019-07-19-18-01-31_01GTKT0_0000007.pdf', 275113, '/api/downloadInvoiceVer3File/2019-07-19-18-01-31_01GTKT0_0000007.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (788, 'Official', 40, '2019-07-19-18-04-26_S-M-TC-TAMAN-20160101 PL-07.pdf', 207189, '/api/downloadContractFile/2019-07-19-18-04-26_S-M-TC-TAMAN-20160101 PL-07.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (789, 'InvoiceVer3', 50, '2019-07-19-18-05-53_01GTKT0_0000026.pdf', 274538, '/api/downloadInvoiceVer3File/2019-07-19-18-05-53_01GTKT0_0000026.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (790, 'Official', 41, '2019-07-19-18-06-46_S-S-HQ-TAMAN-20190401.pdf', 473719, '/api/downloadContractFile/2019-07-19-18-06-46_S-S-HQ-TAMAN-20190401.pdf', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (791, 'Acceptance', 43, '2019-07-19-18-07-10_NT007.pdf', 389241, '/api/downloadAcceptanceFile/2019-07-19-18-07-10_NT007.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (792, 'Draft', 42, '2019-07-19-18-15-03_S-M-TC-TAMAN-20160101 PL-08.docx', 124860, '/api/downloadContractFile/2019-07-19-18-15-03_S-M-TC-TAMAN-20160101 PL-08.docx', 'hiennguyen@tamaninterior.com');
INSERT INTO `file_upload` VALUES (793, 'Quotation', 87, '2019-07-19-23-28-52_190507- Aeon Bình Tân-Thay gạch sảnh Trung tâm tầng 3.pdf', 108975, '/api/downloadQuotationFile/2019-07-19-23-28-52_190507- Aeon Bình Tân-Thay gạch sảnh Trung tâm tầng 3.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (794, 'InvoiceVer3', 51, '2019-07-19-23-31-42_01GTKT0_0000037.pdf', 274029, '/api/downloadInvoiceVer3File/2019-07-19-23-31-42_01GTKT0_0000037.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (795, 'Quotation', 88, '2019-07-19-23-34-49_190519- ABT- Thay bạt .pdf', 216640, '/api/downloadQuotationFile/2019-07-19-23-34-49_190519- ABT- Thay bạt .pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (796, 'InvoiceVer3', 52, '2019-07-19-23-39-36_01GTKT0_0000042.pdf', 273798, '/api/downloadInvoiceVer3File/2019-07-19-23-39-36_01GTKT0_0000042.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (797, 'Quotation', 89, '2019-07-20-10-05-42_ABT-3GMS-VN.pdf', 416938, '/api/downloadQuotationFile/2019-07-20-10-05-42_ABT-3GMS-VN.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (798, 'Acceptance', 44, '2019-07-20-10-07-33_NT022.pdf', 267959, '/api/downloadAcceptanceFile/2019-07-20-10-07-33_NT022.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (799, 'InvoiceVer3', 53, '2019-07-20-10-08-30_01GTKT0_0000022.pdf', 273936, '/api/downloadInvoiceVer3File/2019-07-20-10-08-30_01GTKT0_0000022.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (800, 'Quotation', 90, '2019-07-20-10-33-51_190319- ABT- Xây tường rào .pdf', 213005, '/api/downloadQuotationFile/2019-07-20-10-33-51_190319- ABT- Xây tường rào .pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (801, 'InvoiceVer3', 54, '2019-07-20-10-41-38_01GTKT0_0000012.pdf', 274754, '/api/downloadInvoiceVer3File/2019-07-20-10-41-38_01GTKT0_0000012.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (802, 'Acceptance', 45, '2019-07-20-10-42-57_NT012.pdf', 268941, '/api/downloadAcceptanceFile/2019-07-20-10-42-57_NT012.pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (803, 'Quotation', 91, '2019-07-20-11-02-46_190330- ABT- Lắp kính quầy shashimi .pdf', 110190, '/api/downloadQuotationFile/2019-07-20-11-02-46_190330- ABT- Lắp kính quầy shashimi .pdf', 'phuongphan@tamaninterior.com');
INSERT INTO `file_upload` VALUES (804, 'Draft', 46, '2019-07-24-11-53-30_incurrd1 copy.xlsx', 10242, '/api/downloadContractFile/2019-07-24-11-53-30_incurrd1 copy.xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (805, 'Official', 46, '2019-07-24-11-53-36_invoice12.xlsx', 10242, '/api/downloadContractFile/2019-07-24-11-53-36_invoice12.xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (806, 'PaymentVer1', 27, '2019-07-24-11-54-15_incurrd1.xlsx', 10242, '/api/downloadInvoiceVer1File/2019-07-24-11-54-15_incurrd1.xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (807, 'InvoiceVer1', 27, '2019-07-24-11-54-22_incurrd1.xlsx', 10242, '/api/downloadInvoiceVer1File/2019-07-24-11-54-22_incurrd1.xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (808, 'InputVer1', 27, '2019-07-24-11-54-01_incurrd1 copy 4.xlsx', 10242, '/api/downloadInvoiceVer1File/2019-07-24-11-54-01_incurrd1 copy 4.xlsx', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (809, 'UserImage', 2, '2019-07-29-09-58-05_logo_so_en.jpg', 33706, '/api/downloadUserImage/2019-07-29-09-58-05_logo_so_en.jpg', 'admin@tamaninterior.com');
INSERT INTO `file_upload` VALUES (810, 'UserImage', 3, '2019-07-29-10-00-10_logo.png', 14150, '/api/downloadUserImage/2019-07-29-10-00-10_logo.png', 'admin@tamaninterior.com');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_product_category` (`product_category_id`),
  KEY `fk_product_supplier` (`supplier_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, 'Weather Coat K001NV/18L new', 1, 'K001NV/18L', '18L', 'THÙNG', 6400000, NULL, 1);
INSERT INTO `product` VALUES (2, 'Weather Coat K001NV/5L new', 1, 'K001NV/5L', '5L', 'LON', 985000, NULL, 1);
INSERT INTO `product` VALUES (3, 'ECO Spring Exterior K005/18L', 1, 'K005/18L', '18L', 'THÙNG', 1390000, NULL, 1);
INSERT INTO `product` VALUES (4, 'ECO Spring Exterior K005/5L', 1, 'K005/5L', '5L', 'LON', 390000, NULL, 1);
INSERT INTO `product` VALUES (5, 'Water Proof K015/17Kg', 1, 'K015/17Kg', '17Kg', 'THÙNG', 1280000, NULL, 1);
INSERT INTO `product` VALUES (6, 'Water Proof K015/4Kg', 1, 'K015/4Kg', '4Kg', 'LON', 330000, NULL, 1);
INSERT INTO `product` VALUES (7, 'Eco Sheen White K019/17L', 1, 'K019/17L', '17L', 'THÙNG', 1820000, NULL, 1);
INSERT INTO `product` VALUES (8, 'Eco Sheen White K019/4L', 1, 'K019/4L', '4L', 'LON', 500000, NULL, 1);
INSERT INTO `product` VALUES (9, 'Sơn Weathercoat Elastomeric K021-/18L', 1, 'K021- 000/18L', '18L', 'THÙNG', 2500000, NULL, 1);
INSERT INTO `product` VALUES (10, 'Sơn Weathercoat Elastomeric K021-/18L', 1, 'K021- N55/18L', '18L', 'THÙNG', 2904000, NULL, 1);
INSERT INTO `product` VALUES (11, 'Sơn Weathercoat Elastomeric K021-/18L', 1, 'K021- N65/18L', '18L', 'THÙNG', 2904000, NULL, 1);
INSERT INTO `product` VALUES (12, 'Sơn Weathercoat Elastomeric K021-/18L', 1, 'K021- N72/18L', '18L', 'THÙNG', 2904000, NULL, 1);
INSERT INTO `product` VALUES (13, 'Sơn Weathercoat Elastomeric K021-/18L', 1, 'K021- N85/18L', '18L', 'THÙNG', 2904000, NULL, 1);
INSERT INTO `product` VALUES (14, 'Sơn Weathercoat Elastomeric K021-/5L', 1, 'K021-N55/5L', '5L', 'LON', 783000, NULL, 1);
INSERT INTO `product` VALUES (15, 'Sơn Weathercoat Elastomeric K021-/5L', 1, 'K021-N65/5L', '5L', 'LON', 783000, NULL, 1);
INSERT INTO `product` VALUES (16, 'Sơn Weathercoat Elastomeric K021-/5L', 1, 'K021-N72/5L', '5L', 'LON', 783000, NULL, 1);
INSERT INTO `product` VALUES (17, 'Sơn Weathercoat Elastomeric K021-/5L', 1, 'K021-N85/5L', '5L', 'LON', 783000, NULL, 1);
INSERT INTO `product` VALUES (18, 'Weather Coat Clear KC01NV/18L New', 1, 'KC01NV/18L', '18L', 'THÙNG', 2070000, NULL, 1);
INSERT INTO `product` VALUES (19, 'Weather Coat Clear KC01NV/5L New', 1, 'KC01NV/5L', '5L', 'LON', 620000, NULL, 1);
INSERT INTO `product` VALUES (20, 'ECO Spring Exterior Clear KC05/5L', 1, 'KC05/5L', '5L', 'LON', 340000, NULL, 1);
INSERT INTO `product` VALUES (21, 'Weather Top Sheen Clear KC07/1L', 1, 'KC07/1L', '1L', 'HỘP', 130000, NULL, 1);
INSERT INTO `product` VALUES (22, 'Weather Top Sheen Clear KC07/5L', 1, 'KC07/5L', '5L', 'LON', 510000, NULL, 1);
INSERT INTO `product` VALUES (23, 'Eco Sheen Clear KC19/1L', 1, 'KC19/1L', '1L', 'HỘP', 110000, NULL, 1);
INSERT INTO `product` VALUES (24, 'Eco Sheen Clear KC19/4L', 1, 'KC19/4L', '4L', 'LON', 400000, NULL, 1);
INSERT INTO `product` VALUES (25, 'Weather Coat Deep KD01NV/18L New', 1, 'KD01NV/18L', '18L', 'THÙNG', 2370000, NULL, 1);
INSERT INTO `product` VALUES (26, 'Weather Coat Deep KD01NV/5L New', 1, 'KD01NV/5L', '5L', 'LON', 744000, NULL, 1);
INSERT INTO `product` VALUES (27, 'Weather Top Sheen Deep KD07/1L', 1, 'KD07/1L', '1L', 'HỘP', 140000, NULL, 1);
INSERT INTO `product` VALUES (28, 'Weather Top Sheen Deep KD07/5L', 1, 'KD07/5L', '5L', 'LON', 550000, NULL, 1);
INSERT INTO `product` VALUES (29, 'Weather Coat Medium KM01NV/18L New', 1, 'KM01NV/18L', '18L', 'THÙNG', 2730000, NULL, 1);
INSERT INTO `product` VALUES (30, 'Weather Coat Medium KM01NV/1L New', 1, 'KM01NV/1L', '1L', 'HỘP', 185000, NULL, 1);
INSERT INTO `product` VALUES (31, 'Weather Coat Medium KM01NV/5L New', 1, 'KM01NV/5L', '5L', 'LON', 757000, NULL, 1);
INSERT INTO `product` VALUES (32, 'Weather Top Sheen Medium KM07/18L', 1, 'KM07/18L', '18L', 'THÙNG', 2120000, NULL, 1);
INSERT INTO `product` VALUES (33, 'Weather Top Sheen Medium KM07/1L', 1, 'KM07/1L', '1L', 'HỘP', 150000, NULL, 1);
INSERT INTO `product` VALUES (34, 'Weather Top Sheen Medium KM07/5L', 1, 'KM07/5L', '5L', 'LON', 630000, NULL, 1);
INSERT INTO `product` VALUES (35, 'Eco Sheen Medium KM19/17L', 1, 'KM19/17L', '17L', 'THÙNG', 1580000, NULL, 1);
INSERT INTO `product` VALUES (36, 'Eco Sheen Medium KM19/1L', 1, 'KM19/1L', '1L', 'HỘP', 120000, NULL, 1);
INSERT INTO `product` VALUES (37, 'Eco Sheen Medium KM19/4L', 1, 'KM19/4L', '4L', 'LON', 430000, NULL, 1);
INSERT INTO `product` VALUES (38, 'Weather Coat Pastel KP01NV/18L New', 1, 'KP01NV/18L', '18L', 'THÙNG', 3280000, NULL, 1);
INSERT INTO `product` VALUES (39, 'Weather Coat Pastel KP01NV/1L New', 1, 'KP01NV/1L', '1L', 'HỘP', 216000, NULL, 1);
INSERT INTO `product` VALUES (40, 'Weather Coat Pastel KP01NV/5L New', 1, 'KP01NV/5L', '5L', 'LON', 952000, NULL, 1);
INSERT INTO `product` VALUES (41, 'ECO Spring Exterior Pastel KP05/18L', 1, 'KP05/18L', '18L', 'THÙNG', 1320000, NULL, 1);
INSERT INTO `product` VALUES (42, 'Weather Top Sheen Pastel KP07/18L', 1, 'KP07/18L', '18L', 'THÙNG', 2260000, NULL, 1);
INSERT INTO `product` VALUES (43, 'Weather Top Sheen Pastel KP07/1L', 1, 'KP07/1L', '1L', 'HỘP', 180000, NULL, 1);
INSERT INTO `product` VALUES (44, 'Weather Top Sheen Pastel KP07/5L', 1, 'KP07/5L', '5L', 'LON', 720000, NULL, 1);
INSERT INTO `product` VALUES (45, 'Eco Sheen Pastel KP19/17L', 1, 'KP19/17L', '17L', 'THÙNG', 1680000, NULL, 1);
INSERT INTO `product` VALUES (46, 'Eco Sheen Pastel KP19/1L', 1, 'KP19/1L', '1L', 'HỘP', 150000, NULL, 1);
INSERT INTO `product` VALUES (47, 'Eco Sheen Pastel KP19/4L', 1, 'KP19/4L', '4L', 'LON', 460000, NULL, 1);
INSERT INTO `product` VALUES (48, 'Dung môi Thinner No.5/5L', 1, 'KT05/5L', '5L', 'LON', 350000, NULL, 1);
INSERT INTO `product` VALUES (49, 'Dung môi Thinner No.5/18L', 1, 'KT05/18L', '18L', 'THÙNG', 1200000, NULL, 1);
INSERT INTO `product` VALUES (50, 'Sơn ngoại thất  bóng mờ X Shield X01-C/18L', 1, 'X01 - C/18L', '18L', 'THÙNG', 1010000, NULL, 1);
INSERT INTO `product` VALUES (51, 'Sơn ngoại thất  bóng mờ X Shield X01-W/18L', 1, 'X01-W/18L', '18L', 'THÙNG', 1155000, NULL, 1);
INSERT INTO `product` VALUES (52, 'ECO Spring Interior New K008NV/18L', 2, 'K008NV/18L', '18L', 'THÙNG', 810000, NULL, 1);
INSERT INTO `product` VALUES (53, 'Snow White K012/18L', 2, 'K012/18L', '18L', 'THÙNG', 700000, NULL, 1);
INSERT INTO `product` VALUES (54, 'Snow White K012/5L', 2, 'K012/5L', '5L', 'LON', 220000, NULL, 1);
INSERT INTO `product` VALUES (55, 'Kansai Spring Clean White K014/17L', 2, 'K014/17L', '17L', 'THÙNG', 1550000, NULL, 1);
INSERT INTO `product` VALUES (56, 'Kansai Spring Clean White K014/4L', 2, 'K014/4L', '4L', 'LON', 412000, NULL, 1);
INSERT INTO `product` VALUES (57, 'Eco-V White K020-000/17L', 2, 'K020-000/17L', '17L', 'THÙNG', 560000, NULL, 1);
INSERT INTO `product` VALUES (58, 'Eco-V White K020-000/4L', 2, 'K020-000/4L', '4L', 'LON', 147000, NULL, 1);
INSERT INTO `product` VALUES (59, 'ECO Spring Interior Clear New KC08NV/5L', 2, 'KC08NV/5L', '5L', 'LON', 210000, NULL, 1);
INSERT INTO `product` VALUES (60, 'Kansai Spring Clean Clear KC14/1L', 2, 'KC14/1L', '1L', 'HỘP', 120000, NULL, 1);
INSERT INTO `product` VALUES (61, 'Kansai Spring Clean Clear KC14/4L', 2, 'KC14/4L', '4L', 'LON', 347000, NULL, 1);
INSERT INTO `product` VALUES (62, 'Ultral Matt Clear KC18/17L', 2, 'KC18/17L', '17L', 'THÙNG', 1166000, NULL, 1);
INSERT INTO `product` VALUES (63, 'Kansai Spring Clean Medium KM14/17L', 2, 'KM14/17L', '17L', 'THÙNG', 1390000, NULL, 1);
INSERT INTO `product` VALUES (64, 'Kansai Spring Clean Medium KM14/1L', 2, 'KM14/1L', '1L', 'HỘP', 130000, NULL, 1);
INSERT INTO `product` VALUES (65, 'Kansai Spring Clean Medium KM14/4L', 2, 'KM14/4L', '4L', 'LON', 367000, NULL, 1);
INSERT INTO `product` VALUES (66, 'Ultral Matt Pastel KM18/17L', 2, 'KM18/17L', '17L', 'THÙNG', 1251000, NULL, 1);
INSERT INTO `product` VALUES (67, 'ECO Spring Exterior Pastel KP05/5L', 2, 'KP05/5L', '5L', 'LON', 380000, NULL, 1);
INSERT INTO `product` VALUES (68, 'ECO Spring Interior Pastel New KP08NV/18L', 2, 'KP08NV/18L', '18L', 'THÙNG', 710000, NULL, 1);
INSERT INTO `product` VALUES (69, 'ECO Spring Interior Pastel New KP08NV/5L', 2, 'KP08NV/5L', '5L', 'LON', 232000, NULL, 1);
INSERT INTO `product` VALUES (70, 'Kansai Spring Clean Pastel KP14/17L', 2, 'KP14/17L', '17L', 'THÙNG', 1430000, NULL, 1);
INSERT INTO `product` VALUES (71, 'Kansai Spring Clean Pastel KP14/1L', 2, 'KP14/1L', '1L', 'HỘP', 141000, NULL, 1);
INSERT INTO `product` VALUES (72, 'Kansai Spring Clean Pastel KP14/4L', 2, 'KP14/4L', '4L', 'LON', 380000, NULL, 1);
INSERT INTO `product` VALUES (73, 'Ultral Matt Pastel KP18/17L', 2, 'KP18/17L', '17L', 'THÙNG', 1315000, NULL, 1);
INSERT INTO `product` VALUES (74, 'Eco-V base Pastel loại KP20/17L', 2, 'KP20/17L', '17L', 'THÙNG', 550000, NULL, 1);
INSERT INTO `product` VALUES (75, 'Eco-V base Pastel loại KP20/4L', 2, 'KP20/4L', '4L', 'LON', 145000, NULL, 1);
INSERT INTO `product` VALUES (76, 'Sơn nội thất bóng mờ Idecor N03 -C/5L', 2, 'N03-C/5L', '5L', 'LON', 420909, NULL, 1);
INSERT INTO `product` VALUES (77, 'Sơn nội thất bóng mờ Idecor N03 -P/18L', 2, 'N03-P/18L', '18L', 'THÙNG', 646000, NULL, 1);
INSERT INTO `product` VALUES (78, 'Sơn nội thất bóng mờ Idecor N03 -P/5L', 2, 'N03-P/5L', '5L', 'LON', 236364, NULL, 1);
INSERT INTO `product` VALUES (79, 'Sơn nội thất dễ lau chùi Idecor N05 -M', 2, 'N05 -M /18L', '18L', 'THÙNG', 1257273, NULL, 1);
INSERT INTO `product` VALUES (80, 'Primer Sealer 1035 KL01/18L', 3, 'KL01/18L', '18L', 'THÙNG', 1560000, NULL, 1);
INSERT INTO `product` VALUES (81, 'Primer Sealer 1035 KL01/5L', 3, 'KL01/5L', '5L', 'LON', 475000, NULL, 1);
INSERT INTO `product` VALUES (82, 'Primer for interior KL04/17L', 3, 'KL04/17L', '17L', 'THÙNG', 1080000, NULL, 1);
INSERT INTO `product` VALUES (83, 'Primer for interior KL04/4L', 3, 'KL04/4L', '4L', 'BAO', 357000, NULL, 1);
INSERT INTO `product` VALUES (84, 'Bột trét tường nội ngoại thất ECO SKIMCOAT for ALL', 4, 'KS01/40KG', '40KG', 'BAO', 264000, NULL, 1);
INSERT INTO `product` VALUES (85, 'Bột trét tường nội ngoại thất ECO SKIMCOAT for Interior', 4, 'KS02/40KG', '40KG', 'BAO', 200000, NULL, 1);
INSERT INTO `product` VALUES (86, 'Sơn chống thấm một thành phần Aqua Shield Light', 5, 'K023-Light Grey/18L', '18L', 'THÙNG', 1380000, NULL, 1);
INSERT INTO `product` VALUES (87, 'Sơn chống thấm một thành phần Aqua Shield Light', 5, 'K023-Light Grey/5L', '5L', 'LON', 422000, NULL, 1);
INSERT INTO `product` VALUES (88, 'Paralux P268HS(B) Light Grey loại 16L', 6, 'PL04-200B/16L', '16L', 'THÙNG', NULL, NULL, 1);
INSERT INTO `product` VALUES (89, 'Paralux P268HS(B) Light Grey loại 4 Lít', 6, 'PL04-200B/4L', '4L', 'LON', 656000, NULL, 1);
INSERT INTO `product` VALUES (90, 'Paralux 268HS Additives loại 1L', 6, 'PL04H/1L', '1L', 'HỘP', 164000, NULL, 1);
INSERT INTO `product` VALUES (91, 'Paralux 268HS Additives loại 4L', 6, 'PL04H/4L', '4L', 'LON', NULL, NULL, 1);
INSERT INTO `product` VALUES (92, 'Sơn dầu- Sơn phủ  Polyurethane Parathane T8 14 Pastel PP04-100B-/4L', 6, 'PP04-100B-19-90A/4L', '4L', 'LON', NULL, NULL, 1);
INSERT INTO `product` VALUES (93, 'Sơn phủ Paralux 4HG hardener loại 1,25L', 6, 'PP03H/1.25L', '1.25L', 'LON', 232500, NULL, 1);
INSERT INTO `product` VALUES (94, 'Sơn phủ Epoxy Paralux 4HG Clear', 6, 'PP03-400B-N30/3.75L', '3.75L', 'LON', 697500, NULL, 1);
INSERT INTO `product` VALUES (95, 'Sơn phủ Polyurethane Parathane\nT8 14 Pastel PP04-100B-/4L', 6, 'PP04-100B-N65/4L', '4L', 'LON', NULL, NULL, 1);
INSERT INTO `product` VALUES (96, 'Sơn phủ Polyurethane Parathane\nT8 14 Pastel PP04-100B-/16L', 6, 'PP04-100B-N72/16L', '16L', 'THÙNG', NULL, NULL, 1);
INSERT INTO `product` VALUES (97, 'Sơn phủ Polyurethane Parathane\nT8 14 Pastel PP04-100B-/4L', 6, 'PP04-100B-N72/4L', '4L', 'LON', NULL, NULL, 1);
INSERT INTO `product` VALUES (98, 'Sơn phủ Polyurethane Parathane\nT8 14 Pastel PP04-100B-/4L', 6, 'PP04-100B-N85/4L', '4L', 'LON', NULL, NULL, 1);
INSERT INTO `product` VALUES (99, 'Sơn phủ Polyurethane Parathane\nT8 14 Clear loại 4L', 6, 'PP04-300B-N40/4L', '4L', 'LON', NULL, NULL, 1);
INSERT INTO `product` VALUES (100, 'Sơn phủ Polyurethane Parathane\nT8 14 Additive loại 1L', 6, 'PP04H/1L', '1L', 'HỘP', NULL, NULL, 1);
INSERT INTO `product` VALUES (101, 'Sơn phủ Polyurethane Parathane\nT8 14 Additive loại 4L', 6, 'PP04H/4L', '4L', 'LON', NULL, NULL, 1);
INSERT INTO `product` VALUES (102, 'Sơn gốc nước Par Textcoat 20L', 6, 'K11/20L', '20L', 'THÙNG', 780000, NULL, 1);
INSERT INTO `product` VALUES (106, 'RULO', 8, '123', '200MM', 'CÂY', 20000, 'MUA TẠI TÂN HOÀNG MINH', NULL);
INSERT INTO `product` VALUES (107, 'Ghế cà phê', 7, 'C001', '400x500x600', 'cái', 1000000, 'custom made', 5);
INSERT INTO `product` VALUES (108, 'Sơn nội thất dễ lau chùi Idecor N05-C', 2, 'N05-C/18L', '18L', 'THÙNG', 1123000, NULL, 1);
INSERT INTO `product` VALUES (109, 'Sơn nội thất dễ lau chùi Idecor N05 -P/18L', 2, 'N05-P/18L', '18L', 'THÙNG', 1221000, NULL, 1);
INSERT INTO `product` VALUES (110, 'Sơn ngoại thất co giãn Weathercoat Elastomeric KP21A -N85/18L', 1, 'KP21A-N85/18L', '18L', 'THÙNG', 2640000, NULL, 1);
INSERT INTO `product` VALUES (111, 'Sơn ngoại thất co giãn Weathercoat Elastomeric KP21A -N72/18L', 1, 'KP21A-N72/18L', '18L', 'THÙNG', 2500000, NULL, 1);
INSERT INTO `product` VALUES (112, 'Sơn nội thất bóng mờ Idecor N03 -M/18L', 2, 'N03 -M/18L', '18L', 'THÙNG', 691900, NULL, 1);
INSERT INTO `product` VALUES (113, 'Sơn ngoại thất  bóng mờ X Shield X01-P/18L', 1, 'X01-P/18L', '18L', 'THÙNG', 1204500, NULL, 1);
INSERT INTO `product` VALUES (114, 'Sơn ngoại thất  bóng mờ X Shield X01-M/18L', 1, 'X01-M/18L', '18L', 'THÙNG', 1166000, NULL, 1);
INSERT INTO `product` VALUES (115, 'Sơn nội thất bóng mờ Idecor N03 -W/18L', 2, 'N03 -W/18L', '18L', 'THÙNG', 753500, NULL, 1);
INSERT INTO `product` VALUES (116, 'Sơn siêu trắng chống ố vàng N01 -W/18L', 2, 'N01 -W/18L', '18L', 'THÙNG', 940500, NULL, 1);
INSERT INTO `product` VALUES (117, 'Sơn chống thấm một thành phần Aqua Shield Dark', 5, 'K023 -Dark Grey/18L', '18L', 'THÙNG', 1700600, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_category
-- ----------------------------
BEGIN;
INSERT INTO `product_category` VALUES (1, 'NGT', 'NGOẠI THẤT', NULL);
INSERT INTO `product_category` VALUES (2, 'NT', 'NỘI THẤT', NULL);
INSERT INTO `product_category` VALUES (3, 'SL', 'SƠN LÓT', NULL);
INSERT INTO `product_category` VALUES (4, 'BT', 'BỘT TRÉT', NULL);
INSERT INTO `product_category` VALUES (5, 'CT', 'CHỐNG THẤM', NULL);
INSERT INTO `product_category` VALUES (6, 'S', 'SƠN', NULL);
INSERT INTO `product_category` VALUES (7, 'Furniture', 'Đồ nội thất', '');
INSERT INTO `product_category` VALUES (8, 'VTSN', 'VẬT TƯ SƠN NƯỚC', NULL);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permissions` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (2, '{\"admin.users.read\":true,\"admin.stock.read\":true,\"admin.users.create\":true,\"admin.users.update\":true,\"admin.users.delete\":true,\"admin.roles.read\":true,\"admin.roles.create\":true,\"admin.roles.update\":true,\"admin.roles.delete\":true,\"admin.stock.create\":true,\"admin.stock.update\":true,\"admin.stock.delete\":true,\"admin.stockLocation.read\":true,\"admin.stockLocation.create\":true,\"admin.stockLocation.update\":true,\"admin.stockLocation.delete\":true,\"admin.Approval.read\":true,\"admin.holiday.read\":true,\"admin.holiday.create\":true,\"admin.holiday.update\":true,\"admin.holiday.delete\":true,\"admin.totalRevenue.check\":true,\"admin.Approval.check\":false,\"admin.product.read\":true,\"admin.product.create\":true,\"admin.product.update\":true,\"admin.product.delete\":true,\"admin.productCategory.read\":true,\"admin.supplier.read\":true,\"admin.company.read\":true,\"admin.project.read\":true,\"admin.labour.read\":true,\"admin.labourAttendance.forSupervisor\":true,\"admin.labourSalary.read\":true,\"admin.labourAttendance.forAttendanceDepart\":true,\"admin.projectDetail.read\":true,\"admin.productCategory.create\":true,\"admin.productCategory.update\":true,\"admin.productCategory.delete\":true,\"admin.supplier.create\":true,\"admin.supplier.update\":true,\"admin.supplier.delete\":true,\"admin.company.create\":true,\"admin.company.update\":true,\"admin.company.delete\":true,\"admin.project.create\":true,\"admin.project.update\":true,\"admin.projectDetail.create\":true,\"admin.projectDetail.update\":true,\"admin.projectDetail.delete\":true,\"admin.projectProgress.read\":true,\"admin.projectProgress.quotationC&U\":true,\"admin.projectProgress.approvalC&U\":true,\"admin.projectProgress.contractC&U\":true,\"admin.projectProgress.invoiceVer1C&U\":true,\"admin.projectProgress.efficientC&U\":true,\"admin.projectProgress.invoiceVer2C&U\":true,\"admin.projectProgress.completeC&U\":true,\"admin.projectProgress.acceptanceC&U\":true,\"admin.projectProgress.invoiceVer3C&U\":true,\"admin.projectProgress.incurredC&U\":true,\"admin.projectProgress.closeProjectC&U\":true,\"admin.labour.create\":true,\"admin.labour.update\":true,\"admin.labour.delete\":true,\"admin.labourAttendance.create\":true,\"admin.labourAttendance.update\":true,\"admin.labourAttendance.delete\":true,\"admin.labourSalary.create\":true,\"admin.labourSalary.update\":true,\"admin.labourSalary.delete\":true,\"admin.project.delete\":true,\"admin.company.goToProjectYear\":true,\"admin.holiday.approvalLetter\":true,\"admin.constructionTeam.read\":true,\"admin.constructionTeam.create\":true,\"admin.constructionTeam.delete\":true,\"admin.constructionTeam.update\":true}', NULL, NULL, 'BOD');
COMMIT;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_provide_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
INSERT INTO `supplier` VALUES (1, 'Kansai', NULL, NULL, NULL, NULL, NULL, 'Kansai');
INSERT INTO `supplier` VALUES (2, 'Nippon- Mr. Hải ', NULL, NULL, '0915736945', NULL, 'anh Hải - Phụ Trách Nippon kênh dự án', 'Nippon Paint');
INSERT INTO `supplier` VALUES (4, 'Thảm, Rèm - Chị Hiền', '60/56  Lý Chính Thắng, phường 8, quận 3, TP.HCM', 'thamtraisancovina@gmail.com', '0916758669', '', 'công nợ trong vòng 1 tháng', NULL);
INSERT INTO `supplier` VALUES (5, 'Nội thất - HÒA PHÁT', '', NULL, NULL, 'Tên TK: Công Ty TNHH Sản Xuất Thương Mại và Dịch Vụ Nội Thất Hòa Phát Sài Gòn / Số TK: 197859719 - ACB CN Lạc Long Quân', NULL, 'Nội thất Hòa Phát ');
INSERT INTO `supplier` VALUES (6, 'Sơn Jotun- Dulux- Nippon- Nhà PP Trung Nam', 'Trường Chinh,  Tân Bình, HCM', NULL, '0907141417', NULL, NULL, 'Công ty Trung Nam');
INSERT INTO `supplier` VALUES (7, '123', '123', '123', '123', '123', '123', 'Mua Vật Liêu');
INSERT INTO `supplier` VALUES (8, 'sendo', '123', '123', '123', '123', '12', '123');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userRole_user` (`user_id`),
  KEY `fk_userRole_role_table` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES (104, 1, 2, NULL, NULL);
INSERT INTO `user_role` VALUES (106, 2, 2, NULL, NULL);
INSERT INTO `user_role` VALUES (107, 3, 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_table
-- ----------------------------
DROP TABLE IF EXISTS `user_table`;
CREATE TABLE `user_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `labour_contract` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leave_day_year` int(11) DEFAULT NULL,
  `is_lock` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `note` longtext COLLATE utf8_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_card_number` bigint(20) DEFAULT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_at` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permanent_address` longtext COLLATE utf8_unicode_ci,
  `current_address` longtext COLLATE utf8_unicode_ci,
  `start_work_date` date DEFAULT NULL,
  `position` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_year` int(5) DEFAULT NULL,
  `job_description` longtext COLLATE utf8_unicode_ci,
  `degree` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `training_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profession` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `graduation_year` int(11) DEFAULT NULL,
  `foreign_language_skill` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_information` longtext COLLATE utf8_unicode_ci,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_user_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lasted_update_user_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `lasted_update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_user_company` (`company_id`),
  KEY `fk_user_userCreated` (`created_user_email`),
  CONSTRAINT `user_table_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_table
-- ----------------------------
BEGIN;
INSERT INTO `user_table` VALUES (1, '', 'admin@logsik.com', 3, '$2a$10$KicBUoWW8UjXyEzV6lpHfOIrEE9kpNBZLmXlOQocA18ZuSpRpEBTa', 'ADMIN', 'admin', NULL, '0938044937', 'admin address', 'Director', '', 20, 0, 1, '0', '0', NULL, NULL, '', NULL, '2016-04-07', 'Bình Dương', 'MALE', 'Tân Uyên, Bình Dương', '', NULL, 'Giám Đốc', NULL, 'CEO', 'Thạc Sỹ', 'AITVN', 'QLDA Xây Dựng', 2014, 'Anh Văn', 'Trung Cấp ', '', 'GD', 'admin@logsik.com', 'admin@logsik.com', NULL, NULL);
INSERT INTO `user_table` VALUES (2, '/api/downloadUserImage/2019-07-29-09-58-05_logo_so_en.jpg', 'dungheo@logsik.com', 3, '$2a$10$KicBUoWW8UjXyEzV6lpHfOIrEE9kpNBZLmXlOQocA18ZuSpRpEBTa', 'ADMIN', 'Dũng Heo', '1997-07-29', NULL, NULL, NULL, 'Thử Việc', 12, 0, 1, NULL, NULL, NULL, NULL, NULL, 123123123, '2019-07-29', 'Quảng Ngãi', 'MALE', 'Quảng Ngãi', '112 Đinh Tiên Hoàng', '2019-07-29', 'Nhân Viên', 1, '12', 'Cử Nhân Công Nghệ Thông Tin', 'CD thực hành FPT polytechnic HCM', 'UDPM', 123, '123123', '2B', '1323', 'DH', 'admin@tamaninterior.com', 'admin@tamaninterior.com', NULL, NULL);
INSERT INTO `user_table` VALUES (3, '/api/downloadUserImage/2019-07-29-10-00-10_logo.png', 'admin@logsik.com', 4, '$2a$10$KicBUoWW8UjXyEzV6lpHfOIrEE9kpNBZLmXlOQocA18ZuSpRpEBTa', 'ADMIN', 'admin', '1990-07-29', '123123123', NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MALE', NULL, NULL, '2019-07-29', 'Giám Đốc', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AD', 'admin@tamaninterior.com', 'admin@tamaninterior.com', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
