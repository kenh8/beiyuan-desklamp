

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=myisam AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COMMENT='系统资源表';

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
