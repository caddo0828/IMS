/*
Navicat MySQL Data Transfer

Source Server         : im
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : kucun

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2019-06-11 17:33:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `state` int(2) DEFAULT '1' COMMENT '状态 0：表示无效，1:表示有效',
  `salt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'root', '52045d2ffc2d57c1336a361430603c7e', '1', 'shiro');
INSERT INTO `t_admin` VALUES ('2', 'eeee', '1111', '0', '');
INSERT INTO `t_admin` VALUES ('4', '张无忌', '520zhaoming', '0', '');
INSERT INTO `t_admin` VALUES ('6', '马云', '123456', '1', '');
INSERT INTO `t_admin` VALUES ('7', '马化腾', '111111', '1', null);
INSERT INTO `t_admin` VALUES ('9', '刘强东', '123456', '0', null);
INSERT INTO `t_admin` VALUES ('10', '雷军', 'leijun', '0', null);
INSERT INTO `t_admin` VALUES ('11', 'admin', '8e7a4a6bad4f685bd9da4f78b5f76f9f', '1', 'shiro');
INSERT INTO `t_admin` VALUES ('12', 'caddo', 'caddo', '1', null);
INSERT INTO `t_admin` VALUES ('13', 'tqtq', 'tqtq', '1', null);

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
INSERT INTO `t_admin_role` VALUES ('1', '1');
INSERT INTO `t_admin_role` VALUES ('2', '1');
INSERT INTO `t_admin_role` VALUES ('3', '2');
INSERT INTO `t_admin_role` VALUES ('4', '2');
INSERT INTO `t_admin_role` VALUES ('11', '2');

-- ----------------------------
-- Table structure for t_bigtype
-- ----------------------------
DROP TABLE IF EXISTS `t_bigtype`;
CREATE TABLE `t_bigtype` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '大分类名称',
  `state` int(2) DEFAULT NULL COMMENT '分类状态1: 有用，0:停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bigtype
-- ----------------------------
INSERT INTO `t_bigtype` VALUES ('17', '机器及配件类', '1');
INSERT INTO `t_bigtype` VALUES ('18', '工具类', '1');
INSERT INTO `t_bigtype` VALUES ('19', '修模类', '1');
INSERT INTO `t_bigtype` VALUES ('20', '铸造类', '1');
INSERT INTO `t_bigtype` VALUES ('21', 'qqqq', '1');
INSERT INTO `t_bigtype` VALUES ('22', 'rrrr', '1');
INSERT INTO `t_bigtype` VALUES ('23', '3331', '1');

-- ----------------------------
-- Table structure for t_input
-- ----------------------------
DROP TABLE IF EXISTS `t_input`;
CREATE TABLE `t_input` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '入库商品名',
  `pcount` int(8) unsigned DEFAULT NULL COMMENT '数量',
  `dprice` double(10,2) DEFAULT NULL COMMENT '单价',
  `price` double(15,2) DEFAULT NULL COMMENT '总价',
  `annt` varchar(32) DEFAULT NULL COMMENT '经办人',
  `pname` varchar(32) NOT NULL COMMENT '供应商',
  `inputtime` datetime DEFAULT NULL COMMENT '入库时间',
  `state` int(2) DEFAULT '1' COMMENT '入库记录的状态；1;  可以显示  0：记录已被删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_input
-- ----------------------------
INSERT INTO `t_input` VALUES ('2', '高温钴铬合金', '200', '10.00', '2000.00', '小张', '汉中精诚齿科', '2011-06-29 16:29:54', '1');
INSERT INTO `t_input` VALUES ('3', 'NP-V钢', '300', '100.00', '30000.00', '老李', '现金', '2011-06-29 16:31:29', '1');
INSERT INTO `t_input` VALUES ('4', '高温钴烙合金', '30', '10.00', '300.00', '张建秋', '广州莘诚', '2011-06-29 16:31:49', '1');
INSERT INTO `t_input` VALUES ('5', 'NNB无镍玻钢', '12', '10.00', '120.00', '王五', '珠海永嘉', '2011-06-30 16:45:05', '1');
INSERT INTO `t_input` VALUES ('6', '适配器', '10', '100.00', '1000.00', '李四', '广州莘诚', '2011-07-03 16:16:26', '1');
INSERT INTO `t_input` VALUES ('7', '适配器', '15', '22.00', '330.00', '赵六', '广州莘诚', '2011-07-03 17:27:05', '1');
INSERT INTO `t_input` VALUES ('8', '适配器', '22', '10.00', '220.00', '黑子', 'dddd', '2011-07-03 17:39:56', '1');
INSERT INTO `t_input` VALUES ('9', 'RC700驱动电源板卡主板', '5', '21.00', '105.00', '小张', '南昌飞马', '2019-06-05 06:28:26', '1');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(20) DEFAULT NULL COMMENT '菜单名',
  `permission` varchar(20) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '库存列表', 'kucun:all');
INSERT INTO `t_menu` VALUES ('2', '入库记录', 'input:all');
INSERT INTO `t_menu` VALUES ('3', '出库记录', 'output:all');
INSERT INTO `t_menu` VALUES ('4', '新建物料', 'product:all');
INSERT INTO `t_menu` VALUES ('5', '新增供应商', 'provider:all');
INSERT INTO `t_menu` VALUES ('6', '管理员列表', 'admin:all');

-- ----------------------------
-- Table structure for t_menu_role
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_role`;
CREATE TABLE `t_menu_role` (
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu_role
-- ----------------------------
INSERT INTO `t_menu_role` VALUES ('1', '1');
INSERT INTO `t_menu_role` VALUES ('1', '2');
INSERT INTO `t_menu_role` VALUES ('2', '1');
INSERT INTO `t_menu_role` VALUES ('2', '2');
INSERT INTO `t_menu_role` VALUES ('3', '1');
INSERT INTO `t_menu_role` VALUES ('3', '2');
INSERT INTO `t_menu_role` VALUES ('4', '1');
INSERT INTO `t_menu_role` VALUES ('4', '2');
INSERT INTO `t_menu_role` VALUES ('5', '1');
INSERT INTO `t_menu_role` VALUES ('5', '2');
INSERT INTO `t_menu_role` VALUES ('6', '1');

-- ----------------------------
-- Table structure for t_output
-- ----------------------------
DROP TABLE IF EXISTS `t_output`;
CREATE TABLE `t_output` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '出库产品名',
  `pcount` int(8) DEFAULT NULL COMMENT '数量',
  `price` double(10,2) DEFAULT NULL COMMENT '单价',
  `annt` varchar(32) DEFAULT NULL,
  `outputtime` datetime DEFAULT NULL COMMENT '出库时间',
  `state` int(2) DEFAULT '1' COMMENT '当前记录的状态：1：有用   0：记录已被移除',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_output
-- ----------------------------
INSERT INTO `t_output` VALUES ('2', '高温钴烙合金', '30', '0.00', '小红', '2011-07-01 11:34:16', '1');
INSERT INTO `t_output` VALUES ('3', '高温钴烙合金', '40', '0.00', '小张', '2011-07-01 11:34:34', '1');
INSERT INTO `t_output` VALUES ('4', '适配器', '13', '0.00', '老李', '2011-07-03 17:27:52', '1');
INSERT INTO `t_output` VALUES ('5', 'RC700驱动电源板卡零配件', '2', '25.00', '张建秋', '2019-06-02 09:58:11', '1');

-- ----------------------------
-- Table structure for t_products
-- ----------------------------
DROP TABLE IF EXISTS `t_products`;
CREATE TABLE `t_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `bid` int(5) DEFAULT NULL,
  `sid` int(5) DEFAULT NULL,
  `units` varchar(32) DEFAULT NULL COMMENT '单位',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `wvalue` int(8) DEFAULT NULL COMMENT '预警值',
  `state` int(2) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `annt` varchar(32) DEFAULT NULL COMMENT '经办人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1319 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_products
-- ----------------------------
INSERT INTO `t_products` VALUES ('1040', '压铸炉', '17', '83', '台', '45', '20', '1', '2011-06-29 01:00:32', '小红');
INSERT INTO `t_products` VALUES ('1041', '水打磨机', '17', '83', '台', '12', '20', '1', '2011-06-29 01:00:32', '小张');
INSERT INTO `t_products` VALUES ('1042', '美国石膏比例机', '17', '83', '台', '277', '20', '1', '2011-06-29 01:00:32', '老李');
INSERT INTO `t_products` VALUES ('1043', 'CAUTIONHOTG去蜡炉', '17', '83', '台', '186', '20', '1', '2011-06-29 01:00:32', '张建秋');
INSERT INTO `t_products` VALUES ('1044', 'NEY VULCAN去蜡炉', '17', '83', '台', '187', '20', '1', '2011-06-29 01:00:32', '王五');
INSERT INTO `t_products` VALUES ('1045', '铸造机', '17', '83', '台', '85', '20', '1', '2011-06-29 01:00:32', '李四');
INSERT INTO `t_products` VALUES ('1046', '进口单管喷砂机', '17', '83', '台', '6', '20', '1', '2011-06-29 01:00:32', '赵六');
INSERT INTO `t_products` VALUES ('1047', '4.5万转手机柄', '17', '83', '个', '43', '20', '1', '2011-06-29 01:00:32', '黑子');
INSERT INTO `t_products` VALUES ('1048', '吊机', '17', '83', '台', '93', '20', '1', '2011-06-29 01:00:32', '胖子');
INSERT INTO `t_products` VALUES ('1049', 'TS-300ZT汽动手机', '17', '83', '台', '99', '20', '1', '2011-06-29 01:00:32', '小红');
INSERT INTO `t_products` VALUES ('1050', '抽真空磅', '17', '83', '台', '197', '20', '1', '2011-06-29 01:00:32', '小张');
INSERT INTO `t_products` VALUES ('1051', '烤瓷炉', '17', '83', '台', '35', '20', '1', '2011-06-29 01:00:32', '老李');
INSERT INTO `t_products` VALUES ('1052', '金粉吸尘机', '17', '83', '台', '7', '20', '1', '2011-06-29 01:00:32', '张建秋');
INSERT INTO `t_products` VALUES ('1053', '铸造火枪', '17', '83', '支', '13', '20', '1', '2011-06-29 01:00:32', '王五');
INSERT INTO `t_products` VALUES ('1054', '高速切割机', '17', '83', '台', '94', '20', '1', '2011-06-29 01:00:32', '李四');
INSERT INTO `t_products` VALUES ('1055', '真空搅拌机', '17', '83', '台', '300', '20', '1', '2011-06-29 01:00:32', '赵六');
INSERT INTO `t_products` VALUES ('1056', '成型机', '17', '83', '台', '20', '20', '1', '2011-06-29 01:00:33', '黑子');
INSERT INTO `t_products` VALUES ('1057', '植钉机轴心柄', '17', '83', '个', '96', '20', '1', '2011-06-29 01:00:33', '胖子');
INSERT INTO `t_products` VALUES ('1058', '吊机内电机', '17', '83', '个', '621', '20', '1', '2011-06-29 01:00:33', '小红');
INSERT INTO `t_products` VALUES ('1059', '胶枪', '17', '83', '把', '465', '20', '1', '2011-06-29 01:00:33', '小张');
INSERT INTO `t_products` VALUES ('1060', '压力胶枪', '17', '83', '支', '690', '20', '1', '2011-06-29 01:00:33', '老李');
INSERT INTO `t_products` VALUES ('1061', '焊枪', '17', '83', '把', '1122', '20', '1', '2011-06-29 01:00:33', '张建秋');
INSERT INTO `t_products` VALUES ('1062', '日本喷火枪', '17', '83', '把', '20', '20', '1', '2011-06-29 01:00:33', '王五');
INSERT INTO `t_products` VALUES ('1063', '水磨机砂片', '17', '84', '块', '0', '20', '1', '2011-06-29 01:00:33', '李四');
INSERT INTO `t_products` VALUES ('1064', '钻石金钢砂片', '17', '84', '片', '298', '20', '1', '2011-06-29 01:00:33', '赵六');
INSERT INTO `t_products` VALUES ('1065', '国产真空搅拌杯', '17', '84', '个', '1048', '20', '1', '2011-06-29 01:00:33', '黑子');
INSERT INTO `t_products` VALUES ('1066', '吸尘袋', '17', '84', '个', '532', '20', '1', '2011-06-29 01:00:33', '胖子');
INSERT INTO `t_products` VALUES ('1067', '真空包埋机用ORNG', '17', '84', '个', '379', '20', '1', '2011-06-29 01:00:33', '小红');
INSERT INTO `t_products` VALUES ('1068', '洗净机安全栓', '17', '84', '个', '732', '20', '1', '2011-06-29 01:00:33', '小张');
INSERT INTO `t_products` VALUES ('1069', '洗净机网管', '17', '84', '根', '851', '20', '1', '2011-06-29 01:00:33', '老李');
INSERT INTO `t_products` VALUES ('1070', '洗净机继电器', '17', '84', '个', '213', '20', '1', '2011-06-29 01:00:33', '张建秋');
INSERT INTO `t_products` VALUES ('1071', 'NEY密封圈', '17', '84', '个', '282', '20', '1', '2011-06-29 01:00:33', '王五');
INSERT INTO `t_products` VALUES ('1072', '吊机皮带', '17', '84', '支', '440', '20', '1', '2011-06-29 01:00:33', '李四');
INSERT INTO `t_products` VALUES ('1073', '高速手机机心', '17', '84', '支', '395', '20', '1', '2011-06-29 01:00:33', '赵六');
INSERT INTO `t_products` VALUES ('1074', '汽动手机轴承', '17', '84', '个', '0', '20', '1', '2011-06-29 01:00:33', '黑子');
INSERT INTO `t_products` VALUES ('1075', '汽动手机头', '17', '84', '个', '704', '20', '1', '2011-06-29 01:00:33', '胖子');
INSERT INTO `t_products` VALUES ('1076', '美国轴承', '17', '84', '个', '287', '20', '1', '2011-06-29 01:00:33', '小红');
INSERT INTO `t_products` VALUES ('1077', '蒸汽管', '17', '84', '根', '1012', '20', '1', '2011-06-29 01:00:33', '小张');
INSERT INTO `t_products` VALUES ('1078', '吊机碳刷', '17', '84', '个', '507', '20', '1', '2011-06-29 01:00:33', '老李');
INSERT INTO `t_products` VALUES ('1079', '手机电源线', '17', '84', '根', '1002', '20', '1', '2011-06-29 01:00:33', '张建秋');
INSERT INTO `t_products` VALUES ('1080', '手机碳刷', '17', '84', '个', '392', '20', '1', '2011-06-29 01:00:33', '王五');
INSERT INTO `t_products` VALUES ('1081', '汽油格', '17', '84', '个', '374', '20', '1', '2011-06-29 01:00:33', '李四');
INSERT INTO `t_products` VALUES ('1082', '铸造机头', '17', '84', '个', '547', '20', '1', '2011-06-29 01:00:33', '赵六');
INSERT INTO `t_products` VALUES ('1083', '烤瓷炉测试温度条', '17', '84', '支', '1010', '20', '1', '2011-06-29 01:00:33', '黑子');
INSERT INTO `t_products` VALUES ('1084', '烤瓷炉胆', '17', '84', '个', '394', '20', '1', '2011-06-29 01:00:34', '胖子');
INSERT INTO `t_products` VALUES ('1085', '烤瓷炉感温棒', '17', '84', '支', '512', '20', '1', '2011-06-29 01:00:34', '小红');
INSERT INTO `t_products` VALUES ('1086', '烤瓷炉盘', '17', '84', '个', '413', '20', '1', '2011-06-29 01:00:34', '小张');
INSERT INTO `t_products` VALUES ('1087', '压瓷炉盘', '17', '84', '个', '386', '20', '1', '2011-06-29 01:00:34', '老李');
INSERT INTO `t_products` VALUES ('1088', 'IP2000烤瓷炉密封圈', '17', '84', '个', '526', '20', '1', '2011-06-29 01:00:34', '张建秋');
INSERT INTO `t_products` VALUES ('1089', '进口弹簧', '17', '84', '个', '710', '20', '1', '2011-06-29 01:00:34', '王五');
INSERT INTO `t_products` VALUES ('1090', '喷砂机头嘴', '17', '84', '个', '484', '20', '1', '2011-06-29 01:00:34', '李四');
INSERT INTO `t_products` VALUES ('1091', '火枪头', '17', '84', '支', '292', '20', '1', '2011-06-29 01:00:34', '赵六');
INSERT INTO `t_products` VALUES ('1092', '小炉板', '17', '84', '块', '564', '20', '1', '2011-06-29 01:00:34', '黑子');
INSERT INTO `t_products` VALUES ('1093', '烤瓷炉发热丝', '17', '84', '个', '730', '20', '1', '2011-06-29 01:00:34', '胖子');
INSERT INTO `t_products` VALUES ('1094', 'MPB轴承', '17', '84', '只', '400', '20', '1', '2011-06-29 01:00:34', '小红');
INSERT INTO `t_products` VALUES ('1095', '手机轴承', '17', '84', '只', '241', '20', '1', '2011-06-29 01:00:34', '小张');
INSERT INTO `t_products` VALUES ('1096', '压瓷炉拉簧', '17', '84', '个', '504', '20', '1', '2011-06-29 01:00:34', '老李');
INSERT INTO `t_products` VALUES ('1097', '烤瓷炉效温银片', '17', '84', '合', '605', '20', '1', '2011-06-29 01:00:34', '张建秋');
INSERT INTO `t_products` VALUES ('1098', '手机轴心', '17', '84', '个', '440', '20', '1', '2011-06-29 01:00:34', '王五');
INSERT INTO `t_products` VALUES ('1099', '测温银丝', '17', '84', '合', '359', '20', '1', '2011-06-29 01:00:34', '李四');
INSERT INTO `t_products` VALUES ('1100', '烤瓷炉高温底座', '17', '84', '个', '407', '20', '1', '2011-06-29 01:00:34', '赵六');
INSERT INTO `t_products` VALUES ('1101', '种钉机砂心圈', '17', '84', '套', '718', '20', '1', '2011-06-29 01:00:34', '黑子');
INSERT INTO `t_products` VALUES ('1102', 'MR148轴承', '17', '84', '个', '718', '20', '1', '2011-06-29 01:00:34', '小红');
INSERT INTO `t_products` VALUES ('1103', 'MR126轴承', '17', '84', '个', '459', '20', '1', '2011-06-29 01:00:34', '小张');
INSERT INTO `t_products` VALUES ('1104', 'MR104轴承', '17', '84', '个', '479', '20', '1', '2011-06-29 01:00:34', '老李');
INSERT INTO `t_products` VALUES ('1105', '蒸汽机电子阀', '17', '84', '个', '1118', '20', '1', '2011-06-29 01:00:34', '张建秋');
INSERT INTO `t_products` VALUES ('1106', '气管接头', '17', '84', '个', '385', '20', '1', '2011-06-29 01:00:34', '王五');
INSERT INTO `t_products` VALUES ('1107', '直通接头', '17', '84', '个', '816', '20', '1', '2011-06-29 01:00:34', '李四');
INSERT INTO `t_products` VALUES ('1108', '铜接头', '17', '84', '个', '548', '20', '1', '2011-06-29 01:00:34', '赵六');
INSERT INTO `t_products` VALUES ('1109', '意大利牙花总承', '17', '84', '个', '399', '20', '1', '2011-06-29 01:00:34', '黑子');
INSERT INTO `t_products` VALUES ('1110', 'MR93轴承', '17', '84', '个', '162', '20', '1', '2011-06-29 01:00:34', '胖子');
INSERT INTO `t_products` VALUES ('1111', '烤瓷炉电磁阀', '17', '84', '个', '689', '20', '1', '2011-06-29 01:00:35', '小红');
INSERT INTO `t_products` VALUES ('1112', '瓷盘', '17', '84', '个', '450', '20', '1', '2011-06-29 01:00:35', '小张');
INSERT INTO `t_products` VALUES ('1113', '手机油', '17', '84', '瓶', '286', '20', '1', '2011-06-29 01:00:35', '老李');
INSERT INTO `t_products` VALUES ('1115', '石膏剪', '18', '85', '把', '624', '20', '1', '2011-06-29 01:00:35', '王五');
INSERT INTO `t_products` VALUES ('1116', '石膏调拌刀', '18', '85', '把', '488', '20', '1', '2011-06-29 01:00:35', '李四');
INSERT INTO `t_products` VALUES ('1117', '锯柄', '18', '85', '把', '1482', '20', '1', '2011-06-29 01:00:35', '赵六');
INSERT INTO `t_products` VALUES ('1118', '大橡胶皮碗', '18', '85', '个', '889', '20', '1', '2011-06-29 01:00:35', '黑子');
INSERT INTO `t_products` VALUES ('1119', '铜嘴风枪头', '18', '85', '支', '486', '20', '1', '2011-06-29 01:00:35', '胖子');
INSERT INTO `t_products` VALUES ('1121', '2040#蜡刀', '18', '86', '把', '208', '20', '1', '2011-06-29 01:00:35', '小红');
INSERT INTO `t_products` VALUES ('1122', '双头探针', '18', '86', '把', '380', '20', '1', '2011-06-29 01:00:35', '小张');
INSERT INTO `t_products` VALUES ('1123', '电蜡刀', '18', '86', '把', '878', '20', '1', '2011-06-29 01:00:35', '老李');
INSERT INTO `t_products` VALUES ('1124', '#5蜡刀', '18', '86', '把', '586', '20', '1', '2011-06-29 01:00:35', '张建秋');
INSERT INTO `t_products` VALUES ('1125', '台湾雕刻刀', '18', '86', '把', '249', '20', '1', '2011-06-29 01:00:35', '王五');
INSERT INTO `t_products` VALUES ('1126', '#5关刀滴蜡刀', '18', '86', '把', '392', '20', '1', '2011-06-29 01:00:35', '李四');
INSERT INTO `t_products` VALUES ('1127', '一般包埋圈', '18', '86', '套', '0', '20', '1', '2011-06-29 01:00:35', '赵六');
INSERT INTO `t_products` VALUES ('1128', '50G包埋底坐', '18', '86', '个', '554', '20', '1', '2011-06-29 01:00:35', '黑子');
INSERT INTO `t_products` VALUES ('1129', 'GROBET洒精灯', '18', '86', '个', '380', '20', '1', '2011-06-29 01:00:35', '胖子');
INSERT INTO `t_products` VALUES ('1130', '洒精灯', '18', '86', '个', '212', '20', '1', '2011-06-29 01:00:35', '小红');
INSERT INTO `t_products` VALUES ('1131', 'ERA', '18', '86', '个', '153', '20', '1', '2011-06-29 01:00:35', '小张');
INSERT INTO `t_products` VALUES ('1132', 'PEARSN 种植体配件', '18', '86', '包', '519', '20', '1', '2011-06-29 01:00:35', '老李');
INSERT INTO `t_products` VALUES ('1133', '3021KV', '18', '86', '个', '303', '20', '1', '2011-06-29 01:00:35', '张建秋');
INSERT INTO `t_products` VALUES ('1134', '3114KV', '18', '86', '个', '155', '20', '1', '2011-06-29 01:00:35', '王五');
INSERT INTO `t_products` VALUES ('1135', '蜡卡尺', '18', '86', '把', '831', '20', '1', '2011-06-29 01:00:35', '李四');
INSERT INTO `t_products` VALUES ('1136', '#137技工钳', '18', '86', '把', '880', '20', '1', '2011-06-29 01:00:35', '赵六');
INSERT INTO `t_products` VALUES ('1137', 'C5C6蜡刀', '18', '86', '把', '619', '20', '1', '2011-06-29 01:00:35', '黑子');
INSERT INTO `t_products` VALUES ('1138', '剪钳', '18', '86', '把', '251', '20', '1', '2011-06-29 01:00:35', '胖子');
INSERT INTO `t_products` VALUES ('1139', '雕刻刀', '18', '86', '把', '290', '20', '1', '2011-06-29 01:00:35', '小红');
INSERT INTO `t_products` VALUES ('1140', '漂白色比色板11-8色', '18', '87', '套', '784', '20', '1', '2011-06-29 01:00:36', '小张');
INSERT INTO `t_products` VALUES ('1141', 'A0-B0比色板', '18', '87', '套', '433', '20', '1', '2011-06-29 01:00:36', '老李');
INSERT INTO `t_products` VALUES ('1142', '#8号上瓷笔', '18', '87', '支', '118', '20', '1', '2011-06-29 01:00:36', '张建秋');
INSERT INTO `t_products` VALUES ('1143', '#7号上瓷笔', '18', '87', '支', '0', '20', '1', '2011-06-29 01:00:36', '王五');
INSERT INTO `t_products` VALUES ('1144', '#6号上瓷笔', '18', '87', '支', '500', '20', '1', '2011-06-29 01:00:36', '李四');
INSERT INTO `t_products` VALUES ('1145', '#5号上瓷笔', '18', '87', '支', '695', '20', '1', '2011-06-29 01:00:36', '赵六');
INSERT INTO `t_products` VALUES ('1146', '#4号上瓷笔', '18', '87', '支', '844', '20', '1', '2011-06-29 01:00:36', '黑子');
INSERT INTO `t_products` VALUES ('1147', '#1号笔', '18', '87', '支', '227', '20', '1', '2011-06-29 01:00:36', '胖子');
INSERT INTO `t_products` VALUES ('1148', '#1/8上OP笔', '18', '87', '支', '425', '20', '1', '2011-06-29 01:00:36', '小红');
INSERT INTO `t_products` VALUES ('1149', '#0  号笔', '18', '87', '支', '442', '20', '1', '2011-06-29 01:00:36', '小张');
INSERT INTO `t_products` VALUES ('1150', '#00号笔', '18', '87', '支', '922', '20', '1', '2011-06-29 01:00:36', '老李');
INSERT INTO `t_products` VALUES ('1151', '#000号笔', '18', '87', '支', '625', '20', '1', '2011-06-29 01:00:36', '张建秋');
INSERT INTO `t_products` VALUES ('1152', '清洁碳', '18', '87', '盒', '1024', '20', '1', '2011-06-29 01:00:36', '王五');
INSERT INTO `t_products` VALUES ('1153', '止血钳', '18', '87', '把', '938', '20', '1', '2011-06-29 01:00:36', '李四');
INSERT INTO `t_products` VALUES ('1154', '烧付钉', '18', '87', '包', '0', '20', '1', '2011-06-29 01:00:36', '赵六');
INSERT INTO `t_products` VALUES ('1155', '烧付盘（带钉）', '18', '87', '个', '0', '20', '1', '2011-06-29 01:00:36', '黑子');
INSERT INTO `t_products` VALUES ('1156', '调色盘', '18', '87', '个', '277', '20', '1', '2011-06-29 01:00:36', '胖子');
INSERT INTO `t_products` VALUES ('1157', '上瓷调刀', '18', '87', '把', '186', '20', '1', '2011-06-29 01:00:36', '小红');
INSERT INTO `t_products` VALUES ('1158', '双头调拌刀', '18', '87', '把', '187', '20', '1', '2011-06-29 01:00:36', '小张');
INSERT INTO `t_products` VALUES ('1159', '玛瑙刀', '18', '87', '把', '85', '20', '1', '2011-06-29 01:00:36', '老李');
INSERT INTO `t_products` VALUES ('1160', '胶调刀', '18', '87', '把', '6', '20', '1', '2011-06-29 01:00:36', '张建秋');
INSERT INTO `t_products` VALUES ('1161', '回切刀', '18', '87', '把', '43', '20', '1', '2011-06-29 01:00:36', '王五');
INSERT INTO `t_products` VALUES ('1162', '上瓷拉刀', '18', '87', '把', '93', '20', '1', '2011-06-29 01:00:36', '李四');
INSERT INTO `t_products` VALUES ('1163', '大镊子', '18', '87', '个', '99', '20', '1', '2011-06-29 01:00:36', '赵六');
INSERT INTO `t_products` VALUES ('1164', '小镊子', '18', '87', '个', '197', '20', '1', '2011-06-29 01:00:36', '黑子');
INSERT INTO `t_products` VALUES ('1165', '3D比色板', '18', '87', '个', '35', '20', '1', '2011-06-29 01:00:36', '胖子');
INSERT INTO `t_products` VALUES ('1166', 'VITA 16色比色板', '18', '87', '块', '7', '20', '1', '2011-06-29 01:00:36', '小红');
INSERT INTO `t_products` VALUES ('1167', '烤瓷炉清洁剂', '18', '87', '瓶', '13', '20', '1', '2011-06-29 01:00:37', '小张');
INSERT INTO `t_products` VALUES ('1168', '高温棉', '18', '87', '包', '99', '20', '1', '2011-06-29 01:00:37', '老李');
INSERT INTO `t_products` VALUES ('1169', '吸水棉', '18', '87', '块', '300', '20', '1', '2011-06-29 01:00:37', '张建秋');
INSERT INTO `t_products` VALUES ('1170', '飞马包埋粉', '18', '88', '箱', '20', '20', '1', '2011-06-29 01:00:37', '王五');
INSERT INTO `t_products` VALUES ('1171', '白蜡', '18', '88', '盒', '96', '20', '1', '2011-06-29 01:00:37', '李四');
INSERT INTO `t_products` VALUES ('1172', '红蜡片', '18', '88', '盒', '621', '20', '1', '2011-06-29 01:00:37', '赵六');
INSERT INTO `t_products` VALUES ('1173', '绿蜡块', '18', '88', '块', '465', '20', '1', '2011-06-29 01:00:37', '黑子');
INSERT INTO `t_products` VALUES ('1174', '大瓶黄蜡粒', '18', '88', '瓶', '0', '20', '1', '2011-06-29 01:00:37', '胖子');
INSERT INTO `t_products` VALUES ('1175', '边缘蜡', '18', '88', '盒', '0', '20', '1', '2011-06-29 01:00:37', '小红');
INSERT INTO `t_products` VALUES ('1176', '米色通用蜡/50g', '18', '88', '块', '277', '20', '1', '2011-06-29 01:00:37', '小张');
INSERT INTO `t_products` VALUES ('1177', '进口#26号蜡片', '18', '88', '盒', '186', '20', '1', '2011-06-29 01:00:37', '老李');
INSERT INTO `t_products` VALUES ('1178', 'KZRR分离剂', '18', '88', '瓶', '187', '20', '1', '2011-06-29 01:00:37', '张建秋');
INSERT INTO `t_products` VALUES ('1179', '0.8蜡线条', '18', '88', '盒', '85', '20', '1', '2011-06-29 01:00:37', '王五');
INSERT INTO `t_products` VALUES ('1180', '2.0蜡线条', '18', '88', '盒', '6', '20', '1', '2011-06-29 01:00:37', '李四');
INSERT INTO `t_products` VALUES ('1181', '2.5蜡线条', '18', '88', '合', '43', '20', '1', '2011-06-29 01:00:37', '赵六');
INSERT INTO `t_products` VALUES ('1182', '3.0蜡线条', '18', '88', '盒', '93', '20', '1', '2011-06-29 01:00:37', '黑子');
INSERT INTO `t_products` VALUES ('1183', '3.5蜡线条', '18', '88', '盒', '99', '20', '1', '2011-06-29 01:00:37', '胖子');
INSERT INTO `t_products` VALUES ('1184', '石棉纸', '18', '88', '个', '197', '20', '1', '2011-06-29 01:00:37', '小红');
INSERT INTO `t_products` VALUES ('1185', '除泡剂WAX PAINENG', '18', '88', '瓶', '35', '20', '1', '2011-06-29 01:00:37', '小张');
INSERT INTO `t_products` VALUES ('1186', '玻璃棒', '18', '88', '包', '7', '20', '1', '2011-06-29 01:00:37', '老李');
INSERT INTO `t_products` VALUES ('1187', '#4胶包埋圈', '18', '88', '个', '13', '20', '1', '2011-06-29 01:00:37', '张建秋');
INSERT INTO `t_products` VALUES ('1188', '#3胶包埋圈', '18', '88', '个', '99', '20', '1', '2011-06-29 01:00:37', '王五');
INSERT INTO `t_products` VALUES ('1189', 'BK 烤瓷包埋料12KG', '18', '88', '箱', '300', '20', '1', '2011-06-29 01:00:37', '李四');
INSERT INTO `t_products` VALUES ('1190', '高速车针', '18', '89', '支', '20', '20', '1', '2011-06-29 01:00:38', '赵六');
INSERT INTO `t_products` VALUES ('1191', '低速车针', '18', '89', '支', '96', '20', '1', '2011-06-29 01:00:38', '黑子');
INSERT INTO `t_products` VALUES ('1192', '1-008车针', '18', '89', '支', '621', '20', '1', '2011-06-29 01:00:38', '胖子');
INSERT INTO `t_products` VALUES ('1193', '1-014车针', '18', '89', '支', '0', '20', '1', '2011-06-29 01:00:38', '小红');
INSERT INTO `t_products` VALUES ('1194', '1-023车针', '18', '89', '支', '0', '20', '1', '2011-06-29 01:00:38', '小张');
INSERT INTO `t_products` VALUES ('1195', '2-018车针', '18', '89', '支', '277', '20', '1', '2011-06-29 01:00:38', '老李');
INSERT INTO `t_products` VALUES ('1196', '1LR车针', '18', '89', '支', '186', '20', '1', '2011-06-29 01:00:38', '张建秋');
INSERT INTO `t_products` VALUES ('1197', '2R车针', '18', '89', '支', '187', '20', '1', '2011-06-29 01:00:38', '王五');
INSERT INTO `t_products` VALUES ('1198', '3R车针', '18', '89', '支', '85', '20', '1', '2011-06-29 01:00:38', '李四');
INSERT INTO `t_products` VALUES ('1199', '4R车针', '18', '89', '支', '6', '20', '1', '2011-06-29 01:00:38', '赵六');
INSERT INTO `t_products` VALUES ('1200', '5R车针', '18', '89', '支', '43', '20', '1', '2011-06-29 01:00:38', '黑子');
INSERT INTO `t_products` VALUES ('1201', '13B车针', '18', '89', '支', '93', '20', '1', '2011-06-29 01:00:38', '胖子');
INSERT INTO `t_products` VALUES ('1202', '14B车针', '18', '89', '支', '99', '20', '1', '2011-06-29 01:00:38', '小红');
INSERT INTO `t_products` VALUES ('1203', '15-2夹石针', '18', '89', '支', '197', '20', '1', '2011-06-29 01:00:38', '小张');
INSERT INTO `t_products` VALUES ('1204', 'SPC23车针', '18', '89', '支', '35', '20', '1', '2011-06-29 01:00:38', '老李');
INSERT INTO `t_products` VALUES ('1205', 'SPC33车针', '18', '89', '支', '7', '20', '1', '2011-06-29 01:00:38', '张建秋');
INSERT INTO `t_products` VALUES ('1206', '18P国产长针', '18', '89', '支', '13', '20', '1', '2011-06-29 01:00:38', '王五');
INSERT INTO `t_products` VALUES ('1207', '#29号车针', '18', '89', '支', '99', '20', '1', '2011-06-29 01:00:38', '李四');
INSERT INTO `t_products` VALUES ('1208', 'SP49车针', '18', '89', '支', '0', '20', '1', '2011-06-29 01:00:38', '赵六');
INSERT INTO `t_products` VALUES ('1209', 'FG37车针', '18', '89', '支', '0', '20', '1', '2011-06-29 01:00:38', '黑子');
INSERT INTO `t_products` VALUES ('1210', 'FG7901车针', '18', '89', '支', '277', '20', '1', '2011-06-29 01:00:38', '胖子');
INSERT INTO `t_products` VALUES ('1211', '车瓷砂片22M/M', '18', '90', '片', '186', '20', '1', '2011-06-29 01:00:38', '小红');
INSERT INTO `t_products` VALUES ('1212', '22*0.25*1.8砂片', '18', '90', '片', '187', '20', '1', '2011-06-29 01:00:38', '小张');
INSERT INTO `t_products` VALUES ('1213', '25*0.6*1.8砂片', '18', '90', '片', '85', '20', '1', '2011-06-29 01:00:38', '老李');
INSERT INTO `t_products` VALUES ('1214', '38*0.7*1.8砂片', '18', '90', '片', '6', '20', '1', '2011-06-29 01:00:38', '张建秋');
INSERT INTO `t_products` VALUES ('1215', '38*1.7*1.8砂片', '18', '90', '片', '43', '20', '1', '2011-06-29 01:00:38', '王五');
INSERT INTO `t_products` VALUES ('1216', '台湾小厚砂片', '18', '90', '片', '93', '20', '1', '2011-06-29 01:00:38', '李四');
INSERT INTO `t_products` VALUES ('1217', '绿车石', '18', '91', '个', '99', '20', '1', '2011-06-29 01:00:38', '小红');
INSERT INTO `t_products` VALUES ('1218', '贵金打亮胶轮', '18', '91', '个', '197', '20', '1', '2011-06-29 01:00:38', '小张');
INSERT INTO `t_products` VALUES ('1219', '小棕毛刷', '18', '91', '个', '35', '20', '1', '2011-06-29 01:00:39', '老李');
INSERT INTO `t_products` VALUES ('1220', '棕胶轮', '18', '91', '个', '7', '20', '1', '2011-06-29 01:00:39', '张建秋');
INSERT INTO `t_products` VALUES ('1221', 'G13子弹头车石', '18', '91', '个', '13', '20', '1', '2011-06-29 01:00:39', '王五');
INSERT INTO `t_products` VALUES ('1222', '轮 状小号车石', '18', '91', '个', '99', '20', '1', '2011-06-29 01:00:39', '李四');
INSERT INTO `t_products` VALUES ('1223', 'R22台湾硬胶轮', '18', '91', '个', '300', '20', '1', '2011-06-29 01:00:39', '赵六');
INSERT INTO `t_products` VALUES ('1224', 'L22台湾白扣轮', '18', '91', '个', '20', '20', '1', '2011-06-29 01:00:39', '黑子');
INSERT INTO `t_products` VALUES ('1225', 'DEDECO 绿胶轮', '18', '91', '个', '96', '20', '1', '2011-06-29 01:00:39', '胖子');
INSERT INTO `t_products` VALUES ('1226', 'DEDECO 绿胶粒', '18', '91', '个', '621', '20', '1', '2011-06-29 01:00:39', '小红');
INSERT INTO `t_products` VALUES ('1227', '扣形小胶轮', '18', '91', '个', '465', '20', '1', '2011-06-29 01:00:39', '小张');
INSERT INTO `t_products` VALUES ('1228', '绒毛轮', '18', '91', '个', '690', '20', '1', '2011-06-29 01:00:39', '老李');
INSERT INTO `t_products` VALUES ('1229', 'PEARSON柱型胶轮', '18', '91', '个', '0', '20', '1', '2011-06-29 01:00:39', '张建秋');
INSERT INTO `t_products` VALUES ('1230', 'PEARSON子弹头胶轮', '18', '91', '个', '0', '20', '1', '2011-06-29 01:00:39', '王五');
INSERT INTO `t_products` VALUES ('1231', 'PEARSON 兰轮', '18', '92', '个', '277', '20', '1', '2011-06-29 01:00:39', '李四');
INSERT INTO `t_products` VALUES ('1232', '美国打亮膏（BELLA）', '18', '92', '合', '186', '20', '1', '2011-06-29 01:00:39', '赵六');
INSERT INTO `t_products` VALUES ('1233', '国产钻石打亮膏', '18', '92', '支', '187', '20', '1', '2011-06-29 01:00:39', '黑子');
INSERT INTO `t_products` VALUES ('1234', '黑色打亮膏', '18', '92', '筒', '85', '20', '1', '2011-06-29 01:00:39', '胖子');
INSERT INTO `t_products` VALUES ('1235', '红色打亮砖', '18', '92', '个', '6', '20', '1', '2011-06-29 01:00:39', '小红');
INSERT INTO `t_products` VALUES ('1236', '抛光蜡', '18', '93', '块', '43', '20', '1', '2011-06-29 01:00:39', '小张');
INSERT INTO `t_products` VALUES ('1237', '焊条', '18', '93', '支', '93', '20', '1', '2011-06-29 01:00:39', '老李');
INSERT INTO `t_products` VALUES ('1238', 'VERA焊条', '18', '93', '支', '99', '20', '1', '2011-06-29 01:00:39', '张建秋');
INSERT INTO `t_products` VALUES ('1239', 'Co/Cr NP PRE-SOLDER', '18', '93', '根', '197', '20', '1', '2011-06-29 01:00:39', '王五');
INSERT INTO `t_products` VALUES ('1240', '#100石英砂', '18', '94', '包', '35', '20', '1', '2011-06-29 01:00:39', '李四');
INSERT INTO `t_products` VALUES ('1241', '玻璃砂', '18', '94', '包', '7', '20', '1', '2011-06-29 01:00:39', '赵六');
INSERT INTO `t_products` VALUES ('1242', '黄金砂', '18', '94', '瓶', '13', '20', '1', '2011-06-29 01:00:39', '黑子');
INSERT INTO `t_products` VALUES ('1243', '美国进口硬石膏', '19', '95', '箱', '99', '20', '1', '2011-06-29 01:00:39', '胖子');
INSERT INTO `t_products` VALUES ('1244', '超硬黄石膏25kg', '19', '95', '代', '300', '20', '1', '2011-06-29 01:00:39', '小红');
INSERT INTO `t_products` VALUES ('1245', '绿石膏25G', '19', '95', '箱', '20', '20', '1', '2011-06-29 01:00:39', '小张');
INSERT INTO `t_products` VALUES ('1246', '国产兰色石膏25KG', '19', '95', '包', '96', '20', '1', '2011-06-29 01:00:40', '老李');
INSERT INTO `t_products` VALUES ('1247', '底座白石膏', '19', '95', '包', '621', '20', '1', '2011-06-29 01:00:40', '张建秋');
INSERT INTO `t_products` VALUES ('1248', '一般白石膏', '19', '95', '包', '465', '20', '1', '2011-06-29 01:00:40', '王五');
INSERT INTO `t_products` VALUES ('1249', '珠海白石膏', '19', '95', '包', '690', '20', '1', '2011-06-29 01:00:40', '李四');
INSERT INTO `t_products` VALUES ('1250', '红笔芯', '19', '96', '盒', '0', '20', '1', '2011-06-29 01:00:40', '赵六');
INSERT INTO `t_products` VALUES ('1251', '胶棒', '19', '96', '根', '0', '20', '1', '2011-06-29 01:00:40', '黑子');
INSERT INTO `t_products` VALUES ('1252', '502胶水', '19', '96', '瓶', '277', '20', '1', '2011-06-29 01:00:40', '胖子');
INSERT INTO `t_products` VALUES ('1253', '水玻璃', '19', '96', '瓶', '186', '20', '1', '2011-06-29 01:00:40', '小红');
INSERT INTO `t_products` VALUES ('1254', '国产手术刀片', '19', '96', '包', '187', '20', '1', '2011-06-29 01:00:40', '小张');
INSERT INTO `t_products` VALUES ('1255', '进口手术刀片', '19', '96', '包', '85', '20', '1', '2011-06-29 01:00:40', '老李');
INSERT INTO `t_products` VALUES ('1256', '#11号刀片', '19', '96', '片', '6', '20', '1', '2011-06-29 01:00:40', '张建秋');
INSERT INTO `t_products` VALUES ('1257', '#15号刀片', '19', '96', '片', '43', '20', '1', '2011-06-29 01:00:40', '王五');
INSERT INTO `t_products` VALUES ('1258', '雕刻刀片', '19', '96', '片', '93', '20', '1', '2011-06-29 01:00:40', '李四');
INSERT INTO `t_products` VALUES ('1259', '兰油', '19', '96', '瓶', '99', '20', '1', '2011-06-29 01:00:40', '赵六');
INSERT INTO `t_products` VALUES ('1260', '模型油C9-金油', '19', '96', '瓶', '197', '20', '1', '2011-06-29 01:00:40', '黑子');
INSERT INTO `t_products` VALUES ('1261', '模型油C8-银油', '19', '96', '瓶', '35', '20', '1', '2011-06-29 01:00:40', '胖子');
INSERT INTO `t_products` VALUES ('1262', '高温红油', '19', '96', '瓶', '7', '20', '1', '2011-06-29 01:00:40', '小红');
INSERT INTO `t_products` VALUES ('1263', '高温黄油', '19', '96', '瓶', '13', '20', '1', '2011-06-29 01:00:40', '小张');
INSERT INTO `t_products` VALUES ('1264', '打磨砂圈', '19', '96', '个', '99', '20', '1', '2011-06-29 01:00:40', '老李');
INSERT INTO `t_products` VALUES ('1265', '锯条', '19', '96', '根', '300', '20', '1', '2011-06-29 01:00:40', '张建秋');
INSERT INTO `t_products` VALUES ('1266', '单钉', '19', '96', '包', '20', '20', '1', '2011-06-29 01:00:40', '王五');
INSERT INTO `t_products` VALUES ('1267', '双套钉', '19', '96', '盒', '96', '20', '1', '2011-06-29 01:00:40', '李四');
INSERT INTO `t_products` VALUES ('1268', '打孔钻针', '19', '96', '支', '0', '20', '1', '2011-06-29 01:00:40', '赵六');
INSERT INTO `t_products` VALUES ('1269', '种钉钻头', '19', '96', '支', '0', '20', '1', '2011-06-29 01:00:40', '黑子');
INSERT INTO `t_products` VALUES ('1270', '美国黄金钻头', '19', '96', '支', '277', '20', '1', '2011-06-29 01:00:40', '胖子');
INSERT INTO `t_products` VALUES ('1271', '贺利氏印 模材', '19', '96', '桶', '186', '20', '1', '2011-06-29 01:00:40', '小红');
INSERT INTO `t_products` VALUES ('1272', '注射型而至硅胶', '19', '96', '套', '187', '20', '1', '2011-06-29 01:00:40', '小张');
INSERT INTO `t_products` VALUES ('1273', '1:1硅橡胶', '19', '96', '套', '85', '20', '1', '2011-06-29 01:00:40', '老李');
INSERT INTO `t_products` VALUES ('1274', '日本GC树脂', '19', '96', '套', '6', '20', '1', '2011-06-29 01:00:41', '张建秋');
INSERT INTO `t_products` VALUES ('1275', '红色咬合纸', '19', '96', '个', '43', '20', '1', '2011-06-29 01:00:41', '王五');
INSERT INTO `t_products` VALUES ('1276', '涧淆液', '19', '96', '瓶', '93', '20', '1', '2011-06-29 01:00:41', '李四');
INSERT INTO `t_products` VALUES ('1277', '铝桶装快干胶', '19', '96', '桶', '99', '20', '1', '2011-06-29 01:00:41', '赵六');
INSERT INTO `t_products` VALUES ('1278', '喷塑托盘', '19', '96', '副', '197', '20', '1', '2011-06-29 01:00:41', '小红');
INSERT INTO `t_products` VALUES ('1279', '黑色咬合架', '19', '96', '付', '35', '20', '1', '2011-06-29 01:00:41', '小张');
INSERT INTO `t_products` VALUES ('1280', '白色长形咬合架', '19', '96', '付', '7', '20', '1', '2011-06-29 01:00:41', '老李');
INSERT INTO `t_products` VALUES ('1281', '钢合架', '19', '96', '个', '13', '20', '1', '2011-06-29 01:00:41', '张建秋');
INSERT INTO `t_products` VALUES ('1282', '黑色（大）', '19', '97', '个', '99', '20', '1', '2011-06-29 01:00:41', '王五');
INSERT INTO `t_products` VALUES ('1283', '黑色硅胶底座（中）', '19', '97', '个', '300', '20', '1', '2011-06-29 01:00:41', '李四');
INSERT INTO `t_products` VALUES ('1284', '黑色硅胶底座（小）', '19', '97', '个', '20', '20', '1', '2011-06-29 01:00:41', '赵六');
INSERT INTO `t_products` VALUES ('1285', '长形黑色硅胶底座 大', '19', '97', '个', '96', '20', '1', '2011-06-29 01:00:41', '黑子');
INSERT INTO `t_products` VALUES ('1286', '长形黑色硅胶底座 小', '19', '97', '个', '0', '20', '1', '2011-06-29 01:00:41', '胖子');
INSERT INTO `t_products` VALUES ('1287', '粉色半圆硅橡胶底座小', '19', '97', '个', '0', '20', '1', '2011-06-29 01:00:41', '小红');
INSERT INTO `t_products` VALUES ('1288', '粉色半圆硅橡胶底座中', '19', '97', '个', '277', '20', '1', '2011-06-29 01:00:41', '小张');
INSERT INTO `t_products` VALUES ('1289', '粉色半圆硅橡胶底座大', '19', '97', '个', '186', '20', '1', '2011-06-29 01:00:41', '老李');
INSERT INTO `t_products` VALUES ('1290', '大长硅胶底座', '19', '97', '个', '187', '20', '1', '2011-06-29 01:00:41', '张建秋');
INSERT INTO `t_products` VALUES ('1291', '小长硅胶底座', '19', '97', '个', '85', '20', '1', '2011-06-29 01:00:41', '王五');
INSERT INTO `t_products` VALUES ('1292', '平半圆硅胶底座', '19', '97', '个', '6', '20', '1', '2011-06-29 01:00:41', '李四');
INSERT INTO `t_products` VALUES ('1293', '凸半圆硅胶底座', '19', '97', '个', '43', '20', '1', '2011-06-29 01:00:41', '赵六');
INSERT INTO `t_products` VALUES ('1294', '大硅胶底坐', '19', '97', '个', '93', '20', '1', '2011-06-29 01:00:41', '黑子');
INSERT INTO `t_products` VALUES ('1295', '中硅胶底坐', '19', '97', '个', '99', '20', '1', '2011-06-29 01:00:41', '胖子');
INSERT INTO `t_products` VALUES ('1296', '小硅胶底坐', '19', '97', '个', '197', '20', '1', '2011-06-29 01:00:41', '小红');
INSERT INTO `t_products` VALUES ('1297', '长形硅胶底坐', '19', '97', '个', '35', '20', '1', '2011-06-29 01:00:41', '小张');
INSERT INTO `t_products` VALUES ('1298', '钢块', '20', '98', '块', '7', '20', '1', '2011-06-29 01:00:41', '老李');
INSERT INTO `t_products` VALUES ('1299', 'NP钢', '20', '98', '包', '13', '20', '1', '2011-06-29 01:00:41', '张建秋');
INSERT INTO `t_products` VALUES ('1300', 'NEY焊膏', '20', '98', '瓶', '99', '20', '1', '2011-06-29 01:00:42', '王五');
INSERT INTO `t_products` VALUES ('1301', 'NNB无镍玻钢', '20', '98', '瓶', '300', '20', '1', '2011-06-29 01:00:42', '李四');
INSERT INTO `t_products` VALUES ('1302', '钴铬烤瓷合金', '20', '98', '瓶', '20', '20', '1', '2011-06-29 01:00:42', '赵六');
INSERT INTO `t_products` VALUES ('1303', '烤瓷钢钢', '20', '98', '瓶', '96', '20', '1', '2011-06-29 01:00:42', '黑子');
INSERT INTO `t_products` VALUES ('1304', '无铍钢', '20', '98', '瓶', '621', '20', '1', '2011-06-29 01:00:42', '胖子');
INSERT INTO `t_products` VALUES ('1305', 'NP-V钢', '20', '98', '瓶', '300', '20', '1', '2011-06-29 01:00:42', '小红');
INSERT INTO `t_products` VALUES ('1306', '高温钴铬合金', '20', '98', '包', '200', '20', '1', '2011-06-29 01:00:42', '小张');
INSERT INTO `t_products` VALUES ('1307', '高温钴烙合金', '20', '98', '公斤', '621', '20', '1', '2011-07-02 11:53:00', '老李');
INSERT INTO `t_products` VALUES ('1308', '无镍皮钢', '20', '98', 'KG', '300', '20', '1', '2011-06-29 01:00:42', '张建秋');
INSERT INTO `t_products` VALUES ('1309', '高频机铸杯YK-H6', '20', '99', '个', '200', '20', '1', '2011-06-29 01:00:42', '王五');
INSERT INTO `t_products` VALUES ('1310', '铸杯', '20', '99', '个', '277', '20', '1', '2011-06-29 01:00:42', '李四');
INSERT INTO `t_products` VALUES ('1311', '坩埚H1.H3立式', '20', '99', '个', '186', '20', '1', '2011-06-29 01:00:42', '赵六');
INSERT INTO `t_products` VALUES ('1312', '坩埚K1卧式', '20', '99', '个', '187', '20', '1', '2011-06-29 01:00:42', '黑子');
INSERT INTO `t_products` VALUES ('1313', '坩埚K2卧式', '20', '99', '个', '85', '20', '1', '2011-06-29 01:00:42', '胖子');
INSERT INTO `t_products` VALUES ('1314', '坩埚K3卧式', '20', '99', '个', '6', '20', '1', '2011-06-29 01:00:42', '小红');
INSERT INTO `t_products` VALUES ('1315', '进口铸杯', '20', '100', '个', '43', '20', '1', '2011-06-29 01:00:42', '小张');
INSERT INTO `t_products` VALUES ('1316', '熔煤粉', '20', '100', '瓶', '93', '20', '1', '2011-06-29 01:00:42', '老李');
INSERT INTO `t_products` VALUES ('1317', '贵金属清洁剂', '20', '100', '瓶', '99', '20', '1', '2011-06-29 01:00:42', '张建秋');
INSERT INTO `t_products` VALUES ('1318', '硼砂', '20', '100', '瓶', '197', '20', '1', '2011-06-29 01:00:42', '王五');

-- ----------------------------
-- Table structure for t_provider
-- ----------------------------
DROP TABLE IF EXISTS `t_provider`;
CREATE TABLE `t_provider` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL COMMENT '用户商公司名',
  `intro` varchar(200) DEFAULT NULL COMMENT '用户商信息介绍',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=465 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_provider
-- ----------------------------
INSERT INTO `t_provider` VALUES ('426', '美国', null);
INSERT INTO `t_provider` VALUES ('427', '杜滨牙科', null);
INSERT INTO `t_provider` VALUES ('428', '广州莘诚', null);
INSERT INTO `t_provider` VALUES ('429', '现金', null);
INSERT INTO `t_provider` VALUES ('430', '汉中精诚齿科', null);
INSERT INTO `t_provider` VALUES ('431', '上海齿康', null);
INSERT INTO `t_provider` VALUES ('432', '台湾蔡爸', null);
INSERT INTO `t_provider` VALUES ('433', '超今', null);
INSERT INTO `t_provider` VALUES ('434', '鑫三禾', null);
INSERT INTO `t_provider` VALUES ('435', '南昌飞马', null);
INSERT INTO `t_provider` VALUES ('436', '珠海永嘉', null);
INSERT INTO `t_provider` VALUES ('437', '思戈玛', null);
INSERT INTO `t_provider` VALUES ('438', '深圳亮丽公司', null);
INSERT INTO `t_provider` VALUES ('439', '深圳远东', null);
INSERT INTO `t_provider` VALUES ('440', '深圳永昌', null);
INSERT INTO `t_provider` VALUES ('441', '上海山八齿材', null);
INSERT INTO `t_provider` VALUES ('442', '深圳深海通', null);
INSERT INTO `t_provider` VALUES ('443', '洛阳北苑', null);
INSERT INTO `t_provider` VALUES ('444', '台湾邱先生', null);
INSERT INTO `t_provider` VALUES ('445', '上海复星', null);
INSERT INTO `t_provider` VALUES ('446', 'dddd', 'dddd');
INSERT INTO `t_provider` VALUES ('463', '北京银联', '银联商务股份有限公司（简称：银联商务）是中国银联控股的，专门从事线下、互联网以及移动支付的综合支付与信息服务机构，成立于2002年12月，总部设在上海市浦东新区。');
INSERT INTO `t_provider` VALUES ('464', '合众艾特', '测试功能');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员');
INSERT INTO `t_role` VALUES ('2', '普通管理员');

-- ----------------------------
-- Table structure for t_smalltype
-- ----------------------------
DROP TABLE IF EXISTS `t_smalltype`;
CREATE TABLE `t_smalltype` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '小分类的名称',
  `bid` int(5) DEFAULT NULL COMMENT '对应的大类编号',
  `state` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bid` (`bid`),
  CONSTRAINT `fk_bid` FOREIGN KEY (`bid`) REFERENCES `t_bigtype` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_smalltype
-- ----------------------------
INSERT INTO `t_smalltype` VALUES ('83', '机器类', '17', '1');
INSERT INTO `t_smalltype` VALUES ('84', '配件类', '17', '1');
INSERT INTO `t_smalltype` VALUES ('85', '修模用', '18', '1');
INSERT INTO `t_smalltype` VALUES ('86', '上蜡用', '18', '1');
INSERT INTO `t_smalltype` VALUES ('87', '上瓷用', '18', '1');
INSERT INTO `t_smalltype` VALUES ('88', '蜡类', '18', '1');
INSERT INTO `t_smalltype` VALUES ('89', '车针类', '18', '1');
INSERT INTO `t_smalltype` VALUES ('90', '车片类', '18', '1');
INSERT INTO `t_smalltype` VALUES ('91', '打亮类', '18', '1');
INSERT INTO `t_smalltype` VALUES ('92', '抛光类', '18', '1');
INSERT INTO `t_smalltype` VALUES ('93', '焊条类', '18', '1');
INSERT INTO `t_smalltype` VALUES ('94', '石英砂类', '18', '1');
INSERT INTO `t_smalltype` VALUES ('95', '石膏类', '19', '1');
INSERT INTO `t_smalltype` VALUES ('96', '耗材类', '19', '1');
INSERT INTO `t_smalltype` VALUES ('97', '硅胶底座类', '19', '1');
INSERT INTO `t_smalltype` VALUES ('98', '金属类', '20', '1');
INSERT INTO `t_smalltype` VALUES ('99', '铸杯类', '20', '1');
INSERT INTO `t_smalltype` VALUES ('100', '金属清洗', '20', '1');
