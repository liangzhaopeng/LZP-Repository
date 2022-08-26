/*
 Navicat Premium Data Transfer

 Source Server         : 19
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 192.168.0.19:3306
 Source Schema         : 2207193_cmser

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 29/07/2022 16:33:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner_image
-- ----------------------------
DROP TABLE IF EXISTS `banner_image`;
CREATE TABLE `banner_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'second hand id',
  `banner_image_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'goods image one',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'creator',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'banner image' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner_image
-- ----------------------------
INSERT INTO `banner_image` VALUES (2, '/profile/upload/2022/07/25/cc143563-89e2-41d5-a57d-af367ef8bb7a_20220725112417A001.jpg', '', '2022-07-25 11:24:19', '', NULL, '');
INSERT INTO `banner_image` VALUES (3, '/profile/upload/2022/07/25/flo_20220725112941A002.jpg', '', '2022-07-25 11:29:43', '', NULL, '');
INSERT INTO `banner_image` VALUES (4, '/profile/upload/2022/07/25/leaf_20220725112956A003.jpg', '', '2022-07-25 11:29:58', '', NULL, '');

-- ----------------------------
-- Table structure for community_introduction
-- ----------------------------
DROP TABLE IF EXISTS `community_introduction`;
CREATE TABLE `community_introduction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'community id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'title',
  `introduce_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'introduce content',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'creator',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'community introduction' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community_introduction
-- ----------------------------
INSERT INTO `community_introduction` VALUES (1, 'community', '', '', '2022-07-23 17:04:49', '', '2022-07-25 15:25:43', '');

-- ----------------------------
-- Table structure for front_user
-- ----------------------------
DROP TABLE IF EXISTS `front_user`;
CREATE TABLE `front_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'user name',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'login name',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'password',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'creator',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'front user' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of front_user
-- ----------------------------
INSERT INTO `front_user` VALUES (1, NULL, '赵小天', '+132r1+8P1k3Q5o082udO4n5A5IaJ2Aau1ybcen3t3Q6=6=2', '', '2022-07-22 09:21:40', '', '2022-07-25 14:10:34', NULL);
INSERT INTO `front_user` VALUES (3, NULL, 'janshky', 'J897Qb31F5N4h1hcSd35Ua0fv6mexdA5g64732QaH5Q5=3=0', '', '2022-07-23 10:21:46', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'front_user', 'front user', NULL, NULL, 'FrontUser', 'crud', 'com.ruoyi.project.front', 'front', 'user', 'front user', 'lzp', '0', '/', NULL, 'admin', '2022-07-21 16:30:42', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'household_management', 'household management', '', NULL, 'HouseholdManagement', 'crud', 'com.ruoyi.project.front', 'front', 'household', 'household management', 'lzp', '0', '/', '{\"parentMenuId\":\"1063\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Household management\",\"treeCode\":\"\"}', 'admin', '2022-07-22 14:44:32', '', '2022-07-22 14:57:10', '');
INSERT INTO `gen_table` VALUES (4, 'menu_information', 'menu information', '', NULL, 'MenuInformation', 'crud', 'com.ruoyi.project.front', 'front', 'menu', 'menu information', 'lzp', '0', '/', '{\"parentMenuId\":\"1062\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Order management\",\"treeCode\":\"\"}', 'admin', '2022-07-22 14:44:32', '', '2022-07-22 14:59:16', '');
INSERT INTO `gen_table` VALUES (5, 'menu_order', 'menu order', '', NULL, 'MenuOrder', 'crud', 'com.ruoyi.project.front', 'front', 'order', 'menu order', 'lzp', '0', '/', '{\"parentMenuId\":\"1062\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Order management\",\"treeCode\":\"\"}', 'admin', '2022-07-22 14:44:32', '', '2022-07-22 15:00:21', '');
INSERT INTO `gen_table` VALUES (6, 'community_introduction', 'community introduction', '', NULL, 'CommunityIntroduction', 'crud', 'com.ruoyi.project.front', 'front', 'introduction', 'community introduction', 'lzp', '0', '/', '{\"parentMenuId\":\"1082\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"community management\",\"treeCode\":\"\"}', 'admin', '2022-07-23 10:34:46', '', '2022-07-23 10:46:02', '');
INSERT INTO `gen_table` VALUES (7, 'second_hand', 'second hand exchange', '', NULL, 'SecondHand', 'crud', 'com.ruoyi.project.front', 'front', 'hand', 'second hand exchange', 'lzp', '0', '/', '{\"parentMenuId\":\"1083\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"second hand exchange\",\"treeCode\":\"\"}', 'admin', '2022-07-23 10:47:12', '', '2022-07-23 10:47:44', '');
INSERT INTO `gen_table` VALUES (8, 'banner_image', 'banner image', '', NULL, 'BannerImage', 'crud', 'com.ruoyi.project.front', 'front', 'banner', 'banner image', 'lzp', '0', '/', '{\"parentMenuId\":\"1096\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"banner management\",\"treeCode\":\"\"}', 'admin', '2022-07-25 10:48:16', '', '2022-07-25 10:50:04', '');
INSERT INTO `gen_table` VALUES (10, 'image_information', 'image information', '', NULL, 'ImageInformation', 'crud', 'com.ruoyi.project.front', 'front', 'image', 'image information', 'lzp', '0', '/', '{\"parentMenuId\":\"1082\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"community management\",\"treeCode\":\"\"}', 'admin', '2022-07-27 17:12:13', '', '2022-07-27 17:32:41', '');
INSERT INTO `gen_table` VALUES (11, 'order_item', 'order item', '', NULL, 'OrderItem', 'crud', 'com.ruoyi.project.front', 'front', 'item', 'order item', 'lzp', '0', '/', '{\"parentMenuId\":\"1062\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"Order management\",\"treeCode\":\"\"}', 'admin', '2022-07-28 10:28:17', '', '2022-07-28 10:28:57', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (10, '2', 'id', 'user id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-21 16:30:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '2', 'name', 'user name', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-07-21 16:30:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '2', 'login_name', 'login name', 'varchar(255)', 'String', 'loginName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-07-21 16:30:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '2', 'password', 'password', 'varchar(255)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-07-21 16:30:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '2', 'create_by', 'creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-07-21 16:30:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '2', 'create_time', 'create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-07-21 16:30:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '2', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-07-21 16:30:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '2', 'update_time', 'update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-07-21 16:30:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '2', 'remark', 'remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2022-07-21 16:30:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '3', 'id', 'household id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (20, '3', 'household_category', 'household category', 'varchar(255)', 'String', 'householdCategory', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'household_category', 2, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (21, '3', 'user_id', 'customer id', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (22, '3', 'user_name', 'customer name', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (23, '3', 'house_number', 'house number', 'varchar(255)', 'String', 'houseNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (24, '3', 'household_price', 'household price', 'decimal(10,2)', 'BigDecimal', 'householdPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (25, '3', 'household_status', 'household status(1not send 2sent)', 'int(4)', 'Integer', 'householdStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'household_status', 7, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (26, '3', 'create_by', 'creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (27, '3', 'create_time', 'create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (28, '3', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (29, '3', 'update_time', 'update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (30, '3', 'remark', 'remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:57:10');
INSERT INTO `gen_table_column` VALUES (31, '4', 'id', 'menu id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (32, '4', 'food_name', 'food name', 'varchar(255)', 'String', 'foodName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (33, '4', 'food_introduce', 'food introduce', 'varchar(255)', 'String', 'foodIntroduce', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (34, '4', 'price', 'food price', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (35, '4', 'food_image', 'food image', 'varchar(500)', 'String', 'foodImage', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (36, '4', 'create_by', 'creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (37, '4', 'create_time', 'create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (38, '4', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (39, '4', 'update_time', 'update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (40, '4', 'remark', 'remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 14:59:16');
INSERT INTO `gen_table_column` VALUES (41, '5', 'id', 'order id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (42, '5', 'food_id', 'food id', 'bigint(20)', 'Long', 'foodId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (43, '5', 'food_name', 'food name', 'varchar(255)', 'String', 'foodName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (44, '5', 'user_id', 'customer id', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (45, '5', 'user_name', 'customer name', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (46, '5', 'food_number', 'food number', 'int(4)', 'Integer', 'foodNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (47, '5', 'order_amount', 'food amount', 'decimal(10,2)', 'BigDecimal', 'orderAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (48, '5', 'order_status', 'order status(1not send 2sent)', 'int(4)', 'Integer', 'orderStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'order_status', 8, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (49, '5', 'deliveryman', 'deliveryman', 'varchar(255)', 'String', 'deliveryman', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (50, '5', 'deliveryman_phone', 'deliveryman phone', 'varchar(20)', 'String', 'deliverymanPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (51, '5', 'create_by', 'creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (52, '5', 'create_time', 'create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (53, '5', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (54, '5', 'update_time', 'update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (55, '5', 'remark', 'remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2022-07-22 14:44:32', NULL, '2022-07-22 15:00:21');
INSERT INTO `gen_table_column` VALUES (56, '6', 'id', 'community id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-23 10:34:46', NULL, '2022-07-23 10:46:02');
INSERT INTO `gen_table_column` VALUES (57, '6', 'title', 'title', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-07-23 10:34:46', NULL, '2022-07-23 10:46:02');
INSERT INTO `gen_table_column` VALUES (58, '6', 'introduce_content', 'introduce content', 'longtext', 'String', 'introduceContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'summernote', '', 3, 'admin', '2022-07-23 10:34:46', NULL, '2022-07-23 10:46:02');
INSERT INTO `gen_table_column` VALUES (59, '6', 'create_by', 'creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-07-23 10:34:46', NULL, '2022-07-23 10:46:02');
INSERT INTO `gen_table_column` VALUES (60, '6', 'create_time', 'create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2022-07-23 10:34:46', NULL, '2022-07-23 10:46:02');
INSERT INTO `gen_table_column` VALUES (61, '6', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-07-23 10:34:46', NULL, '2022-07-23 10:46:02');
INSERT INTO `gen_table_column` VALUES (62, '6', 'update_time', 'update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-07-23 10:34:46', NULL, '2022-07-23 10:46:02');
INSERT INTO `gen_table_column` VALUES (63, '6', 'remark', 'remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2022-07-23 10:34:46', NULL, '2022-07-23 10:46:02');
INSERT INTO `gen_table_column` VALUES (64, '7', 'id', 'second hand id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (65, '7', 'goods_name', 'goods name', 'varchar(255)', 'String', 'goodsName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (66, '7', 'goods_describe', 'goods describe', 'varchar(255)', 'String', 'goodsDescribe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (67, '7', 'price', 'goods price', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (68, '7', 'goods_image_one', 'goods image one', 'varchar(500)', 'String', 'goodsImageOne', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (69, '7', 'goods_image_two', 'goods image two', 'varchar(500)', 'String', 'goodsImageTwo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (70, '7', 'goods_image_three', 'goods image three', 'varchar(500)', 'String', 'goodsImageThree', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (71, '7', 'goods_image_four', 'goods image four', 'varchar(500)', 'String', 'goodsImageFour', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (72, '7', 'goods_image_five', 'goods image five', 'varchar(500)', 'String', 'goodsImageFive', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 9, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (73, '7', 'goods_image_six', 'goods image six', 'varchar(500)', 'String', 'goodsImageSix', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (74, '7', 'create_by', 'creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (75, '7', 'create_time', 'create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (76, '7', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (77, '7', 'update_time', 'update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (78, '7', 'remark', 'remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2022-07-23 10:47:12', NULL, '2022-07-23 10:47:44');
INSERT INTO `gen_table_column` VALUES (79, '8', 'id', 'second hand id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-25 10:48:16', NULL, '2022-07-25 10:50:04');
INSERT INTO `gen_table_column` VALUES (80, '8', 'banner_image_url', 'goods image one', 'varchar(500)', 'String', 'bannerImageUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 2, 'admin', '2022-07-25 10:48:16', NULL, '2022-07-25 10:50:04');
INSERT INTO `gen_table_column` VALUES (81, '8', 'create_by', 'creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2022-07-25 10:48:16', NULL, '2022-07-25 10:50:04');
INSERT INTO `gen_table_column` VALUES (82, '8', 'create_time', 'create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2022-07-25 10:48:16', NULL, '2022-07-25 10:50:04');
INSERT INTO `gen_table_column` VALUES (83, '8', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-07-25 10:48:16', NULL, '2022-07-25 10:50:04');
INSERT INTO `gen_table_column` VALUES (84, '8', 'update_time', 'update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-07-25 10:48:16', NULL, '2022-07-25 10:50:04');
INSERT INTO `gen_table_column` VALUES (85, '8', 'remark', 'remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 7, 'admin', '2022-07-25 10:48:16', NULL, '2022-07-25 10:50:04');
INSERT INTO `gen_table_column` VALUES (95, '10', 'id', 'image id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-27 17:12:13', NULL, '2022-07-27 17:32:41');
INSERT INTO `gen_table_column` VALUES (96, '10', 'image_type', 'image type', 'int(4)', 'Integer', 'imageType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'image_type', 2, 'admin', '2022-07-27 17:12:13', NULL, '2022-07-27 17:32:41');
INSERT INTO `gen_table_column` VALUES (97, '10', 'information_id', 'information id', 'bigint(20)', 'Long', 'informationId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-07-27 17:12:13', NULL, '2022-07-27 17:32:41');
INSERT INTO `gen_table_column` VALUES (98, '10', 'image_url', 'image url', 'varchar(500)', 'String', 'imageUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2022-07-27 17:12:13', NULL, '2022-07-27 17:32:41');
INSERT INTO `gen_table_column` VALUES (99, '10', 'create_by', 'creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-07-27 17:12:13', NULL, '2022-07-27 17:32:41');
INSERT INTO `gen_table_column` VALUES (100, '10', 'create_time', 'create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-07-27 17:12:13', NULL, '2022-07-27 17:32:41');
INSERT INTO `gen_table_column` VALUES (101, '10', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-07-27 17:12:13', NULL, '2022-07-27 17:32:41');
INSERT INTO `gen_table_column` VALUES (102, '10', 'update_time', 'update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-07-27 17:12:13', NULL, '2022-07-27 17:32:41');
INSERT INTO `gen_table_column` VALUES (103, '10', 'remark', 'remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2022-07-27 17:12:13', NULL, '2022-07-27 17:32:41');
INSERT INTO `gen_table_column` VALUES (104, '11', 'id', 'item id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');
INSERT INTO `gen_table_column` VALUES (105, '11', 'order_id', 'order id', 'bigint(20)', 'Long', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');
INSERT INTO `gen_table_column` VALUES (106, '11', 'food_id', 'food id', 'bigint(20)', 'Long', 'foodId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');
INSERT INTO `gen_table_column` VALUES (107, '11', 'food_name', 'food name', 'varchar(255)', 'String', 'foodName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');
INSERT INTO `gen_table_column` VALUES (108, '11', 'food_number', 'food number', 'int(4)', 'Integer', 'foodNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');
INSERT INTO `gen_table_column` VALUES (109, '11', 'create_by', 'creator', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');
INSERT INTO `gen_table_column` VALUES (110, '11', 'create_time', 'create time', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');
INSERT INTO `gen_table_column` VALUES (111, '11', 'update_by', 'Updater', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');
INSERT INTO `gen_table_column` VALUES (112, '11', 'update_time', 'update time', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');
INSERT INTO `gen_table_column` VALUES (113, '11', 'remark', 'remark', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2022-07-28 10:28:17', NULL, '2022-07-28 10:28:57');

-- ----------------------------
-- Table structure for household_management
-- ----------------------------
DROP TABLE IF EXISTS `household_management`;
CREATE TABLE `household_management`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'household id',
  `household_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'household category',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT 'customer id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'customer name',
  `house_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'house number',
  `household_price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'household price',
  `household_status` int(4) NULL DEFAULT 1 COMMENT 'household status(1not send 2sent)',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'creator',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'household management' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of household_management
-- ----------------------------
INSERT INTO `household_management` VALUES (1, '1', 1, '赵小天', '001', 1.00, 1, '', '2022-07-22 15:45:37', '', NULL, '');
INSERT INTO `household_management` VALUES (2, '1', 1, '赵小天', '001', 10.00, 1, '', '2022-07-23 16:31:38', '', NULL, NULL);
INSERT INTO `household_management` VALUES (3, '1', 1, 'Miss Su', '001', 20.00, 1, '', '2022-07-27 20:07:30', '', NULL, 'test');
INSERT INTO `household_management` VALUES (4, '1', 3, 'janshky', '415', 50.00, 1, '', '2022-07-28 15:11:53', '', NULL, '');
INSERT INTO `household_management` VALUES (5, '1', 3, 'janshky', '415', 50.00, 1, '', '2022-07-28 15:14:10', '', NULL, NULL);
INSERT INTO `household_management` VALUES (6, '1', 3, 'janshky', '415', 50.00, 1, '', '2022-07-28 15:46:44', '', NULL, '');
INSERT INTO `household_management` VALUES (7, '1', 3, 'janshky', '415', 50.00, 1, '', '2022-07-28 16:07:59', '', NULL, '');

-- ----------------------------
-- Table structure for image_information
-- ----------------------------
DROP TABLE IF EXISTS `image_information`;
CREATE TABLE `image_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'image id',
  `image_type` int(4) NULL DEFAULT NULL COMMENT 'image type',
  `information_id` bigint(20) NULL DEFAULT NULL COMMENT 'information id',
  `image_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'image url',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'creator',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'image information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image_information
-- ----------------------------
INSERT INTO `image_information` VALUES (1, 2, 2, '/profile/upload/2022/07/23/leaf_20220723144442A002.jpg', '', '2022-07-27 19:21:08', '', NULL, NULL);
INSERT INTO `image_information` VALUES (2, 2, 2, '/profile/upload/2022/07/25/leaf_20220725112956A003.jpg', '', '2022-07-27 19:21:08', '', NULL, NULL);
INSERT INTO `image_information` VALUES (3, 2, 3, '/profile/upload/2022/07/23/leaf_20220723144442A002.jpg', '', '2022-07-27 19:22:47', '', NULL, NULL);
INSERT INTO `image_information` VALUES (4, 2, 3, '/profile/upload/2022/07/25/leaf_20220725112956A003.jpg', '', '2022-07-27 19:22:47', '', NULL, NULL);
INSERT INTO `image_information` VALUES (5, 2, 4, '/profile/upload/2022/07/23/leaf_20220723144442A002.jpg', '', '2022-07-27 19:28:41', '', NULL, NULL);
INSERT INTO `image_information` VALUES (6, 2, 4, '/profile/upload/2022/07/25/leaf_20220725112956A003.jpg', '', '2022-07-27 19:28:41', '', NULL, NULL);
INSERT INTO `image_information` VALUES (7, 1, 3, '/profile/upload/2022/07/23/leaf_20220723144442A002.jpg', '', '2022-07-27 20:07:30', '', NULL, NULL);
INSERT INTO `image_information` VALUES (8, 1, 3, '/profile/upload/2022/07/25/leaf_20220725112956A003.jpg', '', '2022-07-27 20:07:30', '', NULL, NULL);
INSERT INTO `image_information` VALUES (9, 1, 6, '/profile/upload/2022/07/28/936b71889725b7bb56fcec1c870e4df9_exif_20220728154644A004.jpg', '', '2022-07-28 15:46:45', '', NULL, NULL);
INSERT INTO `image_information` VALUES (10, 1, 6, '/profile/upload/2022/07/28/b1285a2a8eede85921c2e378e58d9114_exif_20220728154644A005.jpg', '', '2022-07-28 15:46:45', '', NULL, NULL);
INSERT INTO `image_information` VALUES (11, 1, 6, '/profile/upload/2022/07/28/aba6d75708d6b800766e3d3be754198c_exif_20220728154644A006.jpg', '', '2022-07-28 15:46:45', '', NULL, NULL);
INSERT INTO `image_information` VALUES (12, 1, 7, '/profile/upload/2022/07/28/936b71889725b7bb56fcec1c870e4df9_exif_20220728160758A001.jpg', '', '2022-07-28 16:07:59', '', NULL, NULL);
INSERT INTO `image_information` VALUES (13, 1, 7, '/profile/upload/2022/07/28/b1285a2a8eede85921c2e378e58d9114_exif_20220728160758A002.jpg', '', '2022-07-28 16:07:59', '', NULL, NULL);
INSERT INTO `image_information` VALUES (14, 1, 7, '/profile/upload/2022/07/28/aba6d75708d6b800766e3d3be754198c_exif_20220728160758A003.jpg', '', '2022-07-28 16:07:59', '', NULL, NULL);
INSERT INTO `image_information` VALUES (15, 2, 5, '/profile/upload/2022/07/29/936b71889725b7bb56fcec1c870e4df9_exif_20220729095252A007.jpg', '', '2022-07-29 09:52:52', '', NULL, NULL);
INSERT INTO `image_information` VALUES (16, 2, 5, '/profile/upload/2022/07/29/b1285a2a8eede85921c2e378e58d9114_exif_20220729095252A008.jpg', '', '2022-07-29 09:52:52', '', NULL, NULL);
INSERT INTO `image_information` VALUES (17, 2, 5, '/profile/upload/2022/07/29/aba6d75708d6b800766e3d3be754198c_exif_20220729095252A009.jpg', '', '2022-07-29 09:52:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for menu_information
-- ----------------------------
DROP TABLE IF EXISTS `menu_information`;
CREATE TABLE `menu_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'menu id',
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'food name',
  `food_introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'food introduce',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'food price',
  `food_image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'food image',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'creator',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'menu information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_information
-- ----------------------------
INSERT INTO `menu_information` VALUES (1, 'pizza', 'pizza', 10.00, '/profile/upload/2022/07/23/lol3_20220723151031A004.jpeg', '', '2022-07-23 15:10:36', '', NULL, '');
INSERT INTO `menu_information` VALUES (2, 'rice', 'rice', 1.00, '/profile/upload/2022/07/28/sea_20220728154808A007.jpg', '', '2022-07-28 15:48:15', '', NULL, '');

-- ----------------------------
-- Table structure for menu_order
-- ----------------------------
DROP TABLE IF EXISTS `menu_order`;
CREATE TABLE `menu_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'order id',
  `food_id` bigint(20) NULL DEFAULT NULL COMMENT 'food id',
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'food name',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT 'customer id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'customer name',
  `food_number` int(4) NULL DEFAULT NULL COMMENT 'food number',
  `order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT 'food amount',
  `order_status` int(4) NULL DEFAULT 1 COMMENT 'order status(1not send 2sent)',
  `deliveryman` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'deliveryman',
  `deliveryman_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'deliveryman phone',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'creator',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'menu order' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_order
-- ----------------------------
INSERT INTO `menu_order` VALUES (1, 1, 'pizza', 1, '赵小天', 1, 10.00, 1, NULL, NULL, '', '2022-07-23 15:22:38', '', NULL, NULL);
INSERT INTO `menu_order` VALUES (2, NULL, NULL, 1, 'Miss Su', NULL, 11.00, 1, NULL, NULL, '', '2022-07-28 15:55:45', '', NULL, NULL);
INSERT INTO `menu_order` VALUES (3, NULL, NULL, 1, 'Miss Su', NULL, 11.00, 1, NULL, NULL, '', '2022-07-28 16:00:43', '', NULL, NULL);
INSERT INTO `menu_order` VALUES (6, NULL, NULL, 3, 'janshky', NULL, 12.00, 1, NULL, NULL, '', '2022-07-29 15:06:02', '', NULL, NULL);
INSERT INTO `menu_order` VALUES (7, NULL, NULL, 3, 'janshky', NULL, 31.00, 1, NULL, NULL, '', '2022-07-29 15:06:16', '', NULL, NULL);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'item id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT 'order id',
  `food_id` bigint(20) NULL DEFAULT NULL COMMENT 'food id',
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'food name',
  `food_number` int(4) NULL DEFAULT NULL COMMENT 'food number',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'creator',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'order item' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES (1, 3, 1, 'pizza', 1, '', '2022-07-28 16:00:43', '', NULL, NULL);
INSERT INTO `order_item` VALUES (2, 3, 2, 'rice', 1, '', '2022-07-28 16:00:43', '', NULL, NULL);
INSERT INTO `order_item` VALUES (3, 4, NULL, 'pizza', 4, '', '2022-07-29 11:59:57', '', NULL, NULL);
INSERT INTO `order_item` VALUES (4, 4, NULL, 'rice', 1, '', '2022-07-29 11:59:57', '', NULL, NULL);
INSERT INTO `order_item` VALUES (5, 5, NULL, 'pizza', 4, '', '2022-07-29 14:06:43', '', NULL, NULL);
INSERT INTO `order_item` VALUES (6, 5, NULL, 'rice', 2, '', '2022-07-29 14:06:43', '', NULL, NULL);
INSERT INTO `order_item` VALUES (7, 6, 1, 'pizza', 1, '', '2022-07-29 15:06:02', '', NULL, NULL);
INSERT INTO `order_item` VALUES (8, 6, 2, 'rice', 2, '', '2022-07-29 15:06:02', '', NULL, NULL);
INSERT INTO `order_item` VALUES (9, 7, 1, 'pizza', 3, '', '2022-07-29 15:06:16', '', NULL, NULL);
INSERT INTO `order_item` VALUES (10, 7, 2, 'rice', 1, '', '2022-07-29 15:06:16', '', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for second_hand
-- ----------------------------
DROP TABLE IF EXISTS `second_hand`;
CREATE TABLE `second_hand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'second hand id',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'goods name',
  `goods_describe` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'goods describe',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT 'goods price',
  `goods_image_one` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'goods image one',
  `goods_image_two` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'goods image two',
  `goods_image_three` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'goods image three',
  `goods_image_four` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'goods image four',
  `goods_image_five` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'goods image five',
  `goods_image_six` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'goods image six',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT 'customer id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'customer name',
  `status` int(4) NULL DEFAULT 1 COMMENT 'exchange status',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'creator',
  `create_time` datetime NULL DEFAULT NULL COMMENT 'create time',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Updater',
  `update_time` datetime NULL DEFAULT NULL COMMENT 'update time',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'remark',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'second hand exchange' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of second_hand
-- ----------------------------
INSERT INTO `second_hand` VALUES (2, 'old car', 'this is a good car', 200000.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '赵小天', 1, '', '2022-07-27 19:21:08', '', NULL, 'test');
INSERT INTO `second_hand` VALUES (3, 'old car', 'this is a good car', 200000.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '赵小天', 1, '', '2022-07-27 19:22:47', '', NULL, 'test');
INSERT INTO `second_hand` VALUES (4, 'old car', 'this is a good car', 200000.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'Miss Su', 1, '', '2022-07-27 19:28:41', '', NULL, 'test');
INSERT INTO `second_hand` VALUES (5, 'Chanel ladies skirt', 'The upper part of the skirt is designed as a simple white strapless style, and the skirt hem is a fluffy short skirt, which makes the skirt look younger, but the White Strapless part has more classic flowers, and the back of the hat and skirt is decorated with black lace, which makes the skirt look more retro, and the aura naturally looks more advanced', 55.50, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'janshky', 1, '', '2022-07-29 09:52:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-03-23 09:42:25', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-03-23 09:42:25', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2022-03-23 09:42:25', 'admin', '2022-03-23 09:47:43', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-03-23 09:42:25', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-03-23 09:42:25', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-03-23 09:42:25', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-03-23 09:42:25', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-03-23 09:42:25', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-03-23 09:42:25', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-03-23 09:42:25', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'XX科技', 0, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'anssy', '15888888888', '3186857853@qq.com', '0', '0', 'admin', '2022-03-23 09:42:24', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, 'not send', '1', 'order_status', NULL, NULL, 'Y', '0', 'admin', '2022-07-22 11:58:31', '', NULL, 'not send');
INSERT INTO `sys_dict_data` VALUES (31, 2, 'sent', '2', 'order_status', NULL, NULL, 'Y', '0', 'admin', '2022-07-22 11:59:17', '', NULL, 'sent');
INSERT INTO `sys_dict_data` VALUES (32, 1, 'cleaning', '1', 'household_category', '', '', 'Y', '0', 'admin', '2022-07-22 14:32:29', 'admin', '2022-07-22 14:37:05', 'cleaning');
INSERT INTO `sys_dict_data` VALUES (33, 2, 'dry cleaning', '2', 'household_category', NULL, NULL, 'Y', '0', 'admin', '2022-07-22 14:37:23', '', NULL, 'dry cleaning');
INSERT INTO `sys_dict_data` VALUES (34, 3, 'help drive', '3', 'household_category', NULL, NULL, 'Y', '0', 'admin', '2022-07-22 14:37:46', '', NULL, 'help drive');
INSERT INTO `sys_dict_data` VALUES (35, 4, 'nanny', '4', 'household_category', NULL, NULL, 'Y', '0', 'admin', '2022-07-22 14:38:14', '', NULL, 'nanny');
INSERT INTO `sys_dict_data` VALUES (36, 5, 'move house', '5', 'household_category', NULL, NULL, 'Y', '0', 'admin', '2022-07-22 14:38:43', '', NULL, 'move house');
INSERT INTO `sys_dict_data` VALUES (37, 1, 'not finished', '1', 'household_status', NULL, NULL, 'Y', '0', 'admin', '2022-07-22 14:40:54', '', NULL, 'not finished');
INSERT INTO `sys_dict_data` VALUES (38, 2, 'finished', '2', 'household_status', NULL, NULL, 'Y', '0', 'admin', '2022-07-22 14:41:14', '', NULL, 'finished');
INSERT INTO `sys_dict_data` VALUES (39, 1, 'household', '1', 'image_type', NULL, NULL, 'Y', '0', 'admin', '2022-07-27 17:29:50', '', NULL, 'household');
INSERT INTO `sys_dict_data` VALUES (40, 2, 'second hand', '2', 'image_type', NULL, NULL, 'Y', '0', 'admin', '2022-07-27 17:30:10', '', NULL, 'second hand');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, 'order status', 'order_status', '0', 'admin', '2022-07-22 11:57:40', '', NULL, 'order status');
INSERT INTO `sys_dict_type` VALUES (12, 'household category', 'household_category', '0', 'admin', '2022-07-22 14:31:05', '', NULL, 'household category');
INSERT INTO `sys_dict_type` VALUES (13, 'household status', 'household_status', '0', 'admin', '2022-07-22 14:31:48', '', NULL, 'household status');
INSERT INTO `sys_dict_type` VALUES (14, 'image type', 'image_type', '0', 'admin', '2022-07-27 17:16:38', 'admin', '2022-07-28 16:51:55', 'image type');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-03-23 09:42:25', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2022-03-23 09:45:09');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 09:45:19');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-23 09:46:05');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 09:46:07');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-23 09:47:23');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-23 09:47:24');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-23 09:50:53');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-20 10:08:18');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-07-21 10:12:41');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 10:13:15');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 11:02:19');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 14:35:50');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 15:34:06');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-21 15:44:30');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 15:46:32');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 15:48:18');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 15:50:40');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-21 15:54:46');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 15:54:47');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 16:30:20');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-22 11:55:39');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-22 14:30:04');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-22 15:37:26');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-22 16:07:37');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-22 17:13:49');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '192.168.0.233', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-23 10:34:20');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '192.168.0.233', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-23 11:19:33');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '192.168.0.233', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-23 15:07:53');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '192.168.0.233', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-23 15:51:53');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '192.168.0.233', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-23 16:26:38');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '192.168.0.233', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-23 17:03:49');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 09:02:24');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 10:47:58');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 11:19:44');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 14:43:36');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '192.168.0.162', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-07-25 15:10:29');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-27 17:05:20');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-27 19:20:12');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-27 20:47:25');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-27 20:54:34');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '192.168.0.162', '内网IP', 'Chrome 10', 'Mac OS X', '1', '密码输入错误1次', '2022-07-28 09:29:59');
INSERT INTO `sys_logininfor` VALUES (141, 'manager', '192.168.0.162', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-07-28 09:30:17');
INSERT INTO `sys_logininfor` VALUES (142, 'manager', '192.168.0.162', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-07-28 09:30:29');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-28 09:38:58');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-28 10:03:25');
INSERT INTO `sys_logininfor` VALUES (145, 'manager', '192.168.0.162', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-07-28 15:12:25');
INSERT INTO `sys_logininfor` VALUES (146, 'manager', '192.168.0.162', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-07-28 15:12:29');
INSERT INTO `sys_logininfor` VALUES (147, 'manager', '192.168.0.162', '内网IP', 'Chrome 10', 'Mac OS X', '1', '用户不存在/密码错误', '2022-07-28 15:12:33');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-28 15:47:08');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-28 15:59:15');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-28 16:47:06');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-28 17:53:18');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '192.168.0.162', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-07-29 11:13:04');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-29 14:36:14');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-03-23 09:42:25', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2022-03-23 09:42:25', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2022-03-23 09:42:25', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-03-23 09:42:25', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-03-23 09:42:25', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-03-23 09:42:25', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2022-03-23 09:42:25', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2022-03-23 09:42:25', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2022-03-23 09:42:25', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2022-03-23 09:42:25', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2022-03-23 09:42:25', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2022-03-23 09:42:25', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2022-03-23 09:42:25', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2022-03-23 09:42:25', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2022-03-23 09:42:25', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2022-03-23 09:42:25', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2022-03-23 09:42:25', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2022-03-23 09:42:25', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2022-03-23 09:42:25', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2022-03-23 09:42:25', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2022-03-23 09:42:25', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2022-03-23 09:42:25', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1062, 'Order management', 0, 5, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-edit', 'admin', '2022-07-22 14:50:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, 'Household management', 0, 6, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-archive', 'admin', '2022-07-22 14:54:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, 'household management', 1063, 1, '/front/household', '', 'C', '0', '1', 'front:household:view', '#', 'admin', '2022-07-22 15:36:21', '', NULL, 'household management菜单');
INSERT INTO `sys_menu` VALUES (1065, 'household management查询', 1064, 1, '#', '', 'F', '0', '1', 'front:household:list', '#', 'admin', '2022-07-22 15:36:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, 'household management新增', 1064, 2, '#', '', 'F', '0', '1', 'front:household:add', '#', 'admin', '2022-07-22 15:36:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, 'household management修改', 1064, 3, '#', '', 'F', '0', '1', 'front:household:edit', '#', 'admin', '2022-07-22 15:36:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1068, 'household management删除', 1064, 4, '#', '', 'F', '0', '1', 'front:household:remove', '#', 'admin', '2022-07-22 15:36:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1069, 'household management导出', 1064, 5, '#', '', 'F', '0', '1', 'front:household:export', '#', 'admin', '2022-07-22 15:36:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1070, 'menu information', 1062, 1, '/front/menu', '', 'C', '0', '1', 'front:menu:view', '#', 'admin', '2022-07-22 16:06:57', '', NULL, 'menu information菜单');
INSERT INTO `sys_menu` VALUES (1071, 'menu information查询', 1070, 1, '#', '', 'F', '0', '1', 'front:menu:list', '#', 'admin', '2022-07-22 16:06:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1072, 'menu information新增', 1070, 2, '#', '', 'F', '0', '1', 'front:menu:add', '#', 'admin', '2022-07-22 16:06:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, 'menu information修改', 1070, 3, '#', '', 'F', '0', '1', 'front:menu:edit', '#', 'admin', '2022-07-22 16:06:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, 'menu information删除', 1070, 4, '#', '', 'F', '0', '1', 'front:menu:remove', '#', 'admin', '2022-07-22 16:06:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1075, 'menu information导出', 1070, 5, '#', '', 'F', '0', '1', 'front:menu:export', '#', 'admin', '2022-07-22 16:06:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1076, 'menu order', 1062, 1, '/front/order', '', 'C', '0', '1', 'front:order:view', '#', 'admin', '2022-07-22 16:59:42', '', NULL, 'menu order菜单');
INSERT INTO `sys_menu` VALUES (1077, 'menu order查询', 1076, 1, '#', '', 'F', '0', '1', 'front:order:list', '#', 'admin', '2022-07-22 16:59:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1078, 'menu order新增', 1076, 2, '#', '', 'F', '0', '1', 'front:order:add', '#', 'admin', '2022-07-22 16:59:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1079, 'menu order修改', 1076, 3, '#', '', 'F', '0', '1', 'front:order:edit', '#', 'admin', '2022-07-22 16:59:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1080, 'menu order删除', 1076, 4, '#', '', 'F', '0', '1', 'front:order:remove', '#', 'admin', '2022-07-22 16:59:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1081, 'menu order导出', 1076, 5, '#', '', 'F', '0', '1', 'front:order:export', '#', 'admin', '2022-07-22 16:59:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1082, 'community management', 0, 7, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-book', 'admin', '2022-07-23 10:38:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1083, 'second hand exchange', 0, 8, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-credit-card', 'admin', '2022-07-23 10:44:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1084, 'community introduction', 1082, 1, '/front/introduction', '', 'C', '0', '1', 'front:introduction:view', '#', 'admin', '2022-07-23 11:18:46', '', NULL, 'community introduction菜单');
INSERT INTO `sys_menu` VALUES (1085, 'community introduction查询', 1084, 1, '#', '', 'F', '0', '1', 'front:introduction:list', '#', 'admin', '2022-07-23 11:18:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1086, 'community introduction新增', 1084, 2, '#', '', 'F', '0', '1', 'front:introduction:add', '#', 'admin', '2022-07-23 11:18:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1087, 'community introduction修改', 1084, 3, '#', '', 'F', '0', '1', 'front:introduction:edit', '#', 'admin', '2022-07-23 11:18:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1088, 'community introduction删除', 1084, 4, '#', '', 'F', '0', '1', 'front:introduction:remove', '#', 'admin', '2022-07-23 11:18:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1089, 'community introduction导出', 1084, 5, '#', '', 'F', '0', '1', 'front:introduction:export', '#', 'admin', '2022-07-23 11:18:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1090, 'second hand exchange', 1083, 1, '/front/hand', '', 'C', '0', '1', 'front:hand:view', '#', 'admin', '2022-07-23 11:19:05', '', NULL, 'second hand exchange菜单');
INSERT INTO `sys_menu` VALUES (1091, 'second hand exchange查询', 1090, 1, '#', '', 'F', '0', '1', 'front:hand:list', '#', 'admin', '2022-07-23 11:19:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1092, 'second hand exchange新增', 1090, 2, '#', '', 'F', '0', '1', 'front:hand:add', '#', 'admin', '2022-07-23 11:19:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1093, 'second hand exchange修改', 1090, 3, '#', '', 'F', '0', '1', 'front:hand:edit', '#', 'admin', '2022-07-23 11:19:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1094, 'second hand exchange删除', 1090, 4, '#', '', 'F', '0', '1', 'front:hand:remove', '#', 'admin', '2022-07-23 11:19:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1095, 'second hand exchange导出', 1090, 5, '#', '', 'F', '0', '1', 'front:hand:export', '#', 'admin', '2022-07-23 11:19:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1096, 'banner management', 0, 9, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-file-photo-o', 'admin', '2022-07-25 10:49:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1097, 'banner image', 1096, 1, '/front/banner', '', 'C', '0', '1', 'front:banner:view', '#', 'admin', '2022-07-25 11:12:54', '', NULL, 'banner image菜单');
INSERT INTO `sys_menu` VALUES (1098, 'banner image查询', 1097, 1, '#', '', 'F', '0', '1', 'front:banner:list', '#', 'admin', '2022-07-25 11:12:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1099, 'banner image新增', 1097, 2, '#', '', 'F', '0', '1', 'front:banner:add', '#', 'admin', '2022-07-25 11:12:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1100, 'banner image修改', 1097, 3, '#', '', 'F', '0', '1', 'front:banner:edit', '#', 'admin', '2022-07-25 11:12:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1101, 'banner image删除', 1097, 4, '#', '', 'F', '0', '1', 'front:banner:remove', '#', 'admin', '2022-07-25 11:12:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1102, 'banner image导出', 1097, 5, '#', '', 'F', '0', '1', 'front:banner:export', '#', 'admin', '2022-07-25 11:12:54', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '重置密码', 2, 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-23 09:46:01');
INSERT INTO `sys_oper_log` VALUES (101, '参数管理', 2, 'com.ruoyi.project.system.config.controller.ConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"3\"],\"configName\":[\"主框架页-侧边栏主题\"],\"configKey\":[\"sys.index.sideTheme\"],\"configValue\":[\"theme-light\"],\"configType\":[\"Y\"],\"remark\":[\"深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-23 09:47:43');
INSERT INTO `sys_oper_log` VALUES (102, '通知公告', 3, 'com.ruoyi.project.system.notice.controller.NoticeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1,2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-03-23 09:50:31');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"front_user\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-07-21 16:24:11');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-07-21 16:30:34');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"front_user\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-07-21 16:30:42');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/front_user', '127.0.0.1', '内网IP', '\"front_user\"', NULL, 0, NULL, '2022-07-21 16:31:36');
INSERT INTO `sys_oper_log` VALUES (107, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"order status\"],\"dictType\":[\"order_status\"],\"status\":[\"0\"],\"remark\":[\"order status\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 11:57:40');
INSERT INTO `sys_oper_log` VALUES (108, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"not send\"],\"dictValue\":[\"1\"],\"dictType\":[\"order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"not send\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 11:58:31');
INSERT INTO `sys_oper_log` VALUES (109, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"sent\"],\"dictValue\":[\"2\"],\"dictType\":[\"order_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"sent\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 11:59:17');
INSERT INTO `sys_oper_log` VALUES (110, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"household category\"],\"dictType\":[\"household_category\"],\"status\":[\"0\"],\"remark\":[\"household category\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:31:05');
INSERT INTO `sys_oper_log` VALUES (111, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"household status\"],\"dictType\":[\"household_status\"],\"status\":[\"0\"],\"remark\":[\"household status\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:31:48');
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"dry cleaning\"],\"dictValue\":[\"1\"],\"dictType\":[\"household_category\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"dry cleaning\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:32:29');
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"32\"],\"dictLabel\":[\"cleaning\"],\"dictValue\":[\"1\"],\"dictType\":[\"household_category\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"cleaning\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:37:05');
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"dry cleaning\"],\"dictValue\":[\"2\"],\"dictType\":[\"household_category\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"dry cleaning\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:37:23');
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"help drive\"],\"dictValue\":[\"3\"],\"dictType\":[\"household_category\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"help drive\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:37:46');
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"nanny\"],\"dictValue\":[\"4\"],\"dictType\":[\"household_category\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"nanny\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:38:14');
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"move house\"],\"dictValue\":[\"5\"],\"dictType\":[\"household_category\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"move house\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:38:43');
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"not finished\"],\"dictValue\":[\"1\"],\"dictType\":[\"household_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"not finished\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:40:54');
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"finished\"],\"dictValue\":[\"2\"],\"dictType\":[\"household_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"finished\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:41:14');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"household_management,menu_order,menu_information\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:44:32');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/household_management', '127.0.0.1', '内网IP', '\"household_management\"', NULL, 0, NULL, '2022-07-22 14:46:45');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"Order management\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-edit\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:50:29');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"Household management\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:54:56');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"household_management\"],\"tableComment\":[\"household management\"],\"className\":[\"HouseholdManagement\"],\"functionAuthor\":[\"lzp\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"19\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"household id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"20\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"household category\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"householdCategory\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"household_category\"],\"columns[2].columnId\":[\"21\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"customer id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"userId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"22\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"customer name\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"userName\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"23\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"house number\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"houseNumber\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"24\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnCo', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:57:10');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"menu_information\"],\"tableComment\":[\"menu information\"],\"className\":[\"MenuInformation\"],\"functionAuthor\":[\"lzp\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"31\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"menu id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"32\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"food name\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"foodName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"33\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"food introduce\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"foodIntroduce\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"34\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"food price\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"price\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"35\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"food image\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"foodImage\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"36\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"creator\"],\"columns[5].javaType\":[\"St', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 14:59:16');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"menu_order\"],\"tableComment\":[\"menu order\"],\"className\":[\"MenuOrder\"],\"functionAuthor\":[\"lzp\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"41\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"order id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"42\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"food id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"foodId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"43\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"food name\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"foodName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"44\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"customer id\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"userId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"45\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"customer name\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"userName\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"46\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"food number\"],\"columns[5].javaType\":[\"Integer\"],\"columns[5].javaField\":[', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 15:00:21');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/household_management', '127.0.0.1', '内网IP', '\"household_management\"', NULL, 0, NULL, '2022-07-22 15:02:53');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/menu_information', '127.0.0.1', '内网IP', '\"menu_information\"', NULL, 0, NULL, '2022-07-22 15:03:19');
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/menu_order', '127.0.0.1', '内网IP', '\"menu_order\"', NULL, 0, NULL, '2022-07-22 15:03:47');
INSERT INTO `sys_oper_log` VALUES (130, 'household management', 1, 'com.ruoyi.project.front.household.controller.HouseholdManagementController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/household/add', '127.0.0.1', '内网IP', '{\"householdCategory\":[\"1\"],\"userId\":[\"1\"],\"userName\":[\"赵小天\"],\"houseNumber\":[\"001\"],\"householdPrice\":[\"1\"],\"householdStatus\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-22 15:45:43');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/importTable', '192.168.0.233', '内网IP', '{\"tables\":[\"community_introduction\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-23 10:34:47');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/menu/add', '192.168.0.233', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"community management\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-23 10:38:21');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/menu/add', '192.168.0.233', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"second hand exchange\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"8\"],\"icon\":[\"fa fa-credit-card\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-23 10:44:10');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/edit', '192.168.0.233', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"community_introduction\"],\"tableComment\":[\"community introduction\"],\"className\":[\"CommunityIntroduction\"],\"functionAuthor\":[\"lzp\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"56\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"community id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"57\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"title\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"title\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"58\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"introduce content\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"introduceContent\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"summernote\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"59\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"creator\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"createBy\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"60\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"create time\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"61\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"Updater\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"updateBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-23 10:46:02');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/importTable', '192.168.0.233', '内网IP', '{\"tables\":[\"second_hand\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-23 10:47:12');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/edit', '192.168.0.233', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"second_hand\"],\"tableComment\":[\"second hand exchange\"],\"className\":[\"SecondHand\"],\"functionAuthor\":[\"lzp\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"64\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"second hand id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"65\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"goods name\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"goodsName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"66\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"goods describe\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"goodsDescribe\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"67\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"goods price\"],\"columns[3].javaType\":[\"BigDecimal\"],\"columns[3].javaField\":[\"price\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"68\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"goods image one\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"goodsImageOne\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"textarea\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"69\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"goods image two\"],\"colu', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-23 10:47:44');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/second_hand', '192.168.0.233', '内网IP', '\"second_hand\"', NULL, 0, NULL, '2022-07-23 10:48:57');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/community_introduction', '192.168.0.233', '内网IP', '\"community_introduction\"', NULL, 0, NULL, '2022-07-23 10:49:36');
INSERT INTO `sys_oper_log` VALUES (139, 'menu information', 1, 'com.ruoyi.project.front.menu.controller.MenuInformationController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/menu/add', '192.168.0.233', '内网IP', '{\"foodName\":[\"pizza\"],\"foodIntroduce\":[\"pizza\"],\"price\":[\"10\"],\"foodImage\":[\"/profile/upload/2022/07/23/lol3_20220723151031A004.jpeg\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-23 15:10:46');
INSERT INTO `sys_oper_log` VALUES (140, 'community introduction', 1, 'com.ruoyi.project.front.introduction.controller.CommunityIntroductionController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/introduction/add', '192.168.0.233', '内网IP', '{\"title\":[\"community\"],\"introduceContent\":[\"<p><img src=\\\"http://192.168.0.233:8081/cmser/profile/upload/2022/07/23/cc143563-89e2-41d5-a57d-af367ef8bb7a_20220723170443A001.jpg\\\" style=\\\"width: 454.656px;\\\"><br></p>\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-23 17:04:58');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"banner_image\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 10:48:16');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"banner management\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"fa fa-file-photo-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 10:49:50');
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"banner_image\"],\"tableComment\":[\"banner image\"],\"className\":[\"BannerImage\"],\"functionAuthor\":[\"lzp\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"79\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"second hand id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"80\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"goods image one\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"bannerImageUrl\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"textarea\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"81\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"creator\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"createBy\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"82\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"create time\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"83\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"Updater\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"updateBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"84\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"update time\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"updateTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"85', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 10:50:04');
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/banner_image', '127.0.0.1', '内网IP', '\"banner_image\"', NULL, 0, NULL, '2022-07-25 10:50:42');
INSERT INTO `sys_oper_log` VALUES (145, 'banner image', 1, 'com.ruoyi.project.front.banner.controller.BannerImageController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/banner/add', '127.0.0.1', '内网IP', '{\"bannerImageUrl\":[\"\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 11:23:32');
INSERT INTO `sys_oper_log` VALUES (146, 'banner image', 3, 'com.ruoyi.project.front.banner.controller.BannerImageController.remove()', 'POST', 1, 'admin', '研发部门', '/cmser/front/banner/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 11:24:20');
INSERT INTO `sys_oper_log` VALUES (147, 'banner image', 1, 'com.ruoyi.project.front.banner.controller.BannerImageController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/banner/add', '127.0.0.1', '内网IP', '{\"bannerImageUrl\":[\"/profile/upload/2022/07/25/cc143563-89e2-41d5-a57d-af367ef8bb7a_20220725112417A001.jpg\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 11:24:34');
INSERT INTO `sys_oper_log` VALUES (148, 'banner image', 1, 'com.ruoyi.project.front.banner.controller.BannerImageController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/banner/add', '127.0.0.1', '内网IP', '{\"bannerImageUrl\":[\"/profile/upload/2022/07/25/flo_20220725112941A002.jpg\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 11:29:58');
INSERT INTO `sys_oper_log` VALUES (149, 'banner image', 1, 'com.ruoyi.project.front.banner.controller.BannerImageController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/banner/add', '127.0.0.1', '内网IP', '{\"bannerImageUrl\":[\"/profile/upload/2022/07/25/leaf_20220725112956A003.jpg\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 11:30:13');
INSERT INTO `sys_oper_log` VALUES (150, 'community introduction', 2, 'com.ruoyi.project.front.introduction.controller.CommunityIntroductionController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/introduction/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"community\"],\"introduceContent\":[\"<p><span style=\\\"white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"background-color: rgb(239, 243, 248); white-space: nowrap; color: inherit;\\\">introduce content&nbsp;&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content</span><br></p><p><img src=\\\"http://192.168.0.233:8081/cmser/profile/upload/2022/07/23/cc143563-89e2-41d5-a57d-af367ef8bb7a_20220723170443A001.jpg\\\" style=\\\"width: 454.656px;\\\"><br></p>\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 14:44:26');
INSERT INTO `sys_oper_log` VALUES (151, 'community introduction', 2, 'com.ruoyi.project.front.introduction.controller.CommunityIntroductionController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/introduction/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"community\"],\"introduceContent\":[\"<p><span style=\\\"white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"background-color: rgb(239, 243, 248); white-space: nowrap; color: inherit;\\\">introduce content&nbsp;&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span></p><p><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content</span></p><p><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content</span></p><p><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content</span></p><p><img src=\\\"http://192.168.0.233:8081/cmser/profile/upload/2022/07/23/cc143563-89e2-41d5-a57d-af367ef8bb7a_20220723170443A001.jpg\\\" style=\\\"width: 454.656px;\\\"><br></p>\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 14:45:51');
INSERT INTO `sys_oper_log` VALUES (152, 'community introduction', 2, 'com.ruoyi.project.front.introduction.controller.CommunityIntroductionController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/introduction/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"community\"],\"introduceContent\":[\"<p><span style=\\\"white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"background-color: rgb(239, 243, 248); white-space: nowrap; color: inherit;\\\">introduce content&nbsp;&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content</span></p><p><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content</span></p><p><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; white-space: nowrap; background-color: rgb(239, 243, 248);\\\">introduce content&nbsp;</span><span style=\\\"color: inherit; background-color: rgb(239, 243, 248); white-space: nowrap;\\\">introduce content</span></p><p><img src=\\\"http://192.168.0.233:8081/cmser/profile/upload/2022/07/23/cc143563-89e2-41d5-a57d-af367ef8bb7a_20220723170443A001.jpg\\\" style=\\\"width: 454.656px;\\\"><br></p>\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 15:03:34');
INSERT INTO `sys_oper_log` VALUES (153, 'community introduction', 2, 'com.ruoyi.project.front.introduction.controller.CommunityIntroductionController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/introduction/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"title\":[\"community\"],\"introduceContent\":[\"<div class=\\\"para-title level-3  \\\" data-index=\\\"1_1\\\" label-module=\\\"para-title\\\" data-pid=\\\"7\\\" style=\\\"clear: both; zoom: 1; margin: 20px 0px 12px; line-height: 20px; font-size: 18px; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; color: rgb(51, 51, 51);\\\"><h3 class=\\\"title-text\\\" style=\\\"margin: 0px; padding: 0px; font-size: 18px; color: rgb(51, 51, 51); font-weight: 400;\\\">禹凿龙门</h3></div><div class=\\\"para\\\" label-module=\\\"para\\\" data-pid=\\\"8\\\" style=\\\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif;\\\"><a target=\\\"_blank\\\" href=\\\"https://baike.baidu.com/item/%E5%A4%A7%E7%A6%B9/204744\\\" data-lemmaid=\\\"204744\\\" style=\\\"color: rgb(19, 110, 194);\\\">大禹</a>开凿的龙门山，就是现在龙门石窟所在。《水经注》记载：“昔大禹疏龙门以通水，两山相对，望之若阙，<a target=\\\"_blank\\\" href=\\\"https://baike.baidu.com/item/%E4%BC%8A%E6%B0%B4/7427349\\\" data-lemmaid=\\\"7427349\\\" style=\\\"color: rgb(19, 110, 194);\\\">伊水</a>历其间，故谓之<a target=\\\"_blank\\\" href=\\\"https://baike.baidu.com/item/%E4%BC%8A%E9%98%99/7929818\\\" data-lemmaid=\\\"7929818\\\" style=\\\"color: rgb(19, 110, 194);\\\">伊阙</a>。”<div class=\\\"lemma-picture J-lemma-picture text-pic layout-center\\\" style=\\\"border: 1px solid rgb(224, 224, 224); overflow: hidden; margin: 0px auto; position: relative; float: none; clear: both; width: 640px;\\\"><a class=\\\"image-link\\\" nslog-type=\\\"9317\\\" href=\\\"https://baike.baidu.com/pic/%E9%BE%99%E9%97%A8%E7%9F%B3%E7%AA%9F/274/0/c8177f3e6709c93d70cfaa0f8b74efdcd100bba1feb8?fr=lemma&amp;ct=single\\\" target=\\\"_blank\\\" title=\\\"龙门山水\\\" style=\\\"color: rgb(19, 110, 194); display: block; width: 640px; height: 291.875px;\\\"><img class=\\\"\\\" src=\\\"https://bkimg.cdn.bcebos.com/pic/c8177f3e6709c93d70cfaa0f8b74efdcd100bba1feb8?x-bce-proces', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 15:06:42');
INSERT INTO `sys_oper_log` VALUES (154, 'community introduction', 2, 'com.ruoyi.project.front.introduction.controller.CommunityIntroductionController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/introduction/edit', '192.168.0.162', '内网IP', '{\"id\":[\"1\"],\"title\":[\"community\"],\"introduceContent\":[\"<p class=\\\"one-p\\\" style=\\\"margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px;\\\"><span style=\\\"font-weight: bolder;\\\">第三批新房还摇不到怎么办？</span></p><p class=\\\"one-p\\\" style=\\\"margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px;\\\"><span style=\\\"font-weight: bolder;\\\">独家分享保底方案</span></p><p class=\\\"one-p\\\" style=\\\"margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px;\\\"><span style=\\\"font-weight: bolder;\\\">点击下方直接预约，直播没有回放哦</span></p><p class=\\\"one-p\\\" style=\\\"margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px;\\\">今天为大家推荐一个普陀区内环内的高品质小区——大华清水湾花园(以下简称“大华清水湾”)，该小区位于武宁路板块，紧靠苏州河。</p><p class=\\\"one-p\\\" style=\\\"margin-bottom: 2em; padding: 0px; line-height: 2.2; overflow-wrap: break-word; color: rgb(0, 0, 0); font-family: &quot;Microsoft Yahei&quot;, Avenir, &quot;Segoe UI&quot;, &quot;Hiragino Sans GB&quot;, STHeiti, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px;\\\"><img class=\\\"conten', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 15:12:49');
INSERT INTO `sys_oper_log` VALUES (155, 'community introduction', 2, 'com.ruoyi.project.front.introduction.controller.CommunityIntroductionController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/introduction/edit', '192.168.0.162', '内网IP', '{\"id\":[\"1\"],\"introduceContent\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-25 15:25:58');
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"image_information\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-27 17:09:04');
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-27 17:10:22');
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"image_information\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-27 17:12:13');
INSERT INTO `sys_oper_log` VALUES (159, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"image type\"],\"dictType\":[\"image_type\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-27 17:16:38');
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"household\"],\"dictValue\":[\"1\"],\"dictType\":[\"image_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"household\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-27 17:29:50');
INSERT INTO `sys_oper_log` VALUES (161, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"second hand\"],\"dictValue\":[\"2\"],\"dictType\":[\"image_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"second hand\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-27 17:30:10');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"10\"],\"tableName\":[\"image_information\"],\"tableComment\":[\"image information\"],\"className\":[\"ImageInformation\"],\"functionAuthor\":[\"lzp\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"95\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"image id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"96\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"image type\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"imageType\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"select\"],\"columns[1].dictType\":[\"image_type\"],\"columns[2].columnId\":[\"97\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"information id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"informationId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"98\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"image url\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"imageUrl\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"textarea\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"99\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"creator\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"100\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"create time\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-27 17:32:41');
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/image_information', '127.0.0.1', '内网IP', '\"image_information\"', NULL, 0, NULL, '2022-07-27 17:36:03');
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"order_item\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-28 10:28:17');
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 2, 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"11\"],\"tableName\":[\"order_item\"],\"tableComment\":[\"order item\"],\"className\":[\"OrderItem\"],\"functionAuthor\":[\"lzp\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"104\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"item id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"105\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"order id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"orderId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"106\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"food id\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"foodId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"107\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"food name\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"foodName\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"LIKE\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"108\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"food number\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"foodNumber\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"109\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"creator\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"c', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-28 10:28:57');
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/cmser/tool/gen/download/order_item', '127.0.0.1', '内网IP', '\"order_item\"', NULL, 0, NULL, '2022-07-28 10:29:33');
INSERT INTO `sys_oper_log` VALUES (167, 'menu information', 1, 'com.ruoyi.project.front.menu.controller.MenuInformationController.addSave()', 'POST', 1, 'admin', '研发部门', '/cmser/front/menu/add', '127.0.0.1', '内网IP', '{\"foodName\":[\"rice\"],\"foodIntroduce\":[\"rice\"],\"price\":[\"1\"],\"foodImage\":[\"/profile/upload/2022/07/28/sea_20220728154808A007.jpg\"],\"remark\":[\"\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-28 15:48:17');
INSERT INTO `sys_oper_log` VALUES (168, '字典类型', 2, 'com.ruoyi.project.system.dict.controller.DictTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/cmser/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"14\"],\"dictName\":[\"image type\"],\"dictType\":[\"image_type\"],\"status\":[\"0\"],\"remark\":[\"image type\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-28 16:51:55');
INSERT INTO `sys_oper_log` VALUES (169, 'second hand exchange', 3, 'com.ruoyi.project.front.hand.controller.SecondHandController.remove()', 'POST', 1, 'admin', '研发部门', '/cmser/front/hand/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-28 17:53:50');
INSERT INTO `sys_oper_log` VALUES (170, 'menu order', 3, 'com.ruoyi.project.front.order.controller.MenuOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/cmser/front/order/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-29 15:05:26');
INSERT INTO `sys_oper_log` VALUES (171, 'menu order', 3, 'com.ruoyi.project.front.order.controller.MenuOrderController.remove()', 'POST', 1, 'admin', '研发部门', '/cmser/front/order/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"success\",\"code\":0}', 0, NULL, '2022-07-29 15:05:29');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-03-23 09:42:25', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-03-23 09:42:25', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-03-23 09:42:25', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'Super administrator\n\n', '00', 'ry@163.com', '15888888888', '1', '', '80d8397b562c752a42ce0b21b6e2d227', 'd2eda4', '0', '0', '127.0.0.1', '2022-07-29 14:36:10', '2022-03-23 09:46:04', 'admin', '2022-03-23 09:42:24', '', '2022-07-29 14:36:14', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', 'system administrator', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2022-03-23 09:42:25', '2022-03-23 09:42:25', 'admin', '2022-03-23 09:42:25', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
