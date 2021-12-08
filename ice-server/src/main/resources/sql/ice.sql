CREATE DATABASE IF NOT EXISTS ice Character Set utf8mb4;

-- ----------------------------
-- Table structure for ice.ice_app
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ice`.`ice_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '服务名',
  `info` varchar(500) COLLATE utf8mb4_bin DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ice.ice_base
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ice`.`ice_base` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `app` int(11) NOT NULL COMMENT 'app',
  `scenes` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '场景(多场景以逗号分隔)',
  `status` tinyint(11) NOT NULL DEFAULT '1' COMMENT '1上架0下架',
  `conf_id` bigint(20) DEFAULT NULL,
  `time_type` tinyint(11) DEFAULT '1' COMMENT '1无限制5大于开始时间6小于结束时间7在开始结束之内',
  `start` datetime(3) DEFAULT NULL COMMENT '开始时间',
  `end` datetime(3) DEFAULT NULL COMMENT '结束时间',
  `debug` tinyint(4) NOT NULL DEFAULT '1',
  `priority` bigint(20) NOT NULL DEFAULT '1' COMMENT '优先级',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ice.ice_conf
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ice`.`ice_conf` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app` int(11) NOT NULL COMMENT 'app',
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `son_ids` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '子节点ID列表',
  `type` tinyint(4) NOT NULL DEFAULT '6' COMMENT '0关系none1关系and2关系or3关系节点all4关系节点any5Flow叶子6Result叶子7None叶子',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1上架0下架',
  `inverse` tinyint(4) NOT NULL DEFAULT '0' COMMENT '反转-对TRUE和FALSE进行反转 对None节点无效',
  `conf_name` varchar(1000) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '叶子节点-类名',
  `conf_field` varchar(5000) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '叶子节点-类json',
  `forward_id` bigint(20) DEFAULT NULL COMMENT '前置节点ID',
  `time_type` tinyint(11) NOT NULL DEFAULT '1' COMMENT '1无限制5大于开始时间6小于结束时间7在开始结束之内',
  `start` datetime(3) DEFAULT NULL COMMENT '开始时间',
  `end` datetime(3) DEFAULT NULL COMMENT '结束时间',
  `complex` int(11) NOT NULL DEFAULT '1',
  `debug` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'debug信息 1 true 0 false',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ice.ice_push_history
-- ----------------------------
CREATE TABLE IF NOT EXISTS `ice`.`ice_push_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app` int(11) NOT NULL,
  `ice_id` bigint(20) DEFAULT NULL,
  `reason` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_data` longtext COLLATE utf8mb4_unicode_ci,
  `operator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;