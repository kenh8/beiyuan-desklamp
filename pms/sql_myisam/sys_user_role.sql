/*
Navicat MySQL Data Transfer

Source Server         : 115.47.153.98
Source Server Version : 50633
Source Host           : 115.47.153.98:3306
Source Database       : hive_scrm_product

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2018-09-06 10:41:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `role_code` varchar(30) DEFAULT NULL COMMENT '角色编码',
  PRIMARY KEY (`id`)
) ENGINE=myisam AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', 'admin', '445738124174856192');
