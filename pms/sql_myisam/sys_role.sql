/*
Navicat MySQL Data Transfer

Source Server         : 115.47.153.98
Source Server Version : 50633
Source Host           : 115.47.153.98:3306
Source Database       : hive_scrm_product

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2018-09-06 10:40:51
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=myisam AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '445738124174856192', '超级管理员', '1', 'SUPER_ADMIN', '超管', 'admin', '2017-11-08 15:39:40', 'admin', '2017-11-08 15:39:47');
INSERT INTO `sys_role` VALUES ('2', '455580870561665024', '开发人员', '1', 'DEVELOP', '开发角色', 'admin', '2017-12-05 19:30:39', 'admin', '2017-12-05 19:30:39');
INSERT INTO `sys_role` VALUES ('3', '455584946598875136', '测试角色', '1', 'TEST', '', 'admin', '2017-12-05 19:46:50', 'admin', '2018-08-09 09:29:26');
INSERT INTO `sys_role` VALUES ('4', '455586883025145856', '管理角色', '1', 'ADMIN', '', 'admin', '2017-12-05 19:54:32', 'admin', '2018-08-09 09:29:05');
INSERT INTO `sys_role` VALUES ('5', '513868111720484864', '商户角色', '1', 'SHOP_OWNER', '', 'admin', '2018-05-15 15:43:19', 'admin', '2018-08-09 09:29:18');
INSERT INTO `sys_role` VALUES ('6', '520037248645730304', '运营人员', '1', 'OPERATION', '', 'admin', '2018-06-01 16:17:16', 'admin', '2018-06-01 16:17:16');
