

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=myisam AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='子系统';

-- ----------------------------
-- Records of sub_system
-- ----------------------------
INSERT INTO `sub_system` VALUES ('1', 'pms', '权限系统', '866848898700831111', '权限系统', 'admin', '2017-11-08 15:22:30', 'admin', '2017-11-08 15:22:32');
