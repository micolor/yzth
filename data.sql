/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost:3306
 Source Schema         : jy

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 11/10/2018 16:14:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mc_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `mc_ad_position`;
CREATE TABLE `mc_ad_position`  (
  `adp_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adp_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adp_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adp_height` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adp_width` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adp_addtime` int(10) NULL DEFAULT NULL,
  `adp_status` tinyint(5) NULL DEFAULT 1,
  `adp_type` tinyint(5) NULL DEFAULT 1,
  `adp_num` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`adp_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_ad_position
-- ----------------------------
INSERT INTO `mc_ad_position` VALUES (1, '首页通栏幻灯广告位', '首页通栏幻灯广告位', '562', '1920', 1531794634, 1, 1, 4);
INSERT INTO `mc_ad_position` VALUES (2, '首页视频-客户故事', '首页视频-客户故事', '286', '512', 1534055107, 1, 1, 1);

-- ----------------------------
-- Table structure for mc_ads
-- ----------------------------
DROP TABLE IF EXISTS `mc_ads`;
CREATE TABLE `mc_ads`  (
  `ad_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_type` smallint(2) NULL DEFAULT 1,
  `ad_adp_id` int(10) NULL DEFAULT NULL,
  `ad_start_time` int(10) NULL DEFAULT NULL,
  `ad_end_time` int(10) NULL DEFAULT NULL,
  `ad_link` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_file` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_status` smallint(2) NULL DEFAULT 1,
  `ad_order` int(11) NULL DEFAULT 0,
  `ad_pv` int(10) NULL DEFAULT 1,
  `ad_link_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_link_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ad_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_ads
-- ----------------------------
INSERT INTO `mc_ads` VALUES (1, '《绩效工场》心品牌-新起航', 1, 1, NULL, NULL, 'http://baidu.com', '/imageuploads/thumb/1459157306.1543.jpg', 1, 1, 1, '广告联人', '绩效倍增系系列课程首次问世 ”', '“ 蒋春燕绩效工程 -- 课程品牌重磅升级');
INSERT INTO `mc_ads` VALUES (2, '专属的高端定制化服务', 1, 1, 1457971200, 1458057599, 'http://soso.com', '/imageuploads/thumb/1459157317.5882.jpg', 1, 2, 1, '广告联人', '', '以创意元素设计，结合企业品牌定位，充分了解企业文化，由资深设计师为您打造');
INSERT INTO `mc_ads` VALUES (3, '客户故事视频', 1, 2, NULL, NULL, 'http://www.52jixiao.com/statics/video/a0659yhg0hy.mp4', '/imageuploads/thumb/1534055242.7422.png', 1, 0, 1, '', '', '客户故事视频');

-- ----------------------------
-- Table structure for mc_apply
-- ----------------------------
DROP TABLE IF EXISTS `mc_apply`;
CREATE TABLE `mc_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '联系状态（1未联系 2已联系）',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '性别（1男 2女）',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ip',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_apply
-- ----------------------------
INSERT INTO `mc_apply` VALUES (33, '1', '1', '2018-09-10 15:09:38', '2018-09-10 15:09:38', '1', '18552561993', '1', NULL);
INSERT INTO `mc_apply` VALUES (34, '王文安', '扬州米彩科技有限公司', '2018-09-10 18:09:23', '2018-09-10 18:09:23', '1', '15161415003', '1', NULL);

-- ----------------------------
-- Table structure for mc_config
-- ----------------------------
DROP TABLE IF EXISTS `mc_config`;
CREATE TABLE `mc_config`  (
  `id` smallint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `varname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `groupid` tinyint(3) UNSIGNED NULL DEFAULT 1,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` tinyint(1) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `varname`(`varname`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_config
-- ----------------------------
INSERT INTO `mc_config` VALUES (1, 'sitename', '系统名称', 2, '绩效工厂', 2);
INSERT INTO `mc_config` VALUES (2, 'siteurl', '系统网址', 2, 'http://www.jy.cc/', 2);
INSERT INTO `mc_config` VALUES (3, 'sitefileurl', '附件地址', 2, '/d/file/', 2);
INSERT INTO `mc_config` VALUES (5, 'siteinfo', '系统介绍', 2, '绩效工厂', 2);
INSERT INTO `mc_config` VALUES (23, 'mail_type', '邮件发送模式', 2, NULL, 1);
INSERT INTO `mc_config` VALUES (24, 'smtp_server', '邮件服务器', 2, '', 1);
INSERT INTO `mc_config` VALUES (25, 'smtp_port', '邮件发送端口', 2, '', 1);
INSERT INTO `mc_config` VALUES (26, 'smtp_mail', '发件人地址', 2, 'admin', 1);
INSERT INTO `mc_config` VALUES (27, 'smtp_password', '发件人密码', 2, '123456', 1);
INSERT INTO `mc_config` VALUES (79, 'copyright', '版权', 2, 'Copyright©2017 绩效工厂 版权所有 沪ICP备17012963号-1.', 2);

-- ----------------------------
-- Table structure for mc_contactus
-- ----------------------------
DROP TABLE IF EXISTS `mc_contactus`;
CREATE TABLE `mc_contactus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司电话',
  `fax` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司传真',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司邮箱',
  `thumb` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司二维码图像',
  `addtime` int(11) NULL DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司联系方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_contactus
-- ----------------------------
INSERT INTO `mc_contactus` VALUES (1, '扬州市邗江区开发区扬子江中路228号观湖国际A座16楼1612', '18621653767', '-', 'geyupeng@micolor.net', '/imageuploads/thumb/1523531191.2616.jpg', 1526826389, '594405327');

-- ----------------------------
-- Table structure for mc_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `mc_dictionary`;
CREATE TABLE `mc_dictionary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编码',
  `dname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `dvalue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `addtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_dictionary
-- ----------------------------
INSERT INTO `mc_dictionary` VALUES (1, 'job_position', '董事长', '1', 1458723484);
INSERT INTO `mc_dictionary` VALUES (2, 'job_position', '总经理', '2', 1458723496);
INSERT INTO `mc_dictionary` VALUES (3, 'job_position', '副总经理', '3', 1458723511);
INSERT INTO `mc_dictionary` VALUES (4, 'job_position', '项目经理', '4', 1458723521);
INSERT INTO `mc_dictionary` VALUES (5, 'job_position', 'JAVA高级工程师', '5', 1458723540);
INSERT INTO `mc_dictionary` VALUES (6, 'job_position', 'JAVA开发工程师', '6', 1458723552);
INSERT INTO `mc_dictionary` VALUES (7, 'job_position', 'PHP高级开发工程师', '7', 1458723680);
INSERT INTO `mc_dictionary` VALUES (8, 'job_position', 'PHP开发工程师', '8', 1458723693);
INSERT INTO `mc_dictionary` VALUES (9, 'job_position', '前端设计工程师', '9', 1458723699);

-- ----------------------------
-- Table structure for mc_fxadmin_panel
-- ----------------------------
DROP TABLE IF EXISTS `mc_fxadmin_panel`;
CREATE TABLE `mc_fxadmin_panel`  (
  `menuid` mediumint(8) UNSIGNED NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `name` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `datetime` int(10) UNSIGNED NULL DEFAULT 0,
  UNIQUE INDEX `userid`(`menuid`, `userid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for mc_fxadmin_role_priv
-- ----------------------------
DROP TABLE IF EXISTS `mc_fxadmin_role_priv`;
CREATE TABLE `mc_fxadmin_role_priv`  (
  `roleid` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `app` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  INDEX `roleid`(`roleid`, `app`, `model`, `action`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of mc_fxadmin_role_priv
-- ----------------------------
INSERT INTO `mc_fxadmin_role_priv` VALUES (4, 'Admin', 'Config', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (4, 'Admin', 'Menu', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (4, 'admin', 'Config', 'inii', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (4, 'admin', 'Config', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (4, 'Admin', 'Adminmanage', 'chanpass', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (4, 'Admin', 'Adminmanage', 'myinfo', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (4, 'Admin', 'Adminmanage', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (4, 'Admin', 'Index', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Index', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Adminmanage', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Adminmanage', 'myinfo', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Adminmanage', 'chanpass', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'admin', 'Config', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'admin', 'Config', 'inii', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Menu', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Config', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Management', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Management', 'manager', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Rbac', 'rolemanage', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Logs', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Logs', 'loginlog', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'Logs', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'xtpz', 'xtpz', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Admin', 'xtpz1', 'xtpz1', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Category', 'category', 'init', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (3, 'Category', 'category', 'add', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (5, 'Admin', 'Ad', 'addad', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (5, 'Admin', 'Ad', 'adlist', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (5, 'Admin', 'Ad', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (5, 'Admin', 'Adminmanage', 'chanpass', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (5, 'Admin', 'Adminmanage', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (5, 'Admin', 'Adminmanage', 'myinfo', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (5, 'Admin', 'Index', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (9, 'Admin', 'Index', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (9, 'Admin', 'Adminmanage', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (9, 'Admin', 'Adminmanage', 'myinfo', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (9, 'Admin', 'Adminmanage', 'chanpass', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (8, 'Admin', 'Index', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (8, 'Admin', 'Adminmanage', 'index', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (8, 'Admin', 'Adminmanage', 'myinfo', '');
INSERT INTO `mc_fxadmin_role_priv` VALUES (8, 'Admin', 'Adminmanage', 'chanpass', '');

-- ----------------------------
-- Table structure for mc_fxconfig
-- ----------------------------
DROP TABLE IF EXISTS `mc_fxconfig`;
CREATE TABLE `mc_fxconfig`  (
  `id` smallint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `varname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `groupid` tinyint(3) UNSIGNED NULL DEFAULT 1,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` tinyint(1) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `varname`(`varname`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_fxconfig
-- ----------------------------
INSERT INTO `mc_fxconfig` VALUES (1, 'sitename', '系统名称', 2, '广告管理系统', 2);
INSERT INTO `mc_fxconfig` VALUES (2, 'siteurl', '系统网址', 2, 'http://www.demoadmin.com/', 2);
INSERT INTO `mc_fxconfig` VALUES (3, 'sitefileurl', '附件地址', 2, '/d/file/', 2);
INSERT INTO `mc_fxconfig` VALUES (5, 'siteinfo', '系统介绍', 2, '公司人员', 2);
INSERT INTO `mc_fxconfig` VALUES (23, 'mail_type', '邮件发送模式', 2, NULL, 1);
INSERT INTO `mc_fxconfig` VALUES (24, 'smtp_server', '邮件服务器', 2, 'smtp.qq.com', 1);
INSERT INTO `mc_fxconfig` VALUES (25, 'smtp_port', '邮件发送端口', 2, '25', 1);
INSERT INTO `mc_fxconfig` VALUES (26, 'smtp_mail', '发件人地址', 2, 'eciti@qq.com', 1);
INSERT INTO `mc_fxconfig` VALUES (27, 'smtp_password', '发件人密码', 2, '123456', 1);

-- ----------------------------
-- Table structure for mc_fxloginlog
-- ----------------------------
DROP TABLE IF EXISTS `mc_fxloginlog`;
CREATE TABLE `mc_fxloginlog`  (
  `loginid` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录帐号',
  `logintime` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态,1为登录成功，0为登录失败',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '尝试错误密码',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '其他说明',
  PRIMARY KEY (`loginid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 502 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台登陆日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_fxloginlog
-- ----------------------------
INSERT INTO `mc_fxloginlog` VALUES (452, 'evangoe', '2018-05-09 17:36:27', '183.64.110.1', 0, 'cssc***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (453, 'admin', '2018-05-09 17:36:38', '183.64.110.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (454, 'admin', '2018-05-10 21:31:55', '36.149.101.190', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (455, 'admin', '2018-05-20 22:22:45', '101.245.244.219', 0, 'admi***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (456, 'admin', '2018-05-20 22:23:24', '101.245.244.219', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (457, 'admin', '2018-05-20 22:24:09', '101.245.244.219', 1, 'cssc***', '');
INSERT INTO `mc_fxloginlog` VALUES (458, 'admin', '2018-05-20 22:36:05', '223.104.146.153', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (459, 'micolor', '2018-05-21 11:22:52', '127.0.0.1', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (460, 'admin', '2018-05-21 11:23:02', '127.0.0.1', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (461, 'admin', '2018-05-21 11:23:07', '127.0.0.1', 0, 'admi***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (462, 'admin', '2018-05-21 11:23:12', '127.0.0.1', 0, 'admi***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (463, 'admin', '2018-05-21 18:36:10', '0.0.0.0', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (464, 'admin', '2018-05-21 18:36:17', '0.0.0.0', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (465, 'admin', '2018-05-21 18:36:26', '0.0.0.0', 0, 'admi***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (466, 'admin', '2018-05-21 18:37:14', '0.0.0.0', 0, 'admi***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (467, 'evangoe', '2018-05-29 20:37:40', '221.181.228.200', 0, 'cssc***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (468, 'admin', '2018-05-29 20:37:52', '221.181.228.200', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (469, 'admin', '2018-06-04 15:41:39', '114.230.122.196', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (470, 'admin', '2018-06-04 15:41:48', '114.230.122.196', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (471, 'evangoe', '2018-06-05 13:13:11', '114.230.122.196', 0, 'cssc***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (472, 'admin', '2018-06-05 13:13:20', '114.230.122.196', 0, 'admi***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (473, 'admin', '2018-06-16 16:26:47', '36.149.240.84', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (474, 'admin', '2018-06-16 16:26:58', '36.149.240.84', 0, 'mico***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (475, 'admin', '2018-06-16 16:27:09', '36.149.240.84', 0, 'admi***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (476, 'micolor2018', '2018-06-16 16:28:03', '36.149.240.84', 0, 'eglo***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (477, 'admin', '2018-06-16 16:28:10', '36.149.240.84', 0, 'mico***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (478, 'admin', '2018-06-16 16:28:30', '36.149.240.84', 1, 'cssc***', '');
INSERT INTO `mc_fxloginlog` VALUES (479, 'admin', '2018-06-16 16:28:46', '36.149.240.84', 1, 'cssc***', '');
INSERT INTO `mc_fxloginlog` VALUES (480, 'admin', '2018-06-16 16:28:46', '36.149.112.84', 1, 'cssc***', '');
INSERT INTO `mc_fxloginlog` VALUES (481, 'evangoe', '2018-06-16 16:28:59', '36.149.112.84', 0, 'cssc***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (482, 'admin', '2018-06-16 16:29:09', '36.149.112.84', 1, 'cssc***', '');
INSERT INTO `mc_fxloginlog` VALUES (483, 'admin', '2018-06-16 16:29:36', '36.149.240.84', 1, 'cssc***', '');
INSERT INTO `mc_fxloginlog` VALUES (484, 'admin', '2018-07-12 09:29:10', '127.0.0.1', 0, '1234***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (485, 'admin', '2018-07-12 09:29:19', '127.0.0.1', 0, 'admi***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (486, 'admin', '2018-07-12 09:30:20', '127.0.0.1', 0, 'admi***', '帐号密码错误');
INSERT INTO `mc_fxloginlog` VALUES (487, 'admin', '2018-07-12 09:30:26', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (488, 'admin', '2018-07-12 09:35:16', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (489, 'admin', '2018-07-12 09:35:45', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (490, 'admin', '2018-07-12 09:43:10', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (491, 'admin', '2018-07-12 11:14:38', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (492, 'admin', '2018-07-12 11:25:20', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (493, 'admin', '2018-07-17 10:28:28', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (494, 'admin', '2018-07-17 11:07:00', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (495, 'admin', '2018-07-17 11:39:32', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (496, 'admin', '2018-07-17 16:32:09', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (497, 'admin', '2018-07-18 09:32:20', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (498, 'admin', '2018-07-18 16:17:57', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (499, 'admin', '2018-08-12 13:32:43', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (500, 'admin', '2018-08-24 17:10:28', '127.0.0.1', 1, '1234***', '');
INSERT INTO `mc_fxloginlog` VALUES (501, 'admin', '2018-08-27 10:05:45', '127.0.0.1', 1, '1234***', '');

-- ----------------------------
-- Table structure for mc_fxmenu
-- ----------------------------
DROP TABLE IF EXISTS `mc_fxmenu`;
CREATE TABLE `mc_fxmenu`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) UNSIGNED NULL DEFAULT 0,
  `app` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用名称app',
  `model` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `action` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `data` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `type` tinyint(1) NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `group_id` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `listorder` smallint(6) UNSIGNED NULL DEFAULT 0 COMMENT '排序ID',
  `level` tinyint(5) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `parentid`(`parentid`) USING BTREE,
  INDEX `model`(`model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 230 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_fxmenu
-- ----------------------------
INSERT INTO `mc_fxmenu` VALUES (35, 0, 'Admin', 'Index', 'index', '', 1, 1, 0, '我的面板', '我的面板', 1, 0);
INSERT INTO `mc_fxmenu` VALUES (2, 0, 'admin', 'Config', 'index', '', 1, 1, 0, '设置', '网站参数信息设置！', 2, 0);
INSERT INTO `mc_fxmenu` VALUES (36, 35, 'Admin', 'Adminmanage', 'index', '', 1, 1, 0, '个人信息', '个人信息', 0, 1);
INSERT INTO `mc_fxmenu` VALUES (37, 36, 'Admin', 'Adminmanage', 'myinfo', '', 1, 1, 0, '个人信息', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (8, 2, 'admin', 'Config', 'inii', '', 1, 1, 0, '系统设置', '系统设置', 0, 1);
INSERT INTO `mc_fxmenu` VALUES (33, 8, 'Admin', 'Menu', 'index', '', 1, 1, 0, '后台菜单管理', '后台菜单管理', 0, 2);
INSERT INTO `mc_fxmenu` VALUES (10, 8, 'Admin', 'Config', 'index', '', 1, 1, 0, '站点配置', '站点配置', 1, 2);
INSERT INTO `mc_fxmenu` VALUES (38, 36, 'Admin', 'Adminmanage', 'chanpass', '', 1, 1, 0, '修改密码', '', 0, 2);
INSERT INTO `mc_fxmenu` VALUES (39, 2, 'Admin', 'Management', 'index', '', 1, 1, 0, '管理员设置', '权限相关管理', 0, 1);
INSERT INTO `mc_fxmenu` VALUES (40, 39, 'Admin', 'Management', 'manager', '', 1, 1, 0, '管理员管理', '管理员管理', 0, 2);
INSERT INTO `mc_fxmenu` VALUES (41, 39, 'Admin', 'Rbac', 'rolemanage', '', 1, 1, 0, '管理员角色', '管理员角色', 0, 2);
INSERT INTO `mc_fxmenu` VALUES (44, 2, 'Admin', 'Logs', 'index', '', 1, 1, 0, '日志管理', '日志管理', 0, 1);
INSERT INTO `mc_fxmenu` VALUES (45, 44, 'Admin', 'Logs', 'loginlog', '', 1, 1, 0, '后台登陆日志', '', 0, 2);
INSERT INTO `mc_fxmenu` VALUES (125, 0, 'Admin', 'Leftnew', 'Index', '', 0, 1, 0, '新闻管理', NULL, 3, 0);
INSERT INTO `mc_fxmenu` VALUES (126, 125, 'Admin', 'Newcat', 'Index', '', 0, 1, 0, '栏目管理', NULL, 0, 1);
INSERT INTO `mc_fxmenu` VALUES (127, 126, 'Admin', 'Newcat', 'add', '', 0, 0, 0, '添加栏目', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (128, 126, 'Admin', 'Newcat', 'edit', '', 0, 0, 0, '栏目修改', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (129, 125, 'Admin', 'New', 'index', '', 0, 1, 0, '新闻列表', NULL, 0, 1);
INSERT INTO `mc_fxmenu` VALUES (130, 129, 'Admin', 'New', 'add', '', 0, 0, 0, '添加新闻', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (199, 126, 'Admin', 'Newcat', 'delete', '', 0, 0, 0, '删除栏目', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (200, 126, 'Newcat', 'Newcat', 'listorders', '', 0, 0, 0, '排序栏目', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (201, 129, 'Admin', 'New', 'edit', '', 0, 0, 0, '修改新闻', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (202, 129, 'Admin', 'New', 'del', '', 0, 0, 0, '删除文章', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (203, 129, 'Admin', 'New', 'listorder', '', 0, 0, 0, '排序文章', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (205, 129, 'Admin', 'New', 'push_add', '', 0, 0, 0, '文章加入推荐位', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (206, 129, 'Admin', 'New', 'remove', '', 0, 0, 0, '批量移动文章', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (207, 129, 'Admin', 'New', 'public_ajax_search', '', 0, 0, 0, '快速搜索', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (208, 129, 'Admin', 'New', 'public_categorys', '', 0, 0, 0, '快速栏目显示', NULL, 0, 2);
INSERT INTO `mc_fxmenu` VALUES (209, 0, 'Admin', 'Leftads', 'index', '', 0, 1, 0, '广告管理', NULL, 5, 0);
INSERT INTO `mc_fxmenu` VALUES (210, 209, 'Admin', 'Adp', 'index', '', 0, 1, 0, '广告位管理', NULL, 0, 1);
INSERT INTO `mc_fxmenu` VALUES (211, 209, 'Admin', 'Ads', 'index', '', 0, 1, 0, '广告管理', NULL, 0, 1);
INSERT INTO `mc_fxmenu` VALUES (215, 218, 'Admin', 'Partner', 'index', '', 0, 1, 0, '合作伙伴', NULL, 3, 1);
INSERT INTO `mc_fxmenu` VALUES (218, 0, 'Admin', 'Company', 'index', '', 0, 1, 0, '公司设置', NULL, 8, 0);
INSERT INTO `mc_fxmenu` VALUES (220, 218, 'Admin', 'Commanage', 'aboutus', '', 0, 1, 0, '公司简介', NULL, 1, 1);
INSERT INTO `mc_fxmenu` VALUES (225, 8, 'Admin', 'Dictionary', 'index', '', 0, 1, 0, '字典管理', NULL, 2, 2);
INSERT INTO `mc_fxmenu` VALUES (227, 218, 'Admin', 'Commanage', 'contactus', '', 0, 1, 0, '联系我们', NULL, 2, 1);
INSERT INTO `mc_fxmenu` VALUES (228, 218, 'Admin', 'Apply', 'index', '', 0, 1, 0, '在线报名', NULL, 0, 1);
INSERT INTO `mc_fxmenu` VALUES (229, 218, 'Admin', 'Teacher', 'index', '', 0, 1, 0, '导师管理', NULL, 8, 1);

-- ----------------------------
-- Table structure for mc_fxoperationlog
-- ----------------------------
DROP TABLE IF EXISTS `mc_fxoperationlog`;
CREATE TABLE `mc_fxoperationlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `uid` int(11) NOT NULL COMMENT '操作帐号ID',
  `time` datetime(0) NOT NULL COMMENT '操作时间',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态,1为写入，2为更新，3为删除',
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他说明',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据',
  `options` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件',
  `get` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'get数据',
  `post` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'post数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `username`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1039 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_fxoperationlog
-- ----------------------------
INSERT INTO `mc_fxoperationlog` VALUES (962, 1, '2018-05-09 17:36:55', '183.64.110.1', 1, '应用：GROUP_NAME,模块：Admin,方法：authorize<br>提示语：权限设置成功！', 'a:0:{}', 'a:0:{}', 'http://www.micolor.net/Admin/Rbac/authorize/id/9.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (963, 1, '2018-05-09 17:56:35', '183.64.110.1', 1, '应用：GROUP_NAME,模块：Admin,方法：authorize<br>提示语：权限设置成功！', 'a:0:{}', 'a:0:{}', 'http://www.micolor.net/Admin/Rbac/authorize/id/8.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (964, 1, '2018-05-20 22:23:43', '101.245.244.219', 1, '应用：GROUP_NAME,模块：Admin,方法：chanpass<br>提示语：密码已经更新！', 'a:0:{}', 'a:0:{}', 'http://www.micolor.net/Admin/Adminmanage/chanpass.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (965, 1, '2018-05-20 22:24:35', '101.245.244.219', 1, '应用：GROUP_NAME,模块：Admin,方法：index<br>提示语：更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.micolor.net/Admin/Config/index.html?id=10', '');
INSERT INTO `mc_fxoperationlog` VALUES (966, 1, '2018-05-20 22:26:29', '101.245.244.219', 1, '应用：GROUP_NAME,模块：Admin,方法：contactus<br>提示语：编辑成功!', 'a:0:{}', 'a:0:{}', 'http://www.micolor.net/Admin/Commanage/contactus.html?id=227', '');
INSERT INTO `mc_fxoperationlog` VALUES (967, 1, '2018-06-16 16:28:34', '36.149.240.84', 1, '应用：GROUP_NAME,模块：Admin,方法：logout<br>提示语：登出成功！', 'a:0:{}', 'a:0:{}', 'http://www.micolor.net/Admin/Index/index.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (968, 1, '2018-06-16 16:28:50', '36.149.112.84', 1, '应用：GROUP_NAME,模块：Admin,方法：logout<br>提示语：登出成功！', 'a:0:{}', 'a:0:{}', 'http://www.micolor.net/Admin/Index/index.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (969, 1, '2018-06-16 16:28:55', '36.149.240.84', 1, '应用：GROUP_NAME,模块：Admin,方法：logout<br>提示语：登出成功！', 'a:0:{}', 'a:0:{}', 'http://www.micolor.net/Admin/Index/index.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (970, 1, '2018-06-16 16:29:20', '36.149.112.84', 1, '应用：GROUP_NAME,模块：Admin,方法：logout<br>提示语：登出成功！', 'a:0:{}', 'a:0:{}', 'http://www.micolor.net/Admin/Index/index.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (971, 1, '2018-07-12 09:30:50', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：logout<br>提示语：登出成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Index/index.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (972, 1, '2018-07-12 09:35:19', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：logout<br>提示语：登出成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Index/index.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (973, 1, '2018-07-12 10:11:37', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：index<br>提示语：更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Config/index.html?id=10', '');
INSERT INTO `mc_fxoperationlog` VALUES (974, 1, '2018-07-12 10:11:47', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：index<br>提示语：更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Config/index.html?id=10', '');
INSERT INTO `mc_fxoperationlog` VALUES (975, 1, '2018-07-12 10:12:24', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/edit/cate_id/1.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (976, 1, '2018-07-12 10:15:43', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorder<br>提示语：排序成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/New/index.html?id=129', '');
INSERT INTO `mc_fxoperationlog` VALUES (977, 1, '2018-07-12 10:18:51', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorder<br>提示语：排序成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/New/index.html?id=129', '');
INSERT INTO `mc_fxoperationlog` VALUES (978, 1, '2018-07-12 10:19:02', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorders<br>提示语：排序更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/Index.html?id=126', '');
INSERT INTO `mc_fxoperationlog` VALUES (979, 1, '2018-07-12 10:19:05', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorders<br>提示语：排序更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/Index.html?id=126', '');
INSERT INTO `mc_fxoperationlog` VALUES (980, 1, '2018-07-12 10:21:32', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/add.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (981, 1, '2018-07-12 10:21:59', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/add.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (982, 1, '2018-07-12 10:22:13', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/edit/cate_id/10.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (983, 1, '2018-07-12 10:27:52', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/add.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (984, 1, '2018-07-12 10:39:53', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/edit/cate_id/11.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (985, 1, '2018-07-12 10:41:01', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/edit/cate_id/11.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (986, 1, '2018-07-12 10:41:10', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/edit/cate_id/11.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (987, 1, '2018-07-12 10:41:15', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/edit/cate_id/11.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (988, 1, '2018-07-12 11:08:10', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：logout<br>提示语：登出成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Index/index.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (989, 1, '2018-07-12 11:14:44', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：myinfo<br>提示语：资料修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Adminmanage/myinfo.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (990, 1, '2018-07-12 11:15:13', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：index<br>提示语：更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Config/index.html?id=10', '');
INSERT INTO `mc_fxoperationlog` VALUES (991, 1, '2018-07-17 10:30:34', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,广告位修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Adp/edit/adp_id/48.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (992, 1, '2018-07-17 11:07:44', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,广告修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Ads/edit/id/2.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (993, 1, '2018-07-17 11:08:05', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,广告修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Ads/edit/id/1.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (994, 1, '2018-07-17 11:11:56', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,广告修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Ads/edit/id/1.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (995, 1, '2018-07-17 11:12:46', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,广告修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Ads/edit/id/2.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (996, 1, '2018-07-17 11:12:54', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,广告修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Ads/edit/id/2.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (997, 1, '2018-07-17 11:18:34', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,广告修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Ads/edit/id/1.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (998, 1, '2018-07-17 11:19:40', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,广告修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Ads/edit/id/2.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (999, 1, '2018-07-17 11:40:16', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/add/cate_id/1.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1000, 1, '2018-07-17 11:40:55', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/add/cate_id/1.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1001, 1, '2018-07-17 11:41:57', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/add/cate_id/2.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1002, 1, '2018-07-17 11:42:09', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/add/cate_id/2.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1003, 1, '2018-07-17 11:42:21', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/edit/cate_id/8.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1004, 1, '2018-07-17 11:43:10', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/edit/cate_id/3.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1005, 1, '2018-07-17 11:43:24', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：delete<br>提示语：删除成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Newcat/Index.html?id=126', '');
INSERT INTO `mc_fxoperationlog` VALUES (1006, 1, '2018-07-17 13:53:47', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改菜单成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Menu/edit/id/215.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1007, 1, '2018-07-17 13:54:03', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,合作伙伴修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Partner/edit/link_id/54.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1008, 1, '2018-07-17 14:18:46', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,合作伙伴修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Partner/edit/link_id/10.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1009, 1, '2018-07-17 14:19:13', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,合作伙伴修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Partner/edit/link_id/10.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1010, 1, '2018-07-17 14:24:24', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：恭喜您,合作伙伴修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Partner/edit/link_id/10.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1011, 1, '2018-07-17 16:34:59', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：aboutus<br>提示语：编辑成功!', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Commanage/aboutus.html?id=220', '');
INSERT INTO `mc_fxoperationlog` VALUES (1012, 1, '2018-07-18 11:24:16', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Menu/add/parentid/218.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1013, 1, '2018-07-18 11:34:29', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：delete<br>提示语：删除成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Apply/index.html?id=228', '');
INSERT INTO `mc_fxoperationlog` VALUES (1014, 1, '2018-07-18 13:10:40', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/add.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1015, 1, '2018-07-18 13:21:29', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：delete<br>提示语：删除成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/index.html?id=229', '');
INSERT INTO `mc_fxoperationlog` VALUES (1016, 1, '2018-07-18 13:21:33', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：delete<br>提示语：删除成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/index.html?id=229', '');
INSERT INTO `mc_fxoperationlog` VALUES (1017, 1, '2018-07-18 13:21:46', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/add.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1018, 1, '2018-07-18 13:24:43', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/edit/id/11.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1019, 1, '2018-07-18 13:24:53', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/edit/id/11.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1020, 1, '2018-07-18 13:25:02', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/edit/id/10.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1021, 1, '2018-07-18 13:32:19', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/edit/id/10.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1022, 1, '2018-07-18 13:51:12', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/edit/id/10.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1023, 1, '2018-07-18 14:20:30', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/edit/id/10.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1024, 1, '2018-07-18 16:18:15', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：delete<br>提示语：删除菜单成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Menu/index.html?id=33', '');
INSERT INTO `mc_fxoperationlog` VALUES (1025, 1, '2018-07-18 16:18:35', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：delete<br>提示语：删除菜单成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Menu/index.html?id=33', '');
INSERT INTO `mc_fxoperationlog` VALUES (1026, 1, '2018-07-18 16:19:02', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：delete<br>提示语：删除菜单成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Menu/index.html?id=33', '');
INSERT INTO `mc_fxoperationlog` VALUES (1027, 1, '2018-07-18 16:19:23', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：delete<br>提示语：删除菜单成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Menu/index.html?id=33', '');
INSERT INTO `mc_fxoperationlog` VALUES (1028, 1, '2018-07-18 16:19:30', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：delete<br>提示语：删除菜单成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Menu/index.html?id=33', '');
INSERT INTO `mc_fxoperationlog` VALUES (1029, 1, '2018-08-12 13:40:02', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/edit/id/11.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1030, 1, '2018-08-12 13:40:59', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：edit<br>提示语：修改成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/edit/id/11.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1031, 1, '2018-08-12 14:12:26', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorders<br>提示语：排序更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/index.html?id=229', '');
INSERT INTO `mc_fxoperationlog` VALUES (1032, 1, '2018-08-12 14:12:29', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorders<br>提示语：排序更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/index.html?id=229', '');
INSERT INTO `mc_fxoperationlog` VALUES (1033, 1, '2018-08-12 14:16:17', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorders<br>提示语：排序更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/index.html?id=229', '');
INSERT INTO `mc_fxoperationlog` VALUES (1034, 1, '2018-08-12 14:16:53', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorders<br>提示语：排序更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/index.html?id=229', '');
INSERT INTO `mc_fxoperationlog` VALUES (1035, 1, '2018-08-12 14:18:19', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorders<br>提示语：排序更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/index.html?id=229', '');
INSERT INTO `mc_fxoperationlog` VALUES (1036, 1, '2018-08-12 14:18:22', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：listorders<br>提示语：排序更新成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Teacher/index.html?id=229', '');
INSERT INTO `mc_fxoperationlog` VALUES (1037, 1, '2018-08-12 14:25:07', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：恭喜您,广告位添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Adp/add.html', '');
INSERT INTO `mc_fxoperationlog` VALUES (1038, 1, '2018-08-12 14:27:26', '127.0.0.1', 1, '应用：GROUP_NAME,模块：Admin,方法：add<br>提示语：恭喜您,广告添加成功！', 'a:0:{}', 'a:0:{}', 'http://www.jy.cc/Admin/Ads/add.html', '');

-- ----------------------------
-- Table structure for mc_fxrole
-- ----------------------------
DROP TABLE IF EXISTS `mc_fxrole`;
CREATE TABLE `mc_fxrole`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '角色名称',
  `pid` smallint(6) NULL DEFAULT 0 COMMENT '父角色ID',
  `status` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` int(11) UNSIGNED NOT NULL COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT 0 COMMENT '排序字段',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId`(`pid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_fxrole
-- ----------------------------
INSERT INTO `mc_fxrole` VALUES (1, '超级管理员', NULL, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 3);
INSERT INTO `mc_fxrole` VALUES (5, '平台客服', 0, 1, '平台客服', 1347248900, 1427682083, 2);
INSERT INTO `mc_fxrole` VALUES (8, '测试角色', 0, 1, '测试', 1437461646, 1437461646, 1);
INSERT INTO `mc_fxrole` VALUES (9, '新闻广告管理员', 0, 1, '管理公司动态新闻，广告', 1457681630, 1457686172, 0);

-- ----------------------------
-- Table structure for mc_fxrole_user
-- ----------------------------
DROP TABLE IF EXISTS `mc_fxrole_user`;
CREATE TABLE `mc_fxrole_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` tinyint(5) UNSIGNED NULL DEFAULT 0 COMMENT '对应角色ID',
  `user_id` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of mc_fxrole_user
-- ----------------------------
INSERT INTO `mc_fxrole_user` VALUES (1, 1, NULL);
INSERT INTO `mc_fxrole_user` VALUES (5, 8, NULL);
INSERT INTO `mc_fxrole_user` VALUES (6, 1, 6);
INSERT INTO `mc_fxrole_user` VALUES (8, 1, 8);
INSERT INTO `mc_fxrole_user` VALUES (10, 9, 10);

-- ----------------------------
-- Table structure for mc_fxuser
-- ----------------------------
DROP TABLE IF EXISTS `mc_fxuser`;
CREATE TABLE `mc_fxuser`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称/姓名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `last_login_time` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '上次登录时间',
  `last_login_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录IP',
  `verify` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证验码',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态',
  `role_id` tinyint(4) UNSIGNED NULL DEFAULT 0 COMMENT '对应角色ID',
  `user_real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `user_home_tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `user_tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_fxuser
-- ----------------------------
INSERT INTO `mc_fxuser` VALUES (1, 'admin', 'admin', '82790085228cf8a1e3bac41f45271e5f', 1535335545, '127.0.0.1', '123456', 'admin@phpwsd.com', '超级管理员1', 1341301342, 1426065290, 1, 1, '管理员', '3233123', '321321', '321321');
INSERT INTO `mc_fxuser` VALUES (2, 'test', '测试', '1e37136e8bf026c6402cd3f08344587c', 0, NULL, 'EDdKFJ', NULL, 'beizhuaaa', 1457606119, 1457686094, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `mc_fxuser` VALUES (3, '测试', '测试', '7d8fb05849e5f57bf147ef26ee92d0c0', 0, NULL, 'cxNgzs', NULL, '测试股', 1457682198, 1457686640, 1, 9, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for mc_item
-- ----------------------------
DROP TABLE IF EXISTS `mc_item`;
CREATE TABLE `mc_item`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司简介 标题',
  `thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司缩略图(用于首页图片展示)',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `etime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_item
-- ----------------------------
INSERT INTO `mc_item` VALUES (1, 'PLATFORM PROFILE', '/imageuploads/thumb/1523583805.2923.jpg', '<div class=\"content\">\r\n	<h3>\r\n		公司概况\r\n	</h3>\r\n	<div class=\"about1\">\r\n		<div class=\"col-md-6 col-sm-12 col-xs-12\">\r\n			<img src=\"/statics/home/Default/images/about/about_02.png\" class=\"img-responsive\" /> \r\n		</div>\r\n		<div class=\"col-md-6 col-sm-12 col-xs-12\">\r\n			<div class=\"concon\">\r\n				<h4>\r\n					时和咨询（绩效工场）\r\n				</h4>\r\n				<p>\r\n					是国内一地一家是国内一地一家是国内一 <br />\r\n是国内一地一家是国内一地一家是国内一地一家是 <br />\r\n是国内一地一家是国内一地一家是国内一地一家是国内一 <br />\r\n是国内一地一家是国内一地一家是国内一地一家是国内一地一 <br />\r\n是国内一地一家是国内一地一 <br />\r\n是国内一地一家是国内一地一家是国内一地一家是 <br />\r\n<br />\r\n是国内一地一家是国内一 <br />\r\n是国内一地一家是国内一地一家是国 <br />\r\n是国内一地一家是国内一地一家是国内一地一家 <br />\r\n是国内一地一家是国内一地一家是国一家是国内一地一家 <br />\r\n是国内一地一家是国内一地一家是国内一\r\n				</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"clearfix col-md-12 col-sm-12 col-xs-12 clear-height\">\r\n	</div>\r\n	<div class=\"about2\">\r\n		<div class=\"col-md-6 col-sm-12 col-xs-12\">\r\n			<div class=\"concon\">\r\n				<h4>\r\n					公司发展\r\n				</h4>\r\n				<p>\r\n					200多起大可与与与，2000与与与与，20000与与与与与与与 <br />\r\n是国内一地一家是国内一地一家是国内一地一家是 <br />\r\n是国内一地一家是国内一地一家是国内一地一家是国内一 <br />\r\n是国内一地一家是国内一地一家是国内一地一家是国内一地一 <br />\r\n是国内一地一家是国内一地一 <br />\r\n是国内一地一家是国内一地一家是国内一地一家是\r\n				</p>\r\n			</div>\r\n		</div>\r\n		<div class=\"col-md-6 col-sm-12 col-xs-12\">\r\n			<img src=\"/statics/home/Default/images/about/about_03.png\" class=\"img-responsive\" /> \r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"content\">\r\n	<div class=\"about3\">\r\n		<h3>\r\n			公司定位\r\n		</h3>\r\n		<p class=\"col-md-12 col-sm-12 col-xs-12 des\">\r\n			<br />\r\n		</p>\r\n		<p class=\"row\">\r\n			愿景：愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景 <br />\r\n愿景：愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景 <br />\r\n愿景：愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景 <br />\r\n愿景：愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景 <br />\r\n愿景：愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景 <br />\r\n<img src=\"/statics/home/Default/images/about/about_04.png\" class=\"img-responsive\" /> 愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景愿景\r\n		</p>\r\n		<p>\r\n			<br />\r\n		</p>\r\n	</div>\r\n</div>\r\n<div class=\"content\">\r\n	<div class=\"about4\">\r\n		<h3>\r\n			我们优势\r\n		</h3>\r\n		<p class=\"col-md-12 col-sm-12 col-xs-12\">\r\n			<img src=\"/statics/home/Default/images/about/about_05.png\" /> \r\n		</p>\r\n	</div>\r\n</div>\r\n<div class=\"content dev-path\">\r\n	<div class=\"about4\">\r\n		<h3>\r\n			发展历程\r\n		</h3>\r\n		<div class=\"about4-bg col-md-12 col-sm-12 col-xs-12\">\r\n			<div id=\"timeline\">\r\n				<ul id=\"dates\">\r\n					<li>\r\n						<a href=\"#2017\"> \r\n						<h5>\r\n							2017\r\n						</h5>\r\n						<p>\r\n							乔迁\r\n						</p>\r\n</a> \r\n					</li>\r\n					<li>\r\n						<a href=\"#2016\"> \r\n						<h5>\r\n							2016\r\n						</h5>\r\n						<p>\r\n							获奖\r\n						</p>\r\n</a>\r\n					</li>\r\n					<li>\r\n						<a href=\"#2015\"> \r\n						<h5>\r\n							2015\r\n						</h5>\r\n						<p>\r\n							绩效工场\r\n						</p>\r\n</a>\r\n					</li>\r\n					<li>\r\n						<a href=\"#2014\"> \r\n						<h5>\r\n							2014\r\n						</h5>\r\n						<p>\r\n							蒋春燕 <br />\r\n绩效工场\r\n						</p>\r\n</a>\r\n					</li>\r\n					<li>\r\n						<a href=\"#2013\"> \r\n						<h5>\r\n							2013\r\n						</h5>\r\n						<p>\r\n							转型\r\n						</p>\r\n</a>\r\n					</li>\r\n					<li>\r\n						<a href=\"#2012\"> \r\n						<h5>\r\n							2012\r\n						</h5>\r\n						<p>\r\n							培训\r\n						</p>\r\n</a>\r\n					</li>\r\n					<li>\r\n						<a href=\"#2010\"> \r\n						<h5>\r\n							2010\r\n						</h5>\r\n						<p>\r\n							获奖\r\n						</p>\r\n</a>\r\n					</li>\r\n				</ul>\r\n				<ul id=\"issues\">\r\n					<li id=\"2017\">\r\n						<p>\r\n							Donec semper quam scelerisque tortor dictum gravida. In hac habitasse\r\n                                                    platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam\r\n                                                    ultrices mauris, eu consequat purus metus eu velit. Proin metus\r\n                                                    odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis\r\n                                                    est sed turpis sollicitudin venenatis sed eu odio. Praesent eget\r\n                                                    neque eu eros interdum malesuada non vel leo. Sed fringilla porta\r\n                                                    ligula.\r\n						</p>\r\n					</li>\r\n					<li id=\"2016\">\r\n						<p>\r\n							Donec semper quam scelerisque tortor dictum gravida. In hac habitasse\r\n                                                    platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam\r\n                                                    ultrices mauris, eu consequat purus metus eu velit. Proin metus\r\n                                                    odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis\r\n                                                    est sed turpis sollicitudin venenatis sed eu odio. Praesent eget\r\n                                                    neque eu eros interdum malesuada non vel leo. Sed fringilla porta\r\n                                                    ligula.\r\n						</p>\r\n					</li>\r\n					<li id=\"2015\">\r\n						<p>\r\n							Donec semper quam scelerisque tortor dictum gravida. In hac habitasse\r\n                                                    platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam\r\n                                                    ultrices mauris, eu consequat purus metus eu velit. Proin metus\r\n                                                    odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis\r\n                                                    est sed turpis sollicitudin venenatis sed eu odio. Praesent eget\r\n                                                    neque eu eros interdum malesuada non vel leo. Sed fringilla porta\r\n                                                    ligula.\r\n						</p>\r\n					</li>\r\n					<li id=\"2014\">\r\n						<p>\r\n							Donec semper quam scelerisque tortor dictum gravida. In hac habitasse\r\n                                                    platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam\r\n                                                    ultrices mauris, eu consequat purus metus eu velit. Proin metus\r\n                                                    odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis\r\n                                                    est sed turpis sollicitudin venenatis sed eu odio. Praesent eget\r\n                                                    neque eu eros interdum malesuada non vel leo. Sed fringilla porta\r\n                                                    ligula.\r\n						</p>\r\n					</li>\r\n					<li id=\"2013\">\r\n						<p>\r\n							Donec semper quam scelerisque tortor dictum gravida. In hac habitasse\r\n                                                    platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam\r\n                                                    ultrices mauris, eu consequat purus metus eu velit. Proin metus\r\n                                                    odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis\r\n                                                    est sed turpis sollicitudin venenatis sed eu odio. Praesent eget\r\n                                                    neque eu eros interdum malesuada non vel leo. Sed fringilla porta\r\n                                                    ligula.\r\n						</p>\r\n					</li>\r\n					<li id=\"2012\">\r\n						<p>\r\n							Donec semper quam scelerisque tortor dictum gravida. In hac habitasse\r\n                                                    platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam\r\n                                                    ultrices mauris, eu consequat purus metus eu velit. Proin metus\r\n                                                    odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis\r\n                                                    est sed turpis sollicitudin venenatis sed eu odio. Praesent eget\r\n                                                    neque eu eros interdum malesuada non vel leo. Sed fringilla porta\r\n                                                    ligula.\r\n						</p>\r\n					</li>\r\n					<li id=\"2010\">\r\n						<p>\r\n							Donec semper quam scelerisque tortor dictum gravida. In hac habitasse\r\n                                                    platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam\r\n                                                    ultrices mauris, eu consequat purus metus eu velit. Proin metus\r\n                                                    odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis\r\n                                                    est sed turpis sollicitudin venenatis sed eu odio. Praesent eget\r\n                                                    neque eu eros interdum malesuada non vel leo. Sed fringilla porta\r\n                                                    ligula.\r\n						</p>\r\n					</li>\r\n				</ul>\r\n			</div>\r\n<a href=\"javascript:;\" id=\"next\"> &gt; </a> <a href=\"javascript:;\" id=\"prev\"> &lt; </a> \r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"content\">\r\n	<div class=\"about5\">\r\n		<h3>\r\n			核心业务\r\n		</h3>\r\n		<p class=\"col-md-12 col-sm-12 col-xs-12\">\r\n			<img src=\"/statics/home/Default/images/about/about_06.png\" /> \r\n		</p>\r\n	</div>\r\n</div>', 1531816499);

-- ----------------------------
-- Table structure for mc_jobs
-- ----------------------------
DROP TABLE IF EXISTS `mc_jobs`;
CREATE TABLE `mc_jobs`  (
  `jid` int(11) NOT NULL AUTO_INCREMENT COMMENT '工作id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '招聘名称',
  `ndesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `people` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招聘人数',
  `status` tinyint(2) NULL DEFAULT 2 COMMENT '是否发布(1：发布2：未发布）',
  `edittime` int(10) NULL DEFAULT NULL COMMENT '修改时间',
  `listorder` smallint(5) NULL DEFAULT 255 COMMENT '排序',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作地址',
  `istop` smallint(3) NULL DEFAULT 1 COMMENT '1正常2招聘完成',
  PRIMARY KEY (`jid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 533 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_jobs
-- ----------------------------
INSERT INTO `mc_jobs` VALUES (518, 'JAVA开发工程师', '1-2年工作经验，熟悉SSH框架，MYBATIS/IBATIS等。拥有财务系统开发经验者优先', '<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;text-decoration:underline;font-family:\'宋体\';\">岗位职责：</span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1、&nbsp;接听客户来电，为客户提供业务办理及咨询服务，提升客户满意度。</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">3、&nbsp;&nbsp;以服务带动销售，在线营销增值服务产品</span><span style=\"font-size:10.5pt;font-family:\'宋体\';font-weight:bold;\">。</span><span style=\"font-size:10.5pt;font-family:\'宋体\';font-weight:bold;\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;text-decoration:underline;font-family:\'宋体\';\">岗位要求:</span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1、具备全日制大专及以上学历。</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">2、口齿清晰，普通话标准，声音亲切，无明显方言。</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">3、能熟练运用各类Word和Excel办公软件，打字速度不低于40字/分钟。</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">4、能够适应客服工作班次与工作地点的要求。</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">5、有良好的倾听能力和表达能力，能为客户提供适合的解决方案、有效解决客户问题。</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">6、具有一定的销售意愿。</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">7、能适应7×24小时轮班制。</span>\r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"><u>岗位薪资：</u></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">、社会招聘（已毕业）—基本工资：&nbsp;本科2880元&nbsp;专科2400元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 岗位工资： </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">96</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">0元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">绩效工资额度：首月</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">次月</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 无</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 第三个月</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">800</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">第四个月后</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">130</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">0元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">2、实习生—基本工资：本科1</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">9</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">50元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">专科1</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">5</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">50元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 绩效工资额度</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">：首月</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">100元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 次月200元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 第三个月500元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 第四个月1300元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"><u></u></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"><u>岗位福利：</u></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1、签订正式合同员工享受：</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">基本五险一金、交通补贴、免费早午餐、子女托费、员工商业保险、年度体检、年终花红（2-4个月固定工资）</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">2、实习生享受：</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">免费早午餐、员工商业保险、免费住宿。</span> \r\n</p>\r\n<p class=\"p0\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"><u>联系方式：</u></span> <span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1、地址：江苏省昆山市花桥国际商务城亚太广场5座；</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">2、电话：0512-86178363；86178367</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">3、邮箱：</span><span><a href=\"mailto:xut@vitalservices.com.cn\"><span style=\"font-size:10.5pt;font-family:\'宋体\';\">xut@vitalservices.com.cn</span></a></span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 网址：</span><span><a href=\"http://www.vitalservices.com.cn/\"><span style=\"font-size:10.5pt;font-family:\'宋体\';\">http://www.vitalservices.com.cn</span></a></span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 江苏汇通金融，期待您的加入&nbsp;！</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>', '若干', 1, 1411549107, 1, '江苏省扬州市', 1);
INSERT INTO `mc_jobs` VALUES (519, 'PHP开发工程师', '熟悉B2B/B2C等电商平台模式，熟悉THINKPHP,YII等框架。拥有大型电商平台开发经验者优先。', '<p class=\"p0\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;text-decoration:underline;font-family:\'宋体\';\">岗位职责：</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1、学习和熟悉现行的风险政策及相关业务流程，针对客户提交的申请资料进行审查，通过外拨电话联系客户进行在线信用审核和欺诈嫌疑申请的调查工作；</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">2、收集和整理工作中相关数据和案例；</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">3、完成分配的其它工作。</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;text-decoration:underline;font-family:\'宋体\';\">岗位要求：</span><span style=\"font-size:10.5pt;text-decoration:underline;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1、具有一定的学习能力和逻辑思维能力；</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">2、具有较强的责任心和团队合作精神；</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">3、良好的表达能力；</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">4、全日制大专及以上学历。</span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"><br />\r\n</span>\r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"><u>岗位薪资：</u></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">、社会招聘（已毕业）—基本工资：&nbsp;本科2880元&nbsp;专科2400元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 岗位工资：&nbsp;&nbsp;300元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">绩效工资额度：首月350元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 次月450元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 第三个月550元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 出</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">组后平均650-700元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">2、实习生—基本工资：本科1750元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"> </span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">专科1350元</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 绩效工资额度：300元/月</span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"><br />\r\n</span>\r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> \r\n<p class=\"p0\">\r\n	<u>岗位福利：</u>\r\n</p>\r\n</span> \r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1、签订正式合同员工享受：</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">基本五险一金、交通补贴、免费早午餐、子女托费、员工商业保险、年度体检、年终花红（2-4个月固定工资）</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">2、实习生享受：</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">免费早午餐、员工商业保险、免费住宿</span>\r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"><br />\r\n</span>\r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"><u>联系方式：</u></span>\r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">1、地址：江苏省昆山市花桥国际商务城亚太广场5座</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\">；</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">2、电话：0512-86178363；86178367</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\">3、邮箱：</span><span><a href=\"mailto:xut@vitalservices.com.cn\"><span style=\"font-size:10.5pt;font-family:\'宋体\';\">xut@vitalservices.com.cn</span></a></span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 网址：</span><span><a href=\"http://www.vitalservices.com.cn/\"><span style=\"font-size:10.5pt;font-family:\'宋体\';\">http://www.vitalservices.com.cn</span></a></span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;font-family:\'宋体\';\"> 江苏汇通金融，期待您的加入&nbsp;！</span><span style=\"font-size:10.5pt;font-family:\'宋体\';\"></span> \r\n</p>\r\n<p class=\"p0\" style=\"background:#ffffff;text-align:left;\">\r\n	<span style=\"font-size:10.5pt;text-decoration:underline;font-family:\'宋体\';\"><span style=\"font-size:10.5pt;text-decoration:underline;font-family:\'宋体\';\"><u></u></span></span> \r\n</p>', '若干', 1, 1411549142, 2, '江苏省扬州市', 1);
INSERT INTO `mc_jobs` VALUES (532, '数据库管理员', '拥有ORACLE,DB2等大型数据库运维经验，熟悉双机配置，性能优化，冷热备份。', NULL, '1', 1, NULL, 3, '江苏省扬州市', 1);

-- ----------------------------
-- Table structure for mc_jobs_jion
-- ----------------------------
DROP TABLE IF EXISTS `mc_jobs_jion`;
CREATE TABLE `mc_jobs_jion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `jid` int(11) NULL DEFAULT NULL COMMENT '工作id',
  `realname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1 男 2 女',
  `education` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历: 1 专科 2 本科 3 硕士 4 博士 5 博士以上',
  `linkphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '4' COMMENT '1 面试中 2 录用 3 未录用 4 未面试',
  `addttime` int(10) NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_jobs_jion
-- ----------------------------
INSERT INTO `mc_jobs_jion` VALUES (43, 519, '刘华翔', '1', '1', '1594908161', '443125267@qq.com', '3', 1411892771);
INSERT INTO `mc_jobs_jion` VALUES (33, 519, '倪妮', '2', '2', '18749081111', '22564@26.com', '3', 1407760652);
INSERT INTO `mc_jobs_jion` VALUES (74, 519, '唐雯', '2', '3', '15949081611', '443125267@qq.com', '4', NULL);
INSERT INTO `mc_jobs_jion` VALUES (75, 518, '刘华翔', '1', '2', '15949081611', 'liusirfcb@126.com', '4', 1459413865);
INSERT INTO `mc_jobs_jion` VALUES (76, 518, '刘华翔', '1', '2', '15949081611', 'liusirfcb@126.com', '4', 1459413868);
INSERT INTO `mc_jobs_jion` VALUES (77, 532, '刘华翔', '1', '2', '15949081611', '443125267@qq.com', '4', 1459413980);
INSERT INTO `mc_jobs_jion` VALUES (78, 532, '刘华翔', '1', '2', '15949081611', '443125267@qq.com', '4', 1459413982);
INSERT INTO `mc_jobs_jion` VALUES (79, 518, '王文安', '1', '4', '15949051611', '443125267@qq.com', '4', 1459414115);

-- ----------------------------
-- Table structure for mc_leanmessage
-- ----------------------------
DROP TABLE IF EXISTS `mc_leanmessage`;
CREATE TABLE `mc_leanmessage`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `leanname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言姓名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言',
  `uploadfile` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传文件地址',
  `addtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_leanmessage
-- ----------------------------
INSERT INTO `mc_leanmessage` VALUES (9, '刘华翔', '443125267@qq.com', '留言测试', NULL, 1459149404);
INSERT INTO `mc_leanmessage` VALUES (8, 'qeqe', '12345@qq.com', '13131413', NULL, 1458810635);

-- ----------------------------
-- Table structure for mc_link
-- ----------------------------
DROP TABLE IF EXISTS `mc_link`;
CREATE TABLE `mc_link`  (
  `link_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link_img` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link_type` tinyint(5) NULL DEFAULT 1,
  `link_static` tinyint(5) NULL DEFAULT NULL,
  `link_add_time` int(11) NULL DEFAULT NULL,
  `link_order` int(10) NULL DEFAULT 255,
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_link
-- ----------------------------
INSERT INTO `mc_link` VALUES (62, '三星大中华区', 'https://www.samsungshop.com.cn/', NULL, 1, 1, 1458892609, 5);
INSERT INTO `mc_link` VALUES (58, '百度', 'http://baidu.com', '/imageuploads/thumb/1458006641.2418.jpg', 2, 1, 1458892479, 1);
INSERT INTO `mc_link` VALUES (59, '阿里巴巴', 'https://www.1688.com/', NULL, 1, 1, 1458892514, 2);
INSERT INTO `mc_link` VALUES (60, '华为科技', 'http://www.huawei.com/cn/', NULL, 1, 1, 1458892629, 3);
INSERT INTO `mc_link` VALUES (61, '新浪科技', 'http://sina.com', NULL, 1, 1, 1458892621, 4);
INSERT INTO `mc_link` VALUES (63, '金蝶财务软件', 'http://www.830836.com/', NULL, 1, 1, 1458892688, 6);

-- ----------------------------
-- Table structure for mc_members
-- ----------------------------
DROP TABLE IF EXISTS `mc_members`;
CREATE TABLE `mc_members`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `headimage` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像路径',
  `job_position` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `teamid` int(11) NULL DEFAULT NULL COMMENT '团队ID',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 1 男 2 女',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `jobyear` int(5) NULL DEFAULT NULL COMMENT '工龄',
  `intime` int(11) NULL DEFAULT NULL COMMENT '入职时间',
  `outtime` int(11) NULL DEFAULT NULL COMMENT '离职时间',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态: 1 在职 2 离职',
  `is_show` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '是否首页展示: 1 是  2 否',
  `ygxs` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工心声',
  `addtime` int(11) NULL DEFAULT NULL COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司职员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_members
-- ----------------------------
INSERT INTO `mc_members` VALUES (8, '葛钰鹏', '/imageuploads/thumb/1458887401.4096.jpg', '4', 7, '1', '15544554455', 8, 1459353600, NULL, '1', '1', '在新思，我看到了不一样的未来。我愿意在这干一辈子！', 1459154420);
INSERT INTO `mc_members` VALUES (12, '孔繁荣', '/imageuploads/thumb/1523533332.8442.jpg', '1', 3, '1', '', 0, 1523462400, NULL, '1', '2', '而委屈委屈儿', 1523533333);
INSERT INTO `mc_members` VALUES (13, '王文安', '/imageuploads/thumb/1523533371.2433.jpg', '4', 3, '1', '32132321311', 12, NULL, NULL, '1', '2', '21', 1523533372);

-- ----------------------------
-- Table structure for mc_ncontent
-- ----------------------------
DROP TABLE IF EXISTS `mc_ncontent`;
CREATE TABLE `mc_ncontent`  (
  `nid` int(11) NOT NULL COMMENT '新闻id',
  `paginationtype` tinyint(2) NULL DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `maxcharperpage` mediumint(6) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_ncontent
-- ----------------------------
INSERT INTO `mc_ncontent` VALUES (15, 0, '<div class=\"article-sub\" style=\"padding:0px;margin:0px;color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<p style=\"text-align:justify;\">\r\n		本文转载自区块链酋长（ID:cmcmbc），最有态度的区块链市场研究分析新媒体，用数据深度解读区块链。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>前言</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		有人说，目前区块链行业火热，各种项目层出不穷，但真正有实际落地的却寥寥可数，甚至有极端言论说99%的区块链项目最后都将夭折。事实果真如此吗？这期区块链酋长(id: cmcmbc)就为您梳理一下目前全球区块链行业最牛的四个项目，通过对这些项目的梳理和总结，带您进一步了解区块链行业。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>为什么说这四个是目前最牛的区块链项目？</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		目前，区块链项目众多，酋长根据区块链产业链，将主要项目归为五大类，即数字资产、全球支付、金融、平台应用和底层技术。\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s1.51cto.com/oss/201804/12/f5d043b1a1c8269b9291f72efbedcccb.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		酋长认为，一个区块链项目牛不牛，由众多因素和指标决定，但是，如果综合融资规模、市值、用户规模等几个大的因素，可以从很大程度上反映出项目的水平，基于此，区块链酋长从五大类项目中的前四类中各选出了一个最牛项目（由于本酋长对区块链底层技术知识积累尚浅，故暂不对该类公司进行分析）。如果你对这些项目是否最牛有质疑，欢迎联系本酋长进行探讨。\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s4.51cto.com/oss/201804/12/7bc3de88d0bd1aa516da0bf592868011.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>Ethereum-目前市值仅次于比特币的数字货币</strong>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s1.51cto.com/oss/201804/12/00b81df17e051b4952e367a41c3968a6.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		比特币是大家最为熟知的数字货币，除此之外，目前比较流行的还有以太币、莱特币、瑞波币等等，据不完全统计，目前市场上的数字货币数量有1300多种，这些数字货币的主要作用是用来代表价值储存、交换媒介或账户单位。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		以太币在数字货币里，无论从用户规模还是市值，都是仅次于比特币的数字货币，以太币是由以太坊（Ethereum）发行的代币。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		以太坊项目发起于2013年底，以创始人Vitalik Buterin发布以太坊初版白皮书为标志。以太坊是全球第一个有实力的竞争币，相较于比特币，以太坊在交易速度、技术创新等方面优势突出，是全球第一个将虚拟机、智能合约引入区块链，开创区块链新时代的项目。整体而言，以太坊的简史可以大致分为诞生、迅速崛起与更新迭代三个阶段，目前还是处于第三阶段。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>诞生</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		以太坊项目开始于2013年底，是一个新的区块链平台，也同样是一个开放源代码的项目，相较于比特币，以太坊更加开放和灵活，它允许任何人在平台中建立和使用通过区块链技术运行的去中心化应用，不局限于数字货币交易。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		到2014年4月，以太坊社区、代码数量、wiki内容、商业基础结构和法律策略基本完善，在其发布的以太坊虚拟机技术说明黄皮书中宣布，以太坊客户端支持7种编程语言，包括C++、 Go、Python、Java、JavaScript、Haskell、Rust等。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		2014年7月24日，以太坊开放为期42天的以太币预售，最终售出60102216个以太币,共募集到31531个比特币，根据当时币价折合1843万美元，是当时排名第二大的众筹项目。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>迅速崛起</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		2015年7月以太坊发布正式的以太坊网络，标志着以太坊区块链正式上线运行，月底以太币开始在多家交易所交易，目前单个以太币的价格已经高达400美元。\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s4.51cto.com/oss/201804/12/c1a0944d772b056994c5e40a8e655eca.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>更新迭代</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		截至目前，以太坊项目已经占据区块链应用底层的半壁江山，这其中既有优于比特币的特性、以太坊抢占竞争高地带来的红利，也有包括摩根大通、微软、英特尔在内的大型企业组成的以太坊企业联盟（EEA）带来的正面效果。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		以太坊在高速发展的同时，一些问题也逐渐暴露，比如近期随着虚拟猫CryptoKitties上线造成的网络拥堵，以太坊是否能通过更新迭代改进系统交易速度与容量问题，将直接决定以太坊后续能走多远。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>InterLedger-基于区块链实现全球跨境支付的实践者</strong>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s2.51cto.com/oss/201804/12/76b1682bd87d2bbc8451a0871566663c.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		InterLedger是Ripple推出的一个跨账本协议，帮助银行间进行快速结算。Ripple成立于美国，是一家利用区块链技术发展跨境结算的金融科技公司。它构建了一个没有中心节点的分布式支付网络，以期提供一个能够取代SWIFT（环球银行金融电信协会）网络的跨境支付平台，打造全球统一的网络金融传输协议。Ripple的跨账本协议能让参与方看到同样的一个账本，通过该公司的网络，银行客户可以实现实时的点对点跨国转账，不需要中心组织管理，且支持各国不同货币。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>InterLedger项目背景</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		目前基于区块链的数字货币种类繁多，如果在不同的区块链直接通过数字货币进行价值转移和交换，会遇到一些问题，比如用户A想用手中的比特币从用户B那里买一个台电脑，但是用户B的电脑以以太币进行定价，不接受比特币，这时用户A就必须把手中的比特币兑换成以太币，在这个兑换的过程中，又会遇到数字货币价值不稳定的问题，会出现价值损耗，同时交易过程也很繁琐，正是针对这样的问题，Ripple提出了一种跨链价值传输的技术协议InterLedger。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>InterLedger</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		在InterLedger系统中，两个不同的账本系统可以通过第三方来互相转换货币。账本系统无需去信任第三方，因为该协议采用密码算法为这两个账本系统和第三方创建资金托管，当所有参与方对资金达成共识时，便可相互交易。“账本”提供的第三方，会向发送者保证，他们的资金只有在“账本”收到证明，且接收方已经收到支付时，才将资金转给连接者；第三方也同时也保证连接者，一旦他们完成了协议的最后部分，他们就会收到发送方的资金。这意味着，这种交易无需得到法律合同的保护和过多的审核，大大降低了门槛。\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s1.51cto.com/oss/201804/12/9312aeb0c12c6eb832086f8ff9a67584.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>市场表现</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		目前全球已经有17个国家的银行加入了 Interledger项目合作，此外包括苹果、微软在内的巨头公司均已接入，在今年1月26号，Ripple CEO Brad Garlinghouse 在首届中美区块链峰会上表示，未来Ripple会考虑进入中国，与中国人民银行等机构进行合作。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>Coinbase-美国第一家比特币交易所</strong>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s4.51cto.com/oss/201804/12/786b2e4852f0993072bf931417db82ea.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>成立</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		coinbase公司成立于2012年6月，它致力于让消费者更容易的使用比特币。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>主营业务</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		1、比特币钱包：最初提供比特币钱包服务，帮助客户存放数字资产。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		2、比特币交易所：2015年1月27日上午，Coinbase创建的美国第一家持有正规牌照的比特币交易所正式开张，为交易者提供加密货币交换或出售的服务。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>官方认证</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		2017年1月17日，纽约金融服务部门（NYDFS）负责人宣布，已通过比特币交易平台Coinbase的牌照申请，这意味着Coinbase在美国纽约州的经营终于获得了官方认证。Coinbase成立三年间获得了美国20个州的许可。\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s5.51cto.com/oss/201804/12/3aae4a61470197bc9c6abd18d5509d38.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>Coinbase已经成为比特币领域的独角兽公司</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		2017年6月，Coinbase称公司最新估值超过20亿美元。截止2017年6月，Coinbase 累计持有2780万个钱包，拥有840万用户，交易规模达200亿美元，覆盖32个国家。累计为超过万名开发者提供开发工具及服务，拓展Expedia（美国最大在线旅游平台）、Dell、Overstock（美国知名零售商）等46000家企业客户。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>核心产品</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>1、Coinbase-比特币交易所</strong>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s2.51cto.com/oss/201804/12/e447afb8fe0dc756551dc29e77bcc12d.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>2、Coinbase-比特币钱包</strong>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s2.51cto.com/oss/201804/12/197d6da8341236245b3465bfc36f7287.jpeg-wh_600x-s_563965170.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>3、Coinbase数字API平台</strong>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s5.51cto.com/oss/201804/12/1ddab99e20b660a6ccfaea9372fd169a.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>Steem-基于区块链的内容激励鼻祖</strong>\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s4.51cto.com/oss/201804/12/37a1c2ad4d194c38f96681bb0370827f.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>项目背景</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		用户为社交媒体带来大量流量和收入，却很少享受到平台发展带来的红利，传统的内容分发和版权交易流程中，无论内容生产者还是普通用户，多数都很难获得任何收益，Steem项目用加密货币奖励用户的方式来解决现有社交平台存在利益分配不合理的问题。\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		Steem是社交媒体网站Steemit发行的数字货币，用户在该平台发布内容（文章、图片、评论）后，根据用户的投票和评论等规则，可得到一种系统奖励代币Steem，简单来说，Steem是一个通过加密货币奖励支持社区建设和社交互动的区块链数据库。\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s5.51cto.com/oss/201804/12/168e466f0d7193b3837818821015d7d4.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>市场表现</strong>\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		截止2018年3月，Steem的注册用户数超过33万人。在最高峰时，Steem在coinmarketcap.com上显示市值曾高达12.7亿美金，但目前已经有了大幅回落，目前在4.5亿美金左右。目前Steem的价格在1.9美元左右。\r\n	</p>\r\n	<p style=\"text-align:center;\">\r\n		<img src=\"http://s4.51cto.com/oss/201804/12/2a397b8d19ca4bc919ffbcabaaa17acd.jpeg\" alt=\"全球最牛的四个区块链项目都在这里！\" />\r\n	</p>\r\n	<p style=\"text-align:justify;\">\r\n		<strong>总结</strong>\r\n	</p>\r\n</div>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	通过本期对几个区块链项目的梳理，我们发现，目前区块链技术已经逐渐应用到各行各业，无论是跨境支付还是金融交易亦或是媒体分发，在不同的细分场景下，已经有公司获得了大量用户和融资，本酋长认为，这些公司的技术和模式对区块链行业的后来者都有着积极的意义，比如Steem这种模式很多互联网公司就可以借鉴，通过区块链技术解决传统媒体分发的痛点。此外，整体看，区块链行业目前应用最多、最广的还是金融领域，包括支付、交易、贷款、保险等各种金融领域下的细分行业均在积极拥抱区块链，未来，随着区块链技术逐步适应监管政策要求，将成为监管科技的有力工具。\r\n</p>', 1000);
INSERT INTO `mc_ncontent` VALUES (16, 0, '<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	人工智能(AI)不是未来科技，它已经来到了我们身边。随着机器学习技术的创新继续推动基于人工智能的解决方案成为市场关注的焦点，投资者、技术分析师和未来有抱负的开发人员都试图把注意力放在这些智能机器能够做出回应的原因上，他们越来越来关注无线网络和人工智能技术的交集。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	那么，当无线网络和人工智能发生碰撞时会发生什么，以及今天有抱负的市场专家和数字专家应该做什么来为下一代机器学习做好准备? 了解机器学习如何彻底改变我们所知道的网络，并且我们该对未来做出怎样的改变以尽快适应人工智能驱动网络日益增长的趋势?\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<a href=\"http://s3.51cto.com/oss/201804/12/a40c62fa47b072081de17c8afb9a72e3.jpg-wh_651x-s_1486661150.jpg\" target=\"_blank\"><img src=\"http://s3.51cto.com/oss/201804/12/a40c62fa47b072081de17c8afb9a72e3.jpg-wh_651x-s_1486661150.jpg\" width=\"auto\" border=\"0\" height=\"auto\" alt=\"\" title=\"\" /></a>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong>网络的未来 </strong> \r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	网络已经经历了许多突然的、不可逆转的变化，但很快就会出现一波以人工智能驱动的创新浪潮，我们知道这与市场以前所见过的任何东西都不一样。简单地说，机器学习和无线网络的融合并不是在不久的将来发生，而是已经开始发生的事情。今天的无线网络需要收集和处理大量的数据，并且通常是通过相对低效的操作来实现的，而这些操作并不能保证数据的准确和有用，以便以后可以更好地减少运营成本。现在，感谢人工智能，这一切即将改变。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<a href=\"http://s2.51cto.com/oss/201804/12/f8289d37566c76b2d9f9b9ecf8ec4870.jpg\" target=\"_blank\"><img src=\"http://s2.51cto.com/oss/201804/12/f8289d37566c76b2d9f9b9ecf8ec4870.jpg\" width=\"auto\" border=\"0\" height=\"auto\" alt=\"\" title=\"\" /></a>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	特别回顾一下人工智能在通信网络和5G无线网络中的应用，你将会看到机器学习的基础是如何影响未来的开发者的。今天无线网络的“文书工作”占用了开发者大量的时间，这很快就会被自动化。也就是意味着，那些负责无线网络的技术专家将有更多的时间专注于那些在现代市场上仍然无法找到可行解决方案的创造性问题。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	自适应网络能够识别并解决困扰他们的问题，这将会自动并迅速成为常态，今天许多被指派去做维护无线网络的人，他们将会很快被分配到其他不那么自动化的任务中。未来最先进的通信系统仍需要有创造性的人力资源来帮助设计和维护它们，但是未来的无线网络将主要由计算机来运行，而这些计算机在处理这些网络上的大量信息时，要比它们的人类对手好的多。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	如果你研究一下今天的研究人员是如何依赖机器学习来分析现代通讯网络的，你就会看到未来的发展方向。未来的行业研究将完全由最擅长利用人工智能来应对他们所面临的任何挑战的公司和专业人士所主导，无线网络行业的创新也将会是这样，正如我们所知，这将很快由机器学习驱动的算法来实现。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>神经网络和更好的物联网只是一个开始</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	要真正理解无线网络和人工智能的交集，查看那些我们还不知道的东西，其实是很有帮助的。具体地说，通过深入研究新兴技术，比如更好的中立网络和低延迟的通信系统，这些系统能够以较小的成本处理更多的数据，你将能够更好地描绘尚未发现的中断情况，这将革新未来无线网络行业的基础。真的洞见未来是不可能的，但是，那些掌握无线网络前沿科技发展的专业人士，更难在未来被自动化所替代。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img alt=\"\" src=\"http://s1.51cto.com/oss/201804/12/6a307b8cdeadc2ccf81d1d3573fb34c6.jpeg\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	当然，你不需要成为一个绝对的技术专家来理解无线网络的基本知识，以及人工智能如何重塑它。如果你了解机器学习的基本原理，特别是在自动化重复性任务和构建智能算法的过程中，你将能够预见到未来的无线网络几乎完全由计算机驱动的解决方案来运作。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	不是所有的事情都是关于数据和无线通信基础设施的技术方面的。在人工智能和无线网络方面，日常用户的体验也将从根本上被颠覆。如果你能意识到机器学习技术已经开始被利用于为用户提供更好的无线体验，你将不太可能被未来类似的发展所震惊。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	人工智能具有不可思议的颠覆性，它常常让人感到恐惧，这要归功于围绕它的好莱坞大片制造的噩梦，但它有可能颠覆我们对无线网络的所有认识，这一点应该受到极大的欢迎。未来的通信系统将会因为人工智能而变得更好，那些开始研究它的开发者和投资者将会控制未来的无线网络。\r\n</p>', 1000);
INSERT INTO `mc_ncontent` VALUES (17, 0, '<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	科技界最近发生了一件事，这事儿还扯上了美国国防部，闹出了不小的风波。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	事情是这样的，谷歌员工发表公开信反对参与美国国防部的人工智能项目，已有超过 3100 人签名。这封公开信的诉求为：谷歌不应卷入战争，谷歌及其供应链生态永应不发展战争科技。请求公司撤出美国国防部项目 Project Maven。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s4.51cto.com/oss/201804/11/c3cee6992d4d35d747265780f70fedae.png-wh_600x-s_2410709296.png\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	外媒争先恐后对此事进行了报道：\r\n</p>\r\n<ol style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<li>\r\n		<p style=\"text-align:justify;\">\r\n			五角大楼使用 Google 的 TensorFlow API，以此来分析无人机镜头拍摄到的画面。\r\n		</p>\r\n		<p style=\"text-align:center;\">\r\n			<img src=\"http://s4.51cto.com/oss/201804/11/5f976c8c9e3cc6601d6143313510bebc.png-wh_600x-s_3600543792.png\" alt=\"\" />\r\n		</p>\r\n	</li>\r\n</ol>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<br />\r\n2. 谷歌控股母公司的执行董事会成员，该公司前执行董事长 Eric Schmidt，同时也担任国防创新委员会（Defence Innovation Board）的成员。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s5.51cto.com/oss/201804/11/5b0ef7fa8075360eedfdb6899221ae34.png-wh_600x-s_3236435966.png\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	3. &nbsp;美国国土安全部斥资 150 万美元与谷歌及其众包竞赛平台 Kaggle 合作，寻找新的算法来识别由机场安全机构扫描仪检测到的物体。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s4.51cto.com/oss/201804/11/07df4c5e2e690a2d692e9d21798c0cf6.png-wh_600x-s_2329558578.png\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	事件一出，立马有外部反对人士称，尽管公司应该听取员工的意见，但是员工也应该清楚，公司作为一个管理型组织，不应该用民主的方式决策。由此可见，反对人士的意见正好反应了他对谷歌文化的无知，“透明”是谷歌核心文化理念之一。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	什么是透明的企业文化呢？说白了就是文化氛围支持员工和高层管理人员进行各种形式的公开交流。很多企业就算有类似的形式，但是文化不支持，员工见了管理层也不敢说什么。确实，透明能培育出正直、负责和公开的文化，而不是企业员工间相互流传的猜测与猜疑。让团队之间充满了焦虑与不信任感。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	好的企业文化能够建立人与人之间彼此需要的连结，这种连结能够给人力量与生气。但也有分析人士在媒体中指出，熟知信件内容的多名谷歌员工仅在匿名条件下发声，这表示出他们可能还是担心被揪出来秋后算账。可是公开信发出后，超过 3100 人签名，证明员工对矛盾和冲突的认同度非常高，他们愿意参与、愿意讨论。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	谷歌员工敢这样明目张胆地和公司管理层唱反调，主要原因是谷歌员工觉得“自己不一样”。在收到公开信后，谷歌相关发言人给《纽约时报》的一份声明显示，首先认可员工与公司公开交流这一形式。将其定性为“非常重要而且有益”。但他并没有提到任何为该项目踩刹车的计划。声明也强调，五角大楼使用的技术可以用于“任何谷歌云服务的客户”，而且只会用于“非攻击目的”。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<img src=\"http://s5.51cto.com/oss/201804/11/b79505ad2c7c4deca3096b4f99d33dc5.png-wh_600x-s_2395747765.png\" alt=\"\" />\r\n</p>\r\n<blockquote style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<p style=\"text-align:justify;\">\r\n		谷歌发言人表示，我们长期与政府机构合作提供技术解决方案。这个特定的项目是国防部的试点项目，提供开源 TensorFlow APIs。该技术能够标记图像，并且仅用于非冒犯性用途。机器学习在军事领域的应用自然引起关注。我们正在内部和其他人积极讨论这个重要议题，因为我们将继续围绕开发和使用我们的机器学习技术制定政策和保护措施。\r\n	</p>\r\n</blockquote>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	我们透过谷歌员工公开信本身，来看看究竟是什么引发了谷歌内部的争论。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>美国国防急需拥抱硅谷科技公司</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	首先，美国国防部项目 Project Maven 背景了解一下。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	反恐战争中，恐怖组织通过购买而获得实施恐怖主义袭击所需要的技术，其对先进技术的使用引发美国国防部反思，尤其对比美国国防系统相对落后的信息技术。在 2000 年至 2008 年间，科技互联网技术的迅猛发展和美国国防信息技术的老态龙钟形成鲜明对比。美国国防部是知名的官僚机构，其官僚文化根深蒂固，创新的阻力和难度可想而知。“我们没有动力去拥抱风险。”类似这样的说法，早已是国防部各级人员的共识。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在此背景下，各类项目应运而生，希望能够打破僵化官僚与守旧文化，Project Maven 是其中之一。前文中提到的谷歌控股母公司执行董事会成员，同时也担任国防创新委员会的成员，这也可以被视为是美国国防部吸纳专业科技董事会角色的重要举措。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	为什么美国国防部的项目 Project Maven 会找到硅谷科技巨头谷歌公司？主要是为了获得前沿技术，需要商用技术创新来解决国防需求。其实美国国防部的思维也很简单，缺啥买啥呗，买买买，不差钱。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>人工智能战争算法首当其冲</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	目前，美国空军正在采取行动，将人工智能纳入其运作，美国国防部早已经发现人工智能技术满足军事情报的各项需求。他们的第一个项目就是 Project Maven，将使用人工智能和机器学习来快速筛选无人机拍摄的画面，收集有用的情报。早在 2017 年 4 月美国国防部常务副部长就签署备忘录推出 Project Maven，启动无人机全动态视频人工智能算法项目，以提高无人机视频处理、发掘与分发过程的自主化水平。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	这一项目利用人工智能算法，将无人机战场上获得的海量数据通过机器学习的方式进行分析与挖掘，转化为有价值的行动情报和军事洞见，开启了人工智能军事应用的先河，是美国国防部战场人工智能技术应用进程的重要里程碑。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s2.51cto.com/oss/201804/11/c317d38246f2e64ed6bcb58d274aaf43.jpeg\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	Project Maven 备忘录\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	目前让人头痛的问题是，分析人员需要花费大量的时间或者数小时来观看视频，以找到有价值的内容。如果项目成功应用成功，将会降低军事情报人员的时间成本。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	实际上，美国国防部对人工智能并不陌生：\r\n</p>\r\n<ul style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<li style=\"background:url(&quot;\">\r\n		<p style=\"text-align:justify;\">\r\n			2017 年 4 月，空军展示了一种能够自行运行的实验性F-16 战斗机。\r\n		</p>\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<p style=\"text-align:justify;\">\r\n			2017 年 5 月，美国海军陆战队开始测试一种遥控机枪机器人，并表示希望自动化。这均意味着美国希望在现在正在进行的人工智能军备竞赛中领先对手。\r\n		</p>\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<p style=\"text-align:justify;\">\r\n			Project Maven 被称为探路者型项目，也成为我们熟知的“试点项目”。\r\n		</p>\r\n	</li>\r\n</ul>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	美国国防部的态度已经表达得很清楚——全面拥抱人工智能。而谷歌员工明确公开反对参与的，也是项目 Project Maven。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s2.51cto.com/oss/201804/11/4fcaed596daff791a8ac20b5cb0a4aa4.png-wh_600x-s_3572932009.png\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<strong> 亚马逊、谷歌、微软抢政府订单</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在云服务方面，美国国防部也找硅谷科技公司合作，其中就包括谷歌。此外，亚马逊曾面向美国国防部不遗余力地宣传其图像识别研究成果，微软早前已与美国政府签订了云服务合同，能够为军事和国防机构处理机密信息。现在谷歌员工公开表示不接受美国国防部这一超级大客户的订单，而微软和亚马逊对于美国国防部的订单却是非常热情，两种情况形成了鲜明的对比。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<img src=\"http://s5.51cto.com/oss/201804/11/9cf39f36ca42fb2ff87eb06639485957.png-wh_600x-s_2705779500.png\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	为了云服务，美国国防部还你定了向科技企业采购云服务的专项计划——与企业合作型国防基础设施云服务（Joint Enterprise Defense Infrastructure Cloud）。美国国防部当然知道云服务在未来战争中的基础性重要意义，向拥有该技术的行业巨头购买无疑是最好的选择。问题在于是买哪一家，只买一家，还是几家一起买。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	该专项计划旨在使用云基础设施来实现标准化和提高安全性，帮助国防部门拥有更好的信息共享和计算能力，从最小作战单位到指挥官都能够利用成果在战争中获得实时信息，更好地为作战决策。值得一提的是，美国国防部在宣传这个专项计划的时候，提到了“减少作战人员伤亡”等。可众所周知，除了制造死亡机器外，国防部不会用它搞其他事情。而这次，国防部首席管理官约翰吉布森（国防部三号人物仅次于部长副部长）在回答媒体问题时，直言这次合作的部分原因是为了“提高杀伤力和作战准备”。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	另外有说法称，谷歌也会与亚马逊、微软竞争美国国防部开出的巨额订单。我们暂时无法确认这种说法是否属实，但可以知道的是，过去谷歌一直对采取军事项目持谨慎态度，并竭力避免成为军事工业的一部分，这种观念甚至成为公司不成文的共识。举个例子：2013 年，在收购了与军事研究机构有联系的机器人公司之后，谷歌曾拒绝了国防高级研究计划局（DARPA）的资金。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	一些业内观察人士还说，与企业合作型国防基础设施云服务计划旨在提供云服务解决方案，以支持国防部的非保密、秘密和绝密要求。而美国国防部开出的云服务订单，总额可能会达到 20 亿美元。大家可以脑补一下画面，美国某个科技公司在官网贴出写着“美国国防部云服务唯一合作伙伴企业”的宣传页，这看起来是不是很恐怖？科技公司参与战争，这宣传究竟是正面还是负面？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s5.51cto.com/oss/201804/11/0a3d07c2321893af06a7d7718d7465da.jpeg\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	美国空军想把人工智能技术引入到情报工作中\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	此外还有一点，中国的人工智能投资者也需要注意。负责国防情报局作战支持的主管曾向路透社透露，他们注意到类似的图像识别技术由硅谷科技公司研发，也会被军事敌对方所用。所以从 2012 年开始，研究机构（CB Insights）便开始追踪由中国投资、在美国发展的人工智能科技公司，数量达到了 29 家。这位主管还认为，当中国投资一家开发先进技术的创业公司时，美国需要承受机会成本，因为中国（投资方）可能禁止这家公司与美国国防部合作。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>总结</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	这封公开信会对谷歌内部造成多大影响还有待观察，谷歌与政府之间的微妙博弈肯定也还会持续。但关键在于，谷歌是否能探寻出科技公司的人工智能技术与现代国防军事的边界究竟在哪里，以及该如何对这样的边界加以控制。经常听人说科技没有国界，可军事的存在其实就是国界的存在，这将是一个上升到人类未来与科技未来的大议题。\r\n</p>', 1000);
INSERT INTO `mc_ncontent` VALUES (18, 0, '<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	日前，工信部旗下中国信息通信研究院发布了《2018年3月国内手机市场运行分析报告》。报告显示，2018年1-3月，中国智能手机出货量为8137万部，同比下降26.1%。其中，国产品牌手机出货量7586.4万部，同比下降27.9%。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	接下来，第二季度手机出货量会增加么?我认为，不仅很难增加，而且还会出现大洗牌，一些手机品牌将消失。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>份额向华为、OPPO等五大品牌集中</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	今年1月，国际市场调研公司CounterpointResearch发布的数据显示，2017年中国智能手机厂商出货量排名中，华为、OPPO、vivo、小米、苹果分列前五名，市场份额占比合计高达77%，2016年这一数据尚为67%。\r\n</p>\r\n<img alt=\"中国手机销量下滑28%，乐视和酷派已消失，下一个消失的是谁？-牛科技\" src=\"http://s2.51cto.com/oss/201804/11/f34b4711c57b161caeff19b91784870d.jpeg-wh_651x-s_3364878957.jpeg\" />\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	之所以份额出现集中，这与乐视、酷派和金立、魅族遭遇下滑有直接关系。乐视手机的消失，给小米手机提供了巨大的机会。金立因为盲目投资，导致资金链紧张，企业遭遇了大裁员。至今还在等资本救援。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	而魅族也传出裁员的消息，2017年裁员10%左右，2018年将继续裁员。这说明手机市场的竞争已经十分惨烈，品牌进一步向前五名手中集中，会加剧竞争的难度。\r\n</p>\r\n<img alt=\"中国手机销量下滑28%，乐视和酷派已消失，下一个消失的是谁？-牛科技\" src=\"http://s2.51cto.com/oss/201804/11/4d89f35725f963d15d45696fb88db409.jpeg-wh_600x-s_2595644484.jpeg\" />\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	前五大品牌，接下来的比拼主要是海外市场。谁能夺得海外市场的胜利，谁将继续保持出货量增加。所以无论是华为，还是小米，都疯狂的拓展印度等市场，这也是危机感的体现。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>第二季度，手机出货量仍难复苏</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	据 Canalys发布的一份最新统计报告显示，2017年中国智能手机市场年总出货量为4.59亿部，较2016年下跌4%，这也是中国首次出现智能手机年总出货量下滑的情况。\r\n</p>\r\n<img alt=\"中国手机销量下滑28%，乐视和酷派已消失，下一个消失的是谁？-牛科技\" src=\"http://s4.51cto.com/oss/201804/11/e3332759c15d320376ab0dc8acb008c0.jpeg-wh_600x-s_67576640.jpeg\" />\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	如果算上2016年，已经是接连七个季度出现手机销量下滑。2018年3月，vivo、OPPO、小米、华为、魅族，甚至锤子，纷纷发布新机。这些手机全都采用18：9的全面屏，模仿iPhone X的刘海设计，都宣称刘海比iPhone X更窄。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	手机企业一窝蜂的搞刘海屏手机，几乎没有差异化。一眼望去都长得一模一样，这种手机能否提起消费者的购买兴趣?显然很难。\r\n</p>\r\n<img alt=\"中国手机销量下滑28%，乐视和酷派已消失，下一个消失的是谁？-牛科技\" src=\"http://s4.51cto.com/oss/201804/11/6c34bb649e985912b9c09d8abf7b3e5a.jpeg-wh_600x-s_517746484.jpeg\" />\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	因为消费者不会为了一块并不美观的刘海屏而更换手机。首先，手机处理器、内存、屏幕、拍照等硬件配置已经到了瓶颈，2018年下半年那一波全面屏手机，甚至2018年初发布的新手机的硬件配置，仍然很新潮，运行速度流畅。\r\n</p>\r\n<img alt=\"中国手机销量下滑28%，乐视和酷派已消失，下一个消失的是谁？-牛科技\" src=\"http://s3.51cto.com/oss/201804/11/010fcc18aeae8eef4e167e0cf69e17e6.jpeg-wh_600x-s_1746728300.jpeg\" />\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	其次，手机软件、通信网络、应用方面没有新的突破。iPhone替代诺基亚成为领导者，是得益于3G网络的诞生与普及。而三星、华为们崛起，则依靠的是4G网络的普及。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	5G网络至今还未出现，手机OS、应用并未有革命性变化，硬件不需要为此升级。现在炒作的最多的是人工智能手机，但是噱头大于实用。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	而联想等手机企业去搞区块链手机，更是病急乱投医，投机倒把的做法难以成功。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	2020年的时候5G可能会发牌照，至少需要到2025年才会普及。5G能否带动手机大变革，这决定着手机更新换代。因此，现在手机市场是最艰难的时刻。进军印度、东南亚、俄罗斯、非洲等正在普及智能手机的新兴国家，或许是所有手机企业的必由之路。\r\n</p>', 1000);
INSERT INTO `mc_ncontent` VALUES (12, 0, '<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	摘要\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	本文目的，不在于指点财富升值，而是引导认知升级：帮助区块链零基础的小白快速熟悉十年来区块链技术的一些基本概念，以便探讨未来十年区块链领域的创业机会。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s3.51cto.com/oss/201804/13/7c45fb5dbb954e7bebcd5f74186d3ed3.jpeg-wh_651x-s_4284511202.jpeg\" alt=\"区块链概念最全解析：区块链的下一个十年什么样？\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	关于区块链的四个判断\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	相信大家对区块链技术的基本概念已经有所理解了，从这些概念出发，我们有四个基本判断：\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>一、区块链的颠覆之处，在于它解决了“信任”这个人性的问题，仅仅从技术角度出发，无法理解它的强大。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	一些原本彼此并不信任的人或者团体，各自出一台服务器，在大家彼此监督，大多数人遵守共识协议的情况下，能维护一份公认的记录——这就足以打开无穷的想象空间。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>二、区块链对生产力的改造存在被高估的倾向。抛开能够实现价值流动的“币”，仅仅考虑区块链对生产力的改造，其创新程度远远比不上人工智能。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	区块链其实就是一个分布式的数据库， 每个区块中保存的内容，相当于数据库中的表格，它和传统的分布式数据库的区别在于：\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	（1）参与者可以任意地加入，不需要许可；任意地离开，不影响系统运行\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	（2）数据库的内容对所有参与者公开\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	（3）以往的所有交易数据——即数据库的日志——永不删除\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	（4）高度冗余，高度可靠\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	（5）低效，需要多个确认，才能认为交易真的完成了\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	数字货币只是区块链技术的应用之一。从数据库技术角度看来，数字货币记账方式，和支付宝、微信支付记账的方式并无本质的不同，比特币交易的速度还很慢，大额交易一般都要等六个确认，时间达1小时左右。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	那么数字货币的优势在哪里？在于&nbsp;<strong>它们实现了比特世界中价值的低摩擦力流动&nbsp;</strong>。法币在比特世界中流动起来有非常大的摩擦力，发送方和接收方都要和公民的身份相绑定，有各种各样的限额，而且跨境流动非常困难。与之相比，多等几个确认的时间真是细枝末节的小事了。如梁斌博士所言：“<strong>&nbsp;财富的自由流动，不受限的自由流动是很多富人的终极需求，我想这是包括比特币在内的数字货币最核心的价值。”</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	但在数字货币的应用之外，&nbsp;<strong>作为纯粹可信数据库的区块链技术，目前看来，最先落地的应用很可能是“溯源”。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	例如天猫国际的全球溯源计划，主要是通过区块链、药监码等技术，运用大数据跟踪进口商品全链路，实现集生产、通关、运输等各方面信息于一身的目的，以期为各个跨境商品添加“身份证”。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	这类应用，&nbsp;<strong>传统的、中心化的、高可靠的数据库一样可以搞定，因此从生产力角度来看，区块链只提供增量式的进步，想象空间不大。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s1.51cto.com/oss/201804/13/c8e5a79df2507b28bc7da186d7571078.jpeg\" alt=\"区块链概念最全解析：区块链的下一个十年什么样？\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>三、区块链真正的想象力是对生产关系的“去中心化”改造。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>生产关系的“去中心化”有两种路线，一种是“无政府主义”，一种是“去中介化”&nbsp;</strong>。后面将从区块链的具体应用中展开讨论。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>四、和任何技术一样，区块链本身是中性的，它有可能用于作恶，也有可能促进经济、社会发展。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	从历史上讲，黄赌毒骗还有游戏，经常是最先应用新技术的领域。以区块链为基础的加密数字货币，就被走私军火、从事毒品、人口贩卖的暗网作为交易货币。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	另一个历史规律是，&nbsp;<strong>遏制新技术的发展从来不是解决负面应用真正有效的方法。&nbsp;</strong>在区块链技术已经兴起，大量资本和人才涌入的情况下，只有<strong>&nbsp;花更多力气发展有益应用，才能避免有害应用的流行。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	从整个人类历史的高度来看，如同郑渊洁所说：“某些高科技首先是为了军事目的而研制的，尔后才转为民用。说白了，就是先杀人，再养人……人类本身就是一个矛盾体。通过死，求得生存。通过战争，求得和平。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	如果区块链技术真的如大家想象的那么伟大，那它未来会带来多少美好，眼下就可能带来多少混乱。或者说，它眼下带来多少混乱，说明它未来就有潜力带来多少美好，想想核武器吧。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	无政府主义和价值流动的黑暗面\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	区块链的巨大想象空间，在于它对生产关系的“去中心化改造”。&nbsp;<strong>去中心化有两种路径，一是无政府主义的应用，二是在一定监管体制下的去中介化应用。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	前文提到，如果区块链技术真的如大家想象的那么伟大，那它未来会带来多少美好，眼下就可能带来多少混乱。我们首先来看看，从2017年开始的“区块链疯魔”中，我们短期内还可能看到多少混乱。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在无政府主义路径上，黄赌毒等，都可能用到区块链技术。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在赌博方面，网上赌场用比特币、比特币现金支付，早已不是新鲜事，例如老牌网站中本聪筛子（SatoshiDice）。它的工作流程是：一、用户给SatoshiDice的地址打钱，二、SatoshiDice掷骰子判断你是否中奖，三、根据输赢打钱给用户。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	掷骰子是非常基本也非常无聊的赌博手段，其实还有很多值得赌的。例如某场球赛的比分，某球员是否能进球，川普能否连任总统，某对明星夫妻何时离婚。难保没有其它的去中心化赌场去从事这些业务，技术上一点儿也不复杂。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	网上赌场非常容易实现去中心化，SatoshiDice的网站可以被轻易封掉。但只要大众都已经拿到了它的公钥，它就能通过各种渠道把用于赌博的数字货币地址广播给大家，并且通过签名技术确保这些地址没有被渠道篡改。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在“黄”方面，区块链技术的用途是可以冲破信息审查。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	以往，互联网只有信息的流动，没有价值的流动（或者流动起来摩擦很大），只有复制，没有交换（因为无法确权）。互联网上信息的传播是中心化的，微信、微博、直播、快手，无不如此。因为商业模式是：“数据传输本身免费，靠广告变现”。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	如果数据传输本身可以通过赚取数字货币来盈利，任何做数据中继的节点都有钱赚，信息的流动就可以变成去中心化的。这里面的技术实现起来并不困难。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	试想一下，微信、微博、直播、快手这样应用，如果有了去中心化的，信息全球流动且不受审查的版本，它们的杀伤力会有多大？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	最近，区块链还成功地应用在“骗”上。方式就是ICO、IFO、IMO等，其中有大量虚假项目和泡沫，对社会造成了很大的困扰。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s1.51cto.com/oss/201804/13/db160e72932a3a1990c3c5c842e6c688.jpeg\" alt=\"区块链概念最全解析：区块链的下一个十年什么样？\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	去中介化，“最不坏”的选择\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	有一种观点，认为人类大部分经济活动都可以通过区块链进行，人类现有的大部分组织都可以被区块链代替，包括国家，最终会建立一个无国界的新世界。听起来好刺激，但是这样一个新世界由谁来建立？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	· 如果这个新世界将由现在币圈和链圈的大咖建立，你会相信吗？你会愿意吗？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	· 如果这个新世界由最擅长推广“信”的宗教势力建立，你会相信吗？你会愿意吗？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	· 如果未来强势、先进国家主导的区块链，逐步渗透到弱势、落后国家的经济活动中，最终建立了这样一个新世界，你会相信吗？你会愿意吗？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	我们预计，&nbsp;<strong>还是最后一个的可能性更大，而且相比较而言，在上述三个可能性中，它是最“不坏”的那个。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	去中介化，说白了就是看现在的互联网巨头不爽，要斗地主分田地。有一段话：“Uber - 世界最大计程车行，却没有自己的车。 Facebook - 世界最红的媒体，却没有自创的内容。 Alibaba - 世界最大量交易的商场，却没有自己的库存。 Airbnb - 世界最大住宿提供者，却没有自己的地产。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	此话真的是在赞扬这些平台公司吗？还是有莫名的情绪在里面？举例而言，Alibaba，它可以很自豪地说靠一己之力把中国带入了电子商务时代；但从另外一个角度讲，我们也可以说tmall.com和1688.com上众多商家苦哈哈，才养活了一家阿里风风光光。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	平台型公司，连接消费者和生产者（无论生产的是信息、实物还是服务），然后利用这个“连接”来赚钱。它们从供需双方那里赚的钱越多，意味着供需双方所付出的显性和隐性的成本也越多。如果成本过高，人们必然希望有新的解决方案。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>这是区块链的主要优势：成本。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	从技术上讲，去中心化的区块链上跑的去中心化的数据库，在功能上只会小于等于中心化平台所拥有的中心化数据库；区块链可以实现的功能，中心化平台一定可以实现。&nbsp;<strong>区块链要想成功，就必须有成本优势。&nbsp;</strong>具体降成本的方式有很多，例如机器替代人工，砍掉垄断利润等。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s3.51cto.com/oss/201804/13/0de944ef8146dd7b49601be10a83ec71.jpeg\" alt=\"区块链概念最全解析：区块链的下一个十年什么样？\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	从这个角度讲，&nbsp;<strong>用区块链的技术挑战某个巨头，就算斗地主成功了，你也远远不会成为另一个地主，&nbsp;</strong>你赚的钱会比巨头曾经赚的钱少非常多，否则谈何低成本？区块链属于使用链的每一个人，底层代码的开发者也无法控制它，一味独断专行地控制的话，链就会分叉。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	但从另外一个角度讲，&nbsp;<strong>区块链的创业者，也不必害怕巨头来抄袭&nbsp;</strong>，因为这是要砍掉它们自己赚钱的命脉，自我革命。（除了百度，它的确可能抄袭。因为百度在移动互联网时代没有混成任何一种平台，眼看就要落魄成富农了，亟需突围。富农弄不好会是斗地主的急先锋。）\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在成本之外，&nbsp;<strong>区块链的优势还有“诚信”&nbsp;</strong>。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	平台为了牟利，必然会利用供需双方的信息不对称来隐瞒甚至作假。例如携程会利用顾客对它的信任来“杀熟”，广告平台会伪造点击率，视频平台会伪造播放次数，等等。&nbsp;<strong>区块链上的所有数据都是公开的，没有作假的余地。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>还一个优势是“开放”。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	平台垄断了供需双方的数据，自己依赖数据做大数据分析，提供服务。信息被平台分割成了孤岛，大数据分析因此受限。另外由于缺乏竞争，平台所开发的分析算法也未必是最优的。链上的数据开放之后，会有很多第三方的公司，根据多个链的大数据分析结果，提供为供需牵线搭桥的服务，它们彼此竞争，看谁的算法最优。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	总结一下：&nbsp;<strong>提供平台巨头一样的服务&nbsp;</strong>，自己写的底层代码在链上有等效于法律的意义（代码即法律的说法都听说过了吧），<strong>&nbsp;解决诚信问题，促进数据开放，自己不赚太多的钱。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	等等，这个事情听起来像是商业公司做的吗？亦或是行业协会或者政府该做的？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	这些问题太深奥，说不清。但为民造福肯定有价值。但行好事，莫问前程，接下来我们说说“去中介化”的一些具体创新场景。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s4.51cto.com/oss/201804/13/fcae4c2d728cfafeb011eb9fc791eb97.jpeg\" alt=\"区块链概念最全解析：区块链的下一个十年什么样？\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	区块链创业机会\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>1.广告之痛</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	比起前互联网时代，衣食住行的体验改善了很多，但广告依然像从前一样讨厌，几大痛点一个也没有解决&nbsp;<strong>：一、广告很难看，而且总在你不想看到它的时候出来；二、推来的广告根本不感兴趣；三、广告主不知道广告是否推给了合适的人；四、广告主不知道点击是不是伪造的。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	广告的“去中介化”，意味着厂商、广告制作者、观众三者直接互动，厂商只向制作者和观众付费。“媒体做广告”这件事情，被排除在系统之外。如何用区块链来实现这个目标？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	首先，&nbsp;<strong>让观众看广告是可以收钱的，而且可以自己挑那些自己感兴趣的，或者给钱多的。为了让厂商可以给观众发钱，这个链上要有一个代币。&nbsp;</strong>考虑到政策的接纳程度，所有用户要经过实名认证；代币要锚定人民币，而且只能是人民币换代币，代币可以消费，普通观众无法将其提现为人民币。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	其次，&nbsp;<strong>观众有了代币，自然就要有个钱包来保存代币，有钱包就意味着有一个私钥，这个私钥用做数字签名。&nbsp;</strong>用私钥给观看记录签名，就表示这个广告是被真实的用户观看了。在区块链上，丢失私钥相当于丢失了身份，你账目下的钱会被人花掉；别人用你的私钥给一段言论加了数字签名，就相当于你发表了该言论。要教育用户千万不可以把私钥交给旁人。这就避免了不法之徒搜集众多用户的私钥来伪造观看记录。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	再次，&nbsp;<strong>广告制造者可以是任何人，甚至可以是平头百姓。&nbsp;</strong>厂商自己准备一些硬广，广告制造者生产各种软广，并且从厂商那里获得很多一次性的硬广链接，插入到软广中。观众点击硬广链接并且用私钥对观看记录签名后，厂商向用户和广告制造者支付费用。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	最后，&nbsp;<strong>用户真的购买了某产品之后，用自己的私钥给购买记录签名，传到链上，证明自己是有购买力的观众。&nbsp;</strong>如果是在链外的其它平台上购买了某产品，厂商也会把购买记录在通过那个平台上的留言等机制把购买记录的Token发给用户，请他签名后更新到链上。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在这个系统中，&nbsp;<strong>提供服务者，直接向被服务的对象收费，没有扭曲，&nbsp;</strong>没有“羊毛出在猪身上”。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在链上的商家和用户都要付出一定的会员费，用来奖励链的基础代码开发者，以及奖励运行链的众多服务器节点，作为它们挖矿的收益。&nbsp;<strong>每一笔上链的交易，要支付一定的费用来奖励这些负责记录交易的服务器节点。&nbsp;</strong>用户收看广告，需要直接向CDN提供商按流量付费。软广制造者向商家收费，如果软广做得实在是好，还能拿到用户的打赏。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	这个系统中，还会有很多广告推荐商，根据你观看广告、采购商品、打赏广告制作人的记录，来做大数据分析，推荐广告给你看。这些推荐商所能看到的数据是一样的，彼此比拼算法。硬广链接中可包含推荐商的信息，推荐商据此向商家收费。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	厂商想在短时间内让某产品家喻户晓，只需烧钱把给用户的奖励金提得足够高。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>2.内容</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	如今内容提供商，无论它提供的是音频、视频还是普通图文，基本上盈利模式都是靠广告。广告去中介化之后，内容提供商要么转型为软广制作商，要么直接把自己的产品作为商品来销售，要么采用二者的混合。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	例如电视剧制作商，可以免费提供内插了很多硬广链接的视频，也可以销售纯净版的高价视频，或者销售只插入了少数硬广的低价视频。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	为了保护内容不被盗版和篡改，内容提供商所提供的文件中，内置了Javascript脚本，脚本运行在受限的执行环境中，验证自身没有被CDN节点篡改，验证呈现内容的平台具有HDCP等版权保护措施，不会被录音录屏。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	有些小的内容提供者，比如微博的博主，每条信息都很短，如何收费呢？每条收费1分钱估计都有人嫌多，但人民币的支付单位最小也就是一分钱。这个时候，用户向他们支付的费用，用抽奖券代替。比方说每个奖券有千分之一的几率可以抽到一块钱代币。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s3.51cto.com/oss/201804/13/dd8876ffa030c192176a1bbb0f4e511f.jpeg\" alt=\"区块链概念最全解析：区块链的下一个十年什么样？\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>3.零售</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	上面描述的这个链，直接在上面做零售是顺理成章的，每个硬广里面都可以内置订购链接。订购的网站是商家自己的，UI自己设计，只需把订购的信息放在链上，受公众监督。&nbsp;<strong>未确认的交易资金被淘宝保管这一行为，被链上的锁币操作替代。</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	客户可能不希望透漏自己在哪家商户采购了商品（例如情趣商店），这个时候，零知识证明等手段，可以用来保护用户的隐私。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	客户购买了商品之后，什么也不说，相当于好评。如果想要差评，需要自掏手续费在链上刊载抱怨商家的言论。有实名交易的差评，节点才会打包到区块内。如果客户实在太喜欢这个商品了，就自己去做软广，或许还有机会赚到钱。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>有了区块链上的智能合约支持，还可以玩预售&nbsp;</strong>。商家承诺说某个日期发货，客户付少量订金承诺说那个时候我必然花钱，任意一方违约，都要付出违约金，而且违约金是自动扣的。客户不想要货的话，还可以把合约转让给其他人，避免违约金。这样一来，还没有养大的猪，还没有收获的水果，刚刚设计好但拿不准会不会大卖的衣服，都可以提前试试水温。这种机制可以有效地指导产品的生产，没人愿意买预售合约，说明产品到时候必然卖不出去。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>4.社交</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	有了CDN的支持，每个人都可以委托一家CDN把自己给朋友的加密信息路由过去，如果和朋友不在同一家CDN服务商，那么CDN服务商之间的信息中转成本由它们彼此谈判消化。这就形成了去中心化的社交网络，CDN服务商之间通过信息路由的用户体验来竞争，每个人的公钥就是自己的帐号，适用于所有的CDN服务商。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	朋友圈的功能类似于微博，需要把发圈的人当作内容提供商来看待，你发的内容别人要付费的，哪怕一条只有0.1分。你发的太频繁，人家就屏蔽你了。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	微信群的功能，通过给群里所有人都发信息来实现。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	这里要澄清一个误区，很多人认为加密的聊天工具就是给恐怖分子、不法之徒提供服务的，因此聊天工具不应该使用公钥私钥的机制，最好直接传送明文或者至少在服务器端保存明文——大错特错。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	借助现有的社交工具，传递完全加密的信息非常容易：把加密后的信息嵌入到图片中，对方从图片中抽取信息再解密——这样，外人看起来就是一个充斥了各种表情包和自拍照的普通聊天群，里面的人其实在讨论袭击地铁。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	作为公民，使用加密技术保护自己的隐私，公开发表符合法律的言论，是基本的权利，如果这些权利通过阳光的渠道无法行使，那么，由数字货币驱动的去中心化版本社交工具就会大行其道，这算是21世纪的“道路以目”。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s2.51cto.com/oss/201804/13/578bf5a1f671f0259d644991b4af385b.jpeg\" alt=\"区块链概念最全解析：区块链的下一个十年什么样？\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>5.基于公钥私钥的身份</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	我们把眼光再放得更远一些，畅想一下未来至少十年之后，强势的、先进的政府，会怎样来通过区块链，对那些弱势的、落后的国家，进行经济渗透？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	我们知道，美国绿卡非常难以获得，公民身份更难（但比获得中国公民身份还是简单很多了）。但是，当美国公民的很多经济活动在链上进行之后，和美国公民有经济往来的其它国家的公民，不可避免地也会跑到这条链上来，他们可以非常容易地在链上拥有一个身份，只需一对公钥私钥。这个身份比起美国绿卡要差很多很多了，但他依然可以在链上拥有美元代币和自己的信用。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	两个委内瑞拉人，如果都在美元的链上，他们可以通过美元代币进行交换和经济活动。一家马拉西亚公司和一家菲律宾公司，可以直接在美元的链上通过智能合约来签订合同。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	如果世界上没有另外一个数字化的货币来挑战数字化的美元的话，那么美元必然会变得比今天更加强势。未来，谁能挑战美元？你看好比特币吗？还是看好另外一个数字化的法币？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	享受区块链红利的正确姿态\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	最后，给想借区块链概念投资赚钱的人一个非常稳妥的建议。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	2017年下半年开始，随便什么垃圾的股票，沾上区块链的概念，立刻可以一飞冲天。这种状况是人群非理性的突出表现。对于理性的人而言，究竟买什么股票，可以无惧任何兴衰沉浮，100%地享受到区块链未来发展的红利呢？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	答案很明显：第三代区块链解决方案——链接移动端的区块链\r\n</p>', 1000);
INSERT INTO `mc_ncontent` VALUES (13, 0, '<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	对于很多人来说，比特币似乎是个快速发家致富的新路子，因为买几台矿机就可以获得数字货币。尤其去年比特币创下了价格新高，有太多人不惜一切地去“挖矿”，成为了“矿工”。虽然最近一段时间数字货币行情低迷，但是各种贩卖矿机的卖家和想要成为一名矿工的买家，依旧不在少数。此时，就有一部分黑客，盯上了大家所用的电脑，通过非法手段，利用普通用户的电脑进行数字货币的挖矿牟取暴利。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<a href=\"http://s2.51cto.com/oss/201804/12/dbd6f6831ab0d3b02d16871f0e3311e1.jpg-wh_651x-s_3881995829.jpg\" target=\"_blank\"><img src=\"http://s2.51cto.com/oss/201804/12/dbd6f6831ab0d3b02d16871f0e3311e1.jpg-wh_651x-s_3881995829.jpg\" width=\"auto\" border=\"0\" height=\"auto\" alt=\"挖矿工：教你三招防黑客\" title=\"挖矿工：教你三招防黑客\" /></a>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	挖矿是每天定量投资比特币的一种方式，一次投资，长期收益，只要你的机器正常运行，每天都会产生一定量的币，收益源源不断，鉴于挖矿这种蓄能式的投资属性，并不是每天去卖币，主要以屯币为主，所以不用每天盯盘关注时时币价，正常的生活和工作不受影响，让赚钱变的轻松愉快。而等到币价后期上涨，手里也屯到一定量的币，你就有足够的筹码来交易变现。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>瞄准企业庞大的电脑数量</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	英国国家网络安全中心(NCSC)4月11日发布报告称：2017年12月，全球55%的企业受到过数字货币矿工的影响。因为企业当中有大量的电脑可以用来挖矿，研究人员在过去 6 个月内追踪了一个挖矿团伙，他们居然利用 1 万台感染了挖矿恶意软件的电脑，挣了 700 万美元。“除了控制个人用户的电脑，企业电脑也成了黑客的目标。这些恶意软件则主要通过广告软件、破解游戏和盗版软件传播。”研究人员在报告中写道。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>网吧也成为黑客挖矿重灾区</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	对于黑客来说，只要有电脑的地方，就可以为自己挖矿。360互联网安全中心发现，多款网吧视频播放软件存在挖矿行为，这些软件占用网吧计算机资源挖取数字货币，不仅严重影响计算机的正常工作，造成机器性能下降，耗电增加，而且长时间挖矿还会缩短硬件使用寿命，极大增加网吧运营成本。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img alt=\"挖矿工：教你三招防黑客\" src=\"http://s3.51cto.com/oss/201804/12/8865256aeee831714dd4fa56ab232e9d.jpeg\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	挖矿程序使用多个不同的虚拟货币钱包地址。以门罗币为例，黑客就使用了数十个不同的门罗币钱包地址，这些钱包中的门罗币数量为1个到200个不等，总价值超过百万人民币。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>你的电脑也可能正在为黑客挖矿</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	有网友表示，自己每次打开谷歌浏览器，电脑的CPU使用量就暴增，其实是黑客利用网页中嵌入的一段JavaScript脚本，就可让访问该网站的电脑，使用CPU资源，为它进行虚拟币挖矿。在世界各地的星巴克里，你都能看到带着笔记本“蹭网”办公的人。去年12月，黑客盯上了这些人，他们居然将星巴克里的笔记本，变成了自己的矿机。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	目前的行情来看挖矿收益不高，甚至有些散户已经造成亏损，但在专业大型矿场集中挖矿是很难亏本的。挖矿一个是需要机器设备成本和电价成本，随着比特币行情的低落，机器成本也一再降低，而大型矿场里面电价也是极其低的，所以选择在大型矿场里面挖矿收益在未来很长时间里会高于成本的，在币价上涨之后收益则会更高!\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img alt=\"挖矿工：教你三招防黑客\" src=\"http://s1.51cto.com/oss/201804/12/956fe47568f882d61d50aba9bfbe0814.jpeg\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	专家表示，黑客把Monero挖矿病毒上传到知名文件共享网站。接着黑客发送垃圾邮件给普通用户，邮件中包含下载链接，有些用户就会不小心下载运行病毒。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	以下小编想说一下心声　投资矿机托管业务，比起自建矿场来说，是有一定的优势的。首先，一定程度上省去了时间成本，可以立即开始挖矿业务，其次省去了不必要的开销，比如人工成本，由于托管业务是将多个投资者的矿机集中在一个矿场里的，所以人工成本是所有投资者共摊的。最后还有更加低廉的电价，托管企业开展矿机托管业务的最终目的还是为了盈利，如果拿不到低于市面上正常的电价的话，托管企业是很难盈利的，当然给到投资者的电价当然也会低于市面上的正常电价。还有一个相当重要的优势就是，一些托管企业是能够将投资者矿机所挖到的虚拟币直接进行兑现的，这样也免除了一些投资者担心无法将虚拟币变现的忧虑。\r\n</p>', 1000);
INSERT INTO `mc_ncontent` VALUES (14, 0, '<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“但也只有‘看不到的前途’了，钱是没有的”，近日，一位名叫张俊的读者发来消息告诉懂懂笔记，他入职了一家区块链企业后，发现其业务内容缺乏实质，而且工作的前三个月不发工资。对此，公司的解释是：若三个月后融资到位，方全数补齐，外加期权奖励，让他实现财务自由。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“我现在很焦虑，要是两三个月后，公司就跑路，那不就成‘杨白劳’了嘛。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	那么，透过张俊的经历，我们看到的是怎样的区块链行业招聘用人乱象？看似火热的区块链创企岗位，又有多少不为人知的秘密？\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>区块链招工“套路”多，“财务自由”成幌子</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s5.51cto.com/oss/201804/12/506d815b4ad3b54e75fb76982470e135.jpeg\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“最近找工作太难，要不然也不将就了”，张俊有三年策划工作经验，年前辞职后，一直在寻找新的工作机会。由于上述这家区块链创企所在创客空间，距张俊租住的出租屋仅有两站地铁，所以他有些心动。然而，前三个月可能没有工资，这不啻为对他职业信心的一种考验。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“按道理，我该直接拒绝这份工作邀请，但对方描绘的未来，实在太吸引人了”，张俊告诉懂懂笔记，这家区块链创企的负责人十分肯定地告诉他，会把未来职业发展规划帮他“安排”好。而且，只需三五个月，待项目有资本进场，所有一起创业的创始合伙人，都可以获得分红和套现，实现“财务自由”。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	对于大部分人来说，职业生涯的最终目的，莫过于能够实现财务自由。张俊考虑了几天后，还是决定到这家创企上班。“（财务）自由不敢明着想，但应该会比打工自由吧。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	然而，成为区块链“创业者”的第一天，他就已经后悔了。他告诉懂懂笔记，这家所谓的创企，实际的办公区域并不大，团队规模也只有两三个人，更没有任何制度规范与约束。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“干，就一个字。一开始我每天都要策划两到三个产品的推广方案。”张俊说，所谓的“产品”，其实就是公司自创的“数字货币”，推广为的就是能够募集更多的散户、机构认购。至于多级代理“拉人头”机制，更是有资金盘骗局的嫌疑，“上了几天班之后，我现在很纠结要不要继续做下去。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	对于求职者而言，区块链的确是朝阳行业，何况是以区块链项目的“合伙人”身份入职，更是令人难以拒绝，甚至在一定程度上，代表了美好的未来与无限的财富。然而，过于“虚”的业务内容，也让入行者不禁担忧职业的前景。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	而且，担心区块链项目前景的，还不只是被“财务自由”诱惑入行的从业者。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>招聘背后，连租办公场地的钱都能省则省</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s4.51cto.com/oss/201804/12/e8062df025b6f378abff52e844cec4b4.jpeg\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	招聘之外，区块链的虚火还体现在创客空间的租赁上。“最近租办公室的，很多是区块链（创企），都不想接了”，张小彤是深圳龙华一家创业孵化器的招商经理，她向懂懂笔记抱怨道，从去年底开始，陆续有区块链创企前来询租办公空间，而且过了年之后，入驻孵化器的区块链公司也渐渐多了起来，比例甚至接近 80%。“就拿上个月来说，进来的五家中，有四家是做区块链的，一家技术，一家游戏，两家代投。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	而南山一家创客空间的负责人张海明，也证实了小彤的说法，他甚至觉得入驻企业中，区块链占比 80% 的数字太过于保守了。据他透露，这半年来，已经入驻空间，并开始营业的新企业中，有九成半都是区块链企业，而且这些企业里，大部分都倾向选择租金较为便宜，可以灵活短租的微型办公室，实用面积都在 15㎡以下。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“虽然空间的生意是好了，但我很担心后面的风险。”据海明了解，出现区块链创企“扎堆”入孵现象的，并非只有他所负责的创客空间，许多租金较低廉的产业园区，大都出现了这样的情况。而这让他和部分同行都感到忧虑，“前年很多小贷公司涌进各大产业园，然后忽悠了钱之后就跑了，留下一堆麻烦事都要我们管理方来善后。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	对于产业园的管理方来说，他们担心当年小贷“泡沫”所造成的创业“虚假繁荣”，会在区块链领域再次重演。倘若如此，在“泡沫”破裂之后，拖欠的租金、苦主的追讨、遗留的办公设施等等问题，都无时无刻困扰着他们。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“如果光是拖欠租金倒还好，最担心的是这些区块链企业和小贷一样，从事违法勾当，最后我们还得配合相关部门调查。”说起这个话题，小彤似乎有很多抱怨，她告诉懂懂笔记，作为孵化器、创客机构，本应该要积极拥抱变化。区块链作为当下最热门的创业主题，运营管理方也理应支持。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	但大量关于区块链项目的负面报道，让机构不得不“未雨绸缪”，做好大量相关的预案，甚至加强行业筛选，限制区块链创企入孵。“正所谓一朝被蛇咬，十年怕井绳，当整一层楼看下来都是做区块链时，我们也有理由忐忑。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	据她透露，入驻创客空间的区块链创企中，绝大部分都还没有拿到融资，有的甚至缺乏相应的资金流支持。在租金方面都还要讨价还价，只为能够拿到更低的场地单价。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	而且，这些区块链创企招聘的员工，往往也都是应届毕业生和资历较浅者为主，并且只谈“理想”不谈钱（薪资），“这些区块链公司看起来风光，但实际可能是穷得叮当响，正等着用白皮书割韭菜呢。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在小彤和海明眼里，这样的区块链创业者并不真正的创业者，而是一群顶着区块链噱头“招摇撞骗”的投机者，这也让区块链看起来更像一个十分空洞的概念。尤其是在经历了小贷集体跑路之后，这些创客空间的运营方有“一朝被蛇咬”的担忧自在情理之中。何况，这些区块链创业者的资金问题，也的确有让人担心的理由。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>热门的区块链创业，实则是“空手套白狼”</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:center;background-color:#FFFFFF;\">\r\n	<img src=\"http://s1.51cto.com/oss/201804/12/2e652058ffc32af8f3fc10678176986c.jpeg\" alt=\"\" />\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“我没有资金，但也不想错过机会。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在龙岗一处办公楼里，一位区块链创业者，正在忙着培训新人。他不愿意对外公开真实身份，怕影响公司正常的业务开展，因此在文中且称他为A。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	A 告诉懂懂笔记，他所在的这处高层写字楼，虽然看起来非常高档，也很有商务范。然而由于地处城郊，月租金便宜，每平方米仅 30 元。而这些正在接受业务培训的员工们，也都是用“期权”、“合伙”的方式“骗”进来的。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“不骗真的没办法，办公室、装修、电脑设备都要钱，十来万启动资金根本不够花。”A坦陈，随着区块链话题的持续升温，区块链也被视为当下最具投资价值的创业项目。因此，有很多创业者都像他一样，带着不多的积蓄，毅然辞去稳定的工作，涉足区块链领域，“最典型的一哥们儿，拿着借来的五万块，就敢开始拿区块链来忽悠人。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	而这些被“忽悠”的对象，就包括了写字楼物业方、求职者、散户、资本机构、各路媒体等。他告诉懂懂笔记，为了在区块链红利中迅速占坑，避免错失“一夜暴富”良机，不少人都想利用有限的资金，加速度创造无限的可能。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	首先，要把自己打扮得像个“老板”，和物业方谈行业前景砍租金。然后，用财务自由、股权、分红等话术和莫须有的承诺，吸引求职者低薪资，甚至零薪资加入团队。再者，待团队壮大到一定规模，所谓与区块链沾边的“产品”面世后，则要大量行业媒体参与炒作、推广，以募集散户认购“产品”。最后，当散户到达一定数量时，就可以把资本机构“圈”入局投资了。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“没有几个做区块链的会去做长远发展规划，都是想趁现在（行业热门）发发横财。”A说，如果项目能够在三、五个月内成功套现，那他也立马全身而退，离开“战场”然后提前退休，“所以只做轻资产运作，除了面子工程之外，一切能省则省。”\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	至于那些以“财务自由”等承诺“骗”进来的员工，他告诉懂懂笔记，从一开始面试时，就根本没有为他们考虑过未来。几个月后如果项目有钱赚，那么可能会分一点。如果没钱赚，那也是没有办法的事情。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	“公司都没有未来，还怎么给他们考虑嘛，（员工）就当是收获点社会阅历咯。”为了达到目的，这些区块链创业可谓“不择手段”。如A所言，区块链风口或许很快就会过去，如果不趁现在捞它一笔，那么以后可能就再没机会了。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	然而，这些无辜的员工，机会又在哪里呢？说白了，部分区块链创业者，一心想着“空手套白狼”，通过“忽悠”的方式，层层盘剥。利用不对称的行业信息，使得区块链、数字货币等项目被过度包装，给人一种充满“希望”的感觉。这部分区块链创业者与生俱来的“劣根性”，在一定程度上导致了行业呈“病态”的发展趋势。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>结束语</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	某些区块链创业者高呼要拥抱时代、拥抱变化、拥抱未来，强调着去中心化“公平”的魅力。但现实中却为一己私利，伤害了求职者等相关群体的利益，这本身就是一种极大的不公平。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	而信息的不对称，并不是永存的。区块链、数字货币等都是值得关注的领域，但却不是可以让部分创业者，用来无限挥霍的资本。而对于想要加入其中的求职者，还是要擦亮眼睛，否则一不留神就可能“大跌眼镜”。\r\n</p>', 1000);
INSERT INTO `mc_ncontent` VALUES (11, 0, '<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	摘要：通过对数据处理阶段性发展的解析，分析大数据、人工智能技术的发展趋势。结合实际生产需求，验证了基于容器云架构的新一代大数据与人工智能平台在数据分析、处理、挖掘等方面的强大优势。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>关键词：</strong>大数据 人工智能 云计算 Docker 基础能力 多租户\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	Abstract：Through analyzing the staged development of data processing， this paper analyzes the development trend of big data and AI technology. According to the requirement of customers， the new generation of big data and AI platform based on Docker Cloud verify the powerful advantages in data analysis， processing， mining and so on.\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	Key Words：Big data; AI; cloud computing; Docker;basic abilities; Multi-tenant\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>引言</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	人工智能、大数据与云计算三者有着密不可分的联系。人工智能从1956年开始发展，在大数据技术出现之前已经发展了数十年，几起几落，但当遇到了大数据与分布式技术的发展，解决了计算力和训练数据量的问题，开始产生巨大的生产价值;同时，大数据技术通过将传统机器学习算法分布式实现，向人工智能领域延伸;此外，随着数据不断汇聚在一个平台，企业大数据基础平台服务各个部门以及分支机构的需求越来越迫切。通过容器技术，在容器云平台上构建大数据与人工智能基础公共能力，结合多租户技术赋能业务部门的方式将人工智能、大数据与云计算进行融合。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>数据处理的发展阶段</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	随着信息技术的蓬勃发展，特别是近十年，移动互联技术的普及，运营商、泛金融、政府、大型央企、大型国企、能源等领域数据量更是呈现几何级数的增长趋势。数据量的膨胀除了带来了数据处理性能的压力外，数据种类的多样性也为数据处理手段提出了新的要求，大量新系统的建设同时产生了众多数据孤岛，给企业的数据运营维护与价值发掘带来了重大的挑战。随着大数据技术的不断发展，企业的数据处理技术转型也经历了几个阶段，如图1所示。\r\n</p>\r\n<img alt=\"c9b3aee039b743d2ba11d2d1f6de2d77\" src=\"http://s3.51cto.com/oss/201804/12/fa885051193ace0c64d89754b81548fd.png-wh_651x-s_402191442.png\" /><br />\r\n▲图1 企业数据处理转型的阶段变化\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在第一阶段，大数据技术发展的早期，为了打破数据孤岛，将各类数据向大数据平台汇集，形成数据湖的概念，作为多源、异构的数据的数据归集，在此基础上进行数据标准化，建立企业数据的汇聚中心。在这个阶段，对非结构化数据处理以存储检索为主，对结构化数据处理提供各类API和少量SQL支持，使海量的以SQL实现为主的业务难以迁移到大数据平台，新业务开发使用门槛高，大数据技术的推广受到阻碍。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在第二阶段，企业客户的需求集中表现为，如何更好地处理结构化数据以及将老的IT架构迁移到分布式架构中。各大数据平台厂商开始在SQL on Hadoop领域进行研发和竞争，不断提高SQL标准的兼容程度。在这个过程中，Spark诞生并逐渐取代了过于笨重且TB量级计算性能存在缺陷的MapReduce架构，Hadoop技术开始向结构化数据处理分析更深度的应用领域进发。随着SQL on Hadoop技术的不断发展与星环科技解决了Hadoop分布式事务的难题，越来越多的客户在Hadoop上构建新一代数据仓库，将Hadoop技术应用于越来越多的业务生产场景，技术门槛的降低，使越来越多的客户可以利用强大的分布式计算能力轻松分析处理海量数据。在这个阶段后期，随着企业客户对实时数据分析研判需求的不断提高，流处理技术得以蓬勃发展。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在第三阶段，一部分企业已经完成了由基于关系型数据库为核心的数据处理体系向基于大数据技术为核心的数据处理体系的转变。在本阶段早期，很多企业客户不满足于通过SQL基于统计对数据的分析和挖掘，促使传统的机器学习算法开始实现分布化，但主要还是针对结构化数据的学习挖掘。随着深度学习技术和分布式技术的碰撞，演化出了新一代的计算框架，如TensorFlow等，计算能力的提升，并结合大量训练数据，使机器学习人工智能技术在结构化与非结构化数据领域产生巨大威力，开始应用于人脸识别、车辆识别、智能客服、无人驾驶等领域;同时，对传统机器学习算法产生了巨大冲击，一定程度上减少了对特征工程与业务领域知识的依赖，降低了机器学习的进入门槛，使人工智能技术得以普及。另一方面，可视化的拖拽页面、丰富的行业模板、高效率的交互式体验，极大地降低了数据分析人员的使用门槛，让人工智能技术进一步走入企业的生产应用。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>大数据、人工智能与云技术的融合</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	随着企业内部对于数据资源的应用不再仅仅局限于IT部门，越来越多的内部项目组与分支机构加入大数据平台的使用中，加之数据处理技术的不断发展，如何解决基础平台的资源隔离问题、管理分配问题、编排调度问题;如何将企业业务应用需要的基础服务能力做更好地抽象，降低应用所需的基础服务的环境搭建、开发、测试部署周期，提升IT支撑效能;如何更好地管理众多的基于大数据与人工智能开发的应用等等成为企业急需解决的问题。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在大数据技术发展的早期，仅仅是在计算框架MapReduce中提供简单的作业调度算法，随着资源管理的需求，在Hadoop 2.0时代，Yarn作为单独组件负责分布式计算框架的资源管理。但是，一方面，Yarn仅仅能够管理调度计算框架的资源;另一方面，资源的管理粒度较为粗放，不能做到有效的资源隔离，越来越不能满足企业客户的需求。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	云计算技术作为资源隔离封装虚拟化，以及管理调度的技术，本应应用于解决上述问题。但是，在Docker容器技术被广泛接受之前，云计算虚拟化技术主要基于虚拟机封装资源，并在其之上加载操作系统，资源利用率低，早期有厂商尝试将大数据平台构建在基于虚拟机技术的云化方案上，由于资源利用和稳定性问题，在私有云上的尝试鲜有成功案例。在公有云方面，借助公有云较为强大的基础平台硬件与运维支持能力，有一些非核心业务的应用尝试。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	随着Docker、Kubernetes等容器技术的发展，与微服务等技术概念的形成，大数据与人工智能基础平台开始基于容器云构建底层资源管理与调度平台。容器云就像一个分布式的操作系统，将集群中的各类硬件资源进行封装、管理以及调度，将封装的资源作为容器承载大数据的相关组件进程，再将这些容器进行编排，组成一个个的大数据和人工智能的基础服务，如分布式文件系统HDFS、NoSQL数据库Hbase、分布式分析型数据库Inceptor、分布式流处理平台Slipstream、分布式机器学习组件Sophon等。由这些基础服务编排构建公共能力服务层，提供如数据仓库、数据集市、图数据库、全文搜索数据库、流处理服务、NoSQL数据库、机器学习平台服务、定制图像识别服务等，为企业打造全新的数据处理核心系统。基于这一核心系统服务于各类企业的不同部门。通过资源隔离技术，通过对每个租户的资源分配和权限管理，满足业务分析人员的个性化分析需求，专注于业务逻辑的开发和数据的分析挖掘。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>技术融合的应用</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	中国邮政大数据平台建设以Transwarp Data Hub(以下简称TDH)与Transwarp Operating System(以下简称TOS)作为基础架构系统，搭建的新一代逻辑数据仓库和数据集市，完全取代了Teradata和Oracle.\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>总体架构与实现</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	中国邮政大数据平台服务于量收、邮务、名址等系统，同时运用容器云TOS实现创新多租户的数据分析挖掘环境。建立从业务层到管理层到决策层的智能分析体系，模拟量化风险和收益，实现对邮政各种业务数据进行分类、管理、统计和分析等功能，给各级管理人员提供各类准确的统计分析预测数据，使其能够及时掌握全面的经营状况，为宏观决策提供支持;为省分公司基层业务人员提供详尽的数据，供其对各自的工作目标、当前和历史状况进行准确的把握，对业务活动进行有效支撑，满足邮政经营分析管理及决策支持。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	中国邮政大数据平台以五大基础服务集群域为基础，分别是数据湖集群域、企业数据仓库集群域、省分服务集群域、机器学习实验室集群域、开发/测试/培训集群域。\r\n</p>\r\n<ul style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(1)数据湖集群域：</strong>基于TDH平台搭建的数据湖，主要承担多源异构的数据归集，数据湖内包括：原始数据池、清洗加工数据池、整合加工数据池等。\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(2)企业数仓集群域：</strong>基于TDH搭架的数据仓库集群，基于大数据创新搭架逻辑数据仓库，用于迁移改造原有基于Teradata搭架的数据仓库，数据集市和基于Oracle搭建的报刊集市的邮政量收管理系统。\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(3)省分服务集群域：</strong>基于TOS搭建容器化多租户数据分析平台云。为省、市分公司开发人员和业务人员提供省分多租户的平台环境，集团分发数据与自有数据存储计算，自有应用的开发与管理，独立租户使用运行。\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(4)机器学习实验室集群域：</strong>基于TOS搭建的容器化多租户大数据机器学习平台，为集团数据中心分析师提供多租户的开发实验环境平台，进行数据探查、业务建模、算法研究、应用开发、成果推广等。\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(5)开发/测试/培训集群域：</strong>为应用开发人员、系统测试人员、培训师、学员提供多租户的大数据与机器学习平台，为开发商及内部单位提供开发测试培训服务。\r\n	</li>\r\n</ul>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	以此为基础，达到了数据管理、服务管理、运维管控、安全管控四个维度的统一。在风险管控、决策支持、服务支撑、流程优化、品牌创新、交叉营销六大应用领域展开应用。实现了租户管理、数据治理、数据加工、数据挖掘、数据探索、数据展现六大平台功能。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	数据湖和数据仓库基于TDH构建，将包括业务系统数据、实时流数据、合作单位数据、互联网数据等不同数据源，通过ESB接入、ETL工具、Kafka、Sqoop、文本上传、人工接入等方式，统一汇聚进入数据湖。加工后获得的数据资产发布到数据资产目录，通过数据资产目录的构建TDH与TOS用户间数据交互体系。便于用户快速检索数据，通过数据资产目录实现对数据的集成、融合、安全、共享。数据资产目录包括：元数据、主数据、数据安全、数据标准、数据质量、数据轮廓、数据生命周期等。此外，企业用户通过大数据门户按需申请租户存储计算资源、数据资源、审批流程通过后，集群资源管理员按需快速部署集群，自动化将数据从数据湖加载入数据分析集群或省分集群对应的租户空间，供数据开发人员使用。数据开发人员会将数据应用成果固化到数据湖内，对外提供数据服务。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>数据仓库与数据集市的完整迁移</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	中国邮政大数据平台是全球首个采用Hadoop(TDH)技术完全取代Teradata和Oracle的混合架构搭建新一代逻辑数据仓库和数据集市的系统。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	原量收系统使用Teradata的数据仓库和Oracle的数据库，数据使用空间目前已接近30TB，现有使用用户约5万人，提供近约900张报表的灵活查询，单日报表查询频次最高能达到40万次，月初高峰查询需支持约2000计算查询并发。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	通过项目前期大量调研准备工作，制定了切实可行的项目实施方案。量收管理系统的总体架构、ESB、BI工具、ETL工具、调度工具、门户等都保持不变，仅将原量收系统的数据仓库和数据集市，使用大数据平台进行完全替换，降低了整个迁移风险。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	整个迁移过程中，包括环境部署、模型迁移改造、接口迁移改造、数据迁移、ETL迁移改造、报表迁移改造、数据核对、性能优化、业务应用迁移、风险控制，系统测试等。例如模型迁移改造，不改变原有业务逻辑，只需对接口层模型，基础层模型、汇总层模型进行轻度改造。对于模型改造来说，系统基础层模型结构相对复杂，关联度相对较高，原系统使用Teradata数据库。TDH全面兼容Teradata的数据类型与SQL方言，降低了迁移成本。同时迁移完成后，性能大幅提升，见图2.\r\n</p>\r\n<img alt=\"c5e89d1738164d929ba249b499f7a954\" src=\"http://s4.51cto.com/oss/201804/12/665751caa7490108157bbdacdd0fc5d6.png\" /><br />\r\n▲图2 迁移前后数据集市业务场景500并发测试性能对比\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>基于容器云的大数据与机器学习平台的全面应用</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	基于TOS实现的多租户新模式，将大数据与机器学习平台组件完全容器化实现，并在TOS提供能力服务。集团统一部署企业内部云平台，对邮政各个租户(集团、省分、市局等)动态分配存储、计算、网络等资源，并实现完整的资源隔离，使得各个租户数据分析人员和业务人员获得相对独立的资源环境，赋能业务创新，同时可动态调配资源，实现资源的共享优势。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	集团、省分、市局各级人员通过多租户平台，实现资源发布、申请，使用及应用开发、成果推广。通过项目立项申请审批后，省分项目组人员在租户空间内，接入访问数据资源，使用平台服务资源，大数据分析工具及机器学习挖掘工具展开数据分析挖掘工作，具体开展数据处理、模型开发、算法应用、应用发布等，在审批验收之后，将成果推广到数据湖上部署对全集团提供数据应用服务。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	通过TOS+TDH搭架厚平台、薄应用的微服务架构，实现租户之间的异构性、独立测试与部署、资源按需伸缩、高性能计算能力、租户间错误问题隔离、团队全功能化。实现数据资产化管理。面对集团数据多样、海量、跨板块、跨专业的需求，集团对数据进行了全面梳理，创新集成各版块、专业数据，创建数据资产目录便于快速检索获取资产，管控治理资产，让数据即资产从理论阶段上升到实现阶段。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>结语</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	随着企业数据处理与服务需求的不断发展，由大数据的汇聚，分布式技术释放计算能力开始，技术不断延伸发展，大数据、人工智能与云计算的边界越来越模糊，三者技术的发展不断互相影响与融合，这是发展与需求产生的自然趋势。在“后大数据时代”，基础大数据与人工智能云平台的形成与落地会越来越多，真正实现科技赋能业务，为企业提升效率与发展提供更强的心脏。同时，未来可以看到，企业可能会将其基于基础能力平台的应用体系也上架到平台的应用市场中，充分利用云平台的优势能力，资源共享，统一管理。\r\n</p>', 1000);
INSERT INTO `mc_ncontent` VALUES (8, 0, '<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	摘要：通过对数据处理阶段性发展的解析，分析大数据、人工智能技术的发展趋势。结合实际生产需求，验证了基于容器云架构的新一代大数据与人工智能平台在数据分析、处理、挖掘等方面的强大优势。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>关键词：</strong>大数据 人工智能 云计算 Docker 基础能力 多租户\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	Abstract：Through analyzing the staged development of data processing， this paper analyzes the development trend of big data and AI technology. According to the requirement of customers， the new generation of big data and AI platform based on Docker Cloud verify the powerful advantages in data analysis， processing， mining and so on.\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	Key Words：Big data; AI; cloud computing; Docker;basic abilities; Multi-tenant\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>引言</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	人工智能、大数据与云计算三者有着密不可分的联系。人工智能从1956年开始发展，在大数据技术出现之前已经发展了数十年，几起几落，但当遇到了大数据与分布式技术的发展，解决了计算力和训练数据量的问题，开始产生巨大的生产价值;同时，大数据技术通过将传统机器学习算法分布式实现，向人工智能领域延伸;此外，随着数据不断汇聚在一个平台，企业大数据基础平台服务各个部门以及分支机构的需求越来越迫切。通过容器技术，在容器云平台上构建大数据与人工智能基础公共能力，结合多租户技术赋能业务部门的方式将人工智能、大数据与云计算进行融合。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>数据处理的发展阶段</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	随着信息技术的蓬勃发展，特别是近十年，移动互联技术的普及，运营商、泛金融、政府、大型央企、大型国企、能源等领域数据量更是呈现几何级数的增长趋势。数据量的膨胀除了带来了数据处理性能的压力外，数据种类的多样性也为数据处理手段提出了新的要求，大量新系统的建设同时产生了众多数据孤岛，给企业的数据运营维护与价值发掘带来了重大的挑战。随着大数据技术的不断发展，企业的数据处理技术转型也经历了几个阶段，如图1所示。\r\n</p>\r\n<img alt=\"c9b3aee039b743d2ba11d2d1f6de2d77\" src=\"http://s3.51cto.com/oss/201804/12/fa885051193ace0c64d89754b81548fd.png-wh_651x-s_402191442.png\" /><br />\r\n▲图1 企业数据处理转型的阶段变化\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在第一阶段，大数据技术发展的早期，为了打破数据孤岛，将各类数据向大数据平台汇集，形成数据湖的概念，作为多源、异构的数据的数据归集，在此基础上进行数据标准化，建立企业数据的汇聚中心。在这个阶段，对非结构化数据处理以存储检索为主，对结构化数据处理提供各类API和少量SQL支持，使海量的以SQL实现为主的业务难以迁移到大数据平台，新业务开发使用门槛高，大数据技术的推广受到阻碍。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在第二阶段，企业客户的需求集中表现为，如何更好地处理结构化数据以及将老的IT架构迁移到分布式架构中。各大数据平台厂商开始在SQL on Hadoop领域进行研发和竞争，不断提高SQL标准的兼容程度。在这个过程中，Spark诞生并逐渐取代了过于笨重且TB量级计算性能存在缺陷的MapReduce架构，Hadoop技术开始向结构化数据处理分析更深度的应用领域进发。随着SQL on Hadoop技术的不断发展与星环科技解决了Hadoop分布式事务的难题，越来越多的客户在Hadoop上构建新一代数据仓库，将Hadoop技术应用于越来越多的业务生产场景，技术门槛的降低，使越来越多的客户可以利用强大的分布式计算能力轻松分析处理海量数据。在这个阶段后期，随着企业客户对实时数据分析研判需求的不断提高，流处理技术得以蓬勃发展。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在第三阶段，一部分企业已经完成了由基于关系型数据库为核心的数据处理体系向基于大数据技术为核心的数据处理体系的转变。在本阶段早期，很多企业客户不满足于通过SQL基于统计对数据的分析和挖掘，促使传统的机器学习算法开始实现分布化，但主要还是针对结构化数据的学习挖掘。随着深度学习技术和分布式技术的碰撞，演化出了新一代的计算框架，如TensorFlow等，计算能力的提升，并结合大量训练数据，使机器学习人工智能技术在结构化与非结构化数据领域产生巨大威力，开始应用于人脸识别、车辆识别、智能客服、无人驾驶等领域;同时，对传统机器学习算法产生了巨大冲击，一定程度上减少了对特征工程与业务领域知识的依赖，降低了机器学习的进入门槛，使人工智能技术得以普及。另一方面，可视化的拖拽页面、丰富的行业模板、高效率的交互式体验，极大地降低了数据分析人员的使用门槛，让人工智能技术进一步走入企业的生产应用。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>大数据、人工智能与云技术的融合</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	随着企业内部对于数据资源的应用不再仅仅局限于IT部门，越来越多的内部项目组与分支机构加入大数据平台的使用中，加之数据处理技术的不断发展，如何解决基础平台的资源隔离问题、管理分配问题、编排调度问题;如何将企业业务应用需要的基础服务能力做更好地抽象，降低应用所需的基础服务的环境搭建、开发、测试部署周期，提升IT支撑效能;如何更好地管理众多的基于大数据与人工智能开发的应用等等成为企业急需解决的问题。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	在大数据技术发展的早期，仅仅是在计算框架MapReduce中提供简单的作业调度算法，随着资源管理的需求，在Hadoop 2.0时代，Yarn作为单独组件负责分布式计算框架的资源管理。但是，一方面，Yarn仅仅能够管理调度计算框架的资源;另一方面，资源的管理粒度较为粗放，不能做到有效的资源隔离，越来越不能满足企业客户的需求。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	云计算技术作为资源隔离封装虚拟化，以及管理调度的技术，本应应用于解决上述问题。但是，在Docker容器技术被广泛接受之前，云计算虚拟化技术主要基于虚拟机封装资源，并在其之上加载操作系统，资源利用率低，早期有厂商尝试将大数据平台构建在基于虚拟机技术的云化方案上，由于资源利用和稳定性问题，在私有云上的尝试鲜有成功案例。在公有云方面，借助公有云较为强大的基础平台硬件与运维支持能力，有一些非核心业务的应用尝试。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	随着Docker、Kubernetes等容器技术的发展，与微服务等技术概念的形成，大数据与人工智能基础平台开始基于容器云构建底层资源管理与调度平台。容器云就像一个分布式的操作系统，将集群中的各类硬件资源进行封装、管理以及调度，将封装的资源作为容器承载大数据的相关组件进程，再将这些容器进行编排，组成一个个的大数据和人工智能的基础服务，如分布式文件系统HDFS、NoSQL数据库Hbase、分布式分析型数据库Inceptor、分布式流处理平台Slipstream、分布式机器学习组件Sophon等。由这些基础服务编排构建公共能力服务层，提供如数据仓库、数据集市、图数据库、全文搜索数据库、流处理服务、NoSQL数据库、机器学习平台服务、定制图像识别服务等，为企业打造全新的数据处理核心系统。基于这一核心系统服务于各类企业的不同部门。通过资源隔离技术，通过对每个租户的资源分配和权限管理，满足业务分析人员的个性化分析需求，专注于业务逻辑的开发和数据的分析挖掘。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>技术融合的应用</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	中国邮政大数据平台建设以Transwarp Data Hub(以下简称TDH)与Transwarp Operating System(以下简称TOS)作为基础架构系统，搭建的新一代逻辑数据仓库和数据集市，完全取代了Teradata和Oracle.\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>总体架构与实现</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	中国邮政大数据平台服务于量收、邮务、名址等系统，同时运用容器云TOS实现创新多租户的数据分析挖掘环境。建立从业务层到管理层到决策层的智能分析体系，模拟量化风险和收益，实现对邮政各种业务数据进行分类、管理、统计和分析等功能，给各级管理人员提供各类准确的统计分析预测数据，使其能够及时掌握全面的经营状况，为宏观决策提供支持;为省分公司基层业务人员提供详尽的数据，供其对各自的工作目标、当前和历史状况进行准确的把握，对业务活动进行有效支撑，满足邮政经营分析管理及决策支持。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	中国邮政大数据平台以五大基础服务集群域为基础，分别是数据湖集群域、企业数据仓库集群域、省分服务集群域、机器学习实验室集群域、开发/测试/培训集群域。\r\n</p>\r\n<ul style=\"color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(1)数据湖集群域：</strong>基于TDH平台搭建的数据湖，主要承担多源异构的数据归集，数据湖内包括：原始数据池、清洗加工数据池、整合加工数据池等。\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(2)企业数仓集群域：</strong>基于TDH搭架的数据仓库集群，基于大数据创新搭架逻辑数据仓库，用于迁移改造原有基于Teradata搭架的数据仓库，数据集市和基于Oracle搭建的报刊集市的邮政量收管理系统。\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(3)省分服务集群域：</strong>基于TOS搭建容器化多租户数据分析平台云。为省、市分公司开发人员和业务人员提供省分多租户的平台环境，集团分发数据与自有数据存储计算，自有应用的开发与管理，独立租户使用运行。\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(4)机器学习实验室集群域：</strong>基于TOS搭建的容器化多租户大数据机器学习平台，为集团数据中心分析师提供多租户的开发实验环境平台，进行数据探查、业务建模、算法研究、应用开发、成果推广等。\r\n	</li>\r\n	<li style=\"background:url(&quot;\">\r\n		<strong>(5)开发/测试/培训集群域：</strong>为应用开发人员、系统测试人员、培训师、学员提供多租户的大数据与机器学习平台，为开发商及内部单位提供开发测试培训服务。\r\n	</li>\r\n</ul>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	以此为基础，达到了数据管理、服务管理、运维管控、安全管控四个维度的统一。在风险管控、决策支持、服务支撑、流程优化、品牌创新、交叉营销六大应用领域展开应用。实现了租户管理、数据治理、数据加工、数据挖掘、数据探索、数据展现六大平台功能。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	数据湖和数据仓库基于TDH构建，将包括业务系统数据、实时流数据、合作单位数据、互联网数据等不同数据源，通过ESB接入、ETL工具、Kafka、Sqoop、文本上传、人工接入等方式，统一汇聚进入数据湖。加工后获得的数据资产发布到数据资产目录，通过数据资产目录的构建TDH与TOS用户间数据交互体系。便于用户快速检索数据，通过数据资产目录实现对数据的集成、融合、安全、共享。数据资产目录包括：元数据、主数据、数据安全、数据标准、数据质量、数据轮廓、数据生命周期等。此外，企业用户通过大数据门户按需申请租户存储计算资源、数据资源、审批流程通过后，集群资源管理员按需快速部署集群，自动化将数据从数据湖加载入数据分析集群或省分集群对应的租户空间，供数据开发人员使用。数据开发人员会将数据应用成果固化到数据湖内，对外提供数据服务。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>数据仓库与数据集市的完整迁移</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	中国邮政大数据平台是全球首个采用Hadoop(TDH)技术完全取代Teradata和Oracle的混合架构搭建新一代逻辑数据仓库和数据集市的系统。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	原量收系统使用Teradata的数据仓库和Oracle的数据库，数据使用空间目前已接近30TB，现有使用用户约5万人，提供近约900张报表的灵活查询，单日报表查询频次最高能达到40万次，月初高峰查询需支持约2000计算查询并发。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	通过项目前期大量调研准备工作，制定了切实可行的项目实施方案。量收管理系统的总体架构、ESB、BI工具、ETL工具、调度工具、门户等都保持不变，仅将原量收系统的数据仓库和数据集市，使用大数据平台进行完全替换，降低了整个迁移风险。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	整个迁移过程中，包括环境部署、模型迁移改造、接口迁移改造、数据迁移、ETL迁移改造、报表迁移改造、数据核对、性能优化、业务应用迁移、风险控制，系统测试等。例如模型迁移改造，不改变原有业务逻辑，只需对接口层模型，基础层模型、汇总层模型进行轻度改造。对于模型改造来说，系统基础层模型结构相对复杂，关联度相对较高，原系统使用Teradata数据库。TDH全面兼容Teradata的数据类型与SQL方言，降低了迁移成本。同时迁移完成后，性能大幅提升，见图2.\r\n</p>\r\n<img alt=\"c5e89d1738164d929ba249b499f7a954\" src=\"http://s4.51cto.com/oss/201804/12/665751caa7490108157bbdacdd0fc5d6.png\" /><br />\r\n▲图2 迁移前后数据集市业务场景500并发测试性能对比\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>基于容器云的大数据与机器学习平台的全面应用</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	基于TOS实现的多租户新模式，将大数据与机器学习平台组件完全容器化实现，并在TOS提供能力服务。集团统一部署企业内部云平台，对邮政各个租户(集团、省分、市局等)动态分配存储、计算、网络等资源，并实现完整的资源隔离，使得各个租户数据分析人员和业务人员获得相对独立的资源环境，赋能业务创新，同时可动态调配资源，实现资源的共享优势。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	集团、省分、市局各级人员通过多租户平台，实现资源发布、申请，使用及应用开发、成果推广。通过项目立项申请审批后，省分项目组人员在租户空间内，接入访问数据资源，使用平台服务资源，大数据分析工具及机器学习挖掘工具展开数据分析挖掘工作，具体开展数据处理、模型开发、算法应用、应用发布等，在审批验收之后，将成果推广到数据湖上部署对全集团提供数据应用服务。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	通过TOS+TDH搭架厚平台、薄应用的微服务架构，实现租户之间的异构性、独立测试与部署、资源按需伸缩、高性能计算能力、租户间错误问题隔离、团队全功能化。实现数据资产化管理。面对集团数据多样、海量、跨板块、跨专业的需求，集团对数据进行了全面梳理，创新集成各版块、专业数据，创建数据资产目录便于快速检索获取资产，管控治理资产，让数据即资产从理论阶段上升到实现阶段。\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	<strong>结语</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:&quot;font-size:16px;text-align:justify;background-color:#FFFFFF;\">\r\n	随着企业数据处理与服务需求的不断发展，由大数据的汇聚，分布式技术释放计算能力开始，技术不断延伸发展，大数据、人工智能与云计算的边界越来越模糊，三者技术的发展不断互相影响与融合，这是发展与需求产生的自然趋势。在“后大数据时代”，基础大数据与人工智能云平台的形成与落地会越来越多，真正实现科技赋能业务，为企业提升效率与发展提供更强的心脏。同时，未来可以看到，企业可能会将其基于基础能力平台的应用体系也上架到平台的应用市场中，充分利用云平台的优势能力，资源共享，统一管理。\r\n</p>', 1000);

-- ----------------------------
-- Table structure for mc_newcat
-- ----------------------------
DROP TABLE IF EXISTS `mc_newcat`;
CREATE TABLE `mc_newcat`  (
  `cate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` tinyint(3) UNSIGNED NOT NULL DEFAULT 255,
  `is_show` tinyint(3) NOT NULL DEFAULT 1,
  `letter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cthumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  `category_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `category_keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  PRIMARY KEY (`cate_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_newcat
-- ----------------------------
INSERT INTO `mc_newcat` VALUES (1, '客户见证', 0, 2, 1, '', '', '', '');
INSERT INTO `mc_newcat` VALUES (2, '新闻报道', 0, 2, 1, NULL, NULL, '新闻报道', '新闻报道');
INSERT INTO `mc_newcat` VALUES (3, '课程体系', 0, 3, 1, NULL, '', '课程体系', '课程体系');
INSERT INTO `mc_newcat` VALUES (4, '客户案例', 1, 100, 1, NULL, NULL, '客户案例', '客户案例');
INSERT INTO `mc_newcat` VALUES (5, '客户采访', 1, 100, 1, NULL, NULL, '客户采访', '客户采访');
INSERT INTO `mc_newcat` VALUES (6, '开课信息', 2, 100, 1, NULL, NULL, '开课信息', '开课信息');
INSERT INTO `mc_newcat` VALUES (7, '新闻报道', 2, 100, 1, NULL, '', '新闻报道', '新闻报道');

-- ----------------------------
-- Table structure for mc_news
-- ----------------------------
DROP TABLE IF EXISTS `mc_news`;
CREATE TABLE `mc_news`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻id',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新闻标题',
  `catid` smallint(5) NOT NULL COMMENT '新闻分类',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻来源',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `ndesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `keywords` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `addtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `thumb` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `status` tinyint(2) NULL DEFAULT 2 COMMENT '是否发布(1：发布2：未发布）',
  `hits` smallint(8) NULL DEFAULT 0 COMMENT '点击量',
  `edittime` int(10) NULL DEFAULT NULL COMMENT '修改时间',
  `listorder` smallint(5) NULL DEFAULT 1 COMMENT '排序',
  `cacheym` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vtime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00:00:00',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_news
-- ----------------------------
INSERT INTO `mc_news` VALUES (1, '谷歌员工发表公开信反对参与美国人工智能项目：我们不一样', 4, '', '', '科技界最近发生了一件事，这事儿还扯上了美国国防部，闹出了不小的风波。事情是这样的，谷歌员工发表公开信反对参与美国国防部的人工智能项目，已有超过 3100 人签名。这封公开信的诉求为：谷歌不应卷入战争，...', '', 1523601919, 'http://s4.51cto.com/oss/201804/11/c3cee6992d4d35d747265780f70fedae.png-wh_600x-s_2410709296.png', 1, 0, 1523601919, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (2, '当无线网络遇到人工智能，会发生什么？', 1, '', '', '人工智能(AI)不是未来科技，它已经来到了我们身边。随着机器学习技术的创新继续推动基于人工智能的解决方案成为市场关注的焦点，投资者、技术分析师和未来有抱负的开发人员都试图把注意力放在这些智能机器能够做...', '', 1523601892, 'http://s3.51cto.com/oss/201804/12/a40c62fa47b072081de17c8afb9a72e3.jpg-wh_651x-s_1486661150.jpg', 1, 0, 1523601892, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (3, '全球最牛的四个区块链项目都在这里！', 4, '', '', '本文转载自区块链酋长（ID:cmcmbc），最有态度的区块链市场研究分析新媒体，用数据深度解读区块链。前言有人说，目前区块链行业火热，各种项目层出不穷，但真正有实际落地的却寥寥可数，甚至有极端言论说99%的区...', '', 1523601749, 'http://s1.51cto.com/oss/201804/12/f5d043b1a1c8269b9291f72efbedcccb.jpeg', 1, 0, 1523601749, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (4, '区块链岗位“前途”超“钱途”？应聘者：玩笑！', 4, '', '', '&ldquo;但也只有‘看不到的前途’了，钱是没有的&rdquo;，近日，一位名叫张俊的读者发来消息告诉懂懂笔记，他入职了一家区块链企业后，发现其业务内容缺乏实质，而且工作的前三个月不发工资。对此，公司的解释是：若三个月...', '', 1523601655, 'http://s5.51cto.com/oss/201804/12/506d815b4ad3b54e75fb76982470e135.jpeg', 1, 0, 1523601655, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (5, '大数据、人工智能与云计算的融合与应用', 6, '', '', '摘要：通过对数据处理阶段性发展的解析，分析大数据、人工智能技术的发展趋势。结合实际生产需求，验证了基于容器云架构的新一代大数据与人工智能平台在数据分析、处理、挖掘等方面的强大优势。关键词：大数据 ...', '', 1523601463, 'http://s3.51cto.com/oss/201804/12/fa885051193ace0c64d89754b81548fd.png-wh_651x-s_402191442.png', 1, 0, 1523601463, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (6, '区块链概念最全解析：区块链的下一个十年什么样？', 1, '', '', '摘要本文目的，不在于指点财富升值，而是引导认知升级：帮助区块链零基础的小白快速熟悉十年来区块链技术的一些基本概念，以便探讨未来十年区块链领域的创业机会。关于区块链的四个判断相信大家对区块链技术的基...', '', 1523601525, 'http://s3.51cto.com/oss/201804/13/7c45fb5dbb954e7bebcd5f74186d3ed3.jpeg-wh_651x-s_4284511202.jpeg', 1, 0, 1523601525, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (7, '挖矿工：教你三招防黑客', 7, '', '', '对于很多人来说，比特币似乎是个快速发家致富的新路子，因为买几台矿机就可以获得数字货币。尤其去年比特币创下了价格新高，有太多人不惜一切地去&ldquo;挖矿&rdquo;，成为了&ldquo;矿工&rdquo;。虽然最近一段时间数字货币行情低迷，...', '', 1523601607, 'http://s2.51cto.com/oss/201804/12/dbd6f6831ab0d3b02d16871f0e3311e1.jpg-wh_651x-s_3881995829.jpg', 1, 0, 1523601607, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (8, '中国手机销量下滑28%，乐视和酷派已消失，下一个消失的是谁？', 7, '', '', '日前，工信部旗下中国信息通信研究院发布了《2018年3月国内手机市场运行分析报告》。报告显示，2018年1-3月，中国智能手机出货量为8137万部，同比下降26.1%。其中，国产品牌手机出货量7586.4万部，同比下降27.9%...', '', 1523602018, 'http://s2.51cto.com/oss/201804/11/f34b4711c57b161caeff19b91784870d.jpeg-wh_651x-s_3364878957.jpeg', 1, 0, 1523602018, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (9, '课程体系1.0', 3, '', '', '对于很多人来说，比特币似乎是个快速发家致富的新路子，因为买几台矿机就可以获得数字货币。尤其去年比特币创下了价格新高，有太多人不惜一切地去“挖矿”，成为了“矿工”。虽然最近一段时间数字货币行情低迷，...', '', 1523601607, '/imageuploads/news/201807/20180717133737_80653.jpg', 1, 0, 1531809580, 1, '201804', '', '中国 深圳');
INSERT INTO `mc_news` VALUES (10, '课程体系2.0', 3, '', '', '日前，工信部旗下中国信息通信研究院发布了《2018年3月国内手机市场运行分析报告》。报告显示，2018年1-3月，中国智能手机出货量为8137万部，同比下降26.1%。其中，国产品牌手机出货量7586.4万部，同比下降27.9%...', '', 1523602018, '/imageuploads/news/201807/20180717133723_32101.jpg', 1, 0, 1531809557, 1, '201804', '', '中国 南京');
INSERT INTO `mc_news` VALUES (15, '挖矿工：教你三招防黑客', 2, '', '', '对于很多人来说，比特币似乎是个快速发家致富的新路子，因为买几台矿机就可以获得数字货币。尤其去年比特币创下了价格新高，有太多人不惜一切地去&ldquo;挖矿&rdquo;，成为了&ldquo;矿工&rdquo;。虽然最近一段时间数字货币行情低迷，...', '', 1523601607, 'http://s2.51cto.com/oss/201804/12/dbd6f6831ab0d3b02d16871f0e3311e1.jpg-wh_651x-s_3881995829.jpg', 1, 0, 1523601607, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (12, '中国手机销量下滑28%，乐视和酷派已消失，下一个消失的是谁？', 2, '', '', '日前，工信部旗下中国信息通信研究院发布了《2018年3月国内手机市场运行分析报告》。报告显示，2018年1-3月，中国智能手机出货量为8137万部，同比下降26.1%。其中，国产品牌手机出货量7586.4万部，同比下降27.9%...', '', 1523602018, 'http://s2.51cto.com/oss/201804/11/f34b4711c57b161caeff19b91784870d.jpeg-wh_651x-s_3364878957.jpeg', 1, 0, 1523602018, 1, '201804', '', '中国  北京');
INSERT INTO `mc_news` VALUES (13, '课程体系3.0', 3, '', '', '日前，工信部旗下中国信息通信研究院发布了《2018年3月国内手机市场运行分析报告》。报告显示，2018年1-3月，中国智能手机出货量为8137万部，同比下降26.1%。其中，国产品牌手机出货量7586.4万部，同比下降27.9%...', '', 1523602018, '/imageuploads/news/201807/20180717133723_32101.jpg', 1, 0, 1531809557, 1, '201804', '', '中国 南京');
INSERT INTO `mc_news` VALUES (14, '课程体系4.0', 3, '', '', '日前，工信部旗下中国信息通信研究院发布了《2018年3月国内手机市场运行分析报告》。报告显示，2018年1-3月，中国智能手机出货量为8137万部，同比下降26.1%。其中，国产品牌手机出货量7586.4万部，同比下降27.9%...', '', 1523602018, '/imageuploads/news/201807/20180717133723_32101.jpg', 1, 0, 1531809557, 1, '201804', '', '中国 南京');
INSERT INTO `mc_news` VALUES (19, '大数据、人工智能与云计算的融合与应用', 5, '', '', '摘要：通过对数据处理阶段性发展的解析，分析大数据、人工智能技术的发展趋势。结合实际生产需求，验证了基于容器云架构的新一代大数据与人工智能平台在数据分析、处理、挖掘等方面的强大优势。关键词：大数据 ...', '', 1523601463, 'http://s3.51cto.com/oss/201804/12/fa885051193ace0c64d89754b81548fd.png-wh_651x-s_402191442.png', 1, 0, 1523601463, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (16, '区块链概念最全解析：区块链的下一个十年什么样？', 5, '', '', '摘要本文目的，不在于指点财富升值，而是引导认知升级：帮助区块链零基础的小白快速熟悉十年来区块链技术的一些基本概念，以便探讨未来十年区块链领域的创业机会。关于区块链的四个判断相信大家对区块链技术的基...', '', 1523601525, 'http://s3.51cto.com/oss/201804/13/7c45fb5dbb954e7bebcd5f74186d3ed3.jpeg-wh_651x-s_4284511202.jpeg', 1, 0, 1523601525, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (17, '挖矿工：教你三招防黑客', 5, '', '', '对于很多人来说，比特币似乎是个快速发家致富的新路子，因为买几台矿机就可以获得数字货币。尤其去年比特币创下了价格新高，有太多人不惜一切地去&ldquo;挖矿&rdquo;，成为了&ldquo;矿工&rdquo;。虽然最近一段时间数字货币行情低迷，...', '', 1523601607, 'http://s2.51cto.com/oss/201804/12/dbd6f6831ab0d3b02d16871f0e3311e1.jpg-wh_651x-s_3881995829.jpg', 1, 0, 1523601607, 1, '201804', '', NULL);
INSERT INTO `mc_news` VALUES (18, '中国手机销量下滑28%，乐视和酷派已消失，下一个消失的是谁？', 5, '', '', '日前，工信部旗下中国信息通信研究院发布了《2018年3月国内手机市场运行分析报告》。报告显示，2018年1-3月，中国智能手机出货量为8137万部，同比下降26.1%。其中，国产品牌手机出货量7586.4万部，同比下降27.9%...', '', 1523602018, 'http://s2.51cto.com/oss/201804/11/f34b4711c57b161caeff19b91784870d.jpeg-wh_651x-s_3364878957.jpeg', 1, 0, 1523602018, 1, '201804', '', NULL);

-- ----------------------------
-- Table structure for mc_partner
-- ----------------------------
DROP TABLE IF EXISTS `mc_partner`;
CREATE TABLE `mc_partner`  (
  `link_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link_img` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link_type` tinyint(5) NULL DEFAULT 1,
  `link_static` tinyint(5) NULL DEFAULT NULL,
  `link_add_time` int(11) NULL DEFAULT NULL,
  `link_order` int(10) NULL DEFAULT 255,
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_partner
-- ----------------------------
INSERT INTO `mc_partner` VALUES (1, '太太乐', 'http://baidu.com', '/statics/home/Default/images/index/index_07_02.png', 2, 1, 1531806843, 9);
INSERT INTO `mc_partner` VALUES (2, '达威股份', 'http://baidu.com', '/statics/home/Default/images/index/index_07_04.png', 2, 1, 1431439717, 8);
INSERT INTO `mc_partner` VALUES (3, 'QQ宝贝', 'http://baidu.com', '/statics/home/Default/images/index/index_07_06.png', 2, 1, 1431439717, 7);
INSERT INTO `mc_partner` VALUES (4, '北风网', 'http://baidu.com', '/statics/home/Default/images/index/index_07_08.png', 2, 1, 1431439717, 6);
INSERT INTO `mc_partner` VALUES (6, '安徽鲁班集团', 'http://baidu.com', '/statics/home/Default/images/index/index_07_18.png', 2, 1, 1431439717, 4);
INSERT INTO `mc_partner` VALUES (7, '爱德福', 'http://baidu.com', '/statics/home/Default/images/index/index_07_20.png', 2, 1, 1431439717, 3);
INSERT INTO `mc_partner` VALUES (8, '可靠', 'http://baidu.com', '/statics/home/Default/images/index/index_07_21.png', 2, 1, 1431439717, 2);
INSERT INTO `mc_partner` VALUES (5, '笑蕾', 'http://tmall.com', '/statics/home/Default/images/index/index_07_10.png', 2, 1, 1457940421, 5);
INSERT INTO `mc_partner` VALUES (9, '里道斯', 'http://baidu.com', '/statics/home/Default/images/index/index_07_22.png', 2, 1, 1457940547, 1);
INSERT INTO `mc_partner` VALUES (10, '星辉印刷', 'http://baidu.com', '/statics/home/Default/images/index/index_07_23.png', 2, 1, 1531808664, 1);

-- ----------------------------
-- Table structure for mc_push
-- ----------------------------
DROP TABLE IF EXISTS `mc_push`;
CREATE TABLE `mc_push`  (
  `push_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `push_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` tinyint(3) UNSIGNED NOT NULL DEFAULT 255,
  `is_show` tinyint(3) NOT NULL DEFAULT 1,
  `letter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`push_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_push
-- ----------------------------
INSERT INTO `mc_push` VALUES (1, '主页推荐位', 0, 255, 1, 'zhuyetuijianwei');
INSERT INTO `mc_push` VALUES (7, '面试技巧', 1, 255, 1, 'mianshijiqiao');
INSERT INTO `mc_push` VALUES (3, '新闻频道页面', 0, 255, 1, 'xinwenpindaoyemian');
INSERT INTO `mc_push` VALUES (6, '校园招聘', 1, 255, 1, 'xiaoyuanzhaopin');
INSERT INTO `mc_push` VALUES (5, '招聘会', 1, 255, 1, 'zhaopinhui');
INSERT INTO `mc_push` VALUES (4, '中间新闻推荐1', 3, 1, 1, 'zhongjianxinwentuijian1');
INSERT INTO `mc_push` VALUES (9, '企业动态', 1, 255, 1, 'qiyedongtai');
INSERT INTO `mc_push` VALUES (10, '院校资讯', 1, 255, 1, 'yuanxiaozixun');
INSERT INTO `mc_push` VALUES (11, '学生活动', 1, 255, 1, 'xueshenghuodong');
INSERT INTO `mc_push` VALUES (12, '产学研', 1, 255, 1, 'chanxueyan');
INSERT INTO `mc_push` VALUES (13, '企业新闻', 1, 255, 1, 'qiyexinwen');
INSERT INTO `mc_push` VALUES (24, '测试分类_新闻', 3, 12, 1, NULL);
INSERT INTO `mc_push` VALUES (25, '测试分类_校园招聘', 6, 1, 1, NULL);
INSERT INTO `mc_push` VALUES (17, '中间新闻推荐2', 3, 255, 1, 'zhongjianxinwentuijian2');
INSERT INTO `mc_push` VALUES (18, '幻灯图片新闻', 3, 255, 1, 'huandengtupianxinwen');
INSERT INTO `mc_push` VALUES (19, '学生频道', 0, 255, 1, 'xueshengpindao');

-- ----------------------------
-- Table structure for mc_push_from
-- ----------------------------
DROP TABLE IF EXISTS `mc_push_from`;
CREATE TABLE `mc_push_from`  (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `new_id` int(11) NOT NULL,
  `cat_id` int(11) NULL DEFAULT NULL,
  `cat_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `push_id` int(10) NULL DEFAULT NULL,
  `p_title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_description` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `p_listorder` tinyint(6) NULL DEFAULT 100,
  `p_updatetime` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 204 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_push_from
-- ----------------------------
INSERT INTO `mc_push_from` VALUES (201, 47, 247, '协会院所', 7, '央总书记习近平在主持学习时强调，我们党长期', '/imageuploads/newscontent/thumb/400_400_20150628025614_63698.jpg', '新华网北京6月27日电 中共中央政治局6月26日下午就加强反腐倡廉法规制度建设进行第二十四次集体学习。中共中央总书记习近平在主持学习时强调，我们党长期执政，既具有巨大政治优势，也面临严峻挑战，必须依靠党...', 11, 1435460115);

-- ----------------------------
-- Table structure for mc_teacher
-- ----------------------------
DROP TABLE IF EXISTS `mc_teacher`;
CREATE TABLE `mc_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `tcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '团队详情',
  `tdesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '团队简介',
  `thumb` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `update_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `add_at` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `listorder` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团队信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_teacher
-- ----------------------------
INSERT INTO `mc_teacher` VALUES (10, '蒋春燕', '<h4>\r\n	导师简介\r\n</h4>\r\n<p>\r\n	时和咨询、“蒋春燕绩效工场”品牌创始人 <br />\r\n北风网联合创始人 <br />\r\n中国绩效管理资深实战专家； <br />\r\n中欧国际工商学院EMBA； <br />\r\n《绩效倍增系统PMS》系列课程研发者与首席导师； <br />\r\n原李嘉诚先生旗下企业TOM户外传媒集团高级运营总监； <br />\r\n担任多家企业咨询顾问、独立董事等职务； <br />\r\n被客户誉为“中国绩效实战落地第一人”，“开创了中国式阿米巴的经营模式”； <br />\r\n所讲授的绩效倍增系统课程，被商学院教授与同学誉为“最接地气的课程”； <br />\r\n<br />\r\n蒋春燕，1976年生，重庆人。 <br />\r\n2001年--2008年服务于李嘉诚先生旗下TOM户外传媒集团高级运营总监。 <br />\r\n2009年-2012年行动成功，绩效增长模式研发者与首席导师。 <br />\r\n2008年9月，蒋春燕老师开始第一场绩效增长模式公开课，获得客户高度认可。 <br />\r\n2013年毕业于中欧国际工商学院EMBA。 <br />\r\n2014年，成立蒋春燕绩效工场\r\n</p>\r\n<div class=\"clearfix col-md-12 col-sm-12 col-xs-12 clear-height\">\r\n</div>\r\n<h4>\r\n	服务客户\r\n</h4>\r\n<p>\r\n	期间深度服务婚纱摄影金夫人集团、顾家家居、吉林云天化集团，绝味鸭脖，秋林里道斯，安徽鲁班集团， <br />\r\n绝味鸭脖、青岛笑蕾，秦川乐器，尚层装修，环宇建工集团，北风网，太太乐，五色风马，安徽华恒集团， <br />\r\n四川达威，杭州可靠，黑龙江农机集团，淄博宝恩集团等著名企业。\r\n</p>\r\n<div class=\"clearfix col-md-12 col-sm-12 col-xs-12 clear-height\">\r\n</div>\r\n<h4>\r\n	课程现场\r\n</h4>\r\n<div class=\"swiper-container\">\r\n	<div class=\"swiper-wrapper\">\r\n		<div class=\"swiper-slide\">\r\n			<img src=\"/statics/home/Default/images/teadetail/teadetail_01.png\" alt=\"\" /> \r\n		</div>\r\n	</div>\r\n	<div class=\"swiper-pagination\">\r\n	</div>\r\n</div>\r\n<br />\r\n<br />', '蒋春燕绩效工场创始人|\r\n北风网联合创始人|\r\n专注企业绩效管理15年|\r\n服务过90%以上行业，20000+企业|\r\n300000学员共同见证', '/imageuploads/thumb/1531888616.3833.png', '2018-07-18 14:07:30', NULL, 2);

-- ----------------------------
-- Table structure for mc_teams
-- ----------------------------
DROP TABLE IF EXISTS `mc_teams`;
CREATE TABLE `mc_teams`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '团队名称',
  `team_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '团队详情',
  `team_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '团队简介',
  `thumb` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `leader_id` int(11) NULL DEFAULT NULL COMMENT '团队负责人UID',
  `addtime` int(11) NULL DEFAULT NULL COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '团队信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_teams
-- ----------------------------
INSERT INTO `mc_teams` VALUES (6, '售前服务', '', '<span>极具创新能力的团队，技术的功底.接受并译释新技术的速度，能力及水平，可以说是少数中少数。</span>', '/imageuploads/thumb/1459135828.78.jpg', 8, 1459135830);
INSERT INTO `mc_teams` VALUES (7, '售后服务', '金牌优质售后服务团队，让您体会真正的买着放心，用着省心', '金牌优质售后服务团队，让您体会真正的买着放心，用着省心', '/imageuploads/thumb/1459135820.9582.jpg', 8, 1459135822);

-- ----------------------------
-- Table structure for mc_wx_member_bind
-- ----------------------------
DROP TABLE IF EXISTS `mc_wx_member_bind`;
CREATE TABLE `mc_wx_member_bind`  (
  `wuid` int(11) NOT NULL AUTO_INCREMENT,
  `out_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `wxopenid` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `out_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` tinyint(3) NULL DEFAULT 1,
  `addtime` int(11) NULL DEFAULT NULL,
  `headimgurl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `wxcode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `prov` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在州',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在街道',
  `build` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '建筑',
  `room` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房间号',
  `zcode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`wuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mc_wx_member_bind
-- ----------------------------
INSERT INTO `mc_wx_member_bind` VALUES (1, NULL, '刘华翔', 'o9bJ3xPEfFdIt5T8sx4nZNhEwsE0', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xPEfFdIt5T8sx4nZNhEwsE0\";s:8:\"nickname\";s:9:\"刘华翔\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"扬州\";s:8:\"province\";s:6:\"江苏\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:132:\"http://wx.qlogo.cn/mmopen/hicWibzp4Wj3I33sBibNHeoHict7zPXH9QErYEKMy90eqa4tc1MWe4NiaRd2kic66p7ueVfpsDuMdJGud5szlnhKTwtbicDTYNjicwqU/0\";s:14:\"subscribe_time\";i:1458378817;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1459323185, 'http://wx.qlogo.cn/mmopen/hicWibzp4Wj3I33sBibNHeoHict7zPXH9QErYEKMy90eqa4tc1MWe4NiaRd2kic66p7ueVfpsDuMdJGud5szlnhKTwtbicDTYNjicwqU/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (2, NULL, '李林', 'o9bJ3xOXEao1w3KCp_4FjZNNhouQ', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xOXEao1w3KCp_4FjZNNhouQ\";s:8:\"nickname\";s:6:\"李林\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"扬州\";s:8:\"province\";s:6:\"江苏\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:143:\"http://wx.qlogo.cn/mmopen/Q3auHgzwzM7QicuNJXDguQpic0OViaMTibkgdiazc6SicA09iaM8ljB1zVt9c1ibhY1ZlLswpRHcNyHKq7pPldlrG1lAfLx97jJ7QgMuTMVTG2hlbJQ/0\";s:14:\"subscribe_time\";i:1459387774;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1459387784, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7QicuNJXDguQpic0OViaMTibkgdiazc6SicA09iaM8ljB1zVt9c1ibhY1ZlLswpRHcNyHKq7pPldlrG1lAfLx97jJ7QgMuTMVTG2hlbJQ/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (3, NULL, '往事随风', 'o9bJ3xAUK_K5EY7clEWXhUoN8YWM', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xAUK_K5EY7clEWXhUoN8YWM\";s:8:\"nickname\";s:12:\"往事随风\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"扬州\";s:8:\"province\";s:6:\"江苏\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:127:\"http://wx.qlogo.cn/mmopen/E7qbphvlH1YtYNwmc1Vb05pDRROr7tl4yrIsFhOQ4s90Q7qwIaMXBGxBmNuPniczAZvEnCNmic95LeYay2RXNa9icNn35WtM9up/0\";s:14:\"subscribe_time\";i:1459391530;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1459391649, 'http://wx.qlogo.cn/mmopen/E7qbphvlH1YtYNwmc1Vb05pDRROr7tl4yrIsFhOQ4s90Q7qwIaMXBGxBmNuPniczAZvEnCNmic95LeYay2RXNa9icNn35WtM9up/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (4, NULL, '0.0', 'o9bJ3xHngV_nVDr0Yt-TRYnxcen0', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xHngV_nVDr0Yt-TRYnxcen0\";s:8:\"nickname\";s:3:\"0.0\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"扬州\";s:8:\"province\";s:6:\"江苏\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:129:\"http://wx.qlogo.cn/mmopen/hicWibzp4Wj3LOCv9kZpBx6QLmdk53MDzNgjtEFRMNnBBnuhGOQSUnQzMu5ibY7CSNiaTYTnlXOUlMnYicHudNz86NU82mLMPeYuS/0\";s:14:\"subscribe_time\";i:1458375447;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1459412800, 'http://wx.qlogo.cn/mmopen/hicWibzp4Wj3LOCv9kZpBx6QLmdk53MDzNgjtEFRMNnBBnuhGOQSUnQzMu5ibY7CSNiaTYTnlXOUlMnYicHudNz86NU82mLMPeYuS/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (5, NULL, '张洪潮', 'o9bJ3xMILmEzGBvb8bybALSNnrA0', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xMILmEzGBvb8bybALSNnrA0\";s:8:\"nickname\";s:9:\"张洪潮\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"杭州\";s:8:\"province\";s:6:\"浙江\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:140:\"http://wx.qlogo.cn/mmopen/Q3auHgzwzM6b92GkjV79MiceDqic9CKzrC53xuic5RExYE8lOUQfj2UeckjHagf6yuBeNxPX9g5U4KoQogyoAKQPwvicOcjSt7ibnvRqVyfGRweY/0\";s:14:\"subscribe_time\";i:1457936578;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1459520788, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6b92GkjV79MiceDqic9CKzrC53xuic5RExYE8lOUQfj2UeckjHagf6yuBeNxPX9g5U4KoQogyoAKQPwvicOcjSt7ibnvRqVyfGRweY/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (6, NULL, '안녕하세요', 'o9bJ3xO0YgPT6KV5dmQQqiCRo2m8', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xO0YgPT6KV5dmQQqiCRo2m8\";s:8:\"nickname\";s:15:\"안녕하세요\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:9:\"江陵市\";s:8:\"province\";s:9:\"江原道\";s:7:\"country\";s:6:\"韩国\";s:10:\"headimgurl\";s:119:\"http://wx.qlogo.cn/mmopen/ajNVdqHZLLDMxY0Z2YiaOpNvhCfkP0yXCwh1OBic4OWBc2aeeicvWQv73H2La1HGhPyRRByicTQib4Rjhe4Mvpp6b3A/0\";s:14:\"subscribe_time\";i:1459842579;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1459842596, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDMxY0Z2YiaOpNvhCfkP0yXCwh1OBic4OWBc2aeeicvWQv73H2La1HGhPyRRByicTQib4Rjhe4Mvpp6b3A/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (7, NULL, '平', 'o9bJ3xB0_AnBqTQ8Qodj6ynVjTqY', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xB0_AnBqTQ8Qodj6ynVjTqY\";s:8:\"nickname\";s:3:\"平\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"杭州\";s:8:\"province\";s:6:\"浙江\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:136:\"http://wx.qlogo.cn/mmopen/ajNVdqHZLLAJsZkyE07gV6mxVPnL1zoVcPUbwHWLPo1m70NAy0vponnOBrTbCaoHDsY80qL0msbRaR02VfF2ohPI8qne2NvibuVnMmWdDbpg/0\";s:14:\"subscribe_time\";i:1459929635;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1459930675, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAJsZkyE07gV6mxVPnL1zoVcPUbwHWLPo1m70NAy0vponnOBrTbCaoHDsY80qL0msbRaR02VfF2ohPI8qne2NvibuVnMmWdDbpg/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (8, NULL, '此乃一Man', 'o9bJ3xIn5YtR9NlaYiixsgL3XfMQ', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xIn5YtR9NlaYiixsgL3XfMQ\";s:8:\"nickname\";s:12:\"此乃一Man\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"扬州\";s:8:\"province\";s:6:\"江苏\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:139:\"http://wx.qlogo.cn/mmopen/Q3auHgzwzM6b92GkjV79MiceDqic9CKzrCGRyX15LRT7kmzKpRMNQWlfTwQfuRXgWjFG1GnyTlPiaGek9jXd5yV2LY1KhesDCJJAMibnhlAnZdM/0\";s:14:\"subscribe_time\";i:1457936646;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1460528801, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6b92GkjV79MiceDqic9CKzrCGRyX15LRT7kmzKpRMNQWlfTwQfuRXgWjFG1GnyTlPiaGek9jXd5yV2LY1KhesDCJJAMibnhlAnZdM/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (9, NULL, 'Owen', 'o9bJ3xENwAGEF4p3MrLimSdOgFGQ', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xENwAGEF4p3MrLimSdOgFGQ\";s:8:\"nickname\";s:4:\"Owen\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"扬州\";s:8:\"province\";s:6:\"江苏\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:127:\"http://wx.qlogo.cn/mmopen/B5aibeYF6B9HUkMOWfIfzuia1NNedfE6iaHKf7y1IgPnnFuPH267ggaJQpo7nh7NuG9xwprrJVFomsK7DtbhyyQLjfJ0ANg4Smz/0\";s:14:\"subscribe_time\";i:1457936647;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1460541164, 'http://wx.qlogo.cn/mmopen/B5aibeYF6B9HUkMOWfIfzuia1NNedfE6iaHKf7y1IgPnnFuPH267ggaJQpo7nh7NuG9xwprrJVFomsK7DtbhyyQLjfJ0ANg4Smz/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (10, NULL, 'Steven', 'o9bJ3xPCIhA5m_IzlCXZklLPl2w4', 'O:8:\"stdClass\":12:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xPCIhA5m_IzlCXZklLPl2w4\";s:8:\"nickname\";s:6:\"Steven\";s:3:\"sex\";i:1;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:0:\"\";s:8:\"province\";s:0:\"\";s:7:\"country\";s:15:\"阿尔及利亚\";s:10:\"headimgurl\";s:116:\"http://wx.qlogo.cn/mmopen/Q3auHgzwzM6J3cd3P1JcHSv6ibLhp29shmLx9CggjysHW8waO9WtWX3m3813GXQrNeicdb6WCpIZnd8B2gnn53mQ/0\";s:14:\"subscribe_time\";i:1461215107;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;}', 1, 1461215116, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6J3cd3P1JcHSv6ibLhp29shmLx9CggjysHW8waO9WtWX3m3813GXQrNeicdb6WCpIZnd8B2gnn53mQ/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mc_wx_member_bind` VALUES (11, NULL, '周连玲', 'o9bJ3xJubCrKOqDmG1Db3KfsH5Z0', 'O:8:\"stdClass\":13:{s:9:\"subscribe\";i:1;s:6:\"openid\";s:28:\"o9bJ3xJubCrKOqDmG1Db3KfsH5Z0\";s:8:\"nickname\";s:9:\"周连玲\";s:3:\"sex\";i:2;s:8:\"language\";s:5:\"zh_CN\";s:4:\"city\";s:6:\"扬州\";s:8:\"province\";s:6:\"江苏\";s:7:\"country\";s:6:\"中国\";s:10:\"headimgurl\";s:114:\"http://wx.qlogo.cn/mmopen/O1dAhMERUwXzbvWBR4cL5CbGXtWjHKyWOTSagPmN8fawFyJ8zDWHCJKxEjfsdyYJRAEsoo1wNX3RD9wUJx2sJg/0\";s:14:\"subscribe_time\";i:1464431837;s:6:\"remark\";s:0:\"\";s:7:\"groupid\";i:0;s:10:\"tagid_list\";a:0:{}}', 1, 1464431898, 'http://wx.qlogo.cn/mmopen/O1dAhMERUwXzbvWBR4cL5CbGXtWjHKyWOTSagPmN8fawFyJ8zDWHCJKxEjfsdyYJRAEsoo1wNX3RD9wUJx2sJg/0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
