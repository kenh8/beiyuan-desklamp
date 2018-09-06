/*
Navicat MySQL Data Transfer

Source Server         : 115.47.153.98
Source Server Version : 50633
Source Host           : 115.47.153.98:3306
Source Database       : hive_scrm_product

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2018-09-06 10:41:14
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=myisam AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', '管理员', '445738124174856192', '1', 'admin@btte.net', 'admin', '2017-11-08 14:36:13', 'admin', '2017-11-08 14:36:21');
INSERT INTO `sys_user` VALUES ('2', '1@qq.com', 'd93a5def7511da3d0f2d171d9c344e91', '测试商户', '513868111720484864', '1', '1@qq.com', 'admin', '2018-08-03 10:10:42', 'admin', '2018-08-03 10:10:42');
INSERT INTO `sys_user` VALUES ('3', '111@qq.com', 'd93a5def7511da3d0f2d171d9c344e91', '测试开发', '455580870561665024', '1', '111@qq.com', 'admin', '2018-08-03 14:25:39', 'admin', '2018-08-03 14:25:39');
INSERT INTO `sys_user` VALUES ('4', '123456@qq.com', 'd93a5def7511da3d0f2d171d9c344e91', 'nmmn', '513868111720484864', '1', '123456@qq.com', 'admin', '2018-08-06 13:51:00', 'admin', '2018-08-06 13:51:00');
INSERT INTO `sys_user` VALUES ('5', 'lin@163.com', 'd93a5def7511da3d0f2d171d9c344e91', 'lin', '513868111720484864', '1', 'lin@163.com', 'admin', '2018-08-08 13:54:57', 'admin', '2018-08-08 13:54:57');
INSERT INTO `sys_user` VALUES ('6', 'zhangqin@qq.com', 'c78b6663d47cfbdb4d65ea51c104044e', 'zhangqin@qq.com', '513868111720484864', '1', 'zhangqin@qq.com', 'admin', '2018-08-09 10:21:07', 'admin', '2018-08-09 10:21:07');
INSERT INTO `sys_user` VALUES ('7', 'ceshi1@qq.com', 'd93a5def7511da3d0f2d171d9c344e91', 'ceshi', '513868111720484864', '1', 'ceshi1@qq.com', 'admin', '2018-08-16 17:15:29', 'admin', '2018-08-16 17:15:29');
INSERT INTO `sys_user` VALUES ('8', 'ceshi2@qq.com', 'd93a5def7511da3d0f2d171d9c344e91', 'ceshi2', '513868111720484864', '1', 'ceshi2@qq.com', 'admin', '2018-08-16 17:22:04', 'admin', '2018-08-16 17:22:04');
INSERT INTO `sys_user` VALUES ('9', 'ceshi3@qq.com', 'd93a5def7511da3d0f2d171d9c344e91', 'ceshi3', '513868111720484864', '1', 'ceshi3@qq.com', 'admin', '2018-08-16 17:23:19', 'admin', '2018-08-16 17:23:19');
