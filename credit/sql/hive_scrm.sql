/*
Navicat MySQL Data Transfer

Source Server         : 115.47.153.98
Source Server Version : 50633
Source Host           : 115.47.153.98:3306
Source Database       : hive_scrm_test

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2018-08-02 16:20:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for basic_data
-- ----------------------------
DROP TABLE IF EXISTS `basic_data`;
CREATE TABLE `basic_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_code` varchar(80) DEFAULT NULL COMMENT '关联类型code',
  `type_long_code` varchar(500) DEFAULT NULL COMMENT '长编码',
  `label` varchar(100) DEFAULT NULL COMMENT '标签',
  `value` varchar(500) DEFAULT NULL COMMENT '值',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `orders` int(11) DEFAULT '0' COMMENT '排序',
  `status` int(1) DEFAULT NULL COMMENT '状态 1:启用,2:禁用',
  `del_flag` int(1) DEFAULT NULL COMMENT '删除状态1:正常 2:已删除',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : \r\n',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '更新人',
  `last_update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_type_code` (`type_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础数据表';

-- ----------------------------
-- Records of basic_data
-- ----------------------------

-- ----------------------------
-- Table structure for basic_data_type
-- ----------------------------
DROP TABLE IF EXISTS `basic_data_type`;
CREATE TABLE `basic_data_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `parent_code` varchar(100) DEFAULT NULL COMMENT '父级编码',
  `multiple_online` bit(1) DEFAULT NULL COMMENT '是否允许多个同时上线(启用)',
  `type` varchar(50) NOT NULL COMMENT '数据类型分类',
  `long_code` varchar(500) DEFAULT NULL COMMENT '长编码',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  `level` int(11) DEFAULT '1' COMMENT '级别',
  `orders` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间 : \r\n',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index_code` (`code`) USING BTREE,
  KEY `index_parent_code` (`parent_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础数据类型表';

-- ----------------------------
-- Records of basic_data_type
-- ----------------------------

-- ----------------------------
-- Table structure for damai_product_metadata
-- ----------------------------
DROP TABLE IF EXISTS `damai_product_metadata`;
CREATE TABLE `damai_product_metadata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_sequence_id` varchar(32) DEFAULT NULL COMMENT '商品序号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '商品名称(长度和优购商品名一致)',
  `category_id` varchar(32) DEFAULT NULL COMMENT '分类id/sku\r\n            ',
  `price` bigint(20) DEFAULT NULL COMMENT '价格',
  `picture` varchar(128) DEFAULT NULL COMMENT '图片地址',
  `status` int(1) DEFAULT NULL COMMENT '状态（0新建，2更新，3删除）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `integral_strategy_id` bigint(20) DEFAULT NULL COMMENT '大麦优购积分策略id',
  `category_id_type` tinyint(1) DEFAULT NULL COMMENT '分类id类型(1-3分类，4是sku)',
  `delete_status` tinyint(1) DEFAULT '0' COMMENT '删除状态，默认0，-1是删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`) USING BTREE,
  KEY `ind_category_id` (`category_id`),
  KEY `ind_integral_strategy_id` (`integral_strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优购积分策略sku表';

-- ----------------------------
-- Records of damai_product_metadata
-- ----------------------------

-- ----------------------------
-- Table structure for sub_system
-- ----------------------------
DROP TABLE IF EXISTS `sub_system`;
CREATE TABLE `sub_system` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '子系统名称',
  `project_name` varchar(30) DEFAULT NULL COMMENT '项目名',
  `code` varchar(30) NOT NULL COMMENT '系统编码',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '最新更新人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`,`code`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='子系统';

-- ----------------------------
-- Records of sub_system
-- ----------------------------
INSERT INTO `sub_system` VALUES ('1', 'pms', '权限系统', '866848898700831111', '权限系统', 'admin', '2017-11-08 15:22:30', 'admin', '2017-11-08 15:22:32');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `code` varchar(30) DEFAULT NULL COMMENT '编码',
  `long_code` varchar(150) DEFAULT NULL COMMENT '长编码',
  `status` int(1) DEFAULT NULL COMMENT '状态(1:启用,2:禁用)',
  `sub_system_code` varchar(30) DEFAULT NULL COMMENT '关联子系统',
  `parent_code` varchar(30) DEFAULT NULL COMMENT '父编码',
  `url` varchar(60) DEFAULT NULL COMMENT '访问路径',
  `is_menu` int(1) DEFAULT '1' COMMENT '1:菜单,2:权限项',
  `orders` int(11) DEFAULT '0' COMMENT '排序字段',
  `level` int(2) DEFAULT NULL COMMENT '级别',
  `icon_code` varchar(30) DEFAULT NULL COMMENT '菜单样式',
  `permission` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '最新更新人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COMMENT='系统资源表';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '权限管理', '866595798555656192', '866595798555656192', '1', '866848898700831111', null, 'resource/list_menu', '1', '4', '1', 'fa fa-key', '', 'resource', 'admin@btte.net', '2017-05-22 18:05:14', 'admin@btte.net', '2017-06-12 14:27:25');
INSERT INTO `sys_resource` VALUES ('2', '资源管理', '866595883125407744', '866595798555656192,866595883125407744', '1', '866848898700831111', '866595798555656192', 'pms/resource/list', '1', '1', '2', 'icon', 'pms:resource:list', '', 'admin@btte.net', '2017-05-22 18:05:34', 'admin@btte.net', '2017-06-02 13:57:37');
INSERT INTO `sys_resource` VALUES ('3', '用户管理', '866848827737407488', '866595798555656192,866848827737407488', '1', '866848898700831111', '866595798555656192', 'pms/user/list', '1', '2', '2', 'icon', 'pms:user:list', 'ffffff', 'admin@btte.net', '2017-05-23 10:50:40', 'admin@btte.net', '2017-05-23 10:50:40');
INSERT INTO `sys_resource` VALUES ('4', '角色管理', '866848898700836864', '866595798555656192,866848898700836864', '1', '866848898700831111', '866595798555656192', 'pms/role/list', '1', '3', '2', 'icon', 'pms:role:list', '角色管理', 'admin@btte.net', '2017-05-23 10:50:57', 'admin@btte.net', '2017-06-02 15:12:30');
INSERT INTO `sys_resource` VALUES ('5', '角色权限设置', '870516832400859136', '866595798555656192,866848898700836864,870516832400859136', '1', '866848898700831111', '866848898700836864', 'role/resourceSetting', '2', '1', '3', null, 'pms:role:resourceSetting', null, 'admin@btte.net', '2017-06-02 13:46:01', 'admin@btte.net', '2017-06-02 13:46:01');
INSERT INTO `sys_resource` VALUES ('6', '角色添加&修改', '870518310993682432', '866595798555656192,866848898700836864,870518310993682432', '1', '866848898700831111', '866848898700836864', 'role/resource/edit', '2', '2', '3', null, 'pms:role:edit', null, 'admin@btte.net', '2017-06-02 13:51:54', 'admin@btte.net', '2017-06-02 13:51:53');
INSERT INTO `sys_resource` VALUES ('7', '添加修改菜单', '870518762313375744', '866595798555656192,866595883125407744,870518762313375744', '1', '866848898700831111', '866595883125407744', 'resource/addEdit', '2', '2', '3', '', 'pms:menu:edit', '', 'admin@btte.net', '2017-06-02 13:53:41', 'admin@btte.net', '2017-06-02 13:53:41');
INSERT INTO `sys_resource` VALUES ('8', '添加修改权限项', '870518983730683904', '866595798555656192,866595883125407744,870518983730683904', '1', '866848898700831111', '866595883125407744', 'permission/addEdit', '2', '2', '3', null, 'pms:permission:edit', null, 'admin@btte.net', '2017-06-02 13:54:34', 'admin@btte.net', '2017-06-02 13:54:34');
INSERT INTO `sys_resource` VALUES ('9', '删除菜单权限', '870519327332261888', '866595798555656192,866595883125407744,870519327332261888', '1', '866848898700831111', '866595883125407744', 'pms/resource/delete', '2', '3', '3', null, 'pms:menu:delete', null, 'admin@btte.net', '2017-06-02 13:55:56', 'admin@btte.net', '2017-06-02 13:55:56');
INSERT INTO `sys_resource` VALUES ('10', '权限删除权限', '870519474401337344', '866595798555656192,866595883125407744,870519474401337344', '1', '866848898700831111', '866595883125407744', 'permission/delete', '2', '4', '3', null, 'pms:permission:delete', null, 'admin@btte.net', '2017-06-02 13:56:31', 'admin@btte.net', '2017-06-02 13:56:31');
INSERT INTO `sys_resource` VALUES ('11', '角色启用禁用', '870521335120420864', '866595798555656192,866848898700836864,870521335120420864', '1', '866848898700831111', '866848898700836864', 'role/enable', '2', '4', '3', null, 'pms:role:enable', null, 'admin@btte.net', '2017-06-02 14:03:55', 'admin@btte.net', '2017-06-23 15:50:41');
INSERT INTO `sys_resource` VALUES ('12', '添加账户权限', '425022833241030656', '866595798555656192,866848827737407488,425022833241030656', '1', '866848898700831111', '866848827737407488', 'user/partner/add', '2', '1', '3', null, 'pms:user:partner:add', null, 'admin@btte.net', '2017-09-12 11:43:55', 'admin@btte.net', '2017-09-12 11:43:55');
INSERT INTO `sys_resource` VALUES ('13', '账户修改权限', '425028504292360192', '866595798555656192,866848827737407488,425028504292360192', '1', '866848898700831111', '866848827737407488', 'user/partner/edit', '2', '2', '3', null, 'pms:user:partner:edit', null, 'admin@btte.net', '2017-09-12 12:06:27', 'admin@btte.net', '2017-09-12 12:06:27');
INSERT INTO `sys_resource` VALUES ('14', '账户删除权限', '425028916437254144', '866595798555656192,866848827737407488,425028916437254144', '1', '866848898700831111', '866848827737407488', 'user/partner/delete', '2', '3', '3', null, 'pms:user:partner:delete', null, 'admin@btte.net', '2017-09-12 12:08:05', 'admin@btte.net', '2017-09-12 12:08:05');
INSERT INTO `sys_resource` VALUES ('20', '积分商城', '475753737656123392', '475753737656123392', '1', null, null, 'credit/goods', '1', '1', '1', 'fa fa-btc', '', 'eeee', 'admin', '2018-01-30 11:30:25', 'admin', '2018-01-30 11:30:25');
INSERT INTO `sys_resource` VALUES ('21', '商品列表', '478281790458081280', '475753737656123392,478281790458081280', '1', null, '475753737656123392', 'credit/goods/list', '1', '2', '2', 'dd', '', '', 'admin', '2018-02-06 10:56:00', 'admin', '2018-02-06 10:56:00');
INSERT INTO `sys_resource` VALUES ('22', '虚拟卡', '478282803021787136', '478282803021787136', '1', null, null, 'credit/virCard', '1', '2', '1', 'fa fa-credit-card', '', '', 'admin', '2018-02-06 11:00:01', 'admin', '2018-02-06 11:00:01');
INSERT INTO `sys_resource` VALUES ('23', '虚拟卡列表', '478282929643630592', '478282803021787136,478282929643630592', '1', null, '478282803021787136', 'credit/virCard/list', '1', '3', '2', '', '', '', 'admin', '2018-02-06 11:00:31', 'admin', '2018-02-06 11:00:31');
INSERT INTO `sys_resource` VALUES ('24', '积分策略', '479062214629085184', '479062214629085184', '1', null, null, 'credit/strategy', '1', '2', '1', 'fa fa-arrows-alt', '', '', 'admin', '2018-02-08 14:37:07', 'admin', '2018-02-08 14:37:07');
INSERT INTO `sys_resource` VALUES ('25', '消费积分策略管理', '479062671757889536', '479062214629085184,479062671757889536', '1', null, '479062214629085184', 'credit/integralStrategy/list', '1', '3', '2', '', '', '', 'admin', '2018-02-08 14:38:56', 'admin', '2018-02-08 14:38:56');
INSERT INTO `sys_resource` VALUES ('26', '优购消费积分策略管理', '479103429747625984', '479062214629085184,479103429747625984', '1', null, '479062214629085184', 'credit/damaiStrategy/list', '1', '3', '2', '', '', '', 'admin', '2018-02-08 17:20:54', 'admin', '2018-02-08 17:20:54');
INSERT INTO `sys_resource` VALUES ('29', '积分汇率管理', '479112610391216128', '479112610391216128', '1', null, null, 'credit/rate', '1', '2', '1', 'fa fa-gbp', '', '', 'admin', '2018-02-08 17:57:23', 'admin', '2018-02-08 17:57:23');
INSERT INTO `sys_resource` VALUES ('30', '积分汇率列表', '479112757116358656', '479112610391216128,479112757116358656', '1', null, '479112610391216128', 'credit/rate/list', '1', '3', '2', '', '', '', 'admin', '2018-02-08 17:57:58', 'admin', '2018-02-08 17:57:58');
INSERT INTO `sys_resource` VALUES ('31', '运营', '484194603323842560', '484194603323842560', '1', null, null, 'credit/operation', '1', '2', '1', 'fa fa-group', '', '首页运营', 'admin', '2018-02-22 18:31:24', 'admin', '2018-02-22 18:31:24');
INSERT INTO `sys_resource` VALUES ('32', '运营列表', '484194834769731584', '484194603323842560,484194834769731584', '1', null, '484194603323842560', 'credit/operation/list', '1', '3', '2', '', '', '', 'admin', '2018-02-22 18:32:19', 'admin', '2018-02-22 18:32:19');
INSERT INTO `sys_resource` VALUES ('33', '订单', '484195186239823872', '484195186239823872', '1', null, null, 'credit/order', '1', '2', '1', 'fa fa-list', '', '', 'admin', '2018-02-22 18:33:43', 'admin', '2018-02-22 18:33:43');
INSERT INTO `sys_resource` VALUES ('34', '订单列表', '484195305555189760', '484195186239823872,484195305555189760', '1', null, '484195186239823872', 'credit/order/list', '1', '3', '2', '', '', '', 'admin', '2018-02-22 18:34:12', 'admin', '2018-02-22 18:34:12');
INSERT INTO `sys_resource` VALUES ('35', '积分订单', '484804925189480448', '484804925189480448', '1', null, null, 'credit/integralOrder', '1', '2', '1', 'fa fa-usd', '', '', 'admin', '2018-02-24 10:56:36', 'admin', '2018-02-24 10:56:36');
INSERT INTO `sys_resource` VALUES ('36', '积分订单列表', '484805111173308416', '484804925189480448,484805111173308416', '1', null, '484804925189480448', 'credit/integralOrder/list', '1', '3', '2', '', '', '', 'admin', '2018-02-24 10:57:20', 'admin', '2018-02-24 10:57:20');
INSERT INTO `sys_resource` VALUES ('39', '定时任务', '495728298358214656', '495728298358214656', '1', null, null, 'schedule', '1', '2', '1', 'fa fa-history', '', '', 'admin', '2018-03-26 14:22:11', 'admin', '2018-03-26 14:22:11');
INSERT INTO `sys_resource` VALUES ('40', '定时任务列表', '495728528034107392', '495728298358214656,495728528034107392', '1', null, '495728298358214656', 'schedule/list', '1', '2', '2', '', '', '', 'admin', '2018-03-26 14:23:06', 'admin', '2018-03-26 14:23:06');
INSERT INTO `sys_resource` VALUES ('42', '虚拟卡库存管理', '516057609871036416', '478282803021787136,516057609871036416', '1', null, '478282803021787136', 'credit/virCardStock/listStock', '1', '2', '2', '', '', '', 'admin', '2018-05-21 16:43:34', 'admin', '2018-05-21 16:43:34');
INSERT INTO `sys_resource` VALUES ('43', '商户信息', '516113152904007680', '516113152904007680', '1', null, null, 'parner', '1', '21', '1', 'md md-perm-contact-cal', '', '', 'admin', '2018-05-21 20:24:17', 'admin', '2018-05-21 20:24:17');
INSERT INTO `sys_resource` VALUES ('44', '商户列表', '516113521071624192', '516113152904007680,516113521071624192', '1', null, '516113152904007680', 'credit/partner/list', '1', '1', '2', 'md md-perm-contact-cal', '', '', 'admin', '2018-05-21 20:25:47', 'admin', '2018-05-21 20:25:47');
INSERT INTO `sys_resource` VALUES ('46', '商品添加', '516387563557097472', '475753737656123392,478281790458081280,516387563557097472', '1', null, '478281790458081280', 'credit/goods/add', '2', '1', '3', '', 'goods:permission:add', '商品添加权限', 'admin', '2018-05-22 14:34:44', 'admin', '2018-05-22 14:34:44');
INSERT INTO `sys_resource` VALUES ('47', '编辑商品', '516388044576657408', '475753737656123392,478281790458081280,516388044576657408', '1', null, '478281790458081280', 'credit/goods/edit', '2', '2', '3', '', 'goods:permission:edit', '商品编辑权限', 'admin', '2018-05-22 14:36:39', 'admin', '2018-05-22 14:36:39');
INSERT INTO `sys_resource` VALUES ('48', '短信模板', '516395447028289536', '475753737656123392,478281790458081280,516395447028289536', '1', null, '478281790458081280', 'credit/message/add', '2', '3', '3', '', 'massage:permission:add', '短信模板相关', 'admin', '2018-05-22 15:06:03', 'admin', '2018-05-22 15:06:03');
INSERT INTO `sys_resource` VALUES ('49', '导入虚拟卡', '516395927225765888', '475753737656123392,478281790458081280,516395927225765888', '1', null, '478281790458081280', 'credit/goods/virtualCardList', '2', '4', '3', '', 'goods:permission:virtualCardList', '导入虚拟卡操作', 'admin', '2018-05-22 15:07:58', 'admin', '2018-05-22 15:07:58');
INSERT INTO `sys_resource` VALUES ('50', '商品审核', '516396648352452608', '475753737656123392,478281790458081280,516396648352452608', '1', null, '478281790458081280', 'credit/goods/approve', '2', '5', '3', '', 'goods:permission:approve', '商品上架审核', 'admin', '2018-05-22 15:10:50', 'admin', '2018-05-22 15:10:50');
INSERT INTO `sys_resource` VALUES ('51', '批量制卡', '516397892043280384', '478282803021787136,478282929643630592,516397892043280384', '1', null, '478282929643630592', 'credit/virCard/add', '2', '1', '3', '', 'virCard:permission:add', '创建虚拟卡', 'admin', '2018-05-22 15:15:46', 'admin', '2018-05-22 15:15:46');
INSERT INTO `sys_resource` VALUES ('52', '编辑虚拟卡', '516398380725833728', '478282803021787136,478282929643630592,516398380725833728', '1', null, '478282929643630592', 'credit/virCard/edit', '2', '2', '3', '', 'virCard:permission:edit', '编辑虚拟卡', 'admin', '2018-05-22 15:17:43', 'admin', '2018-05-22 15:17:43');
INSERT INTO `sys_resource` VALUES ('53', '虚拟卡库存操作', '516398950761107456', '478282803021787136,478282929643630592,516398950761107456', '1', null, '478282929643630592', 'credit/virCard/stockHandle', '2', '2', '3', '', 'virCard:permission:stockHandle', '虚拟卡库存操作', 'admin', '2018-05-22 15:19:59', 'admin', '2018-05-22 15:19:59');
INSERT INTO `sys_resource` VALUES ('54', '删除虚拟卡', '516399362050363392', '478282803021787136,478282929643630592,516399362050363392', '1', null, '478282929643630592', 'credit/virCard/delete', '2', '4', '3', '', 'virCard:permission:delete', '删除虚拟卡', 'admin', '2018-05-22 15:21:37', 'admin', '2018-05-22 15:21:37');
INSERT INTO `sys_resource` VALUES ('55', '订单退款', '516400135773622272', '484195186239823872,484195305555189760,516400135773622272', '1', null, '484195305555189760', 'credit/order/updateOrderStatus', '2', '1', '3', '', 'order:permission:updateOrderStatus', '订单退款', 'admin', '2018-05-22 15:24:41', 'admin', '2018-05-22 15:24:41');
INSERT INTO `sys_resource` VALUES ('56', '单个销库', '516400870238195712', '478282803021787136,516057609871036416,516400870238195712', '1', null, '516057609871036416', 'credit/virCardStock/toClearSingle', '2', '1', '3', '', 'virCardStock:permission:toClearSingle', '虚拟卡单个销库', 'admin', '2018-05-22 15:27:36', 'admin', '2018-05-22 15:27:36');
INSERT INTO `sys_resource` VALUES ('57', '虚拟卡批量销库', '516401228284956672', '478282803021787136,516057609871036416,516401228284956672', '1', null, '516057609871036416', 'credit/virCardStock/toClearMore', '2', '2', '3', '', 'virCardStock:permission:toClearMore', '虚拟卡批量销库', 'admin', '2018-05-22 15:29:02', 'admin', '2018-05-22 15:29:02');
INSERT INTO `sys_resource` VALUES ('58', '导出积分订单', '516402778763956224', '484804925189480448,484805111173308416,516402778763956224', '1', null, '484805111173308416', 'credit/integralOrder/export', '2', '1', '3', '', 'integralOrder:permission:export', '', 'admin', '2018-05-22 15:35:11', 'admin', '2018-05-22 15:35:11');
INSERT INTO `sys_resource` VALUES ('68', '退款管理', '526458051567206400', '526458051567206400', '1', null, null, 'vipMovies', '1', '22', '1', 'fa fa-paypal', '', '', 'admin', '2018-06-19 09:31:13', 'admin', '2018-06-19 09:31:13');
INSERT INTO `sys_resource` VALUES ('70', '退款列表', '526461713169432576', '526458051567206400,526461713169432576', '1', null, '526458051567206400', 'credit/vip/list', '1', '1', '2', 'fa fa-table', '', '', 'admin', '2018-06-19 09:45:48', 'admin', '2018-06-19 09:45:48');
INSERT INTO `sys_resource` VALUES ('71', 'ViP退款', '526463052687523840', '526458051567206400,526463052687523840', '1', null, '526458051567206400', 'credit/refund/list', '1', '2', '2', 'fa fa-vimeo-square', '', '', 'admin', '2018-06-19 09:51:08', 'admin', '2018-06-19 09:51:08');
INSERT INTO `sys_resource` VALUES ('72', '影视退款', '526463215493627904', '526458051567206400,526463215493627904', '1', null, '526458051567206400', 'credit/refund/Tvlist', '1', '3', '2', 'fa fa-video-camera', '', '', 'admin', '2018-06-19 09:51:46', 'admin', '2018-06-19 09:51:46');
INSERT INTO `sys_resource` VALUES ('73', '商品包退款', '526463473145528320', '526458051567206400,526463473145528320', '1', null, '526458051567206400', 'credit/refund/packagelist', '1', '4', '2', 'fa fa-suitcase', '', '', 'admin', '2018-06-19 09:52:48', 'admin', '2018-06-19 09:52:48');
INSERT INTO `sys_resource` VALUES ('74', '应用退款', '526463670051323904', '526458051567206400,526463670051323904', '1', null, '526458051567206400', 'credit/refund/Applist', '1', '5', '2', 'fa fa-adn', '', '', 'admin', '2018-06-19 09:53:35', 'admin', '2018-06-19 09:53:35');
INSERT INTO `sys_resource` VALUES ('75', '测试主从', '540337706115272704', '478282803021787136,516057609871036416,540337706115272704', '1', null, '516057609871036416', '/login', '2', '4', '3', '', '', '', 'admin', '2018-07-27 16:44:00', 'admin', '2018-07-27 16:44:00');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(30) DEFAULT NULL COMMENT '编码',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `status` int(1) DEFAULT NULL COMMENT '状态(1:启用,2:禁用)',
  `role_type` varchar(30) DEFAULT NULL COMMENT '角色类型',
  `remark` varchar(120) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '最新更新人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '445738124174856192', '超级管理员', '1', 'SUPER_ADMIN', '超管', 'admin', '2017-11-08 15:39:40', 'admin', '2017-11-08 15:39:47');
INSERT INTO `sys_role` VALUES ('2', '455580870561665024', '开发人员', '1', 'DEVELOP', '开发角色', 'admin', '2017-12-05 19:30:39', 'admin', '2017-12-05 19:30:39');
INSERT INTO `sys_role` VALUES ('3', '455584946598875136', '测试角色', '1', 'TEST', 'dfff', 'admin', '2017-12-05 19:46:50', 'admin', '2017-12-05 19:46:50');
INSERT INTO `sys_role` VALUES ('4', '455586883025145856', '管理角色', '1', 'ADMIN', '发发发llll', 'admin', '2017-12-05 19:54:32', 'admin', '2017-12-06 10:26:43');
INSERT INTO `sys_role` VALUES ('5', '513868111720484864', '商户角色', '1', 'SHOP_OWNER', '而非', 'admin', '2018-05-15 15:43:19', 'admin', '2018-05-15 15:43:19');
INSERT INTO `sys_role` VALUES ('6', '520037248645730304', '运营人员', '1', 'OPERATION', '', 'admin', '2018-06-01 16:17:16', 'admin', '2018-06-01 16:17:16');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_code` varchar(30) DEFAULT NULL COMMENT '角色编码',
  `resource_code` varchar(30) DEFAULT NULL COMMENT '资源编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8mb4 COMMENT='系统角色资源关联表';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------
INSERT INTO `sys_role_resource` VALUES ('1', '455580870561665024', '866595798555656192');
INSERT INTO `sys_role_resource` VALUES ('2', '455580870561665024', '866595883125407744');
INSERT INTO `sys_role_resource` VALUES ('3', '455580870561665024', '870518762313375744');
INSERT INTO `sys_role_resource` VALUES ('4', '455580870561665024', '866848827737407488');
INSERT INTO `sys_role_resource` VALUES ('5', '455580870561665024', '425022833241030656');
INSERT INTO `sys_role_resource` VALUES ('6', '455580870561665024', '425028504292360192');
INSERT INTO `sys_role_resource` VALUES ('20', '455584946598875136', '866595798555656192');
INSERT INTO `sys_role_resource` VALUES ('21', '455584946598875136', '866848898700836864');
INSERT INTO `sys_role_resource` VALUES ('22', '455584946598875136', '870516832400859136');
INSERT INTO `sys_role_resource` VALUES ('23', '455584946598875136', '870518310993682432');
INSERT INTO `sys_role_resource` VALUES ('205', '455586883025145856', '866595798555656192');
INSERT INTO `sys_role_resource` VALUES ('206', '455586883025145856', '866595883125407744');
INSERT INTO `sys_role_resource` VALUES ('207', '455586883025145856', '870518762313375744');
INSERT INTO `sys_role_resource` VALUES ('208', '455586883025145856', '870518983730683904');
INSERT INTO `sys_role_resource` VALUES ('209', '455586883025145856', '870519327332261888');
INSERT INTO `sys_role_resource` VALUES ('210', '455586883025145856', '870519474401337344');
INSERT INTO `sys_role_resource` VALUES ('211', '455586883025145856', '866848827737407488');
INSERT INTO `sys_role_resource` VALUES ('212', '455586883025145856', '425022833241030656');
INSERT INTO `sys_role_resource` VALUES ('213', '455586883025145856', '425028504292360192');
INSERT INTO `sys_role_resource` VALUES ('214', '455586883025145856', '425028916437254144');
INSERT INTO `sys_role_resource` VALUES ('215', '455586883025145856', '866848898700836864');
INSERT INTO `sys_role_resource` VALUES ('216', '455586883025145856', '870516832400859136');
INSERT INTO `sys_role_resource` VALUES ('217', '455586883025145856', '870518310993682432');
INSERT INTO `sys_role_resource` VALUES ('218', '455586883025145856', '870521335120420864');
INSERT INTO `sys_role_resource` VALUES ('219', '455586883025145856', '475753737656123392');
INSERT INTO `sys_role_resource` VALUES ('220', '455586883025145856', '478281790458081280');
INSERT INTO `sys_role_resource` VALUES ('221', '455586883025145856', '516387563557097472');
INSERT INTO `sys_role_resource` VALUES ('222', '455586883025145856', '516388044576657408');
INSERT INTO `sys_role_resource` VALUES ('223', '455586883025145856', '516395447028289536');
INSERT INTO `sys_role_resource` VALUES ('224', '455586883025145856', '516395927225765888');
INSERT INTO `sys_role_resource` VALUES ('225', '455586883025145856', '516396648352452608');
INSERT INTO `sys_role_resource` VALUES ('226', '455586883025145856', '478282803021787136');
INSERT INTO `sys_role_resource` VALUES ('227', '455586883025145856', '478282929643630592');
INSERT INTO `sys_role_resource` VALUES ('228', '455586883025145856', '516397892043280384');
INSERT INTO `sys_role_resource` VALUES ('229', '455586883025145856', '516398380725833728');
INSERT INTO `sys_role_resource` VALUES ('230', '455586883025145856', '516398950761107456');
INSERT INTO `sys_role_resource` VALUES ('231', '455586883025145856', '516399362050363392');
INSERT INTO `sys_role_resource` VALUES ('232', '455586883025145856', '516057609871036416');
INSERT INTO `sys_role_resource` VALUES ('233', '455586883025145856', '516400870238195712');
INSERT INTO `sys_role_resource` VALUES ('234', '455586883025145856', '516401228284956672');
INSERT INTO `sys_role_resource` VALUES ('235', '455586883025145856', '479062214629085184');
INSERT INTO `sys_role_resource` VALUES ('236', '455586883025145856', '479062671757889536');
INSERT INTO `sys_role_resource` VALUES ('237', '455586883025145856', '479103429747625984');
INSERT INTO `sys_role_resource` VALUES ('238', '455586883025145856', '479112610391216128');
INSERT INTO `sys_role_resource` VALUES ('239', '455586883025145856', '479112757116358656');
INSERT INTO `sys_role_resource` VALUES ('240', '455586883025145856', '484194603323842560');
INSERT INTO `sys_role_resource` VALUES ('241', '455586883025145856', '484194834769731584');
INSERT INTO `sys_role_resource` VALUES ('242', '455586883025145856', '484195186239823872');
INSERT INTO `sys_role_resource` VALUES ('243', '455586883025145856', '484195305555189760');
INSERT INTO `sys_role_resource` VALUES ('244', '455586883025145856', '516400135773622272');
INSERT INTO `sys_role_resource` VALUES ('245', '455586883025145856', '484804925189480448');
INSERT INTO `sys_role_resource` VALUES ('246', '455586883025145856', '484805111173308416');
INSERT INTO `sys_role_resource` VALUES ('247', '455586883025145856', '516402778763956224');
INSERT INTO `sys_role_resource` VALUES ('248', '455586883025145856', '495728298358214656');
INSERT INTO `sys_role_resource` VALUES ('249', '455586883025145856', '495728528034107392');
INSERT INTO `sys_role_resource` VALUES ('250', '455586883025145856', '516113152904007680');
INSERT INTO `sys_role_resource` VALUES ('251', '455586883025145856', '516113521071624192');
INSERT INTO `sys_role_resource` VALUES ('252', '455586883025145856', '518846514191056896');
INSERT INTO `sys_role_resource` VALUES ('253', '455586883025145856', '518846882887155712');
INSERT INTO `sys_role_resource` VALUES ('254', '455586883025145856', '518879892252573696');
INSERT INTO `sys_role_resource` VALUES ('255', '455586883025145856', '519691468018728960');
INSERT INTO `sys_role_resource` VALUES ('256', '455586883025145856', '519692097705394176');
INSERT INTO `sys_role_resource` VALUES ('257', '455586883025145856', '519692553391357952');
INSERT INTO `sys_role_resource` VALUES ('391', '513868111720484864', '475753737656123392');
INSERT INTO `sys_role_resource` VALUES ('392', '513868111720484864', '478281790458081280');
INSERT INTO `sys_role_resource` VALUES ('393', '513868111720484864', '516387563557097472');
INSERT INTO `sys_role_resource` VALUES ('394', '513868111720484864', '516388044576657408');
INSERT INTO `sys_role_resource` VALUES ('395', '513868111720484864', '484195186239823872');
INSERT INTO `sys_role_resource` VALUES ('396', '513868111720484864', '484195305555189760');

-- ----------------------------
-- Table structure for sys_seller
-- ----------------------------
DROP TABLE IF EXISTS `sys_seller`;
CREATE TABLE `sys_seller` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '商城商户表主键ID',
  `partner_id` varchar(50) DEFAULT NULL COMMENT '商户iD',
  `partner_name` varchar(64) DEFAULT NULL COMMENT '商城商户名称',
  `partner_type` int(2) DEFAULT NULL COMMENT '商城商户类型',
  `partner_key` varchar(80) DEFAULT NULL COMMENT '商户Key',
  `notify_url` varchar(300) DEFAULT NULL COMMENT '商城商户回调地址',
  `partner_manager` varchar(64) DEFAULT NULL COMMENT '商城商户负责人',
  `province` varchar(64) DEFAULT NULL COMMENT '商城商户省份',
  `city` varchar(64) DEFAULT NULL COMMENT '商城商户市区',
  `area` varchar(64) DEFAULT NULL COMMENT '商城商户地区',
  `address` longtext COMMENT '商城商户地址',
  `business_no` varchar(255) DEFAULT NULL COMMENT '商城商户营业执照号',
  `business_pic` varchar(255) DEFAULT NULL COMMENT '商城商户营业执照路径',
  `product_manager` varchar(255) DEFAULT NULL COMMENT '商品负责人',
  `email` varchar(255) DEFAULT NULL COMMENT '商城商户邮箱',
  `mobile` varchar(64) DEFAULT NULL COMMENT '商城商户电话号码',
  `qq` varchar(32) DEFAULT NULL COMMENT '商城商户QQ号码',
  `account_holder` varchar(255) DEFAULT NULL COMMENT '商城商户开户人',
  `account_bank` varchar(255) DEFAULT NULL COMMENT '商城商户开户行名称',
  `bank_account` varchar(255) DEFAULT NULL COMMENT '商城商户银行账号',
  `ali_account` varchar(255) DEFAULT NULL COMMENT '支付宝账号',
  `settle_type` int(2) DEFAULT '0',
  `audit_status` int(2) DEFAULT '0',
  `fee_rate` decimal(11,2) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '商户状态 0:有效 -1失效',
  `contract_pdf` varchar(300) DEFAULT NULL,
  `tax` decimal(11,2) DEFAULT NULL COMMENT '税',
  `add_user` varchar(200) DEFAULT NULL,
  `review` int(2) DEFAULT NULL COMMENT '审核',
  `server` varchar(255) DEFAULT NULL COMMENT '服务器地址',
  `user_name` varchar(80) DEFAULT NULL COMMENT '登录账号',
  `last_update_date` datetime DEFAULT NULL,
  `partner_phone` varchar(64) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_name` (`user_name`) USING BTREE,
  KEY `ind_partner_id` (`partner_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=912 DEFAULT CHARSET=utf8 COMMENT='合作伙伴表格';

-- ----------------------------
-- Records of sys_seller
-- ----------------------------
INSERT INTO `sys_seller` VALUES ('552', 'hiveview', '4444', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('553', 'p141104093825001', '北京义方天下教育科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('554', 'p140916165683501', '上海臻材网络信息有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('555', 'p140922182500624', '南京睿悦信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('556', '12345', '北京红豆熊科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('557', 'p140723184187921', '一源科技', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('558', 'p140723182740612', '欢网科技', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('559', 'p140724163926221', '江苏苏宁易购电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('560', 'p140728112256125', '有乐游戏', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('561', 'p140728114918826', '北京豆果信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('562', 'p140728163092328', '上海圣剑网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('563', 'p140728172572629', '布丁酒店', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('564', 'p140730092259021', '广州坚和网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('565', 'p140730134911922', '合肥讯飞启明信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('566', 'p140731132106121', '北京盛世传越科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('567', 'p140731154140422', '心梦想（上海）网络技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('568', 'p140804114575321', '北京视博云科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('569', 'p140804174525823', '北京水寒文化传播有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('570', 'p140807131348121', '重庆优路科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('571', 'p140807131677522', '北京酷我科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('572', 'p140807132423223', '北京开云慧科网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('573', 'p140807145022825', '传课计算机系统（北京）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('574', 'p140807145694426', '网易公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('575', 'c140811113262521', '家视天下科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('576', 'p140812173981025', '云看天下（北京）科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('577', 'p140813124398722', '北京芝兰玉树科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('578', 'p140814171194265', '边锋集团', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('579', 'p140815114883521', '深圳市网腾远景网络技术服务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('580', 'p140820095815121', '上海视云网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('581', 'p140821103211621', '北京红马传媒文化发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('582', 'p140822110757922', '成都西米互动科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('583', 'p140822113344723', '上海大智慧股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('584', 'p140825102807554', '去哪儿网', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('585', 'p140825112250355', '上海欢众信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('586', 'p140825174355856', '彩虹世纪（北京）文化传媒有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('587', 'p140828132323721', '深圳市活力天汇科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('588', 'p140901152350921', '广州史达泊雷网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('589', 'p140909112483721', '春雨医生', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('590', 'p140910162112724', '美食杰', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('591', 'p140910172053325', '北京奇果网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('592', 'p140915093637121', '上海洋葱网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('593', 'p140925100538321', '上海渐华科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('594', 'p140929155546922', '鹏博士电信传媒智慧教育', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('595', 'p141008140209022', '应用商户', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('596', 'p141008140462023', '测试人员', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('597', 'p141008140521224', '运营人员', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('598', 'p141020010591822', '波克城市网络科技（上海）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('599', 'p141029094862723', '北京木仓科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('600', 'p141105174868225', '动游有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('601', 'p141120102882021', '炫彩互动网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('602', 'p141202095284622', '深圳市路通网络技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('603', 'p141218133610021', '北京巨象视野科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('604', 'p141222100456822', '上海潘多网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('605', 'p141223095185624', '虾米音乐', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('606', 'p150112173484421', '北教传媒', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('607', 'p150119155521322', '霸下游戏', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('608', 'p150121110013224', '西米互动', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('609', 'p150123094945125', '成都西米互动', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('610', 'p150127120488726', '宁波凯智信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('611', 'p150209175279522', '北京悠彩互动科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('612', 'p150302152708124', '全球播科技（北京）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('613', 'p150305112685925', '艾合石数码（深圳）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('614', 'p150310151392527', '上海渡维电子科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('615', 'p150320144533228', '西米驯龙战机', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('616', 'p150330173823221', '上海童锐网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('617', 'p150401140084522', '上海腾目网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('618', 'p150401163400623', '苏州运智互动科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('619', 'p150403135292424', '上海雀沃信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('620', 'p150403153455525', '深圳市新众玩网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('621', 'p150408094222826', '欣赏工作室', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('622', 'p150408113157727', '浙江核新同花顺网络信息股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('623', 'p150408161257828', '广州盈正信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('624', 'p150409104944329', '上海播朵广告有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('625', 'p150409114098530', '奇珀市场', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('626', 'p150409115752231', '上海于斯网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('627', 'p150414155308432', '北京网讯安卓技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('628', 'p150415100340833', '北京三六三互动教育科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('629', 'p150415101043334', '欢网教育', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('630', 'p150415110290935', '大连市世纪鲲鹏科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('631', 'p150415120008036', '凤凰视频', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('632', 'p150428101720040', '棉花糖电视游戏', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('633', 'p150429135532741', '南京睿悦-突出虫围2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('634', 'p150430104261642', '上海北野网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('635', 'p150430160412443', '广州速玩网络科技有限公司（快游戏）', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('636', 'p150505142333144', '上海飞智电子科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('637', 'p150505144594845', '广州市伟图信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('638', 'p150506133483846', '北京卓意麦斯科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('639', 'p150507163218447', '上海如游信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('640', 'p150511152692948', '聚力视游网络科技无锡有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('641', 'p150512150496649', '中手游沃橙', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('642', 'p150519121478422', '广州幻象引擎网络技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('643', 'p150521145774423', '杭州数品电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('644', 'p150521151715224', '深圳市天易联科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('645', 'p150521153901225', '武汉拇指通科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('646', 'p150521164753426', '湖南红图网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('647', 'p150527105687028', '北京蚂蜂窝网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('648', 'p150527151711229', '广州黄金高德教育股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('649', 'p150602151733630', '小酷音乐台', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('650', 'p150605141199931', '珠海多玩', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('651', 'p150610103109732', '北京分豆教育科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('652', 'p150610173334333', '北京视游互动科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('653', 'p150615180010634', '北京阿米哥科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('654', 'p150623142409535', '东莞市新动力网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('655', 'p150624154631536', '北京油菜花文化传播有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('656', 'p150625101054937', '中手游沃橙 - 花样三国', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('657', 'p150701145610939', '德蒙教育', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('658', 'p150706140042540', '深圳蟋蟀科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('659', 'p150707094698441', '广州市千云信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('660', 'p150707115698542', '成都铁皮人科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('661', 'p150708111947343', '拓维信息系统股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('662', 'p150710114403244', '北京悠彩互动科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('663', 'p150716153456745', '暴走漫画', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('664', 'p150716153518146', '海视云', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('665', 'p150717111231247', '武汉手盟网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('666', 'p150722110056648', '乐上网', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('667', 'p150722180400349', '边锋集团- 三国杀', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('668', 'p150723172441551', '南京市军荣软件科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('669', 'p150724092806952', '梅州市亿讯网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('670', 'p150724143481853', '上海视九信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('671', 'p150727101162054', '深圳市东方博雅科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('672', 'p150731130695156', '欢唱网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('673', 'p150804095295257', '北京慕华信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('674', 'p150806153139659', '上海可娱网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('675', 'p150807101984360', '环球互娱网络有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('676', 'p150807102473262', '上海臻材网络-思维魔方', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('677', 'p150810170074663', '咪咕互动娱乐有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('678', 'p150818155080164', '央广新媒体', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('679', 'p150819101315565', '陕西纷腾互动网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('680', 'p150826143785566', '北京乐乐高尚教育科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('681', 'p150826143915867', '浙江博采传媒有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('682', 'p150901133137268', '杭州乐线科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('683', 'p150924100715922', '边锋网络', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('684', 'p151016163879721', '家视天下增值业务部', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('685', 'p151023143394022', '深圳医帮一健康咨询管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('686', 'p151030161676323', '广州鼎梵数码科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('687', 'p151102170074024', '上海游谷网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('688', 'p151105155211325', '北京天地精华教育科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('689', 'p151110135661526', '深圳中映良品文化传播有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('690', 'p151112152799427', '深圳市掌玩网络技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('691', 'p151113112415828', '上海小腰信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('692', 'p160222102187625', '大ddddddddd', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('693', 'p160222102486927', '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('694', 'p160310152918721', 'fdasfdsaf', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('695', 'p160316101618221', 'fdfdfdf', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('696', 'p160316154143321', 'gx', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('697', 'p160318155136521', '驾驶天', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('698', 'p170601100113023', '大麦商城', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('699', 'p170621103510461', '062101', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('700', 'p170621103681162', '062102', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('701', 'p170621103881363', '062103', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('702', 'p140724172722123', '深圳市童心网络有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('703', 'p140725162500624', '北京爱视游科技文化有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('704', 'p140807133618824', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('705', 'p140813113264021', '个人开发者', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('706', 'p140902170464025', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('707', 'p140902171147027', '成都市极米科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('708', 'p140903103620535', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('709', 'p140903164432221', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('710', 'p140905095990322', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('711', 'p141008144021121', '11111', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('712', 'p141027125115322', '未知', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('713', 'p150210134888223', '奇虎360', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('714', 'p150522094603627', '成都巫山云信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('715', 'p150806114277758', '陕西纷腾互动网络科技有限公司（无效）', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('716', 'p150806133936821', '同方股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('717', 'p150812105879722', '同方股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('718', 'p150906153493123', '大连文森特软件科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('719', 'p150915164630621', '石小竹测试账号', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('720', 'p151207161851723', '上海点掌文化传媒股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('721', 'p151211130410621', '中兴九城网络科技无锡有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('722', 'p151212094830522', '上海尚热网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('723', 'p151215105550623', '上海游谷网络科技有限公司-猪猪侠特攻队', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('724', 'p151223163980721', '北京喜跃信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('725', 'p160121114870621', '知传科技（厦门）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('726', 'p160126105075022', '北京云讯通达网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('727', 'p160222144280822', '深圳市天易联科技有限公司无效', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('728', 'p160229153700825', '南京游乐堂信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('729', 'p160321163182025', '天翼爱音乐文化科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('730', 'p160330094917721', '头条资讯', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('731', 'p160405153197522', '北京视游互动科技有限公司-英雄泰坦', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('732', 'p160413094187323', '上海亲宝文化传播有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('733', 'p160419124197021', '杭州八士群贤教育科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('734', 'p160420100055321', '西安瑜乐软件科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('735', 'p160426101869322', 'tttt', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('736', 'p160510153545722', '乐享无线（深圳）科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('737', 'p160510155240323', '肇庆市无限掌握信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('738', 'p160510155712424', '肇庆市无限掌握信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('739', 'p160511104980925', '广州市朗趣网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('740', 'p160511214985526', '厦门国傲信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('741', 'p160517150394827', '北京吾一启源无线科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('742', 'p160519175959128', '昆山有乐互动网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('743', 'p160613144707021', '北京永乐盛世科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('744', 'p160613153747429', '上海弘贯网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('745', 'p160627155436532', '北京青漫文化有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('746', 'p160704145947833', '上海瀚数多媒体信息科技有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('747', 'p160705152191934', '北京视游互动科技有限公司- 苍翼默示录', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('748', 'p160705172200535', '上海游谷网络科技有限公司[摇滚藏獒]', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('749', 'p160705174257236', '深圳市创云方网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('750', 'p160707160370141', '上海元聚网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('751', 'p160707172989948', '深圳市路通网络技术有限公司-私教', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('752', 'p160726163288451', '北京卡路里信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('753', 'p160727194758852', '杭州智屏电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('754', 'p160815181920058', '上海傲英网络科技有限公司-红包斗地主', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('755', 'p160823113554259', '央视国际网络有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('756', 'p160823151674160', '深圳市信驰无限科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('757', 'p160831101435561', '上海永聪网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('758', 'p160902102636162', '安徽邦天信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('759', 'p160906102091663', 'foany', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('760', 'p160926175578464', '上海辛瑞信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('761', 'p161024200849469', '杭州谋百网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('762', 'p161102140035378', '乐动天下（北京）体育科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('763', 'p161103154891579', '竞技世界（北京）网络技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('764', 'p161108134464122', '上海聚力传媒技术有限公司-体育应用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('765', 'p161129170454781', '宝宝巴士（福建）网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('766', 'p161213120655523', '石家庄火狼软件科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('767', 'p161214103877524', '全球播科技（北京）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('768', 'p161214164277525', '上海小腰信息科技有限公司-瑜伽TV', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('769', 'p170213112932796', '江西启星网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('770', 'p170213171144897', '北京万象娱通网络科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('771', 'p170214161694733', '北京优朋普乐传媒发展有限公司-应用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('772', 'p170328180781134', '银河互联网电视', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('773', 'p170407100273942', '广州明觉网络技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('774', 'p170414110338321', '黑龙江省同源文化发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('775', 'p170505154158348', '北京百变悟空科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('776', 'p170508145042749', '合肥小友网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('777', 'p170525142025758', '北京九麟网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('778', 'p170527171517123', '上海汇火网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('779', 'p170601142728076', '上海淘景立画信息技术有限公司-应用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('780', 'p170605171325278', '大麦科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('781', 'p170607151077281', '天津巴辰科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('782', 'p170703095873882', '家视天下电商应用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('783', 'p170718153772185', '广东格灵教育信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('784', 'p170718155277686', '上海欧耶网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('785', 'p170718155482987', '山东好买手电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('786', 'p170718155504888', '大麦科技发展有限公司-优购商城', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('787', 'p170718155577889', '黑龙江同源文化发展有限公司-优购商城', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('788', 'p170718155730890', '北京歪歪兔教育科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('789', 'p170718155885291', '深圳市忆捷创新科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('790', 'p170718155845192', '深圳市鹤盛联盟文化科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('791', 'p170719151551893', '北京合创万邦电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('792', 'p170721113869494', '北京家视天下科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('793', 'p170725153753095', '京华亿家科技（北京）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('794', 'p170726135327396', '家视天下应用套餐', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('795', 'p170727104884097', '深圳新游畅玩科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('796', 'p170810153635799', '南京小西网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('797', 'p170823092794221', '北京美丽岛科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('798', 'p170825141483422', '深圳市经纬纵横科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('799', 'p170825144456823', '赛特国际旅行社北京朝阳分社', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('800', 'p170829091032424', '北京长宽电信服务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('801', 'p170829110245925', '厦门夏新移动通讯有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('802', 'p170829112130526', '红蔷薇（北京）科技有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('803', 'p170831102527029', '北京久玖九月商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('804', 'p170904115219136', '北京龙恒通商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('805', 'p170905153801837', '陕西仲颖果业有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('806', 'p170905161603239', '连偶（重庆）科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('807', 'p170906090380540', '北京金瑞庭科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('808', 'p170906115724241', '中元易尚科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('809', 'p170906144345342', '上海宜奇信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('810', 'p170906160076743', '北京汇江海商贸有限公司(羊肉/大闸蟹)', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('811', 'p170906161124845', '北京汇江海商贸有限公司(大品牌月饼)', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('812', 'p170906182631446', '北京力宏科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('813', 'p170912092990547', '北京玩亦有道科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('814', 'p170912102643948', '北京万恒科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('815', 'p170912153450749', '上海思无邪珠宝股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('816', 'p170913175604550', '广州贝伊电子科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('817', 'p170915150305751', '昆山市巴城阳澄湖蟹鑫园蟹业有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('818', 'p170918154023052', '上海侍醇商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('819', 'p170920143729853', '深圳市景秀网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('820', 'p170921101659054', '深圳市鹤盛联盟文化科技有限公司-应用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('821', 'p170925094951555', '深圳乐品电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('822', 'p170925095479056', '北京鹏路翱翔网路技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('823', 'p170927173608959', '北京瑞盛翔国际贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('824', 'p170928134296560', '广州禾土商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('825', 'p171016140507069', '天津云商合一科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('826', 'p171017134552270', '北京星光会文化传媒有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('827', 'p171023164856072', '北京美生国际投资咨询有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('828', 'p171027100148273', '兴海共赢（北京）科贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('829', 'p171030105721674', '知行思远信息技术（北京）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('830', 'p171103134952075', '北京三亦华创科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('831', 'p171106105694876', '中睿供应链有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('832', 'p171110153345377', '北京华夏仙谷堂生物科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('833', 'p171115135563578', '饭爷食品科技（北京）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('834', 'p171116161939279', '厦门木薯科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('835', 'p171116170007980', '浙江华光电器集团有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('836', 'p171120140888881', '杭州当贝网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('837', 'p171120154604082', '江苏东方金钰智能机器人有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('838', 'p171120154868483', '广州纽得赛生物科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('839', 'p171122173409084', '北京翠林春珠宝有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('840', 'p171122173711885', '上海子立实业有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('841', 'p171128110391286', '深圳创怀医疗科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('842', 'p171130133542893', '广州市维动商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('843', 'p171130140053494', '贵州艾力康中草药开发有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('844', 'p171201174798496', '恩施市龙角农业发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('845', 'p171205110502297', '北京菲洛德科技服务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('846', 'p171206102292321', '北京丽恩知商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('847', 'p171206102631022', '北京友沃易乐科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('848', 'p171208114203324', '江苏嗨购网络科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('849', 'p171208114424825', '深圳市乐业福商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('850', 'p171211133234826', '北京九一五八科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('851', 'p171213101677027', '察布查尔锡伯自治县骆驼蜀黍电子商务工作室', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('852', 'p171213142071328', '九州梦工厂国际文化传播有限公司北京分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('853', 'p171213155190229', '上海京杏贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('854', 'p171214111280030', '深圳市小朋互联科技信息有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('855', 'p171225192796440', '天津长宽电信城域网服务邮箱公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('856', 'p171227155765041', '北京创服网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('857', 'p171228113859642', '家视天下电商网站', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('858', 'p171229120222443', '上海鲜语牧场乳业销售有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('859', 'p180102105911944', '翊天行国际马术俱乐部（北京）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('860', 'p180103141169645', '上海多灵科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('861', 'p180103163806246', '西安尚谷信息科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('862', 'p180103172850447', '中安消物联传感（深圳）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('863', 'p180105173689748', '鹏博士英语', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('864', 'p180112152730849', '北京美汁源农业科技有限公司北京分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('865', 'p180112163177850', '武汉由米定制科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('866', 'p180112164924652', '  江苏乐居乐家网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('867', 'p180115171861453', '深圳市欧瑞博科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('868', 'p180116135602154', '南京盟联信息科技股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('869', 'p180118141266855', '北京聚瑞祥和贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('870', 'p180122102324656', '北京优品悦动科贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('871', 'p180124142988157', '集团-东莞', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('872', 'p180125163415260', '上海分尚网络科技有限公司北京分公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('873', 'p180126180705161', '贵州分公司茅台', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('874', 'p180131161301262', '天津泓琳科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('875', 'p180207152516163', '五常市沁润水稻种植专业合作社', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('876', 'p180226133059964', '西藏歌德寄卖有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('877', 'p180307102712171', '广东大地通讯连锁服务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('878', 'p180308144808572', '北京源然科技发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('879', 'p180313120385673', '双齐国际贸易（上海）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('880', 'p180316165229478', '杭州厚道科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('881', 'p180330173209479', '北京旺钠国际发展有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('882', 'p180403145776280', '浙江天猫技术有限公司（原优酷）', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('883', 'p180408104938681', '广州洁然科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('884', 'p180416092558083', '知行思远境内', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('885', 'p180416194321085', '欧慕（北京）家居有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('886', 'p180423165008286', '广东中宝炊具制品', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('887', 'p180424123508687', '物联网部门', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('888', 'p180424123860988', '杭州万事利丝绸文化股份有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('889', 'p180426092700489', '上海巴里贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('890', 'p180428143009790', '彩云之端文化传媒（北京）有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('891', 'p180502120374591', '北京雷厉风行汽车服务有限责任公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('892', 'p180503151342292', '秭归橙大鲜电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('893', 'p180509120569822', '天津市玉之天科贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('894', 'p180510133258623', '香港优品国际贸易有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('895', 'p180510150781124', '丫妹零食', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('896', 'p180511140978925', '宜昌誉福天下农牧科技开发有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('897', 'p180515141623426', '上海稍息网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('898', 'p180516094850827', '北京绿维农业投资管理有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('899', 'p180601141368728', '杭州天核网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('900', 'p180604103598529', '天津博恒创辉商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('901', 'p180606110765530', '北京无限创意信息技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('902', 'p180608142118831', '广州赞安电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('903', 'p180615115048933', '南京创晶飞电脑科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('904', 'p180627170567734', '济南特别特商贸有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('905', 'p180628142621436', '杭州贝影网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('906', 'p180703112762338', '上海劢驰数字技术有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('907', 'p180710141522041', '东莞市魁卓电子商务有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('908', 'p180726171707842', '上海刀传网络科技有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('909', 'p180731102395243', '杭州圣万动漫设计有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('910', 'p180801105222644', '北京蜕己教育咨询有限公司', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);
INSERT INTO `sys_seller` VALUES ('911', 'p180802102465345', '中央数字电视传媒有限公司（直播）', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', null, '0', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_seller_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_seller_item`;
CREATE TABLE `sys_seller_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `partner_id` varchar(50) DEFAULT NULL COMMENT '商户ID',
  `user_name` varchar(120) DEFAULT NULL COMMENT '登录账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='合作伙伴店铺对应的用户表';

-- ----------------------------
-- Records of sys_seller_item
-- ----------------------------
INSERT INTO `sys_seller_item` VALUES ('164', 'hiveview', '524252249@qq.com');
INSERT INTO `sys_seller_item` VALUES ('174', 'hiveview', '1@qq.com');
INSERT INTO `sys_seller_item` VALUES ('175', 'hiveview', '123@com');
INSERT INTO `sys_seller_item` VALUES ('176', '12345', 'pansinuo2@btte.net');
INSERT INTO `sys_seller_item` VALUES ('177', 'p140731154140422', 'pansinuo3@btte.net');
INSERT INTO `sys_seller_item` VALUES ('178', 'p140807145694426', '123456@qq.com');
INSERT INTO `sys_seller_item` VALUES ('179', 'p141104093825001', 'yaotiejun@btte.net');
INSERT INTO `sys_seller_item` VALUES ('180', 'p140723184187921', '1234@qq.com');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `default_role` varchar(30) DEFAULT NULL COMMENT '默认角色',
  `status` int(1) DEFAULT NULL COMMENT '状态(1:启用,2:禁用)',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_by` varchar(50) DEFAULT NULL COMMENT '最新更新人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', '管理员', '445738124174856192', '1', 'admin@btte.net', 'admin', '2017-11-08 14:36:13', 'admin', '2017-11-08 14:36:21');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `role_code` varchar(30) DEFAULT NULL COMMENT '角色编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', 'admin', '445738124174856192');

-- ----------------------------
-- Table structure for t_app_order_details
-- ----------------------------
DROP TABLE IF EXISTS `t_app_order_details`;
CREATE TABLE `t_app_order_details` (
  `device_mac` varchar(25) DEFAULT NULL COMMENT '设备mac',
  `device_sn` varchar(25) DEFAULT NULL COMMENT '设备sn',
  `device_code` varchar(25) DEFAULT NULL COMMENT '设备code码',
  `user_uuid` varchar(20) NOT NULL COMMENT '用户id',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '客户端ip',
  `region_name` varchar(25) DEFAULT NULL COMMENT '地区名称',
  `branch_id` varchar(30) DEFAULT NULL COMMENT '分公司id',
  `branch_name` varchar(50) DEFAULT NULL COMMENT '分公司名称',
  `partner_id` varchar(30) NOT NULL COMMENT '商户id',
  `partner_name` varchar(30) DEFAULT NULL COMMENT '商户名称',
  `product_name` varchar(20) NOT NULL COMMENT '产品名称',
  `product_duration` varchar(20) DEFAULT NULL COMMENT '产品时长',
  `product_type` varchar(10) NOT NULL COMMENT '产品类型 2006：极清 2009：VIP 21693：商品包 1003：应用',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '商户订单号',
  `trade_no` varchar(50) NOT NULL COMMENT '订单号',
  `total_amount` int(10) NOT NULL COMMENT '订单金额 ',
  `trade_status` varchar(20) NOT NULL COMMENT '订单状态 2.已支付 4.已退款',
  `balance_amount` int(5) DEFAULT NULL COMMENT '支付麦币',
  `cash_amount` double(10,0) DEFAULT NULL COMMENT '支付现金',
  `fee_ratio` varchar(20) NOT NULL COMMENT '费率',
  `payment_channel` varchar(10) NOT NULL COMMENT '支付渠道  1.麦币余额 3.支付宝 4.微信 7.京东钱包 8.宽带支付 11.兴业银行',
  `payment_way` varchar(10) NOT NULL COMMENT '支付方式 1.麦币余额 3.支付宝 4.微信 7.京东钱包 8.宽带支付 11.兴业银行',
  `payment_time` datetime NOT NULL COMMENT '支付时间',
  `third_trade_no` varchar(50) NOT NULL COMMENT '支付流水订单号',
  `open_time` datetime DEFAULT NULL COMMENT '开通时间',
  `is_refund` varchar(5) DEFAULT '0' COMMENT '是否申请退款',
  UNIQUE KEY `only_key` (`trade_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='针对财务模块类型21693,1003特殊订单表';

-- ----------------------------
-- Records of t_app_order_details
-- ----------------------------

-- ----------------------------
-- Table structure for t_app_refund_detailly
-- ----------------------------
DROP TABLE IF EXISTS `t_app_refund_detailly`;
CREATE TABLE `t_app_refund_detailly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(20) DEFAULT NULL COMMENT '用户id',
  `partner_id` varchar(30) NOT NULL COMMENT '商户id',
  `product_name` varchar(50) NOT NULL COMMENT '产品名称',
  `product_type` varchar(10) NOT NULL COMMENT '产品类型 2006：极清 2009：VIP 21693：商品包 1003：应用',
  `trade_no` varchar(50) NOT NULL COMMENT '订单号',
  `total_amount` int(10) NOT NULL COMMENT '订单金额',
  `refund_no` varchar(50) NOT NULL COMMENT '退款单号',
  `refund_reason` varchar(255) NOT NULL COMMENT '退款原因描述',
  `allow_refund_amount` varchar(10) NOT NULL COMMENT '可退金额',
  `actual_refund_amount` varchar(10) NOT NULL COMMENT '实退金额',
  `refund_way` varchar(10) NOT NULL COMMENT '退款方式(支付宝、微信..)',
  `refund_account` varchar(30) NOT NULL COMMENT '退款对应账户',
  `attachment_url` varchar(255) DEFAULT NULL COMMENT '退款附件地址',
  `refund_status` varchar(10) NOT NULL COMMENT '退款状态；2.已提交 3.已撤销 4.已全部退款 5.部分退款 ',
  `refund_operator` varchar(30) NOT NULL COMMENT '退款操作人员',
  `summit_time` datetime NOT NULL COMMENT '提交时间',
  `complete_time` datetime NOT NULL COMMENT '撤销/退款时间',
  `is_synchronization` varchar(5) NOT NULL DEFAULT '0' COMMENT '0表示未同步1表示已经同步',
  `deduction_integral` int(5) NOT NULL DEFAULT '0',
  `is_callback` varchar(5) NOT NULL DEFAULT '0' COMMENT '0 没有回调',
  `discount_money` varchar(10) NOT NULL COMMENT '积分抵扣金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='针对财务模块类型21693,1003特殊退款订单表';

-- ----------------------------
-- Records of t_app_refund_detailly
-- ----------------------------

-- ----------------------------
-- Table structure for t_carousel_figure
-- ----------------------------
DROP TABLE IF EXISTS `t_carousel_figure`;
CREATE TABLE `t_carousel_figure` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `operate_id` bigint(20) DEFAULT NULL COMMENT '运营id',
  `operate_name` varchar(32) DEFAULT NULL COMMENT '运营名称',
  `operate_type` tinyint(2) DEFAULT NULL COMMENT '运营类型',
  `url` varchar(255) DEFAULT NULL COMMENT '轮播图片地址',
  `jump_to_apk` tinyint(1) DEFAULT NULL COMMENT '是否跳转apk（0否，1是）',
  `jump_to_apk_button` tinyint(1) DEFAULT NULL COMMENT '是否跳转apk选择按钮（0未选中，1选中）',
  `jump_to_ic` varchar(64) DEFAULT NULL COMMENT '跳转识别码',
  `related_topics` tinyint(1) DEFAULT NULL COMMENT '是否关联专题（0否，1是）',
  `related_topics_button` tinyint(1) DEFAULT NULL COMMENT '是否关联专题按钮（0未选中，1选中）',
  `topic_id` varchar(32) DEFAULT NULL COMMENT '专题id',
  `topic_name` varchar(32) DEFAULT NULL COMMENT '专题名称',
  `related_activites` tinyint(1) DEFAULT NULL COMMENT '是否关联活动0否，1是',
  `related_activites_button` tinyint(1) DEFAULT NULL COMMENT '是否关联活动按钮（0未选中，1选中）',
  `activite_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `activite_name` varchar(64) DEFAULT NULL COMMENT '活动名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（0下线，1上线）',
  `sequence` tinyint(2) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图表';

-- ----------------------------
-- Records of t_carousel_figure
-- ----------------------------

-- ----------------------------
-- Table structure for t_charge_back_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_charge_back_detail`;
CREATE TABLE `t_charge_back_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_number` varchar(32) DEFAULT NULL COMMENT '订单id',
  `back_order_number` varchar(32) DEFAULT NULL COMMENT '退单id',
  `b_transaction_number` varchar(32) DEFAULT NULL COMMENT '退单交易号',
  `back_order_cash` decimal(12,2) DEFAULT NULL COMMENT '退款金额（单位分）',
  `back_order_reason` varchar(128) DEFAULT NULL COMMENT '退款原因',
  `back_logistics_order_number` varchar(32) DEFAULT NULL COMMENT '退款物流单号',
  `back_status` tinyint(1) DEFAULT NULL COMMENT '退款状态   4退款中，5已退款',
  `back_application_time` datetime DEFAULT NULL COMMENT '退款申请时间',
  `back_operator` varchar(32) DEFAULT NULL COMMENT '退款操作者',
  `b_close_reason` varchar(128) DEFAULT NULL COMMENT '关闭原因',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退订单明细表';

-- ----------------------------
-- Records of t_charge_back_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_courier_company
-- ----------------------------
DROP TABLE IF EXISTS `t_courier_company`;
CREATE TABLE `t_courier_company` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `courier_company` varchar(32) DEFAULT NULL COMMENT '快递公司',
  `courier_company_code` varchar(32) DEFAULT NULL COMMENT '快递公司代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='快递公司表';

-- ----------------------------
-- Records of t_courier_company
-- ----------------------------
INSERT INTO `t_courier_company` VALUES ('1', '邮政包裹/平邮', 'youzhengguonei');
INSERT INTO `t_courier_company` VALUES ('2', '国际包裹', 'youzhengguoji');
INSERT INTO `t_courier_company` VALUES ('3', 'EMS', 'emsguoji');
INSERT INTO `t_courier_company` VALUES ('4', '北京EMS', 'bjemstckj');
INSERT INTO `t_courier_company` VALUES ('5', '顺丰', 'shunfeng');
INSERT INTO `t_courier_company` VALUES ('6', '申通', 'shentong');
INSERT INTO `t_courier_company` VALUES ('7', '圆通', 'yuantong');
INSERT INTO `t_courier_company` VALUES ('8', '中通', 'zhongtong');
INSERT INTO `t_courier_company` VALUES ('9', '汇通', 'huitongkuaidi');
INSERT INTO `t_courier_company` VALUES ('10', '韵达', 'yunda');
INSERT INTO `t_courier_company` VALUES ('11', '宅急送', 'zhaijisong');
INSERT INTO `t_courier_company` VALUES ('12', '天天', 'tiantian');
INSERT INTO `t_courier_company` VALUES ('13', '德邦', 'debangwuliu');
INSERT INTO `t_courier_company` VALUES ('14', '京东', 'jd');
INSERT INTO `t_courier_company` VALUES ('15', '国通', 'guotongkuaidi');
INSERT INTO `t_courier_company` VALUES ('16', '增益', 'zengyisudi');
INSERT INTO `t_courier_company` VALUES ('17', '速尔', 'suer');
INSERT INTO `t_courier_company` VALUES ('18', '中铁物流', 'zhongtiewuliu');
INSERT INTO `t_courier_company` VALUES ('19', '中铁快运', 'ztky');
INSERT INTO `t_courier_company` VALUES ('20', '能达', 'ganzhongnengda');
INSERT INTO `t_courier_company` VALUES ('21', '优速', 'youshuwuliu');
INSERT INTO `t_courier_company` VALUES ('22', '全峰', 'quanfengkuaidi');
INSERT INTO `t_courier_company` VALUES ('23', '宅急便', 'zhaijibian');
INSERT INTO `t_courier_company` VALUES ('24', '黑猫雅玛多', 'yamato');
INSERT INTO `t_courier_company` VALUES ('25', '香港邮政(HongKong Post)', 'hkpost');
INSERT INTO `t_courier_company` VALUES ('26', '一统飞鸿', 'yitongfeihong');
INSERT INTO `t_courier_company` VALUES ('27', '如风达', 'rufengda');
INSERT INTO `t_courier_company` VALUES ('28', '海红网送', 'haihongwangsong');
INSERT INTO `t_courier_company` VALUES ('29', '通和天下', 'tonghetianxia');
INSERT INTO `t_courier_company` VALUES ('30', '郑州建华', 'zhengzhoujianhua');
INSERT INTO `t_courier_company` VALUES ('31', '红马甲', 'sxhongmajia');
INSERT INTO `t_courier_company` VALUES ('32', '芝麻开门', 'zhimakaimen');
INSERT INTO `t_courier_company` VALUES ('33', '乐捷递', 'lejiedi');
INSERT INTO `t_courier_company` VALUES ('34', '立即送', 'lijisong');
INSERT INTO `t_courier_company` VALUES ('35', '银捷', 'yinjiesudi');
INSERT INTO `t_courier_company` VALUES ('36', '门对门', 'menduimen');
INSERT INTO `t_courier_company` VALUES ('37', '河北建华', 'hebeijianhua');
INSERT INTO `t_courier_company` VALUES ('38', '微特派', 'weitepai');
INSERT INTO `t_courier_company` VALUES ('39', '风行天下', 'fengxingtianxia');
INSERT INTO `t_courier_company` VALUES ('40', '尚橙', 'shangcheng');
INSERT INTO `t_courier_company` VALUES ('41', '新蛋奥硕', 'neweggozzo');
INSERT INTO `t_courier_company` VALUES ('42', '鑫飞鸿', 'xinhongyukuaidi');
INSERT INTO `t_courier_company` VALUES ('43', '全一', 'quanyikuaidi');
INSERT INTO `t_courier_company` VALUES ('44', '彪记', 'biaojikuaidi');
INSERT INTO `t_courier_company` VALUES ('45', '星晨急便', 'xingchengjibian');
INSERT INTO `t_courier_company` VALUES ('46', '亚风', 'yafengsudi');
INSERT INTO `t_courier_company` VALUES ('47', '源伟丰', 'yuanweifeng');
INSERT INTO `t_courier_company` VALUES ('48', '全日通', 'quanritongkuaidi');
INSERT INTO `t_courier_company` VALUES ('49', '安信达', 'anxindakuaixi');
INSERT INTO `t_courier_company` VALUES ('50', '民航', 'minghangkuaidi');
INSERT INTO `t_courier_company` VALUES ('51', '凤凰', 'fenghuangkuaidi');
INSERT INTO `t_courier_company` VALUES ('52', '京广', 'jinguangsudikuaijian');
INSERT INTO `t_courier_company` VALUES ('53', '配思货运', 'peisihuoyunkuaidi');
INSERT INTO `t_courier_company` VALUES ('54', 'AAE-中国件', 'aae');
INSERT INTO `t_courier_company` VALUES ('55', '大田', 'datianwuliu');
INSERT INTO `t_courier_company` VALUES ('56', '新邦', 'xinbangwuliu');
INSERT INTO `t_courier_company` VALUES ('57', '龙邦', 'longbanwuliu');
INSERT INTO `t_courier_company` VALUES ('58', '一邦', 'yibangwuliu');
INSERT INTO `t_courier_company` VALUES ('59', '联昊通', 'lianhaowuliu');
INSERT INTO `t_courier_company` VALUES ('60', '广东邮政', 'guangdongyouzhengwuliu');
INSERT INTO `t_courier_company` VALUES ('61', '中邮', 'zhongyouwuliu');
INSERT INTO `t_courier_company` VALUES ('62', '考拉速递', 'koalaexp');
INSERT INTO `t_courier_company` VALUES ('63', '天天快物流', 'guoeryue');
INSERT INTO `t_courier_company` VALUES ('64', '香港环球快运', 'huanqiuabc');
INSERT INTO `t_courier_company` VALUES ('65', '全速快递', 'fsexp');
INSERT INTO `t_courier_company` VALUES ('66', '恒宇运通', 'hyytes');
INSERT INTO `t_courier_company` VALUES ('67', '中邮速递', 'wondersyd');
INSERT INTO `t_courier_company` VALUES ('68', '韵丰物流', 'yunfeng56');
INSERT INTO `t_courier_company` VALUES ('69', '汇通天下物流', 'httx56');
INSERT INTO `t_courier_company` VALUES ('70', '华中快递', 'cpsair');
INSERT INTO `t_courier_company` VALUES ('71', '顺捷丰达', 'shunjiefengda');
INSERT INTO `t_courier_company` VALUES ('72', '黄马甲', 'huangmajia');
INSERT INTO `t_courier_company` VALUES ('73', '四川快优达', 'kuaiyouda');
INSERT INTO `t_courier_company` VALUES ('74', '速通', 'sutongwuliu');
INSERT INTO `t_courier_company` VALUES ('75', '晟邦', 'nanjingshengbang');
INSERT INTO `t_courier_company` VALUES ('76', '深圳德创', 'dechuangwuliu');
INSERT INTO `t_courier_company` VALUES ('77', '晋越', 'jinyuekuaidi');

-- ----------------------------
-- Table structure for t_damai_integral_strategy
-- ----------------------------
DROP TABLE IF EXISTS `t_damai_integral_strategy`;
CREATE TABLE `t_damai_integral_strategy` (
  `integral_strategy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `strategy_name` varchar(255) DEFAULT NULL COMMENT '策略名称',
  `strategy_rule_yuan` decimal(12,0) DEFAULT NULL COMMENT '策略规则对应的元（金额）单位:分',
  `strategy_rule_integral` int(8) DEFAULT NULL COMMENT '策略规则对应的积分',
  `strategy_categroy` tinyint(2) DEFAULT NULL COMMENT '策略类型',
  `client_id` tinyint(2) DEFAULT NULL COMMENT '客户端id ',
  `strategy_code` varchar(32) DEFAULT NULL COMMENT '策略code',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_effective` tinyint(1) DEFAULT '0' COMMENT '是否有效  默认0，0无效，1有效 ',
  `limit` int(8) DEFAULT NULL COMMENT '单品积分上限',
  `delete_status` tinyint(1) DEFAULT '0' COMMENT '删除状态   -1删除，0不删除，默认0',
  PRIMARY KEY (`integral_strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优购积分策略表';

-- ----------------------------
-- Records of t_damai_integral_strategy
-- ----------------------------

-- ----------------------------
-- Table structure for t_delivery_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_delivery_manager`;
CREATE TABLE `t_delivery_manager` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '商城快递100支持物流公司ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商城快递100支持物流创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商城快递100支持物流更新时间',
  `version` bigint(20) DEFAULT NULL COMMENT '商城快递100支持物流版本号',
  `orders` int(11) DEFAULT NULL COMMENT '商城快递100支持物流排序',
  `name` varchar(60) NOT NULL COMMENT '商城快递100支持物流名称',
  `code` varchar(60) NOT NULL COMMENT '商城快递100支持物流代码',
  `type` int(6) DEFAULT NULL COMMENT '商城快递100支持物流类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '商城快递100支持物流备注',
  `delivery_code` varchar(80) DEFAULT NULL COMMENT '所属第三方快递查询接口放 编码',
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`) USING BTREE,
  KEY `index_code` (`code`) USING BTREE,
  KEY `index_company_code` (`delivery_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1835 DEFAULT CHARSET=utf8 COMMENT='快递提供商字典';

-- ----------------------------
-- Records of t_delivery_manager
-- ----------------------------
INSERT INTO `t_delivery_manager` VALUES ('105', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '安捷快递', 'AJ', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('106', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '安能物流', 'ANE', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('107', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '安信达快递', 'AXD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('108', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '北青小红帽', 'BQXHM', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('109', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '百福东方', 'BFDF', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('110', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '百世快运', 'BTWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('111', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'CCES快递', 'CCES', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('112', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '城市100', 'CITY100', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('113', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'COE东方快递', 'COE', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('114', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '长沙创一', 'CSCY', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('115', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '成都善途速运', 'CDSTKY', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('116', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '德邦', 'DBL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('117', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'D速物流', 'DSWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('118', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '大田物流', 'DTWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('119', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'EMS', 'EMS', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('120', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '快捷速递', 'FAST', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('121', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'FEDEX联邦(国内件）', 'FEDEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('122', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'FEDEX联邦(国际件）', 'FEDEX_GJ', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('123', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '飞康达', 'FKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('124', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '广东邮政', 'GDEMS', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('125', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '共速达', 'GSD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('126', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '国通快递', 'GTO', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('127', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '高铁速递', 'GTSD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('128', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '汇丰物流', 'HFWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('129', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '天天快递', 'HHTT', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('130', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '恒路物流', 'HLWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('131', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '天地华宇', 'HOAU', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('132', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '华强物流', 'hq568', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('133', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '百世快递', 'HTKY', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('134', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '华夏龙物流', 'HXLWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('135', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '好来运快递', 'HYLSD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('136', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '京广速递', 'JGSD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('137', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '九曳供应链', 'JIUYE', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('138', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '佳吉快运', 'JJKY', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('139', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '嘉里物流', 'JLDT', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('140', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '捷特快递', 'JTKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('141', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '急先达', 'JXD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('142', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '晋越快递', 'JYKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('143', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '加运美', 'JYM', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('144', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '佳怡物流', 'JYWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('145', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '跨越物流', 'KYWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('146', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '龙邦快递', 'LB', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('147', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '联昊通速递', 'LHT', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('148', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '民航快递', 'MHKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('149', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '明亮物流', 'MLWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('150', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '能达速递', 'NEDA', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('151', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '平安达腾飞快递', 'PADTF', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('152', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '全晨快递', 'QCKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('153', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '全峰快递', 'QFKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('154', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '全日通快递', 'QRT', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('155', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '如风达', 'RFD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('156', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '赛澳递', 'SAD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('157', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '圣安物流', 'SAWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('158', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '盛邦物流', 'SBWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('159', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '上大物流', 'SDWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('160', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '顺丰快递', 'SF', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('161', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '盛丰物流', 'SFWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('162', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '盛辉物流', 'SHWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('163', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '速通物流', 'ST', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('164', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '申通快递', 'STO', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('165', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '速腾快递', 'STWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('166', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '速尔快递', 'SURE', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('167', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '唐山申通', 'TSSTO', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('168', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '全一快递', 'UAPEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('169', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '优速快递', 'UC', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('170', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '万家物流', 'WJWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('171', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '万象物流', 'WXWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('172', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '新邦物流', 'XBWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('173', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '信丰快递', 'XFEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('174', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '希优特', 'XYT', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('175', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '新杰物流', 'XJ', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('176', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '源安达快递', 'YADEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('177', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '远成物流', 'YCWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('178', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '韵达快递', 'YD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('179', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '义达国际物流', 'YDH', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('180', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '越丰物流', 'YFEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('181', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '原飞航物流', 'YFHEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('182', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '亚风快递', 'YFSD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('183', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '运通快递', 'YTKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('184', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '圆通速递', 'YTO', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('185', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '亿翔快递', 'YXKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('186', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '邮政平邮/小包', 'YZPY', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('187', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '增益快递', 'ZENY', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('188', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '汇强快递', 'ZHQKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('189', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '宅急送', 'ZJS', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('190', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '众通快递', 'ZTE', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('191', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '中铁快运', 'ZTKY', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('192', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '中通快递', 'ZTO', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('193', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '中铁物流', 'ZTWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('194', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '中邮物流', 'ZYWL', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('195', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '亚马逊物流', 'AMAZON', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('196', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '速必达物流', 'SUBIDA', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('197', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '瑞丰速递', 'RFEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('198', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '快客快递', 'QUICK', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('199', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '城际快递', 'CJKD', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('200', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'CNPEX中邮快递', 'CNPEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('201', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '鸿桥供应链', 'HOTSCM', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('202', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '海派通物流公司', 'HPTEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('203', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '澳邮专线', 'AYCA', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('204', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '泛捷快递', 'PANEX', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('205', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'PCA Express', 'PCA', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('206', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'UEQ Express', 'UEQ', '1', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('831', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'AAE全球专递', 'AAE', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('832', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'ACS雅仕快递', 'ACS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('833', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'ADP Express Tracking', 'ADP', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('834', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '安圭拉邮政', 'ANGUILAYOU', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('835', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '澳门邮政', 'AOMENYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('836', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'APAC', 'APAC', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('837', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'Aramex', 'ARAMEX', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('838', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '奥地利邮政', 'AT', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('839', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'Australia Post Tracking', 'AUSTRALIA', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('840', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '比利时邮政', 'BEL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('841', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'BHT快递', 'BHT', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('842', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '秘鲁邮政', 'BILUYOUZHE', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('843', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '巴西邮政', 'BR', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('844', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '不丹邮政', 'BUDANYOUZH', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('845', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '加拿大邮政', 'CA', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('846', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '递四方速递', 'D4PX', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('847', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'DHL', 'DHL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('848', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'DHL(英文版)', 'DHL_EN', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('849', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'DHL全球', 'DHL_GLB', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('850', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'DHL Global Mail', 'DHLGM', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('851', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '丹麦邮政', 'DK', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('852', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'DPD', 'DPD', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('853', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'DPEX', 'DPEX', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('854', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'EMS国际', 'EMSGJ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('855', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'EShipper', 'ESHIPPER', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('856', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '国际e邮宝', 'GJEYB', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('857', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '国际邮政包裹', 'GJYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('858', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'GLS', 'GLS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('859', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '安的列斯群岛邮政', 'IADLSQDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('860', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '澳大利亚邮政', 'IADLYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('861', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '阿尔巴尼亚邮政', 'IAEBNYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('862', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '阿尔及利亚邮政', 'IAEJLYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('863', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '阿富汗邮政', 'IAFHYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('864', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '安哥拉邮政', 'IAGLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('865', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '阿根廷邮政', 'IAGTYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('866', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '埃及邮政', 'IAJYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('867', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '阿鲁巴邮政', 'IALBYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('868', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '奥兰群岛邮政', 'IALQDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('869', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '阿联酋邮政', 'IALYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('870', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '阿曼邮政', 'IAMYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('871', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '阿塞拜疆邮政', 'IASBJYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('872', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '埃塞俄比亚邮政', 'IASEBYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('873', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '爱沙尼亚邮政', 'IASNYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('874', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '阿森松岛邮政', 'IASSDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('875', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '博茨瓦纳邮政', 'IBCWNYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('876', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '波多黎各邮政', 'IBDLGYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('877', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '冰岛邮政', 'IBDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('878', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '白俄罗斯邮政', 'IBELSYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('879', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '波黑邮政', 'IBHYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('880', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '保加利亚邮政', 'IBJLYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('881', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '巴基斯坦邮政', 'IBJSTYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('882', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '黎巴嫩邮政', 'IBLNYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('883', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '便利速递', 'IBLSD', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('884', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '玻利维亚邮政', 'IBLWYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('885', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '巴林邮政', 'IBLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('886', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '百慕达邮政', 'IBMDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('887', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '波兰邮政', 'IBOLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('888', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '宝通达', 'IBTD', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('889', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '贝邮宝', 'IBYB', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('890', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '出口易', 'ICKY', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('891', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '达方物流', 'IDFWL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('892', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '德国邮政', 'IDGYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('893', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '爱尔兰邮政', 'IE', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('894', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '厄瓜多尔邮政', 'IEGDEYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('895', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '俄罗斯邮政', 'IELSYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('896', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '厄立特里亚邮政', 'IELTLYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('897', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '飞特物流', 'IFTWL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('898', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '瓜德罗普岛EMS', 'IGDLPDEMS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('899', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '瓜德罗普岛邮政', 'IGDLPDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('900', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '俄速递', 'IGJESD', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('901', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '哥伦比亚邮政', 'IGLBYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('902', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '格陵兰邮政', 'IGLLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('903', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '哥斯达黎加邮政', 'IGSDLJYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('904', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '韩国邮政', 'IHGYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('905', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '华翰物流', 'IHHWL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('906', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '互联易', 'IHLY', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('907', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '哈萨克斯坦邮政', 'IHSKSTYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('908', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '黑山邮政', 'IHSYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('909', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '津巴布韦邮政', 'IJBBWYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('910', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '吉尔吉斯斯坦邮政', 'IJEJSSTYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('911', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '捷克邮政', 'IJKYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('912', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '加纳邮政', 'IJNYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('913', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '柬埔寨邮政', 'IJPZYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('914', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '克罗地亚邮政', 'IKNDYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('915', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '肯尼亚邮政', 'IKNYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('916', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '科特迪瓦EMS', 'IKTDWEMS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('917', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '科特迪瓦邮政', 'IKTDWYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('918', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '卡塔尔邮政', 'IKTEYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('919', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '利比亚邮政', 'ILBYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('920', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '林克快递', 'ILKKD', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('921', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '罗马尼亚邮政', 'ILMNYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('922', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '卢森堡邮政', 'ILSBYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('923', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '拉脱维亚邮政', 'ILTWYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('924', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '立陶宛邮政', 'ILTWYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('925', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '列支敦士登邮政', 'ILZDSDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('926', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '马尔代夫邮政', 'IMEDFYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('927', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '摩尔多瓦邮政', 'IMEDWYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('928', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '马耳他邮政', 'IMETYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('929', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '孟加拉国EMS', 'IMJLGEMS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('930', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '摩洛哥邮政', 'IMLGYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('931', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '毛里求斯邮政', 'IMLQSYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('932', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '马来西亚EMS', 'IMLXYEMS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('933', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '马来西亚邮政', 'IMLXYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('934', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '马其顿邮政', 'IMQDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('935', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '马提尼克EMS', 'IMTNKEMS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('936', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '马提尼克邮政', 'IMTNKYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('937', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '墨西哥邮政', 'IMXGYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('938', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '南非邮政', 'INFYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('939', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '尼日利亚邮政', 'INRLYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('940', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '挪威邮政', 'INWYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('941', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '葡萄牙邮政', 'IPTYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('942', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '全球快递', 'IQQKD', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('943', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '全通物流', 'IQTWL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('944', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '苏丹邮政', 'ISDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('945', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '萨尔瓦多邮政', 'ISEWDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('946', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '塞尔维亚邮政', 'ISEWYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('947', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '斯洛伐克邮政', 'ISLFKYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('948', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '斯洛文尼亚邮政', 'ISLWNYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('949', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '塞内加尔邮政', 'ISNJEYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('950', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '塞浦路斯邮政', 'ISPLSYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('951', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '沙特阿拉伯邮政', 'ISTALBYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('952', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '土耳其邮政', 'ITEQYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('953', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '泰国邮政', 'ITGYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('954', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '特立尼达和多巴哥EMS', 'ITLNDHDBGE', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('955', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '突尼斯邮政', 'ITNSYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('956', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '坦桑尼亚邮政', 'ITSNYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('957', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '危地马拉邮政', 'IWDMLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('958', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '乌干达邮政', 'IWGDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('959', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '乌克兰EMS', 'IWKLEMS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('960', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '乌克兰邮政', 'IWKLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('961', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '乌拉圭邮政', 'IWLGYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('962', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '文莱邮政', 'IWLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('963', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '乌兹别克斯坦EMS', 'IWZBKSTEMS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('964', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '乌兹别克斯坦邮政', 'IWZBKSTYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('965', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '西班牙邮政', 'IXBYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('966', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '小飞龙物流', 'IXFLWL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('967', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '新喀里多尼亚邮政', 'IXGLDNYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('968', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '新加坡EMS', 'IXJPEMS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('969', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '新加坡邮政', 'IXJPYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('970', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '叙利亚邮政', 'IXLYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('971', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '希腊邮政', 'IXLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('972', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '夏浦世纪', 'IXPSJ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('973', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '夏浦物流', 'IXPWL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('974', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '新西兰邮政', 'IXXLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('975', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '匈牙利邮政', 'IXYLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('976', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '意大利邮政', 'IYDLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('977', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '印度尼西亚邮政', 'IYDNXYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('978', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '印度邮政', 'IYDYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('979', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '英国邮政', 'IYGYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('980', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '伊朗邮政', 'IYLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('981', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '亚美尼亚邮政', 'IYMNYYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('982', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '也门邮政', 'IYMYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('983', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '越南邮政', 'IYNYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('984', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '以色列邮政', 'IYSLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('985', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '易通关', 'IYTG', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('986', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '燕文物流', 'IYWWL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('987', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '直布罗陀邮政', 'IZBLTYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('988', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '智利邮政', 'IZLYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('989', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '日本邮政', 'JP', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('990', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '荷兰邮政', 'NL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('991', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'ONTRAC', 'ONTRAC', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('992', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '全球邮政', 'QQYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('993', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '瑞典邮政', 'RDSE', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('994', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '瑞士邮政', 'SWCH', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('995', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '台湾邮政', 'TAIWANYZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('996', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'TNT快递', 'TNT', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('997', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'UPS', 'UPS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('998', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'USPS美国邮政', 'USPS', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('999', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '日本大和运输(Yamato)', 'YAMA', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1000', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'YODEL', 'YODEL', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1001', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '约旦邮政', 'YUEDANYOUZ', '2', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1003', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '爱购转运', 'ZY_AG', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1004', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '爱欧洲', 'ZY_AOZ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1005', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '澳世速递', 'ZY_AUSE', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1006', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'AXO', 'ZY_AXO', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1007', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '澳转运', 'ZY_AZY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1008', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '八达网', 'ZY_BDA', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1009', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '蜜蜂速递', 'ZY_BEE', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1010', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '贝海速递', 'ZY_BH', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1011', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '百利快递', 'ZY_BL', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1012', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '斑马物流', 'ZY_BM', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1013', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '败欧洲', 'ZY_BOZ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1014', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '百通物流', 'ZY_BT', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1015', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '贝易购', 'ZY_BYECO', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1016', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '策马转运', 'ZY_CM', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1017', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '赤兔马转运', 'ZY_CTM', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1018', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'CUL中美速递', 'ZY_CUL', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1019', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '德国海淘之家', 'ZY_DGHT', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1020', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '德运网', 'ZY_DYW', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1021', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'EFS POST', 'ZY_EFS', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1022', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '宜送转运', 'ZY_ESONG', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1023', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'ETD', 'ZY_ETD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1024', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '飞碟快递', 'ZY_FD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1025', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '飞鸽快递', 'ZY_FG', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1026', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '风雷速递', 'ZY_FLSD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1027', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '风行快递', 'ZY_FX', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1028', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '风行速递', 'ZY_FXSD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1029', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '飞洋快递', 'ZY_FY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1030', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '皓晨快递', 'ZY_HC', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1031', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '皓晨优递', 'ZY_HCYD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1032', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '海带宝', 'ZY_HDB', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1033', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '汇丰美中速递', 'ZY_HFMZ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1034', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '豪杰速递', 'ZY_HJSD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1035', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '360hitao转运', 'ZY_HTAO', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1036', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '海淘村', 'ZY_HTCUN', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1037', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '365海淘客', 'ZY_HTKE', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1038', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '华通快运', 'ZY_HTONG', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1039', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '海星桥快递', 'ZY_HXKD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1040', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '华兴速运', 'ZY_HXSY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1041', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '海悦速递', 'ZY_HYSD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1042', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'LogisticsY', 'ZY_IHERB', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1043', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '君安快递', 'ZY_JA', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1044', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '时代转运', 'ZY_JD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1045', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '骏达快递', 'ZY_JDKD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1046', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '骏达转运', 'ZY_JDZY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1047', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '久禾快递', 'ZY_JH', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1048', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '金海淘', 'ZY_JHT', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1049', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '联邦转运FedRoad', 'ZY_LBZY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1050', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '领跑者快递', 'ZY_LPZ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1051', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '龙象快递', 'ZY_LX', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1052', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '量子物流', 'ZY_LZWL', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1053', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '明邦转运', 'ZY_MBZY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1054', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '美国转运', 'ZY_MGZY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1055', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '美嘉快递', 'ZY_MJ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1056', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '美速通', 'ZY_MST', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1057', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '美西转运', 'ZY_MXZY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1058', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '168 美中快递', 'ZY_MZ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1059', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '欧e捷', 'ZY_OEJ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1060', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '欧洲疯', 'ZY_OZF', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1061', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '欧洲GO', 'ZY_OZGO', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1062', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '全美通', 'ZY_QMT', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1063', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'QQ-EX', 'ZY_QQEX', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1064', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '润东国际快线', 'ZY_RDGJ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1065', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '瑞天快递', 'ZY_RT', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1066', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '瑞天速递', 'ZY_RTSD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1067', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'SCS国际物流', 'ZY_SCS', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1068', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '速达快递', 'ZY_SDKD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1069', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '四方转运', 'ZY_SFZY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1070', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'SOHO苏豪国际', 'ZY_SOHO', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1071', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'Sonic-Ex速递', 'ZY_SONIC', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1072', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '上腾快递', 'ZY_ST', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1073', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '通诚美中快递', 'ZY_TCM', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1074', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '天际快递', 'ZY_TJ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1075', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '天马转运', 'ZY_TM', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1076', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '滕牛快递', 'ZY_TN', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1077', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'TrakPak', 'ZY_TPAK', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1078', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '太平洋快递', 'ZY_TPY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1079', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '唐三藏转运', 'ZY_TSZ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1080', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '天天海淘', 'ZY_TTHT', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1081', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'TWC转运世界', 'ZY_TWC', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1082', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '同心快递', 'ZY_TX', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1083', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '天翼快递', 'ZY_TY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1084', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '同舟快递', 'ZY_TZH', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1085', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, 'UCS合众快递', 'ZY_UCS', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1086', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '文达国际DCS', 'ZY_WDCS', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1087', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '星辰快递', 'ZY_XC', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1088', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '迅达快递', 'ZY_XDKD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1089', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '信达速运', 'ZY_XDSY', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1090', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '先锋快递', 'ZY_XF', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1091', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '新干线快递', 'ZY_XGX', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1092', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '西邮寄', 'ZY_XIYJ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1093', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '信捷转运', 'ZY_XJ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1094', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '优购快递', 'ZY_YGKD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1095', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '友家速递(UCS)', 'ZY_YJSD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1096', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '云畔网', 'ZY_YPW', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1097', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '云骑快递', 'ZY_YQ', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1098', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '一柒物流', 'ZY_YQWL', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1099', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '优晟速递', 'ZY_YSSD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1100', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '易送网', 'ZY_YSW', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1101', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '运淘美国', 'ZY_YTUSA', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1102', '2017-06-27 19:12:25', '2017-06-27 19:12:25', null, null, '至诚速递', 'ZY_ZCSD', '3', 'KDNIAO', 'KDNIAO');
INSERT INTO `t_delivery_manager` VALUES ('1103', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '公司名称', '公司编码', null, null, '类型');
INSERT INTO `t_delivery_manager` VALUES ('1104', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '邮政包裹/平邮', 'youzhengguonei', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1105', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '国际包裹', 'youzhengguoji', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1106', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'EMS', 'ems', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1107', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'EMS-国际件', 'emsguoji', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1108', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'EMS-国际件-英文结果', 'emsinten', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1109', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '北京EMS', 'bjemstckj', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1110', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '顺丰', 'shunfeng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1111', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '申通', 'shentong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1112', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '圆通', 'yuantong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1113', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中通', 'zhongtong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1114', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '汇通', 'huitongkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1115', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '韵达', 'yunda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1116', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '宅急送', 'zhaijisong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1117', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '天天', 'tiantian', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1118', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '德邦', 'debangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1119', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '国通', 'guotongkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1120', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '增益', 'zengyisudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1121', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '速尔', 'suer', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1122', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中铁物流', 'ztky', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1123', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中铁快运', 'zhongtiewuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1124', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '能达', 'ganzhongnengda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1125', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '优速', 'youshuwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1126', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全峰', 'quanfengkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1127', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '京东', 'jd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1128', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'FedEx-国际', 'fedex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1129', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'FedEx-美国', 'fedexus', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1130', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DHL全球件', 'dhlen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1131', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DHL', 'dhl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1132', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DHL-德国', 'dhlde', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1133', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'TNT全球件', 'tnten', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1134', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'TNT', 'tnt', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1135', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'UPS全球件', 'upsen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1136', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'UPS', 'ups', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1137', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'USPS', 'usps', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1138', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DPD', 'dpd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1139', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DPD Germany', 'dpdgermany', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1140', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DPD Poland', 'dpdpoland', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1141', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DPD UK', 'dpduk', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1142', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'GLS', 'gls', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1143', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Toll', 'dpexen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1144', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Toll Priority(Toll Online)', 'tollpriority', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1145', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Aramex', 'aramex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1146', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DPEX', 'dpex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1147', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '宅急便', 'zhaijibian', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1148', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '黑猫雅玛多', 'yamato', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1149', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '香港邮政(HongKong Post)', 'hkpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1150', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '英国大包、EMS（Parcel Force）', 'parcelforce', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1151', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '英国小包（Royal Mail）', 'royalmail', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1152', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳大利亚邮政-英文', 'auspost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1153', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '加拿大邮政-英文版', 'canpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1154', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '一统飞鸿', 'yitongfeihong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1155', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '如风达', 'rufengda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1156', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '海红网送', 'haihongwangsong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1157', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '通和天下', 'tonghetianxia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1158', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '郑州建华', 'zhengzhoujianhua', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1159', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '红马甲', 'sxhongmajia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1160', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '芝麻开门', 'zhimakaimen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1161', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乐捷递', 'lejiedi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1162', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '立即送', 'lijisong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1163', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '银捷', 'yinjiesudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1164', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '门对门', 'menduimen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1165', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '河北建华', 'hebeijianhua', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1166', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '微特派', 'weitepai', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1167', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '风行天下', 'fengxingtianxia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1168', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '尚橙', 'shangcheng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1169', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新蛋奥硕', 'neweggozzo', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1170', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '鑫飞鸿', 'xinhongyukuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1171', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全一', 'quanyikuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1172', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '彪记', 'biaojikuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1173', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '星晨急便', 'xingchengjibian', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1174', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '亚风', 'yafengsudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1175', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '源伟丰', 'yuanweifeng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1176', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全日通', 'quanritongkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1177', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '安信达', 'anxindakuaixi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1178', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '民航', 'minghangkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1179', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '凤凰', 'fenghuangkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1180', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '京广', 'jinguangsudikuaijian', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1181', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '配思货运', 'peisihuoyunkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1182', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'AAE-中国件', 'aae', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1183', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '大田', 'datianwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1184', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新邦', 'xinbangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1185', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '龙邦', 'longbanwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1186', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '一邦', 'yibangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1187', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '联昊通', 'lianhaowuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1188', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '广东邮政', 'guangdongyouzhengwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1189', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中邮', 'zhongyouwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1190', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '天地华宇', 'tiandihuayu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1191', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '盛辉', 'shenghuiwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1192', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '长宇', 'changyuwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1193', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '飞康达', 'feikangda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1194', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '元智捷诚', 'yuanzhijiecheng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1195', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '万家', 'wanjiawuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1196', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '远成', 'yuanchengwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1197', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '信丰', 'xinfengwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1198', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '文捷航空', 'wenjiesudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1199', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全晨', 'quanchenkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1200', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '佳怡', 'jiayiwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1201', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '快捷', 'kuaijiesudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1202', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'D速', 'dsukuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1203', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全际通', 'quanjitong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1204', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '青岛安捷', 'anjiekuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1205', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '越丰', 'yuefengwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1206', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '急先达', 'jixianda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1207', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '百福东方', 'baifudongfang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1208', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'BHT', 'bht', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1209', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '伍圆', 'wuyuansudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1210', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '蓝镖', 'lanbiaokuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1211', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'COE', 'coe', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1212', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '南京100', 'nanjing', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1213', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '恒路', 'hengluwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1214', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '金大', 'jindawuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1215', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '华夏龙', 'huaxialongwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1216', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '运通中港', 'yuntongkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1217', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '佳吉', 'jiajiwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1218', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '盛丰', 'shengfengwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1219', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '源安达', 'yuananda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1220', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '加运美', 'jiayunmeiwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1221', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '万象', 'wanxiangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1222', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '宏品', 'hongpinwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1223', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '上大', 'shangda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1224', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中铁', 'zhongtiewuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1225', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '原飞航', 'yuanfeihangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1226', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '海外环球', 'haiwaihuanqiu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1227', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '三态', 'santaisudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1228', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '晋越', 'jinyuekuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1229', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '联邦', 'lianbangkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1230', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '飞快达', 'feikuaida', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1231', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '忠信达', 'zhongxinda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1232', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '共速达', 'gongsuda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1233', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '嘉里大通', 'jialidatong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1234', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'OCS', 'ocs', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1235', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '美国', 'meiguokuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1236', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '成都立即送', 'lijisong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1237', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '递四方', 'disifang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1238', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '康力', 'kangliwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1239', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '跨越', 'kuayue', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1240', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '海盟', 'haimengsudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1241', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '圣安', 'shenganwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1242', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中速', 'zhongsukuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1243', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'OnTrac', 'ontrac', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1244', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '七天连锁', 'sevendays', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1245', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '明亮', 'mingliangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1246', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '凡客配送（作废）', 'vancl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1247', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '华企', 'huaqikuaiyun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1248', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '城市100', 'city100', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1249', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '穗佳', 'suijiawuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1250', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '飞豹', 'feibaokuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1251', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '传喜', 'chuanxiwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1252', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '捷特', 'jietekuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1253', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '隆浪', 'longlangkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1254', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'EMS-英文', 'emsen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1255', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中天万运', 'zhongtianwanyun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1256', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '邦送', 'bangsongwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1257', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳大利亚(Australia Post)', 'auspost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1258', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '加拿大(Canada Post)', 'canpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1259', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '加拿大邮政', 'canpostfr', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1260', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '顺丰-美国件', 'shunfengen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1261', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '汇强', 'huiqiangkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1262', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '希优特', 'xiyoutekuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1263', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '昊盛', 'haoshengwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1264', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '亿领', 'yilingsuyun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1265', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '大洋', 'dayangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1266', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '递达', 'didasuyun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1267', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '易通达', 'yitongda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1268', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '邮必佳', 'youbijia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1269', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '亿顺航', 'yishunhang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1270', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '飞狐', 'feihukuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1271', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '潇湘晨报', 'xiaoxiangchenbao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1272', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '巴伦支', 'balunzhi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1273', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '闽盛', 'minshengkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1274', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '佳惠尔', 'syjiahuier', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1275', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '民邦', 'minbangsudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1276', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '上海快通', 'shanghaikuaitong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1277', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '北青小红帽', 'xiaohongmao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1278', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'GSM', 'gsm', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1279', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '安能', 'annengwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1280', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'KCS', 'kcs', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1281', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'City-Link', 'citylink', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1282', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '店通', 'diantongkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1283', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '凡宇', 'fanyukuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1284', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '平安达腾飞', 'pingandatengfei', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1285', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '广东通路', 'guangdongtonglu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1286', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中睿', 'zhongruisudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1287', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '快达', 'kuaidawuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1288', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'ADP国际', 'adp', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1289', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '颿达国际', 'fardarww', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1290', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '颿达国际-英文', 'fandaguoji', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1291', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '林道国际', 'shlindao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1292', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中外运-中文', 'sinoex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1293', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中外运', 'zhongwaiyun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1294', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '深圳德创', 'dechuangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1295', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '林道国际-英文', 'ldxpres', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1296', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '瑞典（Sweden Post）', 'ruidianyouzheng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1297', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'PostNord(Posten AB)', 'postenab', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1298', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '偌亚奥国际', 'nuoyaao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1299', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '祥龙运通', 'xianglongyuntong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1300', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '品速心达', 'pinsuxinda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1301', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '宇鑫', 'yuxinwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1302', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '陪行', 'peixingwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1303', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '户通', 'hutongwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1304', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '西安城联', 'xianchengliansudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1305', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '煜嘉', 'yujiawuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1306', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '一柒国际', 'yiqiguojiwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1307', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Fedex-国际件-中文', 'fedexcn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1308', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '联邦-英文', 'lianbangkuaidien', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1309', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中通（带电话）', 'zhongtongphone', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1310', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '赛澳递for买卖宝', 'saiaodimmb', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1311', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '上海无疆for买卖宝', 'shanghaiwujiangmmb', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1312', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新加坡小包(Singapore Post)', 'singpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1313', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '音素', 'yinsu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1314', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '南方传媒', 'ndwl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1315', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '速呈宅配', 'sucheng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1316', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '创一', 'chuangyi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1317', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '云南滇驿', 'dianyi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1318', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '重庆星程', 'cqxingcheng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1319', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '四川星程', 'scxingcheng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1320', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '贵州星程', 'gzxingcheng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1321', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '运通中港(作废)', 'ytkd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1322', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Gati-英文', 'gatien', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1323', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Gati-中文', 'gaticn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1324', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'jcex', 'jcex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1325', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '派尔', 'peex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1326', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '凯信达', 'kxda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1327', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '安达信', 'advancing', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1328', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '汇文', 'huiwen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1329', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '亿翔', 'yxexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1330', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '东红', 'donghong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1331', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '飞远配送', 'feiyuanvipshop', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1332', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '好运来', 'hlyex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1333', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '四川快优达', 'kuaiyouda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1334', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '日昱', 'riyuwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1335', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '速通', 'sutongwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1336', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '晟邦', 'nanjingshengbang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1337', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '爱尔兰(An Post)', 'anposten', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1338', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '日本（Japan Post）', 'japanposten', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1339', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '丹麦(Post Denmark)', 'postdanmarken', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1340', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '巴西(Brazil Post/Correios)', 'brazilposten', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1341', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '荷兰挂号信(PostNL international registered mail)', 'postnlcn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1342', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '荷兰挂号信(PostNL international registered mail)', 'postnl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1343', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乌克兰EMS-中文(EMS Ukraine)', 'emsukrainecn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1344', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乌克兰EMS(EMS Ukraine)', 'emsukraine', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1345', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乌克兰邮政包裹', 'ukrpostcn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1346', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乌克兰小包、大包(UkrPost)', 'ukrpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1347', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '海红for买卖宝', 'haihongmmb', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1348', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'FedEx-英国件（FedEx UK)', 'fedexuk', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1349', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'FedEx-英国件', 'fedexukcn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1350', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '叮咚', 'dingdong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1351', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'UPS Freight', 'upsfreight', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1352', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'ABF', 'abf', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1353', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Purolator', 'purolator', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1354', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '比利时（Bpost）', 'bpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1355', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '比利时国际(Bpost international)', 'bpostinter', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1356', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'LaserShip', 'lasership', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1357', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'YODEL', 'yodel', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1358', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DHL-荷兰（DHL Netherlands）', 'dhlnetherlands', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1359', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'MyHermes', 'myhermes', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1360', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Fastway Ireland', 'fastway', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1361', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '法国大包、EMS-法文（Chronopost France）', 'chronopostfra', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1362', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Selektvracht', 'selektvracht', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1363', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '蓝弧', 'lanhukuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1364', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '比利时(Belgium Post)', 'belgiumpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1365', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'UPS Mail Innovations', 'upsmailinno', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1366', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '挪威（Posten Norge）', 'postennorge', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1367', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '瑞士邮政', 'swisspostcn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1368', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '瑞士(Swiss Post)', 'swisspost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1369', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '英国邮政小包', 'royalmailcn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1370', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DHL Benelux', 'dhlbenelux', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1371', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Nova Poshta', 'novaposhta', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1372', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DHL-波兰（DHL Poland）', 'dhlpoland', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1373', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Estes', 'estes', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1374', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'TNT UK', 'tntuk', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1375', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Deltec Courier', 'deltec', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1376', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'OPEK', 'opek', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1377', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Italy SDA', 'italysad', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1378', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'MRW', 'mrw', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1379', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Chronopost Portugal', 'chronopostport', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1380', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '西班牙(Correos de Espa?a)', 'correosdees', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1381', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Direct Link', 'directlink', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1382', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'ELTA Hellenic Post', 'eltahell', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1383', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '捷克（?eská po?ta）', 'ceskaposta', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1384', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Siodemka', 'siodemka', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1385', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'International Seur', 'seur', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1386', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '久易', 'jiuyicn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1387', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '克罗地亚（Hrvatska Posta）', 'hrvatska', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1388', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '保加利亚（Bulgarian Posts）', 'bulgarian', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1389', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Portugal Seur', 'portugalseur', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1390', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'EC-Firstclass', 'ecfirstclass', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1391', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DTDC India', 'dtdcindia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1392', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Safexpress', 'safexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1393', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '韩国（Korea Post）', 'koreapost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1394', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'TNT Australia', 'tntau', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1395', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '泰国（Thailand Thai Post）', 'thailand', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1396', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'SkyNet Malaysia', 'skynetmalaysia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1397', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '马来西亚小包（Malaysia Post(Registered)）', 'malaysiapost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1398', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '马来西亚大包、EMS（Malaysia Post(parcel,EMS)）', 'malaysiaems', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1399', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '沙特阿拉伯(Saudi Post)', 'saudipost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1400', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '南非（South African Post Office）', 'southafrican', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1401', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'OCA Argentina', 'ocaargen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1402', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '尼日利亚(Nigerian Postal)', 'nigerianpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1403', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '智利(Correos Chile)', 'chile', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1404', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '以色列(Israel Post)', 'israelpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1405', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Estafeta', 'estafeta', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1406', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '港快', 'gdkd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1407', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '墨西哥（Correos de Mexico）', 'mexico', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1408', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '罗马尼亚（Posta Romanian）', 'romanian', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1409', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'TNT Italy', 'tntitaly', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1410', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Mexico Multipack', 'multipack', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1411', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '葡萄牙（Portugal CTT）', 'portugalctt', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1412', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Interlink Express', 'interlink', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1413', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '华航', 'hzpl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1414', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Gati-KWE', 'gatikwe', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1415', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Red Express', 'redexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1416', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Mexico Senda Express', 'mexicodenda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1417', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'TCI XPS', 'tcixps', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1418', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '高铁', 'hre', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1419', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新加坡EMS、大包(Singapore Speedpost)', 'speedpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1420', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'EMS-国际件-英文', 'emsinten', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1421', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Asendia USA', 'asendiausa', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1422', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '法国大包、EMS-英文(Chronopost France)', 'chronopostfren', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1423', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '意大利(Poste Italiane)', 'italiane', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1424', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '冠达', 'gda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1425', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '出口易', 'chukou1', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1426', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '黄马甲', 'huangmajia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1427', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新干线', 'anlexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1428', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '飞洋', 'shipgce', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1429', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '贝海国际', 'xlobo', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1430', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '阿联酋(Emirates Post)', 'emirates', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1431', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新顺丰（NSF）', 'nsf', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1432', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '巴基斯坦(Pakistan Post)', 'pakistan', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1433', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '世运', 'shiyunkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1434', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '合众(UCS）', 'ucs', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1435', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '阿富汗(Afghan Post)', 'afghan', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1436', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '白俄罗斯(Belpochta)', 'belpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1437', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全通', 'quantwl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1438', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'EFS Post', 'efs', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1439', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'TNT Post', 'tntpostcn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1440', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '英脉', 'gml', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1441', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '广通', 'gtongsudi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1442', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '东瀚', 'donghanwl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1443', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'rpx', 'rpx', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1444', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '日日顺', 'rrs', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1445', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '华通', 'htongexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1446', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '吉尔吉斯斯坦(Kyrgyz Post)', 'kyrgyzpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1447', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '拉脱维亚(Latvijas Pasts)', 'latvia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1448', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '黎巴嫩(Liban Post)', 'libanpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1449', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '立陶宛（Lietuvos pa?tas）', 'lithuania', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1450', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '马尔代夫(Maldives Post)', 'maldives', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1451', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '马耳他（Malta Post）', 'malta', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1452', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '马其顿(Macedonian Post)', 'macedonia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1453', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新西兰（New Zealand Post）', 'newzealand', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1454', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '摩尔多瓦(Posta Moldovei)', 'moldova', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1455', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '孟加拉国(EMS)', 'bangladesh', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1456', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '塞尔维亚(PE Post of Serbia)', 'serbia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1457', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '塞浦路斯(Cyprus Post)', 'cypruspost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1458', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '突尼斯EMS(Rapid-Poste)', 'tunisia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1459', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乌兹别克斯坦(Post of Uzbekistan)', 'uzbekistan', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1460', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新喀里多尼亚[法国](New Caledonia)', 'caledonia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1461', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '叙利亚(Syrian Post)', 'republic', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1462', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '亚美尼亚(Haypost-Armenian Postal)', 'haypost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1463', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '也门(Yemen Post)', 'yemen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1464', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '印度(India Post)', 'india', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1465', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '英国(大包,EMS)', 'england', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1466', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '约旦(Jordan Post)', 'jordan', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1467', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '越南小包(Vietnam Posts)', 'vietnam', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1468', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '黑山(Po?ta Crne Gore)', 'montenegro', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1469', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '哥斯达黎加(Correos de Costa Rica)', 'correos', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1470', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '西安喜来', 'xilaikd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1471', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '格陵兰[丹麦]（TELE Greenland A/S）', 'greenland', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1472', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '菲律宾（Philippine Postal）', 'phlpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1473', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '厄瓜多尔(Correos del Ecuador)', 'ecuador', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1474', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '冰岛(Iceland Post)', 'iceland', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1475', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '波兰小包(Poczta Polska)', 'emonitoring', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1476', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '阿尔巴尼亚(Posta shqipatre)', 'albania', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1477', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '阿鲁巴[荷兰]（Post Aruba）', 'aruba', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1478', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '埃及（Egypt Post）', 'egypt', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1479', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '爱沙尼亚(Eesti Post)', 'omniva', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1480', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '云豹国际货运', 'leopard', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1481', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中外运空运', 'sinoairinex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1482', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '上海昊宏国际货物', 'hyk', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1483', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '城晓国际', 'ckeex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1484', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '匈牙利（Magyar Posta）', 'hungary', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1485', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳门(Macau Post)', 'macao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1486', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '台湾（中华邮政）', 'postserv', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1487', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '快淘', 'kuaitao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1488', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '秘鲁(SERPOST)', 'peru', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1489', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '印度尼西亚EMS(Pos Indonesia-EMS)', 'indonesia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1490', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '哈萨克斯坦(Kazpost)', 'kazpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1491', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '立白宝凯', 'lbbk', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1492', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '百千诚', 'bqcwl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1493', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '皇家', 'pfcexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1494', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '法国(La Poste)', 'csuivi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1495', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '奥地利(Austrian Post)', 'austria', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1496', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乌克兰小包、大包(UkrPoshta)', 'ukraine', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1497', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乌干达(Posta Uganda)', 'uganda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1498', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '阿塞拜疆EMS(EMS AzerExpressPost)', 'azerbaijan', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1499', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '芬兰(Itella Posti Oy)', 'finland', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1500', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '斯洛伐克(Slovenská Posta)', 'slovak', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1501', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '埃塞俄比亚(Ethiopian postal)', 'ethiopia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1502', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '卢森堡(Luxembourg Post)', 'luxembourg', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1503', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '毛里求斯(Mauritius Post)', 'mauritius', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1504', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '文莱(Brunei Postal)', 'brunei', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1505', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Quantium', 'quantium', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1506', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '坦桑尼亚(Tanzania Posts)', 'tanzania', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1507', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '阿曼(Oman Post)', 'oman', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1508', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '直布罗陀[英国]( Royal Gibraltar Post)', 'gibraltar', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1509', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '博源恒通', 'byht', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1510', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '越南EMS(VNPost Express)', 'vnpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1511', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '安迅', 'anxl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1512', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '达方', 'dfpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1513', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '兰州伙伴', 'huoban', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1514', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '天纵', 'tianzong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1515', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '波黑(JP BH Posta)', 'bohei', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1516', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '玻利维亚', 'bolivia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1517', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '柬埔寨(Cambodia Post)', 'cambodia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1518', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '巴林(Bahrain Post)', 'bahrain', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1519', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '纳米比亚(NamPost)', 'namibia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1520', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '卢旺达(Rwanda i-posita)', 'rwanda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1521', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '莱索托(Lesotho Post)', 'lesotho', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1522', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '肯尼亚(POSTA KENYA)', 'kenya', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1523', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '喀麦隆(CAMPOST)', 'cameroon', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1524', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '伯利兹(Belize Postal)', 'belize', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1525', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '巴拉圭(Correo Paraguayo)', 'paraguay', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1526', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '十方通', 'sfift', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1527', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '飞鹰', 'hnfy', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1528', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'UPS i-parcle', 'iparcel', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1529', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '鑫锐达', 'bjxsrd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1530', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '麦力', 'mailikuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1531', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '瑞丰', 'rfsd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1532', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '美联', 'letseml', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1533', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'CNPEX中邮', 'cnpex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1534', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '鑫世锐达', 'xsrd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1535', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '同舟行', 'chinatzx', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1536', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '秦邦', 'qbexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1537', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '大达', 'idada', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1538', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'skynet', 'skynet', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1539', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '红马', 'nedahm', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1540', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '云南中诚', 'czwlyn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1541', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '万博', 'wanboex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1542', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '腾达', 'nntengda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1543', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '郑州速捷', 'sujievip', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1544', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'UBI Australia', 'gotoubi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1545', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'ECMS Express', 'ecmsglobal', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1546', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '速派(FastGo)', 'fastgo', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1547', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '易客满', 'ecmscn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1548', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '俄顺达', 'eshunda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1549', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '广东速腾', 'suteng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1550', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新鹏', 'gdxp', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1551', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '美国韵达', 'yundaexus', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1552', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '深圳DPEX', 'szdpex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1553', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '百世', 'baishiwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1554', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '荷兰包裹(PostNL International Parcels)', 'postnlpacle', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1555', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乐天', 'ltexp', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1556', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '智通', 'ztong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1557', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '鑫通宝', 'xtb', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1558', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'airpak expresss', 'airpak', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1559', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '荷兰邮政-中国件', 'postnlchina', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1560', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '法国小包（colissimo）', 'colissimo', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1561', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'PCA Express', 'pcaexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1562', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '韩润', 'hanrun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1563', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中远e环球', 'cosco', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1564', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '顺达', 'sundarexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1565', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '捷记方舟', 'ajexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1566', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '方舟', 'arkexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1567', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '明大', 'adaexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1568', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '长江国际', 'changjiang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1569', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '八达通', 'bdatong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1570', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '美国申通', 'stoexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1571', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '泛捷国际', 'epanex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1572', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '顺捷丰达', 'shunjiefengda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1573', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '华赫', 'nmhuahe', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1574', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '德国(Deutsche Post)', 'deutschepost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1575', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '百腾', 'baitengwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1576', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '品骏', 'pjbest', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1577', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全速通', 'quansutong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1578', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中技', 'zhongjiwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1579', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '九曳供应链', 'jiuyescm', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1580', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '天翼', 'tykd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1581', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '德意思', 'dabei', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1582', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '城际', 'chengji', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1583', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '程光', 'chengguangkuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1584', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '佐川急便', 'sagawa', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1585', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '蓝天', 'lantiankuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1586', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '永昌', 'yongchangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1587', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '笨鸟海淘', 'birdex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1588', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '一正达', 'yizhengdasuyun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1589', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '优配', 'sdyoupei', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1590', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'TRAKPAK', 'trakpak', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1591', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'GTS', 'gts', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1592', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'AOL澳通', 'aolau', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1593', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '宜送', 'yiex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1594', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '通达兴', 'tongdaxing', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1595', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '香港(HongKong Post)英文', 'hkposten', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1596', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '飞力士', 'flysman', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1597', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '转运四方', 'zhuanyunsifang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1598', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'logen路坚', 'ilogen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1599', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '成都东骏', 'dongjun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1600', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '日本郵便', 'japanpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1601', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '佳家通货运', 'jiajiatong56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1602', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '吉日优派', 'jrypex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1603', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '西安胜峰', 'xaetc', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1604', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'CJ', 'doortodoor', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1605', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '信天捷', 'xintianjie', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1606', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '泰国138国际', 'sd138', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1607', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '猴急送', 'hjs', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1608', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全信通', 'quanxintong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1609', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'amazon-国际订单', 'amusorder', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1610', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '骏丰国际', 'junfengguoji', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1611', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '货运皇', 'kingfreight', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1612', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '速必达', 'subida', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1613', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '特急便', 'sucmj', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1614', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '亚马逊中国', 'yamaxunwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1615', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '锦程', 'jinchengwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1616', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '景光', 'jgwl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1617', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '御风', 'yufeng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1618', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '至诚通达', 'zhichengtongda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1619', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '日益通', 'rytsd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1620', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '航宇', 'hangyu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1621', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '急顺通', 'pzhjst', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1622', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '优速通达', 'yousutongda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1623', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '秦远', 'qinyuan', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1624', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳邮中国', 'auexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1625', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '众辉达', 'zhdwl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1626', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '飞邦', 'fbkd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1627', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '华达', 'huada', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1628', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'FOX GLOBAL EXPRESS', 'fox', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1629', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '环球', 'huanqiu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1630', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '辉联', 'huilian', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1631', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'A2U', 'a2u', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1632', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'UEQ', 'ueq', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1633', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中加国际', 'scic', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1634', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '易达通', 'yidatong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1635', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '捷网俄全通', 'ruexp', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1636', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '华通务达', 'htwd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1637', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '申必达', 'speedoex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1638', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '联运', 'lianyun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1639', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '捷安达', 'jieanda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1640', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'SHL畅灵国际', 'shlexp', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1641', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'EWE全球', 'ewe', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1642', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全球', 'abcglobal', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1643', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '芒果', 'mangguo', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1644', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '金海淘', 'goldhaitao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1645', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '极光', 'jiguang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1646', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '富腾达国际', 'ftd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1647', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'DCS', 'dcs', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1648', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '成达国际', 'chengda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1649', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中环', 'zhonghuan', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1650', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '顺邦国际', 'shunbang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1651', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '启辰国际', 'qichen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1652', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳货通', 'auex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1653', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳速', 'aosu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1654', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳世', 'aus', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1655', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '天马迅达', 'tianma', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1656', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '美龙快递', 'mjexp', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1657', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '香港骏辉物流', 'chunfai', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1658', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '三三国际物流', 'zenzen', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1659', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '淼信快递', 'mxe56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1660', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '海派通', 'hipito', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1661', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '鹏程快递', 'pengcheng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1662', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '冠庭国际物流', 'guanting', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1663', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '金岸物流', 'jinan', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1664', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '海带宝', 'haidaibao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1665', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳通华人物流', 'cllexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1666', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '斑马物流', 'banma', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1667', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '友家速递', 'youjia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1668', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '百通物流', 'buytong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1669', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新元快递', 'xingyuankuaidi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1670', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全速物流', 'quansu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1671', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新杰物流', 'sunjex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1672', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '鲁通快运', 'lutong', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1673', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新元国际', 'xynyc', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1674', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '小C海淘', 'xiaocex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1675', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '航空快递', 'airgtc', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1676', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '叮咚澳洲转运', 'dindon', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1677', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '环球通达', 'hqtd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1678', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '好又快物流', 'haoyoukuai', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1679', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '永旺达快递', 'yongwangda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1680', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '木春货运', 'mchy', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1681', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '程光快递', 'flyway', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1682', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全之鑫物流', 'qzx56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1683', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '百事亨通', 'bsht', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1684', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'ILYANG', 'ilyang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1685', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '先锋快递', 'xianfeng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1686', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '万家通快递', 'timedg', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1687', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '美快国际物流', 'meiquick', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1688', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '泰中物流', 'tny', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1689', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '美通', 'valueway', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1690', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新速航', 'sunspeedy', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1691', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '速方', 'bphchina', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1692', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '英超物流', 'yingchao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1693', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '阿根廷(Correo Argentina)', 'correoargentino', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1694', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '瓦努阿图(Vanuatu Post)', 'vanuatu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1695', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '巴巴多斯(Barbados Post)', 'barbados', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1696', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '萨摩亚(Samoa Post)', 'samoa', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1697', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '斐济(Fiji Post)', 'fiji', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1698', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '益递物流', 'edlogistics', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1699', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中外运电子商务', 'esinotrans', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1700', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '跨畅（直邮易）', 'kuachangwuliu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1701', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中澳速递', 'cnausu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1702', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '联合快递', 'gslhkd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1703', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '河南次晨达', 'ccd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1704', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '奔腾物流', 'benteng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1705', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '今枫国际快运', 'mapleexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1706', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中运全速', 'topspeedex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1707', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '宜家行', 'yjxlm', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1708', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中欧快运', 'otobv', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1709', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '金马甲', 'jmjss', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1710', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '一号仓', 'onehcang', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1711', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '和丰同城', 'hfwuxi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1712', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '威时沛运货运', 'wtdchina', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1713', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '顺捷达', 'shunjieda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1714', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '千顺快递', 'qskdyxgs', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1715', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '天联快运', 'tlky', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1716', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'CE易欧通国际速递', 'cloudexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1717', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '行必达', 'speeda', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1718', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中通国际', 'zhongtongguoji', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1719', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '西邮寄', 'xipost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1720', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'NLE', 'nle', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1721', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '亚欧专线', 'nlebv', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1722', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '顺通快递', 'stkd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1723', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '信联通', 'sinatone', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1724', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳德物流', 'auod', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1725', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '德方物流', 'ahdf', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1726', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '微转运', 'wzhaunyun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1727', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '沈阳特急送', 'lntjs', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1728', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'iExpress', 'iexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1729', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'BCWELT', 'bcwelt', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1730', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '欧亚专线', 'euasia', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1731', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '远成快运', 'ycgky', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1732', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '乐递供应链', 'ledii', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1733', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '万通快递', 'gswtkd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1734', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '增速海淘', 'zyzoom', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1735', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'globaltracktrace', 'globaltracktrace', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1736', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '速递中国', 'sendtochina', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1737', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '安鲜达', 'exfresh', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1738', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '高考通知书', 'emsluqu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1739', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '丰程物流', 'sccod', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1740', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '全时速运', 'runhengfeng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1741', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '云邮跨境快递', 'hkems', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1742', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '荷兰Sky Post', 'skypost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1743', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '瑞达国际速递', 'ruidaex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1744', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '德中快递', 'decnlh', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1745', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '苏宁快递', 'suning', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1746', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新西兰中通', 'nzzto', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1747', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '良藤国际速递', 'lmfex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1748', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '一号线', 'lineone', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1749', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '四海快递', 'sihaiet', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1750', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '渥途国际速运', 'wotu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1751', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '德坤供应链', 'dekuncn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1752', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '准实快运', 'zsky123', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1753', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '宏捷国际物流', 'hongjie', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1754', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '鸿讯物流', 'hongxun', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1755', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '卡邦配送', 'ahkbps', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1756', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '论道国际物流', 'lundao', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1757', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '汇通天下物流', 'httx56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1758', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '鹰运国际速递', 'vipexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1759', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '易达通快递', 'qexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1760', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '一运全成物流', 'yyqc56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1761', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '泛远国际物流', 'farlogistis', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1762', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '达速物流', 'dasu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1763', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '恒通快递', 'lqht', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1764', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '壹品速递', 'ypsd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1765', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '速达通', 'sdto', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1766', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '速品快递', 'supinexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1767', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '海龟国际快递', 'turtle', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1768', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '韩国邮政', 'koreapostcn', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1769', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '韵丰物流', 'yunfeng56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1770', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '广州海关', 'gzcustoms', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1771', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '杭州海关', 'hzcustoms', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1772', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '南京海关', 'njcustoms', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1773', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '北京海关', 'bjcustoms', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1774', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '美西快递', 'meixi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1775', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '一站通快递', 'zgyzt', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1776', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '易联通达', 'el56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1777', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '驿扬国际速运', 'iyoungspeed', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1778', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '途鲜物流', 'ibenben', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1779', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '豌豆物流', 'wandougongzhu', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1780', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '韩国邮政韩文', 'koreapostkr', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1781', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '疯狂快递', 'crazyexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1782', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '俄罗斯邮政', 'pochta', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1783', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '云达通', 'ydglobe', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1784', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'ME物流', 'macroexpressco', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1785', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '哥士传奇速递', 'gscq365', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1786', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '心怡物流', 'alog', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1787', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'EU-EXPRESS', 'euexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1788', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '易优包裹', 'eupackage', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1789', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'WTD海外通', 'wtdex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1790', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'CHS中环国际快递', 'chszhonghuanguoji', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1791', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '汉邦国际速递', 'handboy', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1792', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '银河物流', 'milkyway', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1793', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '荷兰速递(Nederland Post)', 'nederlandpost', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1794', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '澳州顺风快递', 'emms', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1795', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '环东物流', 'huandonglg', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1796', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '迅达速递', 'xdexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1797', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中邮速递', 'wondersyd', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1798', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '布谷鸟速递', 'cuckooexpess', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1799', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '万庚国际速递', 'vangenexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1800', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '联邦转运', 'fedroad', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1801', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'Landmark Global', 'landmarkglobal', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1802', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '黑狗物流', 'higo', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1803', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '鹏远国际速递', 'pengyuanexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1804', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '安捷物流', 'anjie88', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1805', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '骏达快递', 'jdexpressusa', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1806', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '恒宇运通', 'hyytes', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1807', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '考拉国际速递', 'kaolaexpress', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1808', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'BlueDart', 'bluedart', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1809', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, 'C&C全球（澳洲cncexp)', 'cncexp', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1810', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '日日顺快线', 'rrskx', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1811', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '运东西', 'yundx', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1812', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '洋包裹', 'yangbaoguo', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1813', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '优联吉运', 'uluckex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1814', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '德豪驿', 'dehaoyi', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1815', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '堡昕德速递', 'bosind', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1816', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '佳成快递', 'jiacheng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1817', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '诺尔国际物流', 'nuoer', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1818', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '加运美速递', 'jym56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1819', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '新时速物流', 'csxss', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1820', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中宇天地', 'zytdscm', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1821', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '翔腾物流', 'xiangteng', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1822', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '恒瑞物流', 'hengrui56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1823', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '邦工快运', 'bgky100', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1824', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '中国翼', 'cnws', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1825', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '上海航瑞货运', 'hangrui', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1826', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '星云速递', 'nebuex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1827', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '冠捷物流', 'gjwl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1828', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '钏博物流', 'cbo56', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1829', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '西翼物流', 'westwing', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1830', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '优邦速运', 'ubonex', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1831', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '首通快运', 'staky', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1832', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '马珂博逻', 'cnmcpl', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1833', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '小熊物流', 'littlebearbear', null, null, 'KD100');
INSERT INTO `t_delivery_manager` VALUES ('1834', '2017-07-12 14:16:32', '2017-07-12 14:16:32', null, null, '玥玛速运', 'yue777', null, null, 'KD100');

-- ----------------------------
-- Table structure for t_delivery_partner
-- ----------------------------
DROP TABLE IF EXISTS `t_delivery_partner`;
CREATE TABLE `t_delivery_partner` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '物流信息合作商主键ID',
  `create_time` datetime NOT NULL COMMENT '物流信息合作商创建时间',
  `delivery_code` varchar(100) NOT NULL,
  `update_time` datetime NOT NULL COMMENT '物流信息合作商修改时间',
  `orders` int(11) DEFAULT NULL COMMENT '物流信息合作商排序',
  `version` int(11) DEFAULT NULL COMMENT '物流信息合作商版本',
  `name` varchar(200) DEFAULT NULL COMMENT '物流信息合作商名称',
  `delivery_url` varchar(500) DEFAULT NULL COMMENT '物流信息合作商URL',
  `delivery_key` varchar(100) DEFAULT NULL COMMENT '物流信息合作商KEY',
  `status` int(6) DEFAULT NULL COMMENT '物流信息合作商状态',
  `business_id` varchar(60) DEFAULT NULL COMMENT '物流信息合作商绑定ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '物流信息合作商备注',
  `creator` varchar(100) DEFAULT NULL COMMENT '物流信息合作商创建者',
  `operator` varchar(100) DEFAULT NULL COMMENT '物流信息合作商操作者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index_code` (`delivery_code`) USING BTREE,
  KEY `ind_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物流合作商';

-- ----------------------------
-- Records of t_delivery_partner
-- ----------------------------
INSERT INTO `t_delivery_partner` VALUES ('2', '2017-06-28 15:10:53', 'KDNIAO', '2017-06-30 16:36:08', null, null, '快递鸟', 'http://api.kdniao.cc/Ebusiness/EbusinessOrderHandle.aspx', 'd57bde6a-c1b4-4c13-a382-7ef0c7c6e719', '0', '1284598', '快递鸟', 'admin', 'admin');
INSERT INTO `t_delivery_partner` VALUES ('3', '2017-06-28 15:11:03', 'KD100', '2017-07-12 13:45:15', null, null, '快递100', 'https://poll.kuaidi100.com/poll/query.do', 'htOHqTQK8006', '0', '26327990FEF6D4EED67F9F596FD32A4C', '快递100', 'admin', 'admin');

-- ----------------------------
-- Table structure for t_delivery_tracker
-- ----------------------------
DROP TABLE IF EXISTS `t_delivery_tracker`;
CREATE TABLE `t_delivery_tracker` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '商城订单物流信息主键ID',
  `create_time` datetime NOT NULL COMMENT '物流订单创建时间',
  `update_time` datetime NOT NULL COMMENT '物流订单更新时间',
  `ordersn` varchar(50) NOT NULL COMMENT '物流订单编号',
  `version` bigint(20) DEFAULT NULL,
  `ebusinessid` varchar(100) DEFAULT NULL COMMENT '物流用户ID',
  `shipper_code` varchar(100) NOT NULL COMMENT '物流快递公司编码',
  `logistic_code` varchar(100) NOT NULL COMMENT '物流运单号',
  `success` bit(1) DEFAULT NULL COMMENT '商城成功与否',
  `reason` varchar(255) DEFAULT NULL COMMENT '物流失败原因',
  `state` varchar(255) DEFAULT NULL COMMENT '物流状态：2-在途中,3-签收,4-问题件.',
  `delivery_type` int(6) DEFAULT NULL COMMENT '快递信息提供方名称',
  PRIMARY KEY (`id`),
  KEY `ind_ordersn` (`ordersn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单物流';

-- ----------------------------
-- Records of t_delivery_tracker
-- ----------------------------

-- ----------------------------
-- Table structure for t_delivery_tracker_item
-- ----------------------------
DROP TABLE IF EXISTS `t_delivery_tracker_item`;
CREATE TABLE `t_delivery_tracker_item` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '物流子项ID',
  `accept_time` varchar(255) DEFAULT NULL COMMENT '物流记录时间',
  `accept_station` varchar(255) DEFAULT NULL COMMENT '物流站点',
  `location` varchar(255) DEFAULT NULL COMMENT '物流站点',
  `action` varchar(255) DEFAULT NULL COMMENT '物流动作',
  `remark` varchar(255) DEFAULT NULL COMMENT '物流子项备注',
  `ordersn` varchar(50) NOT NULL COMMENT '物流子项父SN',
  `logistic_code` varchar(100) NOT NULL COMMENT '物流子项父运单号',
  PRIMARY KEY (`id`),
  KEY `ind_parentid` (`ordersn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单物流明细';

-- ----------------------------
-- Records of t_delivery_tracker_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_domy_order_finance
-- ----------------------------
DROP TABLE IF EXISTS `t_domy_order_finance`;
CREATE TABLE `t_domy_order_finance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键(记录从优购获取的订单)',
  `trade_no` varchar(64) NOT NULL COMMENT ' 大麦支付系统生成的订单号，大麦支付全局唯一.',
  `payment_channel` int(4) DEFAULT NULL COMMENT ' 支付渠道：3-支付宝，4-微信支付，7-京东钱包',
  `third_trade_no` varchar(64) DEFAULT NULL COMMENT '第三方支付订单号',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '商城订单编号',
  `shipping_status` int(4) DEFAULT NULL,
  `receive_name` varchar(64) DEFAULT NULL COMMENT '收货人',
  `receive_address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `receive_phone` varchar(32) NOT NULL COMMENT '联系电话',
  `freight` decimal(12,2) DEFAULT NULL COMMENT '运费金额(单位:分)',
  `delivery_corp` varchar(64) DEFAULT NULL COMMENT '物流公司',
  `delivery_track_no` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `amount_paid` decimal(12,2) DEFAULT NULL COMMENT '已支付金额',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_send_integral` tinyint(2) DEFAULT '0' COMMENT '是否发放了积分:0没有;1发放',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_order_sn` (`order_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优购订单表';

-- ----------------------------
-- Records of t_domy_order_finance
-- ----------------------------

-- ----------------------------
-- Table structure for t_domy_suborder_finance
-- ----------------------------
DROP TABLE IF EXISTS `t_domy_suborder_finance`;
CREATE TABLE `t_domy_suborder_finance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '子订单id',
  `sub_order_sn` varchar(64) NOT NULL COMMENT ' 商城系统子订单号(实际赋值为商品的sku)',
  `seller_id` varchar(64) DEFAULT NULL COMMENT ' 商户ID',
  `seller_name` varchar(64) DEFAULT NULL COMMENT '商户名称',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_sku_sn` varchar(64) DEFAULT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL COMMENT '销售单价（单位分）',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '商品成本价',
  `quantity` int(8) DEFAULT NULL COMMENT '商品数量',
  `goods_sn` varchar(64) DEFAULT NULL COMMENT '商品ID',
  `goods_category` int(4) DEFAULT NULL,
  `goods_ategory_path` varchar(64) DEFAULT NULL,
  `thumb_nail` varchar(64) DEFAULT NULL,
  `order_sn` varchar(64) NOT NULL COMMENT '父订单id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `ind_order_sn` (`order_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优购订单子订单表';

-- ----------------------------
-- Records of t_domy_suborder_finance
-- ----------------------------

-- ----------------------------
-- Table structure for t_exchange_rate
-- ----------------------------
DROP TABLE IF EXISTS `t_exchange_rate`;
CREATE TABLE `t_exchange_rate` (
  `id` tinyint(20) NOT NULL AUTO_INCREMENT,
  `exchange_rate` int(10) DEFAULT NULL COMMENT '积分汇率（1元=多少积分）',
  `creat_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='汇率表(需要初始化数据)';

-- ----------------------------
-- Records of t_exchange_rate
-- ----------------------------
INSERT INTO `t_exchange_rate` VALUES ('1', '100', '2017-11-16 09:32:50', '2018-07-27 17:14:29');

-- ----------------------------
-- Table structure for t_goods_detail_map
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_detail_map`;
CREATE TABLE `t_goods_detail_map` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '详情图id',
  `sequence` int(3) DEFAULT NULL COMMENT '顺序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（0删除，1有效）',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `goods_detail_url` varchar(255) DEFAULT NULL COMMENT '商品详情描述图片',
  `description` text COMMENT '商品详情描述',
  PRIMARY KEY (`id`),
  KEY `ind_goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品详情图表';

-- ----------------------------
-- Records of t_goods_detail_map
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_stock`;
CREATE TABLE `t_goods_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `stock` int(8) DEFAULT NULL COMMENT '商品剩余库存量(就是可用库存,不包括锁定的库存)',
  `used_stock` int(8) DEFAULT NULL COMMENT '消耗库存',
  `lock_stock` int(8) DEFAULT NULL COMMENT '锁定库存',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实物商品库存表';

-- ----------------------------
-- Records of t_goods_stock
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods_virtual_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_virtual_stock`;
CREATE TABLE `t_goods_virtual_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `vritual_card_id` bigint(20) DEFAULT NULL COMMENT '虚拟卡id',
  `stock` int(8) DEFAULT NULL COMMENT '商品剩余库存量(就是可用库存,不包括锁定的库存不包括已经使用的库存)',
  `used_stock` int(8) DEFAULT NULL COMMENT '消耗库存(已经使用的库存)',
  `lock_stock` int(8) DEFAULT NULL COMMENT '锁定库存',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `source` tinyint(1) DEFAULT NULL COMMENT '类型（1来源积分商城）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_goods_id` (`goods_id`),
  KEY `ind_vritual_card_id` (`vritual_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟商品库存表';

-- ----------------------------
-- Records of t_goods_virtual_stock
-- ----------------------------

-- ----------------------------
-- Table structure for t_integral_log
-- ----------------------------
DROP TABLE IF EXISTS `t_integral_log`;
CREATE TABLE `t_integral_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `union_id` bigint(20) DEFAULT NULL,
  `integral_id` bigint(20) DEFAULT NULL COMMENT '积分订单id',
  `order_id` varchar(64) DEFAULT NULL COMMENT '商品订单id',
  `integral` int(255) DEFAULT NULL COMMENT '消耗积分',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `is_return` tinyint(255) DEFAULT '0' COMMENT '是否退款',
  `return_time` datetime DEFAULT NULL COMMENT '退款时间',
  PRIMARY KEY (`id`),
  KEY `ind_union_id` (`union_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='使用积分消费流水表';

-- ----------------------------
-- Records of t_integral_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_integral_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_integral_mall_goods`;
CREATE TABLE `t_integral_mall_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_type` tinyint(1) DEFAULT NULL COMMENT '商品形式(1实物，2虚拟卡,3商城的虚拟商品)',
  `goods_subtitle` varchar(255) DEFAULT NULL COMMENT '商品副标题',
  `goods_cover_url` varchar(128) DEFAULT NULL COMMENT '商品封面url',
  `goods_price` decimal(12,2) DEFAULT NULL COMMENT '商品价格(单位分)',
  `goods_stock` int(8) DEFAULT NULL COMMENT '商品库存(实际可用的库存,虚拟卡就是导入商城后的总量-锁定的-用掉的)',
  `goods_status` tinyint(2) DEFAULT NULL COMMENT '商品状态（-1删除,0,待审核，1审核中，2已上架，3审核未通过，4已下架)',
  `goods_audit_description` varchar(128) DEFAULT NULL COMMENT '商品审核描述',
  `goods_shelf_time` datetime DEFAULT NULL COMMENT '商品上架时间',
  `create_time` datetime DEFAULT NULL COMMENT '商品创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '商品修改时间',
  `freight` decimal(12,2) DEFAULT '0.00' COMMENT '运费金额（单位分）',
  `merchant_id` varchar(128) DEFAULT NULL COMMENT '商户id',
  `merchant_name` varchar(128) DEFAULT NULL COMMENT '商户名称',
  `integral_rule_id` tinyint(2) DEFAULT NULL COMMENT '兑换规则兑换规则（1,纯积分,2积分+现金,3纯现金）',
  `goods_exchange_integral` int(8) DEFAULT '0' COMMENT '商品对应的兑换积分',
  `same_device_limited` tinyint(1) DEFAULT '2' COMMENT '同设备是否限次(1限购 2不限)',
  `same_device_limited_number` int(8) DEFAULT '10' COMMENT '同设备限购次数',
  `same_user_limited` tinyint(1) DEFAULT '2' COMMENT '同用户是否限次(1限购 2不限)',
  `same_user_limited_number` int(8) DEFAULT '10' COMMENT '同用户限购次数',
  `settlement_basis_id` tinyint(1) DEFAULT NULL COMMENT '结算依据   1自拟价，2原价',
  `sequence_number` bigint(20) DEFAULT NULL COMMENT '展示顺序',
  `orginal_price` decimal(12,2) DEFAULT NULL COMMENT '原始价格',
  `viral_card_id` bigint(20) DEFAULT NULL COMMENT '虚拟卡id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分商城商品表';

-- ----------------------------
-- Records of t_integral_mall_goods
-- ----------------------------

-- ----------------------------
-- Table structure for t_integral_order
-- ----------------------------
DROP TABLE IF EXISTS `t_integral_order`;
CREATE TABLE `t_integral_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `integral_order_id` varchar(64) DEFAULT NULL COMMENT '业务订单号',
  `business_order_id` varchar(32) DEFAULT NULL COMMENT '业务子订单号',
  `client_id` bigint(20) DEFAULT NULL COMMENT '生成订单的客户端id',
  `integral_strategy_name` varchar(32) DEFAULT NULL COMMENT '积分策略名称',
  `order_type` tinyint(4) DEFAULT NULL COMMENT '订单类型也叫策略类型-1-消费类型、2退款类型、3过期类型',
  `integral_type` tinyint(4) DEFAULT NULL COMMENT '积分类型--1发放、2扣除、3现金抵扣',
  `integral_num` int(8) DEFAULT NULL COMMENT '商品对应的积分',
  `integral_for_yuan` int(8) DEFAULT NULL COMMENT '积分对应的金额',
  `integral_source` varchar(32) DEFAULT '1' COMMENT '积分来源--商户名(1家视天下)',
  `business_id` bigint(20) DEFAULT NULL COMMENT '业务系统id',
  `integral_exchange` int(8) DEFAULT NULL COMMENT '当时积分兑换汇率(积分)',
  `integral_exchange_cash` decimal(12,2) DEFAULT NULL COMMENT '积分兑换金额',
  `integral_release_time` datetime DEFAULT NULL COMMENT '积分发放时间',
  `goods_order_id` varchar(32) DEFAULT NULL COMMENT '商品订单号',
  `price` decimal(20,0) DEFAULT NULL COMMENT '商品价格(分)',
  `is_successed` tinyint(4) DEFAULT NULL COMMENT '发放或者扣除积分标识（0未成功，1成功）',
  `integral_failure_time` datetime DEFAULT NULL COMMENT '积分失效时间',
  `if_integral_failure` tinyint(4) DEFAULT NULL COMMENT '积分是否失效0失效，1未失效',
  `if_release` tinyint(4) DEFAULT NULL COMMENT '积分是否发放，2剩余 1使用，0未使用',
  `integral_strategy_id` bigint(20) DEFAULT NULL COMMENT '积分策略id',
  `union_id` bigint(20) DEFAULT NULL COMMENT '新用户唯一id',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `year` year(4) DEFAULT NULL COMMENT '积分可用年度',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `used_integral` int(255) DEFAULT NULL COMMENT '已使用积分',
  `original_id` bigint(11) DEFAULT NULL COMMENT '原始主键id 退单过期时使用',
  `append_json` varchar(2000) DEFAULT '' COMMENT '支付回调，追加其他信息json串',
  `product_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_cover_url` varchar(255) DEFAULT NULL COMMENT '封面图片url',
  `deductible_integral` int(5) DEFAULT '0' COMMENT '这个字段表示实时这笔订单退还的积分多余用户的积分数',
  PRIMARY KEY (`id`),
  KEY `ind_union_id` (`union_id`),
  KEY `ind_integral_failure_time` (`integral_failure_time`),
  KEY `ind_id_create_time` (`id`,`create_time`),
  KEY `ind_union_id_failuretime` (`union_id`,`integral_failure_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购买商品后的积分订单流水表';

-- ----------------------------
-- Records of t_integral_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_integral_strategy
-- ----------------------------
DROP TABLE IF EXISTS `t_integral_strategy`;
CREATE TABLE `t_integral_strategy` (
  `strategy_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '策略主键id',
  `strategy_name` varchar(32) NOT NULL COMMENT '策略名称',
  `strategy_rule_yuan` decimal(12,2) DEFAULT NULL COMMENT '积分规则金额单位分',
  `strategy_rule_integrals` int(8) DEFAULT NULL COMMENT '策略规则积分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `business_id` varchar(20) DEFAULT NULL COMMENT '积分策略对应的业务（可以有多个）',
  `client_id` bigint(20) DEFAULT NULL COMMENT '客户端id:1.盒子端;2.移动端;3.PC端',
  `if_effective` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效（1表示有效，0表示无效）',
  `strategy_code` varchar(32) DEFAULT NULL COMMENT '策略code',
  `delete_status` tinyint(2) DEFAULT '0' COMMENT '删除状态 -1为删除，0为不删除，默认为0',
  PRIMARY KEY (`strategy_id`),
  KEY `grp_business_id_client_id` (`business_id`,`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分策略表';

-- ----------------------------
-- Records of t_integral_strategy
-- ----------------------------

-- ----------------------------
-- Table structure for t_message_template
-- ----------------------------
DROP TABLE IF EXISTS `t_message_template`;
CREATE TABLE `t_message_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `message` varchar(255) NOT NULL COMMENT '运营名称',
  `default_message` varchar(255) DEFAULT NULL COMMENT '运营类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（0下线，1上线）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='短息模板表';

-- ----------------------------
-- Records of t_message_template
-- ----------------------------
INSERT INTO `t_message_template` VALUES ('18', '恭喜老板喜提[商品名称]，您的[卡类型]兑换码为[兑换码]，请到[领取地址]领取。', '恭喜您已经获得[商品名称]，您的[卡类型]为[兑换码]，请到[领取地址]领取.滴滴滴滴滴滴滴', '2017-11-08 15:02:32', '2018-07-27 15:47:55', '0');

-- ----------------------------
-- Table structure for t_navigation_bar
-- ----------------------------
DROP TABLE IF EXISTS `t_navigation_bar`;
CREATE TABLE `t_navigation_bar` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bar_name` varchar(255) DEFAULT NULL COMMENT '导航栏名字选项',
  `bar_type` int(4) DEFAULT NULL COMMENT '导航按钮对应的类型(1首页,2积分专区,3跨界权益,4,会员沙龙)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(4) DEFAULT '0' COMMENT '状态0启用,1不启用',
  `sequence` int(4) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='客户端导航栏表';

-- ----------------------------
-- Records of t_navigation_bar
-- ----------------------------
INSERT INTO `t_navigation_bar` VALUES ('1', '首页', '1', '2018-04-03 10:52:19', '2018-04-03 10:52:19', '0', '1');
INSERT INTO `t_navigation_bar` VALUES ('2', '积分专区', '2', '2018-04-03 10:52:21', '2018-04-03 10:52:21', '0', '2');
INSERT INTO `t_navigation_bar` VALUES ('3', '跨界权益', '3', '2018-04-03 10:52:22', '2018-04-03 10:52:22', '0', '3');
INSERT INTO `t_navigation_bar` VALUES ('4', '会员沙龙', '4', '2018-04-03 10:52:36', '2018-04-03 10:52:36', '0', '4');

-- ----------------------------
-- Table structure for t_old_user_ref
-- ----------------------------
DROP TABLE IF EXISTS `t_old_user_ref`;
CREATE TABLE `t_old_user_ref` (
  `union_id` bigint(20) DEFAULT NULL COMMENT '新用户唯一id',
  `old_user_id` bigint(20) DEFAULT NULL COMMENT '老用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='老用户关联表(暂时没用)';

-- ----------------------------
-- Records of t_old_user_ref
-- ----------------------------

-- ----------------------------
-- Table structure for t_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_operation`;
CREATE TABLE `t_operation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `operate_name` varchar(32) NOT NULL COMMENT '运营名称',
  `operate_type` tinyint(2) DEFAULT NULL COMMENT '运营类型  1.轮播图',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态（0下线，1上线）',
  `sequence` tinyint(2) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图表';

-- ----------------------------
-- Records of t_operation
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_number` varchar(32) DEFAULT NULL COMMENT '订单id',
  `transaction_number` varchar(32) DEFAULT NULL COMMENT '交易号 支付中心生成',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `mac` varchar(64) DEFAULT NULL COMMENT '用户的mac地址',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '手机号',
  `address` varchar(64) DEFAULT NULL COMMENT '收货地址',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `goods_count` int(8) DEFAULT NULL COMMENT '商品数量',
  `freight` decimal(12,2) DEFAULT NULL,
  `cash` decimal(12,2) DEFAULT NULL COMMENT '现金（单位分）',
  `integral` int(8) DEFAULT NULL COMMENT '积分',
  `settlement_price` decimal(12,2) DEFAULT NULL COMMENT '结算价格',
  `exchange_rate` int(8) DEFAULT NULL,
  `pay_type` varchar(32) DEFAULT NULL COMMENT '结算方式',
  `invoice_or_not` tinyint(1) DEFAULT NULL COMMENT '是否开具发票(0否，1是)',
  `merchant_id` varchar(32) DEFAULT NULL COMMENT '商户id',
  `merchant_name` varchar(32) DEFAULT NULL COMMENT '商户名称',
  `pay_time` varchar(64) DEFAULT NULL COMMENT '支付时间',
  `order_create_time` datetime DEFAULT NULL COMMENT '订单生成时间',
  `expire` datetime DEFAULT NULL COMMENT '订单过期时间',
  `lock_expire` datetime DEFAULT NULL COMMENT '订单锁定过期时间',
  `complete_date` datetime DEFAULT NULL COMMENT '订单完成日期',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `order_status` int(1) DEFAULT NULL COMMENT '订单状态（0未支付，1代发货，2待收货，3交易成功，4退款中，5已退款，6交易关闭，退款超时，7交易关闭，交易成功 8交易失败，支付超时）',
  `close_reason` varchar(128) DEFAULT NULL COMMENT '关闭原因',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  `business_id` bigint(20) DEFAULT NULL COMMENT '业务id',
  `pay_status` tinyint(2) DEFAULT NULL COMMENT '支付状态  2，已支付，1支付中',
  `create_time` date DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_true` int(2) DEFAULT NULL COMMENT '订单是否正确，0正确，1有误',
  `is_send_integral` tinyint(2) DEFAULT '0' COMMENT '是否发放了积分:0没有;1发放',
  `invoice_number` varchar(25) DEFAULT NULL COMMENT '发票业务编号',
  `strategy_id` bigint(20) DEFAULT '0' COMMENT '对应的积分策略类型id:默认为0没有积分策略',
  PRIMARY KEY (`id`),
  KEY `ind_order_number` (`order_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细表\r\n';

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_original_data
-- ----------------------------
DROP TABLE IF EXISTS `t_order_original_data`;
CREATE TABLE `t_order_original_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `original_json` varchar(255) DEFAULT NULL COMMENT '原始数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `integral_order_id` bigint(20) DEFAULT NULL COMMENT '积分订单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分订单原始业务请求数据表';

-- ----------------------------
-- Records of t_order_original_data
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_paycenter
-- ----------------------------
DROP TABLE IF EXISTS `t_order_paycenter`;
CREATE TABLE `t_order_paycenter` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `balance_amount` decimal(10,0) DEFAULT NULL,
  `bundle_id` varchar(255) DEFAULT NULL,
  `cash_amount` decimal(10,0) DEFAULT NULL,
  `client_ip` varchar(255) DEFAULT NULL,
  `coupon_amount` decimal(10,0) DEFAULT NULL,
  `coupon_type` int(4) DEFAULT NULL,
  `device_code` varchar(255) DEFAULT NULL,
  `device_mac` varchar(255) DEFAULT NULL,
  `device_sn` varchar(255) DEFAULT NULL,
  `goods_detail` mediumtext,
  `open_time` datetime DEFAULT NULL,
  `out_trade_no` varchar(255) DEFAULT NULL,
  `partner_id` varchar(255) DEFAULT NULL,
  `partner_name` varchar(255) DEFAULT NULL,
  `payment_channel` tinyint(4) DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL,
  `product_duration` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `third_trade_no` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `trade_no` varchar(255) DEFAULT NULL,
  `trade_status` varchar(255) DEFAULT NULL,
  `trade_type` varchar(255) DEFAULT NULL,
  `user_uuid` int(11) DEFAULT NULL,
  `is_send` tinyint(255) DEFAULT NULL COMMENT '是否发放（0 未发放 1 发放）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付中心订单';

-- ----------------------------
-- Records of t_order_paycenter
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_payment
-- ----------------------------
DROP TABLE IF EXISTS `t_order_payment`;
CREATE TABLE `t_order_payment` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '订单支付记录表主键ID',
  `msg_id` varchar(255) DEFAULT NULL COMMENT '支付记录消息ID',
  `user_uuid` varchar(60) DEFAULT NULL COMMENT '大麦用户id',
  `device_sn` varchar(100) DEFAULT NULL COMMENT '大麦盒子sn',
  `device_mac` varchar(100) DEFAULT NULL COMMENT '大麦盒子MAC',
  `device_code` varchar(50) DEFAULT NULL COMMENT '大麦盒子设备代码',
  `bundle_id` varchar(100) DEFAULT NULL COMMENT 'apk包名',
  `client_ip` varchar(50) DEFAULT NULL COMMENT '请求ip',
  `payment_channel` int(6) DEFAULT NULL COMMENT '支付渠道：3-支付宝，4-微信支付，7-京东钱包',
  `third_trade_no` varchar(50) DEFAULT NULL COMMENT '第三方订单号',
  `payment_time` datetime DEFAULT NULL COMMENT '用户付款时间',
  `total_amount` decimal(21,2) DEFAULT NULL COMMENT '订单总金额，单位为人民币分',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '商城系统生成的订单号，商城系统全局唯一',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '大麦支付系统生成的订单号，大麦支付全局唯一',
  `trade_status` int(6) DEFAULT NULL COMMENT '交易状态，2-支付成功，目前仅支付成功会发送消息',
  `partner_id` varchar(100) DEFAULT NULL COMMENT '大麦商户平台商户唯一编号',
  PRIMARY KEY (`id`),
  KEY `ind_out_trade_no` (`out_trade_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='scrm(本系统的支付)交易回调成功记录';

-- ----------------------------
-- Records of t_order_payment
-- ----------------------------

-- ----------------------------
-- Table structure for t_refund
-- ----------------------------
DROP TABLE IF EXISTS `t_refund`;
CREATE TABLE `t_refund` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '商城订单退款表主键ID',
  `sn` varchar(50) NOT NULL COMMENT '商城订单退款售后单号',
  `userid` int(11) NOT NULL COMMENT '订单售后退款用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '商城订单退款创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '商城订单退款更新时间',
  `version` bigint(20) DEFAULT NULL COMMENT '商城订单退款版本',
  `account` varchar(255) DEFAULT NULL COMMENT '商城订单退款账号',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '商城订单退款总金额',
  `integrals` int(8) DEFAULT NULL COMMENT '需要退还积分',
  `actual_amount` decimal(21,2) DEFAULT NULL COMMENT '实际退款',
  `actual_integrals` int(8) DEFAULT NULL COMMENT '实际退还积分',
  `reason` varchar(255) DEFAULT NULL COMMENT '商城订单退款原因',
  `operator` varchar(255) DEFAULT NULL COMMENT '商城订单退款操作者',
  `creator` varchar(255) DEFAULT NULL COMMENT '商城订单退款创建者',
  `quantity` int(11) DEFAULT NULL COMMENT '订单售后退款数量',
  `payee` varchar(255) DEFAULT NULL COMMENT '商城订单退款收款人',
  `payment_method` varchar(255) DEFAULT NULL COMMENT '商城订单退款支付方式',
  `order_sn` varchar(50) NOT NULL COMMENT '商城订单退款订单ID',
  `address` varchar(1000) DEFAULT NULL COMMENT '退款联系地址',
  `consignee` varchar(255) DEFAULT NULL COMMENT '退款联系收件人',
  `phone` varchar(100) DEFAULT NULL COMMENT '退款联系电话',
  `status` int(6) DEFAULT NULL COMMENT '退款状态(处理中/已退款)',
  `type` int(6) DEFAULT NULL COMMENT '订单售后退款类型(1整单 2SKU单件)',
  `tracking_no` varchar(255) DEFAULT NULL COMMENT '退款物流运单号',
  `delivery_corp` varchar(100) DEFAULT NULL COMMENT '退款物流公司名称',
  `delivery_code` varchar(100) DEFAULT NULL COMMENT '退款物流公司代码',
  `service_type` int(6) DEFAULT NULL COMMENT '售后类型(退/换)',
  `seller_id` varchar(30) DEFAULT NULL COMMENT '商户ID',
  `freight` decimal(21,2) DEFAULT NULL COMMENT '运费',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_sn` (`sn`) USING BTREE,
  KEY `ind_order_sn` (`order_sn`) USING BTREE,
  KEY `ind_userid` (`userid`) USING BTREE,
  KEY `ind_sellerid` (`seller_id`) USING BTREE,
  KEY `ind_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='scrm退款表';

-- ----------------------------
-- Records of t_refund
-- ----------------------------

-- ----------------------------
-- Table structure for t_refund_item
-- ----------------------------
DROP TABLE IF EXISTS `t_refund_item`;
CREATE TABLE `t_refund_item` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '退款子表ID',
  `create_time` datetime NOT NULL COMMENT '退款子表创建时间',
  `update_time` datetime NOT NULL COMMENT '退款子表更新时间',
  `version` bigint(20) DEFAULT NULL COMMENT '退款子表版本',
  `refund_sn` varchar(50) NOT NULL COMMENT '退款子表父编号',
  `specifications` varchar(300) DEFAULT NULL COMMENT '退款子表规格信息',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '退款子表方图',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '退款子表商品名',
  `goods_title` varchar(255) DEFAULT NULL COMMENT '退款子表单项商品标题',
  `quantity` int(11) DEFAULT NULL COMMENT '退款子表单项数量',
  `price` decimal(21,2) DEFAULT NULL COMMENT '退款子表单项价格',
  `goods_sku_sn` varchar(50) DEFAULT NULL COMMENT '退款子表单项SKU编号',
  `goods_sn` varchar(100) DEFAULT NULL COMMENT '商品SPU编号',
  `seller_id` varchar(30) DEFAULT NULL COMMENT '退款子表单项商户ID',
  `seller_name` varchar(64) DEFAULT NULL COMMENT '退款子表单项商户名称',
  `seller_phone` varchar(64) DEFAULT NULL COMMENT '退款子表单项商户电话',
  `freight` decimal(21,2) DEFAULT NULL COMMENT '运费',
  PRIMARY KEY (`id`),
  KEY `ind_refund_sn` (`refund_sn`) USING BTREE,
  KEY `ind_goods_sku_sn` (`goods_sku_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='scrm退款明细';

-- ----------------------------
-- Records of t_refund_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_refund_shipping
-- ----------------------------
DROP TABLE IF EXISTS `t_refund_shipping`;
CREATE TABLE `t_refund_shipping` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '商城售后发货单主键ID',
  `sn` varchar(50) NOT NULL COMMENT '商城售后发货单编号',
  `create_time` datetime NOT NULL COMMENT '商城售后发货单创建时间',
  `update_time` datetime NOT NULL COMMENT '商城售后发货单更新时间',
  `version` bigint(20) DEFAULT NULL COMMENT '商城售后发货单版本',
  `userid` int(11) NOT NULL COMMENT '商城售后发货单用户ID',
  `address` varchar(1000) DEFAULT NULL COMMENT '商城售后发货单地址',
  `consignee` varchar(255) DEFAULT NULL COMMENT '商城售后发货单收件人',
  `phone` varchar(50) DEFAULT NULL COMMENT '商城售后发货单手机号',
  `order_sn` varchar(50) NOT NULL COMMENT '商城售后发货单订单号',
  `amount` decimal(21,2) DEFAULT NULL COMMENT '商城售后发货单订单金额',
  `tracking_no` varchar(100) DEFAULT NULL COMMENT '商城售后发货单运单号',
  `delivery_corp` varchar(100) DEFAULT NULL COMMENT '商城售后发货单快递公司名称',
  `delivery_code` varchar(100) DEFAULT NULL COMMENT '商城售后发货单快递公司代码',
  `freight` decimal(21,2) DEFAULT NULL COMMENT '商城售后发货单物流费用',
  `creator` varchar(200) DEFAULT NULL COMMENT '商城售后发货单创建者',
  `operator` varchar(200) DEFAULT NULL COMMENT '商城售后发货单操作者',
  `status` tinyint(4) DEFAULT NULL COMMENT '售后发货单状态(1待发货 2已发化(待收货))',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_sn` (`sn`) USING BTREE,
  KEY `ind_userid` (`userid`) USING BTREE,
  KEY `ind_order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退款物流表';

-- ----------------------------
-- Records of t_refund_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for t_refund_shipping_item
-- ----------------------------
DROP TABLE IF EXISTS `t_refund_shipping_item`;
CREATE TABLE `t_refund_shipping_item` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '商城商品售后发货项主键ID',
  `create_time` datetime NOT NULL COMMENT '售后发货单子项创建时间',
  `update_time` datetime NOT NULL COMMENT '售后发货单子项更新时间',
  `shipping_sn` varchar(50) DEFAULT NULL COMMENT '售后发货单子项编号',
  `version` bigint(20) DEFAULT NULL COMMENT '售后发货单子项版本',
  `specifications` varchar(300) DEFAULT NULL COMMENT '售后发货单子项规格',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '售后发货单子项商品名',
  `goods_sku_sn` varchar(100) DEFAULT NULL COMMENT '售后发货单子项商品SKU编号',
  `goods_sn` varchar(100) DEFAULT NULL COMMENT '售后发货单子项商品SPU编号',
  `quantity` int(11) NOT NULL COMMENT '售后发货单子项数量',
  `price` decimal(21,2) DEFAULT NULL COMMENT '售后发货单子项价格',
  `seller_id` varchar(64) DEFAULT NULL COMMENT '售后发货单子项商户ID',
  `seller_name` varchar(64) DEFAULT NULL COMMENT '售后发货单子项商户名称',
  `seller_phone` varchar(64) DEFAULT NULL COMMENT '售后发货单子项商户电话',
  PRIMARY KEY (`id`),
  KEY `ind_shipping_sn` (`shipping_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退款物流明细';

-- ----------------------------
-- Records of t_refund_shipping_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_shipping
-- ----------------------------
DROP TABLE IF EXISTS `t_shipping`;
CREATE TABLE `t_shipping` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '商城发货单主键ID',
  `sn` varchar(50) NOT NULL COMMENT '商城发货单编号',
  `create_time` datetime NOT NULL COMMENT '商城发货单创建时间',
  `update_time` datetime NOT NULL COMMENT '商城发货单更新时间',
  `version` bigint(20) DEFAULT NULL COMMENT '商城发货单版本',
  `userid` int(11) NOT NULL COMMENT '商城发货单用户ID',
  `address` varchar(1000) DEFAULT NULL COMMENT '商城发货单地址',
  `consignee` varchar(255) DEFAULT NULL COMMENT '商城发货单收货人',
  `phone` varchar(255) DEFAULT NULL COMMENT '商城发货单手机号',
  `order_sn` varchar(50) NOT NULL COMMENT '商城发货单对应订单编号',
  `amount` decimal(21,2) DEFAULT NULL COMMENT '商城发货单订单金额',
  `tracking_no` varchar(255) DEFAULT NULL COMMENT '商城发货单运单号',
  `delivery_corp` varchar(100) DEFAULT NULL COMMENT '商城发货单快递公司名称',
  `delivery_code` varchar(100) DEFAULT NULL COMMENT '商城发货单快递公司代码',
  `freight` decimal(21,2) DEFAULT NULL COMMENT '商城发货单物流费用',
  `creator` varchar(255) NOT NULL COMMENT '商城发货单创建者',
  `operator` varchar(255) NOT NULL COMMENT '商城发货单操作者',
  `status` int(6) DEFAULT NULL COMMENT '发货单状态(1待发货 2已发化(待收货))',
  `is_refund` int(6) DEFAULT NULL COMMENT '是否退款',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_sn` (`sn`) USING BTREE,
  KEY `ind_order_sn` (`order_sn`) USING BTREE,
  KEY `ind_userid` (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='scrm发货单';

-- ----------------------------
-- Records of t_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for t_shipping_item
-- ----------------------------
DROP TABLE IF EXISTS `t_shipping_item`;
CREATE TABLE `t_shipping_item` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '商城商品发货项主键ID',
  `create_time` datetime NOT NULL COMMENT '商城商品发货项创建时间',
  `update_time` datetime NOT NULL COMMENT '商城商品发货项更新时间',
  `shipping_sn` varchar(50) DEFAULT NULL COMMENT '商城商品发货你父编号',
  `version` bigint(20) DEFAULT NULL COMMENT '商城商品发货项版本',
  `specifications` varchar(300) DEFAULT NULL COMMENT '商城商品发货项规格',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商城商品发货项商品名',
  `goods_sku_sn` varchar(255) DEFAULT NULL COMMENT '商城商品发货项商品编号',
  `goods_sn` varchar(100) DEFAULT NULL COMMENT '商品SPU编号',
  `quantity` int(11) DEFAULT NULL COMMENT '商城商品发货项数量',
  `price` decimal(21,2) DEFAULT NULL COMMENT '商城商品发货项单项价格',
  `integrals` decimal(21,2) DEFAULT NULL,
  `seller_id` varchar(64) DEFAULT NULL COMMENT '商城商品发货项商户ID',
  `seller_name` varchar(64) DEFAULT NULL COMMENT '商城商品发货项商户名称',
  `seller_phone` varchar(64) DEFAULT NULL COMMENT '商城商品发货项商户电话号码',
  PRIMARY KEY (`id`),
  KEY `ind_shipping_sn` (`shipping_sn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='scrm发货项';

-- ----------------------------
-- Records of t_shipping_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_sms_send
-- ----------------------------
DROP TABLE IF EXISTS `t_sms_send`;
CREATE TABLE `t_sms_send` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_sn` varchar(50) NOT NULL COMMENT '订单编号',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_phone` varchar(20) DEFAULT NULL COMMENT '接收人电话',
  `send_message` varchar(255) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL COMMENT '短信的状态,0未发,1发送',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发送短信记录表';

-- ----------------------------
-- Records of t_sms_send
-- ----------------------------

-- ----------------------------
-- Table structure for t_strategy_business
-- ----------------------------
DROP TABLE IF EXISTS `t_strategy_business`;
CREATE TABLE `t_strategy_business` (
  `business_id` bigint(20) NOT NULL COMMENT '业务id',
  `business_name` varchar(32) DEFAULT NULL COMMENT '业务名称',
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分策略对应的业务表\r\n主要提供基础数据\r\n';

-- ----------------------------
-- Records of t_strategy_business
-- ----------------------------
INSERT INTO `t_strategy_business` VALUES ('1', '充值');
INSERT INTO `t_strategy_business` VALUES ('2', '积分商城');
INSERT INTO `t_strategy_business` VALUES ('3', '商品包');
INSERT INTO `t_strategy_business` VALUES ('4', '大麦优购');

-- ----------------------------
-- Table structure for t_strategy_client
-- ----------------------------
DROP TABLE IF EXISTS `t_strategy_client`;
CREATE TABLE `t_strategy_client` (
  `client_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='积分策略对应的客户端\r\n主要提供数据';

-- ----------------------------
-- Records of t_strategy_client
-- ----------------------------
INSERT INTO `t_strategy_client` VALUES ('1', '盒子端');
INSERT INTO `t_strategy_client` VALUES ('2', '移动端');
INSERT INTO `t_strategy_client` VALUES ('3', 'PC端');

-- ----------------------------
-- Table structure for t_thrid_party
-- ----------------------------
DROP TABLE IF EXISTS `t_thrid_party`;
CREATE TABLE `t_thrid_party` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `soruce_type` tinyint(2) DEFAULT NULL COMMENT '来源',
  `union_id` bigint(20) DEFAULT NULL COMMENT '新用户id',
  `third_id` varchar(32) DEFAULT NULL COMMENT '第三方id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方表';

-- ----------------------------
-- Records of t_thrid_party
-- ----------------------------

-- ----------------------------
-- Table structure for t_union_user
-- ----------------------------
DROP TABLE IF EXISTS `t_union_user`;
CREATE TABLE `t_union_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `union_id` bigint(20) DEFAULT NULL COMMENT '新用户唯一id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '用户状态0无效1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新用户唯一标识表';

-- ----------------------------
-- Records of t_union_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_integrals
-- ----------------------------
DROP TABLE IF EXISTS `t_user_integrals`;
CREATE TABLE `t_user_integrals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `union_id` bigint(20) NOT NULL COMMENT '新用户唯一id',
  `total_integrals` int(8) DEFAULT '0' COMMENT '总积分',
  `lock_integrals` int(8) DEFAULT '0' COMMENT '锁定积分',
  `if_effective` tinyint(1) DEFAULT NULL COMMENT '积分状态（1表示可用，0表示封存）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_total_integrals` int(8) DEFAULT NULL COMMENT '可用积分',
  `expire_integrals` int(8) DEFAULT '0' COMMENT '过期积分',
  `used_integrals` int(8) DEFAULT '0' COMMENT '已经使用积分',
  `last_used_integral` int(8) DEFAULT NULL COMMENT '上次使用积分数',
  `due_integrals` int(8) DEFAULT '0' COMMENT '即将过期积分',
  `due_date` datetime DEFAULT NULL COMMENT '即将过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分表';

-- ----------------------------
-- Records of t_user_integrals
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_invoice
-- ----------------------------
DROP TABLE IF EXISTS `t_user_invoice`;
CREATE TABLE `t_user_invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `company_name` varchar(30) DEFAULT NULL COMMENT '单位名称',
  `invoice_content` varchar(100) DEFAULT NULL COMMENT '发票内容',
  `invoice_type` int(1) DEFAULT NULL COMMENT '发票类型',
  `taxpayer_code` varchar(20) NOT NULL COMMENT '纳税人编码',
  `order_id` varchar(20) NOT NULL COMMENT '订单编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `invoice_number` varchar(30) NOT NULL COMMENT '发票的业务编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `agd` (`user_id`,`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户发票记录表';

-- ----------------------------
-- Records of t_user_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_mac
-- ----------------------------
DROP TABLE IF EXISTS `t_user_mac`;
CREATE TABLE `t_user_mac` (
  `union_id` bigint(20) DEFAULT NULL COMMENT '新用户唯一id',
  `mac` varchar(32) DEFAULT NULL COMMENT '盒子mac',
  `sn` varchar(32) DEFAULT NULL COMMENT '盒子sn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新用户关联mac信息表';

-- ----------------------------
-- Records of t_user_mac
-- ----------------------------
INSERT INTO `t_user_mac` VALUES ('1000138843458', '143DF2F1CF9B', 'DMD3310G170705993');

-- ----------------------------
-- Table structure for t_user_phone
-- ----------------------------
DROP TABLE IF EXISTS `t_user_phone`;
CREATE TABLE `t_user_phone` (
  `union_id` bigint(20) DEFAULT NULL COMMENT '新用户唯一id',
  `telephone` varchar(32) DEFAULT NULL COMMENT '手机号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新\r\n用户手机关联表';

-- ----------------------------
-- Records of t_user_phone
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_union
-- ----------------------------
DROP TABLE IF EXISTS `t_user_union`;
CREATE TABLE `t_user_union` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL COMMENT 'scrm用户id',
  `union_id` bigint(20) DEFAULT NULL COMMENT '盒子unionId',
  `phone` varchar(255) DEFAULT NULL,
  `is_effective` tinyint(255) DEFAULT NULL COMMENT '是否有效（0 fase 1 true）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新的用户id和旧的用户id关联表';

-- ----------------------------
-- Records of t_user_union
-- ----------------------------

-- ----------------------------
-- Table structure for t_vip_order_details
-- ----------------------------
DROP TABLE IF EXISTS `t_vip_order_details`;
CREATE TABLE `t_vip_order_details` (
  `device_mac` varchar(25) DEFAULT NULL COMMENT '设备mac',
  `device_sn` varchar(25) DEFAULT NULL COMMENT '设备sn',
  `device_code` varchar(25) DEFAULT NULL COMMENT '设备code码',
  `user_uuid` varchar(20) NOT NULL COMMENT '用户id',
  `client_ip` varchar(20) DEFAULT NULL COMMENT '客户端ip',
  `region_name` varchar(25) DEFAULT NULL COMMENT '地区名称',
  `branch_id` varchar(30) DEFAULT NULL COMMENT '分公司id',
  `branch_name` varchar(50) DEFAULT NULL COMMENT '分公司名称',
  `partner_id` varchar(30) NOT NULL COMMENT '商户id',
  `partner_name` varchar(30) DEFAULT NULL COMMENT '商户名称',
  `product_name` varchar(20) NOT NULL COMMENT '产品名称',
  `product_duration` varchar(20) DEFAULT NULL COMMENT '产品时长',
  `product_type` varchar(10) NOT NULL COMMENT '产品类型 2006：极清 2009：VIP 21693：商品包 1003：应用',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '商户订单号',
  `trade_no` varchar(50) NOT NULL COMMENT '订单号',
  `total_amount` int(10) NOT NULL COMMENT '订单金额 ',
  `trade_status` varchar(20) NOT NULL COMMENT '订单状态 2.已支付 4.已退款',
  `balance_amount` int(5) DEFAULT NULL COMMENT '支付麦币',
  `cash_amount` double(10,0) DEFAULT NULL COMMENT '支付现金',
  `fee_ratio` varchar(20) DEFAULT NULL COMMENT '费率',
  `payment_channel` varchar(10) NOT NULL COMMENT '支付渠道  1.麦币余额 3.支付宝 4.微信 7.京东钱包 8.宽带支付 11.兴业银行',
  `payment_way` varchar(10) NOT NULL COMMENT '支付方式 1.麦币余额 3.支付宝 4.微信 7.京东钱包 8.宽带支付 11.兴业银行',
  `payment_time` datetime NOT NULL COMMENT '支付时间',
  `third_trade_no` varchar(50) NOT NULL COMMENT '支付流水订单号',
  `open_time` datetime DEFAULT NULL COMMENT '开通时间',
  `is_refund` varchar(5) DEFAULT '0' COMMENT '是否申请退款0 没有 1已申请',
  UNIQUE KEY `only_key` (`trade_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='针对财务模块类型2006,2009特殊订单表';

-- ----------------------------
-- Records of t_vip_order_details
-- ----------------------------

-- ----------------------------
-- Table structure for t_vip_refund_detailly
-- ----------------------------
DROP TABLE IF EXISTS `t_vip_refund_detailly`;
CREATE TABLE `t_vip_refund_detailly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(20) DEFAULT NULL COMMENT '用户id',
  `partner_id` varchar(30) NOT NULL COMMENT '商户id',
  `product_name` varchar(50) NOT NULL COMMENT '产品名称',
  `product_type` varchar(10) NOT NULL COMMENT '产品类型 2006：极清 2009：VIP 21693：商品包 1003：应用',
  `trade_no` varchar(50) NOT NULL COMMENT '订单号',
  `total_amount` int(10) NOT NULL COMMENT '订单金额',
  `refund_no` varchar(50) DEFAULT NULL COMMENT '退款单号',
  `refund_reason` varchar(255) NOT NULL COMMENT '退款原因描述',
  `allow_refund_amount` varchar(10) NOT NULL COMMENT '可退金额',
  `actual_refund_amount` varchar(10) NOT NULL COMMENT '实退金额',
  `refund_way` varchar(10) NOT NULL COMMENT '退款方式(支付宝、微信..)',
  `refund_account` varchar(30) NOT NULL COMMENT '退款对应账户',
  `attachment_url` varchar(255) DEFAULT NULL COMMENT '退款附件地址',
  `refund_status` varchar(10) NOT NULL COMMENT '退款状态；2.已提交 3.已撤销 4.已全部退款 5.部分退款 ',
  `refund_operator` varchar(30) NOT NULL COMMENT '退款操作人员',
  `summit_time` datetime NOT NULL COMMENT '提交时间',
  `complete_time` datetime NOT NULL COMMENT '撤销/退款时间',
  `is_synchronization` varchar(5) NOT NULL DEFAULT '0' COMMENT '0表示为同步财务中心，1表示同步',
  `deduction_integral` int(5) NOT NULL DEFAULT '0',
  `is_callback` varchar(5) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '0 没有进行回调 1已经回调',
  `discount_money` varchar(10) NOT NULL COMMENT '积分抵扣金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='针对财务模块类型2006,2009特殊退款订单表';

-- ----------------------------
-- Records of t_vip_refund_detailly
-- ----------------------------

-- ----------------------------
-- Table structure for t_virtual_card
-- ----------------------------
DROP TABLE IF EXISTS `t_virtual_card`;
CREATE TABLE `t_virtual_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `virtual_card_name` varchar(32) DEFAULT NULL COMMENT '虚拟卡名称',
  `virtual_card_type` tinyint(2) DEFAULT NULL COMMENT '虚拟卡类型（1提货卡，2激活卡，3激活码，4储值卡，5礼品卡）',
  `pro_name` varchar(8) DEFAULT NULL COMMENT '限制使用省',
  `city_name` varchar(8) DEFAULT NULL COMMENT '限制使用市',
  `cover_url` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `receive_place` varchar(128) DEFAULT NULL COMMENT '虚拟卡的领取地址',
  `stock_number` int(8) DEFAULT NULL COMMENT '库存数量(当前实际可用的库存状态为2的)',
  `expiration_date` datetime DEFAULT NULL COMMENT '有效期',
  `is_forever` tinyint(1) DEFAULT NULL COMMENT '是否永久(1.是;0不是)',
  `price` decimal(12,2) DEFAULT NULL COMMENT '售价（单位分）',
  `freight_price` bigint(20) DEFAULT NULL COMMENT '运费价格（单位分）',
  `settlement_type` tinyint(1) DEFAULT NULL COMMENT '结算方式（1售价结算，2自拟价结算）',
  `is_expire` tinyint(1) DEFAULT NULL COMMENT '是否过期（-1被删除,0未过期，1过期）',
  `is_remove_stock` tinyint(1) DEFAULT NULL COMMENT '是否已经消除库存(0未消除，1已经消除)',
  `exchange_date` datetime DEFAULT NULL COMMENT '兑换日期',
  `enable_sms` tinyint(1) DEFAULT NULL COMMENT '短信模板是否启用(0不启用，1启用)',
  `sms_content` varchar(128) DEFAULT NULL COMMENT '短信内容',
  `merchant_id` varchar(32) DEFAULT NULL COMMENT '商户id',
  `merchant_name` varchar(64) DEFAULT NULL COMMENT '商户名称',
  `card_from` tinyint(1) DEFAULT NULL COMMENT '来源方式（1代表外部商户，2代表自有业务，3代表合并业务）',
  `total_price` decimal(12,0) DEFAULT NULL COMMENT '结算价（单位分）',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_merchant_id` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟商品对应的虚拟卡表';

-- ----------------------------
-- Records of t_virtual_card
-- ----------------------------

-- ----------------------------
-- Table structure for t_virtual_card_stock
-- ----------------------------
DROP TABLE IF EXISTS `t_virtual_card_stock`;
CREATE TABLE `t_virtual_card_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `redeem_code_id` varchar(32) DEFAULT NULL COMMENT '兑换码id',
  `redeem_code_name` varchar(32) DEFAULT NULL COMMENT '兑换码名称',
  `use_status` tinyint(2) DEFAULT NULL COMMENT '兑换码使用状态（1未使用，2已使用）',
  `redeem_code_status` tinyint(4) DEFAULT NULL COMMENT '兑换码状态（-1删除,0,出库,1占用，2有效，3无效,4兑换未销库,5,兑换且销库,)',
  `expire_date` datetime DEFAULT NULL COMMENT '兑换码有效期',
  `flow_to` varchar(16) DEFAULT NULL COMMENT '流向(0表示未流向别的地方,1表示流向积分商城,2,表示流向抽奖)',
  `virtual_card_id` bigint(20) DEFAULT NULL COMMENT '虚拟卡id',
  `order_detail_id` varchar(32) DEFAULT NULL COMMENT '该虚拟卡被哪个订单购买了(取订单表order_num)',
  `sell_id` bigint(11) DEFAULT NULL COMMENT '出售的id(如果拿到商城就是对应的商品id,如果是抽奖对应的是抽奖活动)',
  `telephone` varchar(13) DEFAULT NULL COMMENT '手机号',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_redeem_code_name` (`redeem_code_name`),
  KEY `ind_virtual_card_id` (`virtual_card_id`),
  KEY `ind_update_time` (`update_time`),
  KEY `ind_order_detail_id` (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟卡库存表';

-- ----------------------------
-- Records of t_virtual_card_stock
-- ----------------------------

-- ----------------------------
-- Procedure structure for delete_user_info
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_user_info`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `delete_user_info`()
begin 
DELETE FROM t_order_detail WHERE user_id = 2556548;

DELETE FROM t_integral_order WHERE union_id = 2556548;

DELETE FROM t_user_integrals WHERE union_id = 2556548;

DELETE FROM t_integral_log WHERE union_id = 2556548;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per10
-- ----------------------------
DROP PROCEDURE IF EXISTS `per10`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per10`()
BEGIN

DECLARE num INT;


SET num = 1200;


WHILE num < 1400 DO
	INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
		
		'测试商品规则3',
		'1',
		'测试商品规则3测试商品规则3',
		'http://pic1.sc.chinaz.com/Files/pic/pic9/201804/zzpic11253_s.jpg',
		'10.00',
		'20',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:23:50',
		'2018-04-13 10:23:50',
		'20.00',
		NULL,
		NULL,
		'1',
		'20',
		'2',
		NULL,
		'1',
		NULL,
		NULL,
		num,
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (

	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试商品规则1',
		'1',
		'测试商品规则1测试商品规则1',
		'',
		'20.00',
		'30',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:25:58',
		'2018-04-13 10:25:58',
		'50.00',
		NULL,
		NULL,
		'1',
		'40',
		'1',
		NULL,
		'2',
		NULL,
		NULL,
		num+1,
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (

	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试商品33333',
		'1',
		'测试商品33333',
		'',
		'40.00',
		'40',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:26:36',
		'2018-04-13 10:26:36',
		'30.00',
		NULL,
		NULL,
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'3',
		NULL,
		num+2,
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试3333333',
		'1',
		'测试3333333',
		'',
		NULL,
		'50',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:27:13',
		'2018-04-13 10:27:13',
		'20.00',
		NULL,
		NULL,
		'3',
		'500',
		'1',
		NULL,
		'2',
		NULL,
		NULL,
		num+3,
		NULL,
		NULL
	);
SET num = num + 1;
END WHILE;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per12
-- ----------------------------
DROP PROCEDURE IF EXISTS `per12`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per12`()
begin 
declare num int; 
set num=3000; 
while num < 3500 do 
 insert into t_goods_detail_map (`sequence`, create_time, 
      update_time, status, goods_id, 
      goods_detail_url, description)
    values ( num,'2018-04-10 11:46:03', '2018-04-10 11:46:03', '1', num, 'http://pic1.sc.chinaz.com/Files/pic/pic9/201804/zzpic11253_s.jpg', NULL); 
set num=num+1;
end while;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per13
-- ----------------------------
DROP PROCEDURE IF EXISTS `per13`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per13`()
BEGIN

DECLARE num INT;


SET num = 3000;


WHILE num < 3400 DO
	INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
		
		'测试商品规则3',
		'1',
		'测试商品规则3测试商品规则3',
		'http://pic1.sc.chinaz.com/Files/pic/pic9/201804/zzpic11253_s.jpg',
		'10.00',
		'20',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:23:50',
		'2018-04-13 10:23:50',
		'20.00',
		NULL,
		NULL,
		'1',
		'20',
		'2',
		NULL,
		'1',
		NULL,
		NULL,
		num,
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (

	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试商品规则1',
		'1',
		'测试商品规则1测试商品规则1',
		'',
		'20.00',
		'30',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:25:58',
		'2018-04-13 10:25:58',
		'50.00',
		NULL,
		NULL,
		'1',
		'40',
		'1',
		NULL,
		'2',
		NULL,
		NULL,
		num+1,
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (

	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试商品33333',
		'1',
		'测试商品33333',
		'',
		'40.00',
		'40',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:26:36',
		'2018-04-13 10:26:36',
		'30.00',
		NULL,
		NULL,
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'3',
		NULL,
		num+2,
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试3333333',
		'1',
		'测试3333333',
		'',
		NULL,
		'50',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:27:13',
		'2018-04-13 10:27:13',
		'20.00',
		NULL,
		NULL,
		'3',
		'500',
		'1',
		NULL,
		'2',
		NULL,
		NULL,
		num+3,
		NULL,
		NULL
	);
SET num = num + 1;
END WHILE;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per16
-- ----------------------------
DROP PROCEDURE IF EXISTS `per16`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per16`()
BEGIN

DECLARE num INT;


SET num = 3000;


WHILE num < 3400 DO
	INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
		
		'测试商品规则3',
		'1',
		'测试商品规则3测试商品规则3',
		'group1/M00/00/0D/cy9-YVsYoBeAaLXEAAARgLFgAGk543.jpg',
		'10.00',
		'20',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:23:50',
		'2018-04-13 10:23:50',
		'20.00',
		NULL,
		NULL,
		'1',
		'20',
		'2',
		NULL,
		'1',
		NULL,
		NULL,
		num,
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (

	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试商品规则1',
		'1',
		'测试商品规则1测试商品规则1',
		'',
		'20.00',
		'30',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:25:58',
		'2018-04-13 10:25:58',
		'50.00',
		NULL,
		NULL,
		'1',
		'40',
		'1',
		NULL,
		'2',
		NULL,
		NULL,
		num+1,
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (

	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试商品33333',
		'1',
		'测试商品33333',
		'',
		'40.00',
		'40',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:26:36',
		'2018-04-13 10:26:36',
		'30.00',
		NULL,
		NULL,
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'3',
		NULL,
		num+2,
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试3333333',
		'1',
		'测试3333333',
		'',
		NULL,
		'50',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:27:13',
		'2018-04-13 10:27:13',
		'20.00',
		NULL,
		NULL,
		'3',
		'500',
		'1',
		NULL,
		'2',
		NULL,
		NULL,
		num+3,
		NULL,
		NULL
	);
SET num = num + 1;
END WHILE;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per19
-- ----------------------------
DROP PROCEDURE IF EXISTS `per19`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per19`()
BEGIN

DECLARE num INT;


SET num = 3000;


WHILE num < 3400 DO
	INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
		`goods_name`,
		`goods_type`,
		`goods_subtitle`,
		`goods_cover_url`,
		`goods_price`,
		`goods_stock`,
		`goods_status`,
		`goods_audit_description`,
		`goods_shelf_time`,
		`create_time`,
		`update_time`,
		`freight`,
		`merchant_id`,
		`merchant_name`,
		`integral_rule_id`,
		`goods_exchange_integral`,
		`same_device_limited`,
		`same_device_limited_number`,
		`same_user_limited`,
		`same_user_limited_number`,
		`settlement_basis_id`,
		`sequence_number`,
		`orginal_price`,
		`viral_card_id`
	)
VALUES
	(
		'京天（KOTIN） 六核i7 8700GTX1060-----'+num,
		'1',
		'京天（KOTIN） 六核i7 8700GTX1060-----'+num,
		'group1/M00/00/0D/cy9-YVsYoBeAaLXEAAARgLFgAGk543.jpg',
		'1.00',
		'0',
		'4',
		'',
		'2018-06-07 11:06:31',
		'2018-06-07 11:02:35',
		'2018-06-07 11:06:31',
		'1.00',
		NULL,
		NULL,
		'2',
		'2',
		'2',
		NULL,
		'2',
		NULL,
		'2',
		'2',
		'6.00',
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
		'英特尔（Intel） i7 8700K -----'+num,
		'1',
		'英特尔（Intel） i7 8700K -----'+num,
		'group1/M00/00/0D/cy9-YVsYoryAdxiuAAASB6qmpW0396.jpg',
		NULL,
		'0',
		'4',
		'可以',
		'2018-06-13 15:47:41',
		'2018-06-07 11:13:00',
		'2018-06-14 10:34:34',
		'0.00',
		NULL,
		NULL,
		'1',
		'3',
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'3',
		'6.00',
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
		'当季新品 机械革命(MECHREVO)EX631-----'+num,
		'1',
		'当季新品 机械革命(MECHREVO)EX631-----'+num,
		'group1/M00/00/0D/cy9-YVsYo--AQfnSAAALef4J_1I963.jpg',
		'100.00',
		'0',
		'4',
		'同意,没意见,就是通过',
		'2018-06-07 11:18:20',
		'2018-06-07 11:17:45',
		'2018-06-07 13:57:40',
		'1.00',
		NULL,
		NULL,
		'3',
		NULL,
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'4',
		'101.00',
		NULL
	);


SET num = num + 1;


END
WHILE;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per2
-- ----------------------------
DROP PROCEDURE IF EXISTS `per2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per2`()
begin 
declare num int; 
set num=59; 
while num < 150 do 
 insert into t_goods_detail_map (`sequence`, create_time, 
      update_time, status, goods_id, 
      goods_detail_url, description)
    values ( num,'2018-04-10 11:46:03', '2018-04-10 11:46:03', '1', '61', 'http://img0.imgtn.bdimg.com/it/u=406175518,4037495904&amp;fm=200&amp;gp=0.jpg', NULL); 
set num=num+1;
end while;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per20
-- ----------------------------
DROP PROCEDURE IF EXISTS `per20`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per20`()
BEGIN

DECLARE num INT;


SET num = 3000;


WHILE num < 3400 DO
	INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
		`goods_name`,
		`goods_type`,
		`goods_subtitle`,
		`goods_cover_url`,
		`goods_price`,
		`goods_stock`,
		`goods_status`,
		`goods_audit_description`,
		`goods_shelf_time`,
		`create_time`,
		`update_time`,
		`freight`,
		`merchant_id`,
		`merchant_name`,
		`integral_rule_id`,
		`goods_exchange_integral`,
		`same_device_limited`,
		`same_device_limited_number`,
		`same_user_limited`,
		`same_user_limited_number`,
		`settlement_basis_id`,
		`sequence_number`,
		`orginal_price`,
		`viral_card_id`
	)
VALUES
	(
		CONCAT('京天（KOTIN） 六核i7 8700GTX1060-----',num),
		'1',
		CONCAT('京天（KOTIN） 六核i7 8700GTX1060-----',num),
		'group1/M00/00/0D/cy9-YVsYoBeAaLXEAAARgLFgAGk543.jpg',
		'1.00',
		'0',
		'4',
		'',
		'2018-06-07 11:06:31',
		'2018-06-07 11:02:35',
		'2018-06-07 11:06:31',
		'1.00',
		NULL,
		NULL,
		'2',
		'2',
		'2',
		NULL,
		'2',
		NULL,
		'2',
		'2',
		'6.00',
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
CONCAT('英特尔（Intel） i7 8700K-----',num),

		'1',
		CONCAT('英特尔（Intel） i7 8700K-----',num),
		'group1/M00/00/0D/cy9-YVsYoryAdxiuAAASB6qmpW0396.jpg',
		NULL,
		'0',
		'4',
		'可以',
		'2018-06-13 15:47:41',
		'2018-06-07 11:13:00',
		'2018-06-14 10:34:34',
		'0.00',
		NULL,
		NULL,
		'1',
		'3',
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'3',
		'6.00',
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
		CONCAT('当季新品 机械革命(MECHREVO)EX631-----',num),
		
		'1',
		CONCAT('当季新品 机械革命(MECHREVO)EX631-----',num),
		'group1/M00/00/0D/cy9-YVsYo--AQfnSAAALef4J_1I963.jpg',
		'100.00',
		'0',
		'4',
		'同意,没意见,就是通过',
		'2018-06-07 11:18:20',
		'2018-06-07 11:17:45',
		'2018-06-07 13:57:40',
		'1.00',
		NULL,
		NULL,
		'3',
		NULL,
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'4',
		'101.00',
		NULL
	);


SET num = num + 1;


END
WHILE;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per21
-- ----------------------------
DROP PROCEDURE IF EXISTS `per21`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per21`()
BEGIN

DECLARE num INT;


SET num = 1637;


WHILE num < 2837 DO
	

SET num = num + 1;
INSERT INTO `hive_scrm`.`t_goods_stock` (`goods_id`, `stock`, `used_stock`, `lock_stock`, `create_time`, `update_time`) VALUES (num , '7885', '4', '1', '2018-06-07 11:02:35', '2018-06-12 17:39:51');


END
WHILE;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per3
-- ----------------------------
DROP PROCEDURE IF EXISTS `per3`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per3`()
begin 
declare num int; 
set num=59; 
while num < 150 do 
 insert into t_goods_detail_map (`sequence`, create_time, 
      update_time, status, goods_id, 
      goods_detail_url, description)
    values ( 6,'2018-04-10 11:46:03', '2018-04-10 11:46:03', '1', '61', 'http://img0.imgtn.bdimg.com/it/u=406175518,4037495904&amp;fm=200&amp;gp=0.jpg', NULL); 
set num=num+1;
end while;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per4
-- ----------------------------
DROP PROCEDURE IF EXISTS `per4`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per4`()
begin 
declare num int; 
set num=59; 
while num < 150 do 
 insert into t_goods_detail_map (`sequence`, create_time, 
      update_time, status, goods_id, 
      goods_detail_url, description)
    values ( num,'2018-04-10 11:46:03', '2018-04-10 11:46:03', '1', num, 'http://pic1.sc.chinaz.com/Files/pic/pic9/201804/zzpic11253_s.jpg', NULL); 
set num=num+1;
end while;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per5
-- ----------------------------
DROP PROCEDURE IF EXISTS `per5`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per5`()
begin 
declare num int; 
set num=59; 
while num < 150 do 
 update t_integral_mall_goods set goods_cover_url="http://pic1.sc.chinaz.com/Files/pic/pic9/201804/zzpic11253_s.jpg" where id=num; 
set num=num+1;
end while;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per6
-- ----------------------------
DROP PROCEDURE IF EXISTS `per6`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per6`()
begin 
declare num int; 
set num=150; 
while num < 200 do 
 update t_integral_mall_goods set goods_cover_url="http://pic1.sc.chinaz.com/Files/pic/pic9/201804/zzpic11253_s.jpg" where id=num; 
set num=num+1;
end while;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per7
-- ----------------------------
DROP PROCEDURE IF EXISTS `per7`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per7`()
BEGIN

DECLARE num INT;


SET num = 175;


WHILE num < 400 DO
	INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
		
		'测试商品规则3',
		'1',
		'测试商品规则3测试商品规则3',
		'http://pic1.sc.chinaz.com/Files/pic/pic9/201804/zzpic11253_s.jpg',
		'10.00',
		'20',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:23:50',
		'2018-04-13 10:23:50',
		'20.00',
		NULL,
		NULL,
		'1',
		'20',
		'2',
		NULL,
		'1',
		NULL,
		NULL,
		'5',
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (

	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试商品规则1',
		'1',
		'测试商品规则1测试商品规则1',
		'',
		'20.00',
		'30',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:25:58',
		'2018-04-13 10:25:58',
		'50.00',
		NULL,
		NULL,
		'1',
		'40',
		'1',
		NULL,
		'2',
		NULL,
		NULL,
		'6',
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (

	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试商品33333',
		'1',
		'测试商品33333',
		'',
		'40.00',
		'40',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:26:36',
		'2018-04-13 10:26:36',
		'30.00',
		NULL,
		NULL,
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'3',
		NULL,
		'7',
		NULL,
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
	
		'测试3333333',
		'1',
		'测试3333333',
		'',
		NULL,
		'50',
		'0',
		NULL,
		NULL,
		'2018-04-13 10:27:13',
		'2018-04-13 10:27:13',
		'20.00',
		NULL,
		NULL,
		'3',
		'500',
		'1',
		NULL,
		'2',
		NULL,
		NULL,
		'8',
		NULL,
		NULL
	);
SET num = num + 1;
END WHILE;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for per8
-- ----------------------------
DROP PROCEDURE IF EXISTS `per8`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `per8`()
begin 
declare num int; 
set num=175; 
while num < 400 do 
 insert into t_goods_detail_map (`sequence`, create_time, 
      update_time, status, goods_id, 
      goods_detail_url, description)
    values ( num,'2018-04-10 11:46:03', '2018-04-10 11:46:03', '1', num, 'http://pic1.sc.chinaz.com/Files/pic/pic9/201804/zzpic11253_s.jpg', NULL); 
set num=num+1;
end while;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_insert10
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_insert10`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_insert10`()
BEGIN

DECLARE num INT;


SET num = 24;


WHILE nums < 79 DO
	INSERT INTO `hive_scrm_test`.`t_virtual_card` (
		`id`,
		`virtual_card_name`,
		`virtual_card_type`,
		`pro_name`,
		`city_name`,
		`cover_url`,
		`receive_place`,
		`stock_number`,
		`expiration_date`,
		`is_forever`,
		`price`,
		`freight_price`,
		`settlement_type`,
		`is_expire`,
		`is_remove_stock`,
		`exchange_date`,
		`enable_sms`,
		`sms_content`,
		`merchant_id`,
		`merchant_name`,
		`card_from`,
		`total_price`,
		`create_time`,
		`update_time`
	)
VALUES
	(
		num,
		'测试虚拟卡1',
		'1',
		'120000',
		'121000',
		'group2/M00/00/5F/PM6J0VtX2-OAejw3AADoLczHxG4008.jpg',
		'京城81号',
		'10000',
		NULL,
		'1',
		'1.00',
		'1',
		'1',
		'0',
		'0',
		NULL,
		NULL,
		NULL,
		'p140916165683501',
		'上海臻材网络信息有限公司',
		'1',
		NULL,
		'2018-07-25 10:11:29',
		'2018-07-25 10:11:29'
	);


SET num = num+1;


END
WHILE;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_insert11
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_insert11`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_insert11`()
BEGIN

DECLARE num INT;


SET num = 24;


WHILE nums < 240 DO
	INSERT INTO `hive_scrm_test`.`t_virtual_card` (
		`id`,
		`virtual_card_name`,
		`virtual_card_type`,
		`pro_name`,
		`city_name`,
		`cover_url`,
		`receive_place`,
		`stock_number`,
		`expiration_date`,
		`is_forever`,
		`price`,
		`freight_price`,
		`settlement_type`,
		`is_expire`,
		`is_remove_stock`,
		`exchange_date`,
		`enable_sms`,
		`sms_content`,
		`merchant_id`,
		`merchant_name`,
		`card_from`,
		`total_price`,
		`create_time`,
		`update_time`
	)
VALUES
	(
		num,
		'测试虚拟卡1',
		'1',
		'120000',
		'121000',
		'group2/M00/00/5F/PM6J0VtX2-OAejw3AADoLczHxG4008.jpg',
		'京城81号',
		'10000',
		NULL,
		'1',
		'1.00',
		'1',
		'1',
		'0',
		'0',
		NULL,
		NULL,
		NULL,
		'p140916165683501',
		'上海臻材网络信息有限公司',
		'1',
		NULL,
		'2018-07-25 10:11:29',
		'2018-07-25 10:11:29'
	);


SET num = num+1;


END
WHILE;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_insert12
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_insert12`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_insert12`()
BEGIN

DECLARE num INT;


SET num = 24;


WHILE num < 240 DO
	INSERT INTO `hive_scrm_test`.`t_virtual_card` (
		`id`,
		`virtual_card_name`,
		`virtual_card_type`,
		`pro_name`,
		`city_name`,
		`cover_url`,
		`receive_place`,
		`stock_number`,
		`expiration_date`,
		`is_forever`,
		`price`,
		`freight_price`,
		`settlement_type`,
		`is_expire`,
		`is_remove_stock`,
		`exchange_date`,
		`enable_sms`,
		`sms_content`,
		`merchant_id`,
		`merchant_name`,
		`card_from`,
		`total_price`,
		`create_time`,
		`update_time`
	)
VALUES
	(
		num,
		'测试虚拟卡1',
		'1',
		'120000',
		'121000',
		'group2/M00/00/5F/PM6J0VtX2-OAejw3AADoLczHxG4008.jpg',
		'京城81号',
		'10000',
		NULL,
		'1',
		'1.00',
		'1',
		'1',
		'0',
		'0',
		NULL,
		NULL,
		NULL,
		'p140916165683501',
		'上海臻材网络信息有限公司',
		'1',
		NULL,
		'2018-07-25 10:11:29',
		'2018-07-25 10:11:29'
	);


SET num = num+1;


END
WHILE;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_insert7
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_insert7`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_insert7`()
BEGIN

DECLARE num INT;
DECLARE nums INT;



SET num = 18075;
SET nums=24;



WHILE nums < 240 DO
	while(num<=28075) do	#对课程号的循环
		INSERT INTO `hive_scrm_test`.`t_virtual_card_stock` (
		`redeem_code_id`,
		`redeem_code_name`,
		`use_status`,
		`redeem_code_status`,
		`expire_date`,
		`flow_to`,
		`virtual_card_id`,
		`order_detail_id`,
		`sell_id`,
		`telephone`,
		`create_time`,
		`update_time`
	)
VALUES
	(
		CONCAT('wwww11111138',num),
		'wwww111111210',
		'1',
		'2',
		'2018-07-30 18:08:59',
		NULL,
		nums,
		NULL,
		NULL,
		NULL,
		'2018-07-30 09:31:39',
		'2018-07-30 09:31:39'
	);	
		set num=num+1;
	end while;
	set nums=nums+1;
	set num=18075;

END WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_insert8
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_insert8`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_insert8`()
BEGIN

DECLARE num INT;
DECLARE nums INT;



SET num = 18075;
SET nums=24;



WHILE nums < 240 DO
	while(num<=28075) do	#对课程号的循环
		INSERT INTO `hive_scrm_test`.`t_virtual_card_stock` (
		`redeem_code_id`,
		`redeem_code_name`,
		`use_status`,
		`redeem_code_status`,
		`expire_date`,
		`flow_to`,
		`virtual_card_id`,
		`order_detail_id`,
		`sell_id`,
		`telephone`,
		`create_time`,
		`update_time`
	)
VALUES
	(
		CONCAT('wwww11111138',num),
		CONCAT('wwww11111138',num),
		'1',
		'2',
		'2018-07-30 18:08:59',
		NULL,
		nums,
		NULL,
		NULL,
		NULL,
		'2018-07-30 09:31:39',
		'2018-07-30 09:31:39'
	);	
		set num=num+1;
	end while;
	set nums=nums+1;
	set num=18075;

END WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_insert9
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_insert9`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_insert9`()
BEGIN

DECLARE num INT;
DECLARE nums INT;



SET num = 18075;
SET nums=24;



WHILE nums < 240 DO
	while(num<=28075) do	#对课程号的循环
		INSERT INTO `hive_scrm_test`.`t_virtual_card_stock` (
		`redeem_code_id`,
		`redeem_code_name`,
		`use_status`,
		`redeem_code_status`,
		`expire_date`,
		`flow_to`,
		`virtual_card_id`,
		`order_detail_id`,
		`sell_id`,
		`telephone`,
		`create_time`,
		`update_time`
	)
VALUES
	(
		CONCAT('wwww11111138',num,nums),
		CONCAT('wwww11111138',num,nums),
		'1',
		'2',
		'2018-07-30 18:08:59',
		NULL,
		nums,
		NULL,
		NULL,
		NULL,
		'2018-07-30 09:31:39',
		'2018-07-30 09:31:39'
	);	
		set num=num+1;
	end while;
	set nums=nums+1;
	set num=18075;

END WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 给商品添加库存
-- ----------------------------
DROP PROCEDURE IF EXISTS `给商品添加库存`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `给商品添加库存`()
BEGIN

DECLARE num INT;


SET num = 23;


WHILE num < 2423 DO
	

SET num = num + 1;
INSERT INTO `hive_scrm`.`t_goods_stock` (`goods_id`, `stock`, `used_stock`, `lock_stock`, `create_time`, `update_time`) VALUES (num , '7885', '4', '1', '2018-06-07 11:02:35', '2018-06-12 17:39:51');


END
WHILE;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for 循环插入商品
-- ----------------------------
DROP PROCEDURE IF EXISTS `循环插入商品`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `循环插入商品`()
BEGIN

DECLARE num INT;


SET num = 3000;


WHILE num < 3400 DO
	INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
		`goods_name`,
		`goods_type`,
		`goods_subtitle`,
		`goods_cover_url`,
		`goods_price`,
		`goods_stock`,
		`goods_status`,
		`goods_audit_description`,
		`goods_shelf_time`,
		`create_time`,
		`update_time`,
		`freight`,
		`merchant_id`,
		`merchant_name`,
		`integral_rule_id`,
		`goods_exchange_integral`,
		`same_device_limited`,
		`same_device_limited_number`,
		`same_user_limited`,
		`same_user_limited_number`,
		`settlement_basis_id`,
		`sequence_number`,
		`orginal_price`,
		`viral_card_id`
	)
VALUES
	(
		CONCAT('fene-----',num),
		'1',
		CONCAT('fene-----',num),
		'group1/M00/00/0D/cy9-YVsYoBeAaLXEAAARgLFgAGk543.jpg',
		'1.00',
		'0',
		'4',
		'',
		'2018-06-07 11:06:31',
		'2018-06-07 11:02:35',
		'2018-06-07 11:06:31',
		'1.00',
		NULL,
		NULL,
		'2',
		'2',
		'2',
		NULL,
		'2',
		NULL,
		'2',
		'2',
		'6.00',
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
CONCAT('英特尔（Intel） i7 8700K-----',num),

		'1',
		CONCAT('英特尔（Intel） i7 8700K-----',num),
		'group1/M00/00/0D/cy9-YVsYoryAdxiuAAASB6qmpW0396.jpg',
		NULL,
		'0',
		'4',
		'可以',
		'2018-06-13 15:47:41',
		'2018-06-07 11:13:00',
		'2018-06-14 10:34:34',
		'0.00',
		NULL,
		NULL,
		'1',
		'3',
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'3',
		'6.00',
		NULL
	);

INSERT INTO `hive_scrm`.`t_integral_mall_goods` (
	`goods_name`,
	`goods_type`,
	`goods_subtitle`,
	`goods_cover_url`,
	`goods_price`,
	`goods_stock`,
	`goods_status`,
	`goods_audit_description`,
	`goods_shelf_time`,
	`create_time`,
	`update_time`,
	`freight`,
	`merchant_id`,
	`merchant_name`,
	`integral_rule_id`,
	`goods_exchange_integral`,
	`same_device_limited`,
	`same_device_limited_number`,
	`same_user_limited`,
	`same_user_limited_number`,
	`settlement_basis_id`,
	`sequence_number`,
	`orginal_price`,
	`viral_card_id`
)
VALUES
	(
		CONCAT('当季新品 机械革命(MECHREVO)EX631-----',num),
		
		'1',
		CONCAT('当季新品 机械革命(MECHREVO)EX631-----',num),
		'group1/M00/00/0D/cy9-YVsYo--AQfnSAAALef4J_1I963.jpg',
		'100.00',
		'0',
		'4',
		'同意,没意见,就是通过',
		'2018-06-07 11:18:20',
		'2018-06-07 11:17:45',
		'2018-06-07 13:57:40',
		'1.00',
		NULL,
		NULL,
		'3',
		NULL,
		'2',
		NULL,
		'2',
		NULL,
		'1',
		'4',
		'101.00',
		NULL
	);


SET num = num + 1;


END
WHILE;
end
;;
DELIMITER ;
