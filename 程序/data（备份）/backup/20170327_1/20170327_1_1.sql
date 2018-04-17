-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2017-03-27 00:05:05
-- Vol : 1
DROP TABLE IF EXISTS `lygj_ad`;
CREATE TABLE `lygj_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_ad ( `ad_id`, `ad_name`, `ad_content`, `status` ) VALUES  ('1','ad001','','1');
DROP TABLE IF EXISTS `lygj_asset`;
CREATE TABLE `lygj_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `lygj_auth_access`;
CREATE TABLE `lygj_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `lygj_auth_rule`;
CREATE TABLE `lygj_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('1','Admin','admin_url','admin/content/default','','内容管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('2','Api','admin_url','api/guestbookadmin/index','','所有留言','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('3','Api','admin_url','api/guestbookadmin/delete','','删除网站留言','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('4','Comment','admin_url','comment/commentadmin/index','','评论管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('5','Comment','admin_url','comment/commentadmin/delete','','删除评论','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('6','Comment','admin_url','comment/commentadmin/check','','评论审核','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('7','Portal','admin_url','portal/adminpost/index','','文章管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('8','Portal','admin_url','portal/adminpost/listorders','','文章排序','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('9','Portal','admin_url','portal/adminpost/top','','文章置顶','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('10','Portal','admin_url','portal/adminpost/recommend','','文章推荐','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('11','Portal','admin_url','portal/adminpost/move','','批量移动','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('12','Portal','admin_url','portal/adminpost/check','','文章审核','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('13','Portal','admin_url','portal/adminpost/delete','','删除文章','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('14','Portal','admin_url','portal/adminpost/edit','','编辑文章','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('15','Portal','admin_url','portal/adminpost/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('16','Portal','admin_url','portal/adminpost/add','','添加文章','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('17','Portal','admin_url','portal/adminpost/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('18','Portal','admin_url','portal/adminterm/default','','分类管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('19','Portal','admin_url','portal/adminterm/listorders','','文章分类排序','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('20','Portal','admin_url','portal/adminterm/delete','','删除分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('21','Portal','admin_url','portal/adminterm/edit','','编辑分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('22','Portal','admin_url','portal/adminterm/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('23','Portal','admin_url','portal/adminterm/add','','添加分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('24','Portal','admin_url','portal/adminterm/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('25','Portal','admin_url','portal/adminpage/index','','页面管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('26','Portal','admin_url','portal/adminpage/listorders','','页面排序','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('27','Portal','admin_url','portal/adminpage/delete','','删除页面','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('28','Portal','admin_url','portal/adminpage/edit','','编辑页面','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('29','Portal','admin_url','portal/adminpage/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('30','Portal','admin_url','portal/adminpage/add','','添加页面','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('31','Portal','admin_url','portal/adminpage/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('32','Admin','admin_url','admin/recycle/default','','回收站','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('33','Portal','admin_url','portal/adminpost/recyclebin','','文章回收','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('34','Portal','admin_url','portal/adminpost/restore','','文章还原','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('35','Portal','admin_url','portal/adminpost/clean','','彻底删除','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('36','Portal','admin_url','portal/adminpage/recyclebin','','页面回收','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('37','Portal','admin_url','portal/adminpage/clean','','彻底删除','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('38','Portal','admin_url','portal/adminpage/restore','','页面还原','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('39','Admin','admin_url','admin/extension/default','','扩展工具','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('40','Admin','admin_url','admin/backup/default','','备份管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('41','Admin','admin_url','admin/backup/restore','','数据还原','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('42','Admin','admin_url','admin/backup/index','','数据备份','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('43','Admin','admin_url','admin/backup/index_post','','提交数据备份','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('44','Admin','admin_url','admin/backup/download','','下载备份','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('45','Admin','admin_url','admin/backup/del_backup','','删除备份','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('46','Admin','admin_url','admin/backup/import','','数据备份导入','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('47','Admin','admin_url','admin/plugin/index','','插件管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('48','Admin','admin_url','admin/plugin/toggle','','插件启用切换','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('49','Admin','admin_url','admin/plugin/setting','','插件设置','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('50','Admin','admin_url','admin/plugin/setting_post','','插件设置提交','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('51','Admin','admin_url','admin/plugin/install','','插件安装','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('52','Admin','admin_url','admin/plugin/uninstall','','插件卸载','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('53','Admin','admin_url','admin/slide/default','','图片管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('54','Admin','admin_url','admin/slide/index','','图片管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('55','Admin','admin_url','admin/slide/listorders','','幻灯片排序','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('56','Admin','admin_url','admin/slide/toggle','','幻灯片显示切换','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('57','Admin','admin_url','admin/slide/delete','','删除幻灯片','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('58','Admin','admin_url','admin/slide/edit','','编辑幻灯片','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('59','Admin','admin_url','admin/slide/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('60','Admin','admin_url','admin/slide/add','','添加幻灯片','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('61','Admin','admin_url','admin/slide/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('62','Admin','admin_url','admin/slidecat/index','','图片分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('63','Admin','admin_url','admin/slidecat/delete','','删除分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('64','Admin','admin_url','admin/slidecat/edit','','编辑分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('65','Admin','admin_url','admin/slidecat/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('66','Admin','admin_url','admin/slidecat/add','','添加分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('67','Admin','admin_url','admin/slidecat/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('68','Admin','admin_url','admin/ad/index','','网站广告','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('69','Admin','admin_url','admin/ad/toggle','','广告显示切换','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('70','Admin','admin_url','admin/ad/delete','','删除广告','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('71','Admin','admin_url','admin/ad/edit','','编辑广告','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('72','Admin','admin_url','admin/ad/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('73','Admin','admin_url','admin/ad/add','','添加广告','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('74','Admin','admin_url','admin/ad/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('75','Admin','admin_url','admin/link/index','','友情链接','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('76','Admin','admin_url','admin/link/listorders','','友情链接排序','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('77','Admin','admin_url','admin/link/toggle','','友链显示切换','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('78','Admin','admin_url','admin/link/delete','','删除友情链接','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('79','Admin','admin_url','admin/link/edit','','编辑友情链接','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('80','Admin','admin_url','admin/link/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('81','Admin','admin_url','admin/link/add','','添加友情链接','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('82','Admin','admin_url','admin/link/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('83','Api','admin_url','api/oauthadmin/setting','','第三方登陆','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('84','Api','admin_url','api/oauthadmin/setting_post','','提交设置','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('85','Admin','admin_url','admin/menu/default','','菜单管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('86','Admin','admin_url','admin/navcat/default1','','前台菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('87','Admin','admin_url','admin/nav/index','','菜单管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('88','Admin','admin_url','admin/nav/listorders','','前台导航排序','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('89','Admin','admin_url','admin/nav/delete','','删除菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('90','Admin','admin_url','admin/nav/edit','','编辑菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('91','Admin','admin_url','admin/nav/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('92','Admin','admin_url','admin/nav/add','','添加菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('93','Admin','admin_url','admin/nav/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('94','Admin','admin_url','admin/navcat/index','','菜单分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('95','Admin','admin_url','admin/navcat/delete','','删除分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('96','Admin','admin_url','admin/navcat/edit','','编辑分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('97','Admin','admin_url','admin/navcat/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('98','Admin','admin_url','admin/navcat/add','','添加分类','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('99','Admin','admin_url','admin/navcat/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('100','Admin','admin_url','admin/menu/index','','后台菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('101','Admin','admin_url','admin/menu/add','','添加菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('102','Admin','admin_url','admin/menu/add_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('103','Admin','admin_url','admin/menu/listorders','','后台菜单排序','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('104','Admin','admin_url','admin/menu/export_menu','','菜单备份','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('105','Admin','admin_url','admin/menu/edit','','编辑菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('106','Admin','admin_url','admin/menu/edit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('107','Admin','admin_url','admin/menu/delete','','删除菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('108','Admin','admin_url','admin/menu/lists','','所有菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('109','Admin','admin_url','admin/setting/default','','设置','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('110','Admin','admin_url','admin/setting/userdefault','','管理员信息','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('111','Admin','admin_url','admin/user/userinfo','','修改信息','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('112','Admin','admin_url','admin/user/userinfo_post','','修改信息提交','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('113','Admin','admin_url','admin/setting/password','','修改密码','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('114','Admin','admin_url','admin/setting/password_post','','提交修改','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('115','Admin','admin_url','admin/setting/site','','网站信息','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('116','Admin','admin_url','admin/setting/site_post','','提交修改','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('117','Admin','admin_url','admin/route/index','','路由列表','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('118','Admin','admin_url','admin/route/add','','路由添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('119','Admin','admin_url','admin/route/add_post','','路由添加提交','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('120','Admin','admin_url','admin/route/edit','','路由编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('121','Admin','admin_url','admin/route/edit_post','','路由编辑提交','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('122','Admin','admin_url','admin/route/delete','','路由删除','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('123','Admin','admin_url','admin/route/ban','','路由禁止','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('124','Admin','admin_url','admin/route/open','','路由启用','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('125','Admin','admin_url','admin/route/listorders','','路由排序','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('126','Admin','admin_url','admin/mailer/default','','邮箱配置','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('127','Admin','admin_url','admin/mailer/index','','SMTP配置','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('128','Admin','admin_url','admin/mailer/index_post','','提交配置','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('129','Admin','admin_url','admin/mailer/active','','注册邮件模板','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('130','Admin','admin_url','admin/mailer/active_post','','提交模板','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('131','Admin','admin_url','admin/setting/clearcache','','清除缓存','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('132','User','admin_url','user/indexadmin/default','','用户管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('133','User','admin_url','user/indexadmin/default1','','用户组','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('134','User','admin_url','user/indexadmin/index','','本站用户','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('135','User','admin_url','user/indexadmin/ban','','拉黑会员','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('136','User','admin_url','user/indexadmin/cancelban','','启用会员','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('137','User','admin_url','user/oauthadmin/index','','第三方用户','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('138','User','admin_url','user/oauthadmin/delete','','第三方用户解绑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('139','User','admin_url','user/indexadmin/default3','','管理组','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('140','Admin','admin_url','admin/rbac/index','','角色管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('141','Admin','admin_url','admin/rbac/member','','成员管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('142','Admin','admin_url','admin/rbac/authorize','','权限设置','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('143','Admin','admin_url','admin/rbac/authorize_post','','提交设置','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('144','Admin','admin_url','admin/rbac/roleedit','','编辑角色','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('145','Admin','admin_url','admin/rbac/roleedit_post','','提交编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('146','Admin','admin_url','admin/rbac/roledelete','','删除角色','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('147','Admin','admin_url','admin/rbac/roleadd','','添加角色','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('148','Admin','admin_url','admin/rbac/roleadd_post','','提交添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('149','Admin','admin_url','admin/user/index','','管理员','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('150','Admin','admin_url','admin/user/delete','','删除管理员','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('151','Admin','admin_url','admin/user/edit','','管理员编辑','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('152','Admin','admin_url','admin/user/edit_post','','编辑提交','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('153','Admin','admin_url','admin/user/add','','管理员添加','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('154','Admin','admin_url','admin/user/add_post','','添加提交','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('155','Admin','admin_url','admin/plugin/update','','插件更新','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('156','Admin','admin_url','admin/storage/index','','文件存储','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('157','Admin','admin_url','admin/storage/setting_post','','文件存储设置提交','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('158','Admin','admin_url','admin/slide/ban','','禁用幻灯片','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('159','Admin','admin_url','admin/slide/cancelban','','启用幻灯片','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('160','Admin','admin_url','admin/user/ban','','禁用管理员','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('161','Admin','admin_url','admin/user/cancelban','','启用管理员','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('162','Demo','admin_url','demo/adminindex/index','','','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('163','Demo','admin_url','demo/adminindex/last','','','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('166','Admin','admin_url','admin/mailer/test','','测试邮件','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('167','Admin','admin_url','admin/setting/upload','','上传设置','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('168','Admin','admin_url','admin/setting/upload_post','','上传设置提交','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('169','Portal','admin_url','portal/adminpost/copy','','文章批量复制','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('170','Admin','admin_url','admin/menu/backup_menu','','备份菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('171','Admin','admin_url','admin/menu/export_menu_lang','','导出后台菜单多语言包','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('172','Admin','admin_url','admin/menu/restore_menu','','还原菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('173','Admin','admin_url','admin/menu/getactions','','导入新菜单','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('174','Admin','admin_url','admin/variable/index','','变量管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('175','Portal','admin_url','portal/adminproduct/index','','工程管理','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('176','Portal','admin_url','portal/adminterm/index','','分类列表','1','');
INSERT INTO lygj_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('177','Portal','admin_url','portal/admingongyi/index','','工艺管理','1','');
DROP TABLE IF EXISTS `lygj_comments`;
CREATE TABLE `lygj_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `lygj_common_action_log`;
CREATE TABLE `lygj_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `lygj_guestbook`;
CREATE TABLE `lygj_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `tell` varchar(255) NOT NULL COMMENT '手机号码',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_guestbook ( `id`, `full_name`, `email`, `title`, `tell`, `msg`, `createtime`, `status` ) VALUES  ('1','胡先森','1111@qq.com','','15759518702','的萨菲发卡号发老地方服饰公司','2017-03-24 01:26:19','1');
DROP TABLE IF EXISTS `lygj_links`;
CREATE TABLE `lygj_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_links ( `link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder` ) VALUES  ('1','http://www.lygj97.com','龙和古建','admin/20170326/58d7d8f367c8d.png','_blank','','1','0','','0');
DROP TABLE IF EXISTS `lygj_menu`;
CREATE TABLE `lygj_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('1','0','Admin','Content','default','','0','1','内容管理','th','','2');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('2','1','Api','Guestbookadmin','index','','1','1','所有留言','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('3','2','Api','Guestbookadmin','delete','','1','0','删除网站留言','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('4','1','Comment','Commentadmin','index','','1','0','评论管理','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('5','4','Comment','Commentadmin','delete','','1','0','删除评论','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('6','4','Comment','Commentadmin','check','','1','0','评论审核','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('7','1','Portal','AdminPost','index','','1','1','文章管理','','','1');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('8','7','Portal','AdminPost','listorders','','1','0','文章排序','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('9','7','Portal','AdminPost','top','','1','0','文章置顶','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','7','Portal','AdminPost','recommend','','1','0','文章推荐','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('11','7','Portal','AdminPost','move','','1','0','批量移动','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('12','7','Portal','AdminPost','check','','1','0','文章审核','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('13','7','Portal','AdminPost','delete','','1','0','删除文章','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('14','7','Portal','AdminPost','edit','','1','0','编辑文章','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('15','14','Portal','AdminPost','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('16','7','Portal','AdminPost','add','','1','0','添加文章','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('17','16','Portal','AdminPost','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('18','0','Portal','AdminTerm','default','','0','1','分类管理','','','3');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('19','18','Portal','AdminTerm','listorders','','1','0','文章分类排序','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('20','18','Portal','AdminTerm','delete','','1','0','删除分类','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('21','18','Portal','AdminTerm','edit','','1','0','编辑分类','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('22','21','Portal','AdminTerm','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('23','18','Portal','AdminTerm','add','','1','1','添加分类','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('24','23','Portal','AdminTerm','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('25','1','Portal','AdminPage','index','','1','1','页面管理','','','3');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('26','25','Portal','AdminPage','listorders','','1','0','页面排序','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('27','25','Portal','AdminPage','delete','','1','0','删除页面','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('28','25','Portal','AdminPage','edit','','1','0','编辑页面','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('29','28','Portal','AdminPage','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('30','25','Portal','AdminPage','add','','1','0','添加页面','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('31','30','Portal','AdminPage','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('32','0','Admin','Recycle','default','','1','1','回收站','retweet','','6');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('33','32','Portal','AdminPost','recyclebin','','1','1','文章回收','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('34','33','Portal','AdminPost','restore','','1','0','文章还原','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('35','33','Portal','AdminPost','clean','','1','0','彻底删除','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('36','32','Portal','AdminPage','recyclebin','','1','1','页面回收','','','1');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('37','36','Portal','AdminPage','clean','','1','0','彻底删除','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('38','36','Portal','AdminPage','restore','','1','0','页面还原','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('39','0','Admin','Extension','default','','0','1','扩展工具','cloud','','5');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('40','39','Admin','Backup','default','','1','1','备份管理','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('41','40','Admin','Backup','restore','','1','1','数据还原','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('42','40','Admin','Backup','index','','1','1','数据备份','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('43','42','Admin','Backup','index_post','','1','0','提交数据备份','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('44','40','Admin','Backup','download','','1','0','下载备份','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('45','40','Admin','Backup','del_backup','','1','0','删除备份','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('46','40','Admin','Backup','import','','1','0','数据备份导入','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('47','39','Admin','Plugin','index','','1','0','插件管理','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('48','47','Admin','Plugin','toggle','','1','0','插件启用切换','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('49','47','Admin','Plugin','setting','','1','0','插件设置','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('50','49','Admin','Plugin','setting_post','','1','0','插件设置提交','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('51','47','Admin','Plugin','install','','1','0','插件安装','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('52','47','Admin','Plugin','uninstall','','1','0','插件卸载','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('53','0','Admin','Slide','default','','1','1','图片管理','image','','4');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('54','53','Admin','Slide','index','','1','1','图片管理','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('55','54','Admin','Slide','listorders','','1','0','幻灯片排序','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('56','54','Admin','Slide','toggle','','1','0','幻灯片显示切换','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('57','54','Admin','Slide','delete','','1','0','删除幻灯片','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('58','54','Admin','Slide','edit','','1','0','编辑幻灯片','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('59','58','Admin','Slide','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('60','54','Admin','Slide','add','','1','0','添加幻灯片','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('61','60','Admin','Slide','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('62','53','Admin','Slidecat','index','','1','1','图片分类','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('63','62','Admin','Slidecat','delete','','1','0','删除分类','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('64','62','Admin','Slidecat','edit','','1','0','编辑分类','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('65','64','Admin','Slidecat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('66','62','Admin','Slidecat','add','','1','0','添加分类','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('67','66','Admin','Slidecat','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('68','39','Admin','Ad','index','','1','1','网站广告','','','2');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('69','68','Admin','Ad','toggle','','1','0','广告显示切换','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('70','68','Admin','Ad','delete','','1','0','删除广告','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('71','68','Admin','Ad','edit','','1','0','编辑广告','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('72','71','Admin','Ad','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('73','68','Admin','Ad','add','','1','0','添加广告','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('74','73','Admin','Ad','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('75','39','Admin','Link','index','','0','1','友情链接','','','3');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('76','75','Admin','Link','listorders','','1','0','友情链接排序','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('77','75','Admin','Link','toggle','','1','0','友链显示切换','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('78','75','Admin','Link','delete','','1','0','删除友情链接','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('79','75','Admin','Link','edit','','1','0','编辑友情链接','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('80','79','Admin','Link','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('81','75','Admin','Link','add','','1','0','添加友情链接','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('82','81','Admin','Link','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('83','39','Api','Oauthadmin','setting','','1','0','第三方登陆','leaf','','4');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('84','83','Api','Oauthadmin','setting_post','','1','0','提交设置','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('85','0','Admin','Menu','default','','1','1','菜单管理','list','','1');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('86','85','Admin','Navcat','default1','','1','1','前台菜单','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('87','86','Admin','Nav','index','','1','1','菜单管理','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('88','87','Admin','Nav','listorders','','1','0','前台导航排序','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('89','87','Admin','Nav','delete','','1','0','删除菜单','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('90','87','Admin','Nav','edit','','1','0','编辑菜单','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('91','90','Admin','Nav','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('92','87','Admin','Nav','add','','1','0','添加菜单','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('93','92','Admin','Nav','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('94','86','Admin','Navcat','index','','1','1','菜单分类','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('95','94','Admin','Navcat','delete','','1','0','删除分类','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('96','94','Admin','Navcat','edit','','1','0','编辑分类','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('97','96','Admin','Navcat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('98','94','Admin','Navcat','add','','1','0','添加分类','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('99','98','Admin','Navcat','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('100','85','Admin','Menu','index','','1','0','后台菜单','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('101','100','Admin','Menu','add','','1','0','添加菜单','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('102','101','Admin','Menu','add_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('103','100','Admin','Menu','listorders','','1','0','后台菜单排序','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('104','100','Admin','Menu','export_menu','','1','0','菜单备份','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('105','100','Admin','Menu','edit','','1','0','编辑菜单','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('106','105','Admin','Menu','edit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('107','100','Admin','Menu','delete','','1','0','删除菜单','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('108','100','Admin','Menu','lists','','1','0','所有菜单','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('109','0','Admin','Setting','default','','0','1','设置','cogs','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('110','109','Admin','Setting','userdefault','','0','1','管理员信息','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('111','110','Admin','User','userinfo','','1','1','修改信息','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('112','111','Admin','User','userinfo_post','','1','0','修改信息提交','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('113','110','Admin','Setting','password','','1','1','修改密码','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('114','113','Admin','Setting','password_post','','1','0','提交修改','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('115','109','Admin','Setting','site','','1','1','网站信息','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('116','115','Admin','Setting','site_post','','1','0','提交修改','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('117','115','Admin','Route','index','','1','0','路由列表','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('118','115','Admin','Route','add','','1','0','路由添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('119','118','Admin','Route','add_post','','1','0','路由添加提交','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('120','115','Admin','Route','edit','','1','0','路由编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('121','120','Admin','Route','edit_post','','1','0','路由编辑提交','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('122','115','Admin','Route','delete','','1','0','路由删除','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('123','115','Admin','Route','ban','','1','0','路由禁止','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('124','115','Admin','Route','open','','1','0','路由启用','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('125','115','Admin','Route','listorders','','1','0','路由排序','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('126','109','Admin','Mailer','default','','1','0','邮箱配置','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('127','126','Admin','Mailer','index','','1','1','SMTP配置','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('128','127','Admin','Mailer','index_post','','1','0','提交配置','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('129','126','Admin','Mailer','active','','1','1','注册邮件模板','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('130','129','Admin','Mailer','active_post','','1','0','提交模板','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('131','0','Admin','Setting','clearcache','','1','1','清除缓存','trash','','7');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('132','0','User','Indexadmin','default','','1','0','用户管理','group','','10');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('133','132','User','Indexadmin','default1','','1','1','用户组','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('134','133','User','Indexadmin','index','','1','1','本站用户','leaf','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('135','134','User','Indexadmin','ban','','1','0','拉黑会员','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('136','134','User','Indexadmin','cancelban','','1','0','启用会员','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('137','133','User','Oauthadmin','index','','1','1','第三方用户','leaf','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('138','137','User','Oauthadmin','delete','','1','0','第三方用户解绑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('139','132','User','Indexadmin','default3','','1','1','管理组','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('140','139','Admin','Rbac','index','','1','1','角色管理','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('141','140','Admin','Rbac','member','','1','0','成员管理','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('142','140','Admin','Rbac','authorize','','1','0','权限设置','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('143','142','Admin','Rbac','authorize_post','','1','0','提交设置','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('144','140','Admin','Rbac','roleedit','','1','0','编辑角色','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('145','144','Admin','Rbac','roleedit_post','','1','0','提交编辑','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('146','140','Admin','Rbac','roledelete','','1','1','删除角色','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('147','140','Admin','Rbac','roleadd','','1','1','添加角色','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('148','147','Admin','Rbac','roleadd_post','','1','0','提交添加','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('149','139','Admin','User','index','','1','1','管理员','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('150','149','Admin','User','delete','','1','0','删除管理员','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('151','149','Admin','User','edit','','1','0','管理员编辑','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('152','151','Admin','User','edit_post','','1','0','编辑提交','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('153','149','Admin','User','add','','1','0','管理员添加','','','1000');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('154','153','Admin','User','add_post','','1','0','添加提交','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('155','47','Admin','Plugin','update','','1','0','插件更新','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('156','109','Admin','Storage','index','','1','0','文件存储','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('157','156','Admin','Storage','setting_post','','1','0','文件存储设置提交','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('158','54','Admin','Slide','ban','','1','0','禁用幻灯片','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('159','54','Admin','Slide','cancelban','','1','0','启用幻灯片','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('160','149','Admin','User','ban','','1','0','禁用管理员','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('161','149','Admin','User','cancelban','','1','0','启用管理员','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('166','127','Admin','Mailer','test','','1','0','测试邮件','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('167','109','Admin','Setting','upload','','1','1','上传设置','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('168','167','Admin','Setting','upload_post','','1','0','上传设置提交','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('169','7','Portal','AdminPost','copy','','1','0','文章批量复制','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('174','100','Admin','Menu','backup_menu','','1','0','备份菜单','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('175','100','Admin','Menu','export_menu_lang','','1','0','导出后台菜单多语言包','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('176','100','Admin','Menu','restore_menu','','1','0','还原菜单','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('177','100','Admin','Menu','getactions','','1','0','导入新菜单','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('187','1','Admin','Variable','index','','1','1','变量管理','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('188','1','Portal','AdminProduct','index','','1','1','工程管理','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('189','18','Portal','AdminTerm','index','','1','1','分类列表','','','0');
INSERT INTO lygj_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('190','1','Portal','AdminGongyi','index','','1','1','工艺管理','','','0');
DROP TABLE IF EXISTS `lygj_nav`;
CREATE TABLE `lygj_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('1','1','0','首页','','home','','1','0','0-1');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('2','1','0','关于我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}','','1','0','0-2');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('3','1','0','资讯中心','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}','','1','0','0-3');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('5','2','0','工程展示','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}','','1','0','0-5');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('4','1','0','营造工艺','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"8\";}}','','1','0','0-4');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('6','2','0','古建文化','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"18\";}}','','1','0','0-6');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('7','2','0','视频中心','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"23\";}}','','1','0','0-7');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('8','2','0','联系我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}','','1','0','0-8');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('9','3','0','网站首页','','home','','1','0','0-9');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('10','3','0','关于我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}','','1','0','0-10');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('11','3','0','资讯中心','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}','','1','0','0-11');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('12','3','0','营造工艺','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"8\";}}','','1','0','0-12');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('13','3','0','工程展示','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}','','1','0','0-13');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('14','3','0','古建文化','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"18\";}}','','1','0','0-14');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('15','3','0','视频中心','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"23\";}}','','1','0','0-15');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('16','3','0','联系我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}','','1','0','0-16');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('17','4','0','关于我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}','','1','0','0-17');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('18','4','0','联系我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}','','1','0','0-18');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('19','4','0','工程展示','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}','','1','0','0-19');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('20','4','0','视频中心','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"23\";}}','','1','0','0-20');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('21','1','2','企业文化','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}','','1','0','0-2-21');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('22','1','2','组织机构','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}','','1','0','0-2-22');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('23','1','2','公司简介','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}','','1','0','0-2-23');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('24','1','2','企业历程','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}','','1','0','0-2-24');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('25','1','2','荣誉资质','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"7\";}}','','1','0','0-2-25');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('26','1','3','企业动态','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}','','1','0','0-3-26');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('27','1','3','行业资讯','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"7\";}}','','1','0','0-3-27');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('28','1','4','石雕石作','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"9\";}}','','1','0','0-4-28');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('29','1','4','木雕木作','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"10\";}}','','1','0','0-4-29');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('30','1','4','泥水瓦作','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"11\";}}','','1','0','0-4-30');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('31','1','4','堆塑剪贴','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"12\";}}','','1','0','0-4-31');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('32','1','4','油漆彩绘','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"13\";}}','','1','0','0-4-32');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('33','2','5','国内工程','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"15\";}}','','1','0','0-5-33');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('34','2','5','国外工程','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"16\";}}','','1','0','0-5-34');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('35','2','5','在施工程','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"17\";}}','','1','0','0-5-35');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('36','2','6','传承传习','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"19\";}}','','1','0','0-6-36');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('37','2','6','技术总结','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"20\";}}','','1','0','0-6-37');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('38','2','6','交流活动','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"21\";}}','','1','0','0-6-38');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('39','2','6','古建常识','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"22\";}}','','1','0','0-6-39');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('42','2','8','联系我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}','','1','0','0-8-42');
INSERT INTO lygj_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('43','2','8','加入我们','','a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}','','1','0','0-8-43');
DROP TABLE IF EXISTS `lygj_nav_cat`;
CREATE TABLE `lygj_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('1','主导航左侧','1','主导航');
INSERT INTO lygj_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('2','主导航右侧','0','主导航');
INSERT INTO lygj_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('3','手机导航','0','手机导航');
INSERT INTO lygj_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('4','底部导航','0','底部导航');
DROP TABLE IF EXISTS `lygj_oauth_user`;
CREATE TABLE `lygj_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `lygj_options`;
CREATE TABLE `lygj_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('1','member_email_active','{\"title\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.lygj97.com\\\" target=\\\"_self\\\" textvalue=\\\"\\u9f99\\u548c\\u53e4\\u5efa\\\">\\u9f99\\u548c\\u53e4\\u5efa<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662f\\u9f99\\u548c\\u53e4\\u5efa\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; \\u9f99\\u548c\\u53e4\\u5efa \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}','1');
INSERT INTO lygj_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('6','site_options','{\"site_name\":\"\\u9f99\\u548c\\u53e4\\u5efa\",\"site_name_en\":\"\",\"site_host\":\"http:\\/\\/www.lygj97.com\\/\",\"site_logo\":\"admin\\/20170319\\/58ce6bb028793.png\",\"site_erweima\":\"admin\\/20170325\\/58d6529561495.jpg\",\"site_admin_url_password\":\"\",\"site_tpl\":\"lygj97\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\\u95fdICP\\u590717004417\\u53f7-1\",\"site_admin_email\":\"lygj@lygj97.com\",\"site_tongji\":\"\",\"site_copyright\":\"copyrught 2016 - 2018 \\u6cc9\\u5dde\\u9f99\\u548c\\u53e4\\u5efa\\u7b51\\u5de5\\u7a0b\\u6709\\u9650\\u516c\\u53f8 lygj97.com  all rights reserved\",\"site_copyright_en\":\"\",\"site_seo_title\":\"\\u9f99\\u548c\\u53e4\\u5efa\",\"site_seo_title_en\":\"\",\"site_seo_keywords\":\"\\u9f99\\u548c\\u53e4\\u5efa\",\"site_seo_keywords_en\":\"\",\"site_seo_description\":\"\\u9f99\\u548c\\u53e4\\u5efa\",\"urlmode\":\"2\",\"html_suffix\":\".html\",\"comment_time_interval\":\"60\"}','1');
INSERT INTO lygj_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('7','cmf_settings','{\"banned_usernames\":\"\"}','1');
INSERT INTO lygj_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('8','cdn_settings','{\"cdn_static_root\":\"\"}','1');
DROP TABLE IF EXISTS `lygj_plugins`;
CREATE TABLE `lygj_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `lygj_posts`;
CREATE TABLE `lygj_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('1','1','','','2017-03-20 01:01:20','<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-indent: 2rem; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, STXihei, 华文细黑, 微软雅黑, SimSun, 宋体, Heiti, 黑体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(246, 247, 249);\"><span style=\"box-sizing: border-box; font-family: 隶书, SimLi; color: rgb(151, 72, 6);\"><span style=\"box-sizing: border-box; font-weight: 700;\"><span style=\"box-sizing: border-box; font-size: 32px;\">★ 企业宗旨：茹古涵今 &nbsp;与时俱进</span></span></span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-indent: 2rem; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, STXihei, 华文细黑, 微软雅黑, SimSun, 宋体, Heiti, 黑体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(246, 247, 249);\"><span style=\"box-sizing: border-box; font-family: 隶书, SimLi; color: rgb(151, 72, 6);\"><span style=\"box-sizing: border-box; font-weight: 700;\"><span style=\"box-sizing: border-box; font-size: 32px;\">★ 企业口号：今日精品工程·明日文物胜迹</span></span></span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-indent: 2rem; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, STXihei, 华文细黑, 微软雅黑, SimSun, 宋体, Heiti, 黑体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(246, 247, 249);\"><span style=\"font-size: 32px; font-weight: 700; color: rgb(151, 72, 6); font-family: 隶书, SimLi; text-indent: 2rem;\">★ 企业理念：谦诚为本&nbsp; 质艺至尊</span></p>','企业文化','','1','1','2017-03-20 01:00:51','','0','2','','0','{\"template\":\"about\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('2','1','','','2017-03-20 01:02:44','<p style=\"text-align: center;\"><img src=\"/data/upload/ueditor/20170322/58d25687701ed.jpg\" title=\"1457951026136892.jpg\" alt=\"1457951026136892.jpg\"/></p>','组织机构','','1','1','2017-03-20 01:02:37','','0','2','','0','{\"template\":\"about\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('3','1','','','2017-03-20 01:03:00','<p style=\"box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, STXihei, 华文细黑, 微软雅黑, SimSun, 宋体, Heiti, 黑体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(246, 247, 249);\"><span style=\"box-sizing: border-box; font-family: 宋体; font-size: 18px; color: rgb(162, 135, 94);\"><span style=\"box-sizing: border-box; font-weight: 700;\">福建省泉州市古建筑有限公司创立于1988年。公司根植泉州沃土，面向海内外市场，开拓进取，发展壮大，已拥有国家园林古建工程专业承包一级资质和文物保护工程施工一级资质、建筑幕墙装饰二级资质和园林绿化三级资质，并拥有专业配套的石雕公司、木作木雕厂及设计机构，可承建各种规模及类型的仿古建筑工程、文 物保护工程、园林绿化工程。公司精心营造、修复了福建省泉州市佛教四大丛林寺院、西湖公园刺桐阁、玄妙观、蔡氏古民居、福建省建瓯文庙、厦门青礁慈济宫、澳门中华妈祖文化村、江苏昆山慧聚寺仿古建筑群、山东省枣庄市台儿庄运河古城天后宫、深圳园博园福塔等一批精品工程，获得业界的良好信誉和各级政府的褒 奖，福建省政府授予公司董事长蒋钦全省级非物质文化遗产“传统建筑营造技艺”传承人，同时公司被授予“泉州传统建筑营造技艺传习所。同年，荣幸地成为罗哲文大师的弟子。2013年12月，蒋钦全董事长荣获央视2013年“乡土盛典”乡土文化风采榜十大人物。</span></span></p><p style=\"box-sizing: border-box; margin-top: 10px; margin-bottom: 10px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Arial, &quot;Microsoft yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;冬青黑体简体中文 w3&quot;, STXihei, 华文细黑, 微软雅黑, SimSun, 宋体, Heiti, 黑体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(246, 247, 249);\"><span style=\"box-sizing: border-box; font-weight: 700; text-indent: 2em; color: rgb(162, 135, 94); font-family: 宋体; font-size: 18px;\">“山外青山楼外楼”，园林古建博大精深，营造法式亦无止境。公司矢志以传承弘扬中华优秀的园林古建文化为己任，秉持传统艺术风格和民族文化特色，以真诚守信，精益求精的企业精神和卓越精湛的技术，为社会各界提供全方位的服务，携手业界同仁，共同推进中国园林古建筑事业的复兴与繁荣。</span></p>','公司简介','','1','1','2017-03-20 01:02:53','','0','2','','0','{\"template\":\"about\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('4','1','','','2017-03-20 01:03:25','','联系我们','','1','1','2017-03-20 01:03:01','','0','2','','0','{\"template\":\"contact\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('5','1','','','2017-03-20 01:03:37','<p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;text-align: center\"><strong><span style=\"font-size: 21px;font-family: 宋体;color: rgb(51, 51, 51)\">北京市园林古建工程有限公司招聘启事</span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">1</span></strong><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">财务主管<span style=\"font-size: inherit\">1</span>人</span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">岗位职责：</span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">1</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、制定完善财务管理办法，负责组织学习并贯彻与公司财务工作相关的法律、法规、文件及制度等，按照相关法规规范财务基础管理工作；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">2</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、组织财务部有序开展日常业务，包括对基层单位财务工作进行指导、服务与监督，对公司资金收支、账务核算、各类报表、税金、成本等方面业务进行审核把关，银行账户的监管，公司各类资产的管理，财务资料归档及管理，并保证业务处理及时准确；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">3</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、组织做好内部、外部的各种审计检查；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">4</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、组织编制公司年度预结算报告；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">5</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、完成其他与财务相关的临时性的任务。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">任职要求：</span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">1</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、熟悉了解企业财务部门基本日常工作内容；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">2</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、组织沟通能力较好，具有团队协作精神，能承受一定的压力；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">3</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、综合素质较好。责任心强、做事踏实严谨、不拖拉、不敷衍，做事有条理；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">4</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、专业能力较全面。具有会计师以上职称，财经类本科以上学历，<span style=\"font-size: inherit\">10</span>年以上财务工作经历，具备一定的财务工作管理能力。对财务工作有自己的思考与见解。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><br/></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 2px;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">2</span></strong><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">行政主管（偏物业方向）<span style=\"font-size: inherit\">1</span>人</span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">岗位职责<span style=\"font-size: inherit\">:</span></span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">1</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、负责公司房屋的日常检查、维修和房地产权的管理工作，制定相关应急预案。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">2</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、负责公司供电、供水、卫生防疫、交通、垃圾消纳、避雷、污水排放等工作，提出节能措施，完成水电、空调、燃气等能源统计工作。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">3</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、负责办公楼内协议租用的保安、清洁、绿化等人员的相关管理工作。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">4</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、负责办公楼消防安全工作。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">5</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、负责出租房屋的日常管理及租赁费、水电等费用的收缴工作。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">6</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、负责与区政府、办事处、城管、居委会等地接洽、协调相关工作。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">7</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、完成领导交办的其他工作。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">任职要求<span style=\"font-size: inherit\">:</span></span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">1</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、受过物业管理、管理学、财务会计基本知识等方面的培训；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">2</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、熟悉物业管理的运作，有相关知识与经验；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">3</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、具有一定的财务知识基础；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">4</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、具有较强的组织、管理、协调能力，有较强的责任心、服务意识及团队合作精神，善于与人沟通；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">5</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、工作踏实，能承担较大的工作压力。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><br/></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">3</span></strong><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">设计所预算员<span style=\"font-size: inherit\">1</span>人</span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">岗位职责：<span style=\"font-size: inherit\">&nbsp;<br/></span></span></strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">1</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、负责投标项目的预算和标书制作；<span style=\"font-size: inherit\">&nbsp;<br/>2</span>、负责各投标项目的成本测算及编制中标项目成本预算表；<span style=\"font-size: inherit\">&nbsp;<br/>3</span>、申报并确定各投标项目的投标价格；<span style=\"font-size: inherit\">&nbsp;<br/>4</span>、其他有关预算投标及上级交办的工作。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">任职要求：</span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;text-indent: 0;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">1</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、熟悉预算定额，熟悉使用预算软件；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;text-indent: 0;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">2</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、工作踏实认真、责任心强；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;text-indent: 0;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">3</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、必须会广联达预算（清单<span style=\"font-size: inherit\">4.0</span>，必须会<span style=\"font-size: inherit\">CAD</span>（<span style=\"font-size: inherit\">2007</span>及各版本）；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;text-indent: 0;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">4</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、能独立编制投标预算书。</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><br/></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">4</span></strong><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">设计所电气工程师<span style=\"font-size: inherit\">1</span>人<a name=\"_GoBack\"></a></span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">岗位职责：</span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">供配电、照明及插座系统设计</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><strong><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">任职要求：</span></strong></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">1</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、大专（含）以上学历，电气工程或相关工程专业毕业；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">2</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、电气工程师及以上职称，<span style=\"font-size: inherit\">10</span>年以上电气设计工龄；</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">3</span><span style=\"font-size: 19px;font-family: 仿宋;line-height: 28px\">、身体健康</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 12px;line-height: 18px\"><br/></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;line-height: 29px\"><span style=\"font-size: 19px;font-family: 黑体\">联系方式：</span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;line-height: 29px;text-indent: 40px\"><span style=\"font-size: 19px;font-family: 仿宋\">地<span style=\"font-size: inherit\"><span style=\"font-size: inherit\">&nbsp;&nbsp;</span></span>址：北京市西城区新风北街<span style=\"font-size: inherit\">4</span>号<span style=\"font-size: inherit\"><span style=\"font-size: inherit\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span>邮<span style=\"font-size: inherit\"><span style=\"font-size: inherit\">&nbsp;&nbsp;</span></span>编：<span style=\"font-size: inherit\">100088</span></span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 40px;line-height: 29px\"><span style=\"font-size: 19px;font-family: 仿宋\">网址：<span style=\"font-size: inherit\">http://www.ylgj.com.cn/<span style=\"font-size: inherit\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 40px;line-height: 29px\"><span style=\"font-size: 19px;font-family: 仿宋\"><span style=\"font-size: inherit\">E-mail<span style=\"font-size: inherit\">&nbsp;&nbsp;</span></span>：<span style=\"font-size: inherit\">ylgjrl@126.com<span style=\"font-size: inherit\">&nbsp;&nbsp;</span></span></span></p><p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;margin: 0 0 0 40px;line-height: 29px\"><span style=\"font-size: 19px;font-family: 仿宋\"><span style=\"font-size: inherit\"></span>联系人：黄秀丽</span></p>','加入我们','','1','1','2017-03-20 01:03:26','','0','2','','0','{\"template\":\"about\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('6','1','','','2017-03-20 01:09:43','<p>测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章</p>','测试文章测试文章测试文章测试文章测试文章测试文章测试文章','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','1','1','2017-03-23 17:12:16','','0','4','','0','{\"thumb\":\"portal\\/20170323\\/58d3916d82f2c.jpg\",\"template\":\"\"}','26','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('7','1','','','2017-03-20 22:11:14','','荣誉资质','','1','1','2017-03-20 22:10:58','','0','2','','0','{\"template\":\"honor\",\"thumb\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('8','1','','','2006-03-01 00:00:00','<p><span style=\"color: rgb(51, 51, 51); font-family: 宋体; font-size: 19px; background-color: rgb(246, 247, 249);\">2016年1月24日，公司蒋钦全董事长为昆山慧聚寺妈祖配殿“福德正神”殿、太岁殿揭牌典礼。</span></p>','蒋钦全董事长为昆山慧聚寺妈祖配殿“福德正神”殿、太岁殿揭牌典礼','','1','1','2017-03-22 19:38:51','','0','4','','0','{\"thumb\":\"\",\"template\":\"\"}','1','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('9','1','','','2017-03-22 19:39:47','<p>蒋钦全董事长为昆山慧聚寺妈祖配殿“福德正神”殿、太岁殿揭牌典礼</p>','蒋钦全董事长为昆山慧聚寺妈祖配殿“福德正神”殿、太岁殿揭牌典礼','','1','1','2017-03-22 19:39:55','','0','4','','0','{\"thumb\":\"\",\"template\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('10','1','','','2017-03-23 17:29:06','<p>测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章</p>','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','1','1','2017-03-23 17:29:20','','0','4','','0','{\"thumb\":\"\",\"template\":\"\"}','40','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('11','1','','','2017-03-24 23:35:36','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-24 23:59:43','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','3','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('12','1','','','2017-03-24 23:40:46','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-24 23:59:36','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','4','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('13','1','','','2017-03-24 23:40:49','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-24 23:40:49','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','4','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('14','1','','','2017-03-24 23:40:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-24 23:40:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','3','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('15','1','','','2017-03-24 23:40:54','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-24 23:53:03','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','5','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('16','1','','','2017-03-24 23:40:59','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-24 23:59:17','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','15','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('17','1','','','2017-03-24 23:41:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','3','1','2017-03-24 23:41:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('18','1','','','2017-03-24 23:59:52','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-24 23:59:52','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','9','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('19','1','','','2017-03-25 00:00:37','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-25 00:00:37','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','24','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('20','1','','','2017-03-25 00:05:07','','111111','','1','1','2017-03-25 00:05:52','','0','3','','0','{\"thumb\":\"portal\\/20170325\\/58d543d5d93a1.jpg\",\"photo\":[{\"url\":\"portal\\/20170325\\/58d543c38239b.jpg\",\"alt\":\"1486346072993689 (1).jpg\"},{\"url\":\"portal\\/20170325\\/58d543c3e1354.jpg\",\"alt\":\"1486346072993689.jpg\"}]}','23','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('21','1','','','2017-03-25 00:06:00','','111111','','3','1','2017-03-25 00:06:00','','0','1','','0','{\"thumb\":\"portal\\/20170325\\/58d543d5d93a1.jpg\",\"photo\":[{\"url\":\"portal\\/20170325\\/58d543c38239b.jpg\",\"alt\":\"1486346072993689 (1).jpg\"},{\"url\":\"portal\\/20170325\\/58d543c3e1354.jpg\",\"alt\":\"1486346072993689.jpg\"}]}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('22','1','','','2017-03-25 00:08:03','','111111','','3','1','2017-03-25 00:08:03','','0','1','','0','{\"thumb\":\"portal\\/20170325\\/58d543d5d93a1.jpg\",\"photo\":[{\"url\":\"portal\\/20170325\\/58d543c38239b.jpg\",\"alt\":\"1486346072993689 (1).jpg\"},{\"url\":\"portal\\/20170325\\/58d543c3e1354.jpg\",\"alt\":\"1486346072993689.jpg\"}]}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('23','1','','','2017-03-25 00:14:21','<p>测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章</p>','测试文章测试文章测试文章测试文章测试文章测试文章测试文章','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','3','1','2017-03-25 00:14:21','','0','1','','0','{\"thumb\":\"portal\\/20170323\\/58d3916d82f2c.jpg\",\"template\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('24','1','','','2017-03-25 00:18:22','','11111133333','','1','1','2017-03-26 18:15:21','','0','3','','0','{\"thumb\":\"portal\\/20170325\\/58d543d5d93a1.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170325\\/58d543c38239b.jpg\",\"alt\":\"1486346072993689 (1).jpg\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170325\\/58d543c3e1354.jpg\",\"alt\":\"1486346072993689.jpg\"}]}','8','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('25','1','','','2017-03-25 00:23:32','<p>测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章</p>','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','1','1','2017-03-25 00:23:32','','0','4','','0','{\"thumb\":\"\",\"template\":\"\"}','4','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('26','1','','','2017-03-25 00:23:53','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:19:48','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','7','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('27','1','','','2017-03-25 00:24:07','','111111','公司根植泉州沃土，面向海内外市场，开拓进取，发展壮大，已拥有国家园林古建工程专业承包一级资质和文物保护工程施工一级资质、建筑幕墙装饰二级资质和园林绿化三级资质，并拥有专业配套的石雕公司、木作木雕厂及设计机构，可承建各种规模及类型的仿古建筑工程、文 物保护工程、园林绿化工程。公司精心营造、修复了福建省泉州市佛公司根植泉州沃土，面向海内外市场，开拓进取，发展壮大，已拥有国家园林古建工程专业承包一级资质和文物保护工程施工一级资质、建筑幕墙装饰二级资质和园林绿化三级资质，并拥有专业配套的石雕公司、木作木雕厂及设计机构，可承建各种规模及类型的仿古建筑工程、文 物保护工程、园林绿化工程。公司精心营造、修复了福建省泉州市佛','1','1','2017-03-26 22:25:28','','0','3','','0','{\"thumb\":\"portal\\/20170325\\/58d543d5d93a1.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170325\\/58d543c38239b.jpg\",\"alt\":\"1486346072993689 (1).jpg\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170325\\/58d543c3e1354.jpg\",\"alt\":\"1486346072993689.jpg\"}]}','8','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('28','1','','','2017-03-26 17:56:47','<p>测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章</p>','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','1','1','2017-03-26 17:56:47','','0','4','','0','{\"thumb\":\"\",\"template\":\"\"}','3','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('29','1','','','2017-03-26 17:56:47','<p>测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章</p>','测试文章测试文章测试文章测试文章测试文章测试文章测试文章','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','1','1','2017-03-26 17:56:47','','0','4','','0','{\"thumb\":\"portal\\/20170323\\/58d3916d82f2c.jpg\",\"template\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('30','1','','','2017-03-26 17:56:51','<p>测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章</p>','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','1','1','2017-03-26 17:56:51','','0','4','','0','{\"thumb\":\"\",\"template\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('31','1','','','2017-03-26 17:56:51','<p>测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章</p>','测试文章测试文章测试文章测试文章测试文章测试文章测试文章','测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章测试文章','1','1','2017-03-26 17:56:51','','0','4','','0','{\"thumb\":\"portal\\/20170323\\/58d3916d82f2c.jpg\",\"template\":\"\"}','0','0','0','0');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('32','1','','','2017-03-26 18:52:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:52:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','4','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('33','1','','','2017-03-26 18:52:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:52:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','4','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('34','1','','','2017-03-26 18:52:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:52:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','0','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('35','1','','','2017-03-26 18:52:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:52:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','0','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('36','1','','','2017-03-26 18:52:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:52:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','0','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('37','1','','','2017-03-26 18:52:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:52:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','0','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('38','1','','','2017-03-26 18:52:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:52:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','0','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('39','1','','','2017-03-26 18:52:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:52:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','0','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('40','1','','','2017-03-26 18:52:51','','福建福清崇恩寺','福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺福建福清崇恩寺','1','1','2017-03-26 18:52:51','','0','1','','0','{\"thumb\":\"portal\\/20170324\\/58d53d58517a5.jpg\",\"photo\":[{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d7d76045.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e00\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d8a9359d.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e8c\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d98e2639.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u4e09\"},{\"url\":\"http:\\/\\/www.lygj97.com\\/data\\/upload\\/portal\\/20170324\\/58d53d99587c8.jpg\",\"alt\":\"\\u6587\\u5b57\\u8bf4\\u660e\\u56db\"}]}','2','0','1','1');
INSERT INTO lygj_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('41','1','','','2017-03-26 22:58:26','<p style=\"text-align: center;\"><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://player.youku.com/player.php/sid/XMjUyMDEwMDYyMA==/v.swf\" width=\"420\" height=\"280\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p>','测试视频测试视频测试视频测试视频测试视频测试视频测试视频测试视频','','1','1','2017-03-26 22:59:29','','0','4','','0','{\"thumb\":\"\",\"template\":\"\"}','3','0','0','0');
DROP TABLE IF EXISTS `lygj_role`;
CREATE TABLE `lygj_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
DROP TABLE IF EXISTS `lygj_role_user`;
CREATE TABLE `lygj_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `lygj_route`;
CREATE TABLE `lygj_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('1','portal/page/index?id=1','culture','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('2','portal/page/index?id=2','organization','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('3','portal/page/index?id=3','profile','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('4','portal/list/index?id=3','process','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('5','portal/page/index?id=7','honor','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('6','portal/list/index?id=6','trends','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('7','portal/list/index?id=7','industry','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('8','portal/list/index?id=5','news','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('9','portal/list/index?id=9','stone','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('10','portal/list/index?id=10','woodcarving','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('11','portal/list/index?id=11','mud','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('12','portal/list/index?id=12','plasticclip','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('13','portal/list/index?id=13','paintpainting','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('14','portal/list/index?id=8','construction','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('15','portal/list/index?id=15','domestic','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('16','portal/list/index?id=16','overseas','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('17','portal/list/index?id=17','engineering','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('18','portal/list/index?id=14','demonstration','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('19','portal/list/index?id=19','inheritance','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('20','portal/list/index?id=20','summary','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('21','portal/list/index?id=12','activity','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('22','portal/list/index?id=22','ancientknowledge','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('23','portal/list/index?id=18','ancientculture','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('24','portal/list/index?id=23','video','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('25','portal/page/index?id=4','contactus','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('26','portal/page/index?id=5','joinus','0','1');
INSERT INTO lygj_route ( `id`, `full_url`, `url`, `listorder`, `status` ) VALUES  ('27','portal/article/index','article/:id\\d','0','1');
DROP TABLE IF EXISTS `lygj_slide`;
CREATE TABLE `lygj_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('1','1','1','admin/20170321/58d0054e6b643.png','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('2','1','2','admin/20170321/58d00567e6b8a.png','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('3','2','2015年度福建省“安康杯”竞赛先进班组','admin/20170322/58d2596de50c3.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('4','2','2015年度福建省“安康杯”竞赛先进班组','admin/20170322/58d2597d3a809.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('5','3','关于我们','admin/20170326/58d7df5c534ce.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('6','4','企业历程','admin/20170326/58d7dfe56b4d7.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('7','5','荣誉资质','admin/20170326/58d7e03fc64df.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('8','6','资讯中心','admin/20170326/58d7e0d336bc2.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('9','7','营造工艺','admin/20170326/58d7e25fe9850.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('10','8','工程展示','admin/20170326/58d7e26f668a5.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('11','9','联系我们','admin/20170326/58d7e27f59a70.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('12','10','文章详情','admin/20170326/58d7e2906787a.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('13','11','工程工艺详细','admin/20170326/58d7e2a050efa.jpg','','','','1','0');
INSERT INTO lygj_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('14','12','搜索结果详细','admin/20170326/58d7e2b0186c7.jpg','','','','1','0');
DROP TABLE IF EXISTS `lygj_slide_cat`;
CREATE TABLE `lygj_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('1','幻灯片','slider','首页幻灯片','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('2','荣誉资质','honor','荣誉资质列表','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('3','关于我们广告位','about_ads','关于我们广告位(1005px*242px)','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('4','企业历程广告位','process_ads','企业历程广告位（1005*242）','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('5','荣誉资质广告位','honor_ads','荣誉资质广告位（1005*242）','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('6','资讯中心广告位','news_ads','资讯中心广告位（1005*242）','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('7','营造工艺广告位','gongyi_ads','营造工艺广告位（1005*242）','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('8','工程展示广告位','gongcheng_ads','工程展示广告位（1005*242）','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('9','联系我们广告位','contact_ads','联系我们广告位（1005*242）','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('10','文章详情广告位','article_ads','文章详情广告位（1005*242）','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('11','工程工艺详细广告位','gcgy_ads','工程工艺详细广告位（1005*242）','1');
INSERT INTO lygj_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('12','搜索结果页广告位','search_ads','搜索结果页广告位（1005*242）','1');
DROP TABLE IF EXISTS `lygj_term_relationships`;
CREATE TABLE `lygj_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('1','6','6','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('2','8','3','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('3','9','3','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('4','10','6','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('16','11','14','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('15','12','16','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('7','13','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('8','14','16','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('9','15','17','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('14','16','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('11','17','10','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('17','18','10','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('18','19','10','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('19','20','10','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('20','21','12','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('21','22','10','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('22','23','19','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('23','24','11','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('24','25','20','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('25','26','16','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('40','27','11','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('27','28','7','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('28','29','7','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('29','30','19','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('30','31','19','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('31','32','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('32','33','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('33','34','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('34','35','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('35','36','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('36','37','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('37','38','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('38','39','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('39','40','15','0','1');
INSERT INTO lygj_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('41','41','23','0','1');
DROP TABLE IF EXISTS `lygj_terms`;
CREATE TABLE `lygj_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('10','木雕木作','','gongyi','','8','0','0-8-10','','','','gongyi','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('3','企业历程','','article','','0','0','0-3','','','','course','detail','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('6','企业动态','','article','','5','0','0-5-6','','','','list','detail','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('5','资讯中心','','article','','0','0','0-5','','','','list','detail','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('7','行业资讯','','article','','5','0','0-5-7','','','','list','detail','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('8','营造工艺','','gongyi','','0','0','0-8','','','','gongyi','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('9','石雕石作','','gongyi','','8','0','0-8-9','','','','gongyi','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('11','泥水瓦作','','gongyi','','8','0','0-8-11','','','','gongyi','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('12','堆塑剪贴','','gongyi','','8','0','0-8-12','','','','gongyi','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('13','油漆彩绘','','gongyi','','8','0','0-8-13','','','','gongyi','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('14','工程展示','','product','','0','0','0-14','','','','gongcheng','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('15','国内工程','','product','','14','0','0-14-15','','','','gongcheng','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('16','国外工程','','product','','14','0','0-14-16','','','','gongcheng','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('17','在施工程','','product','','14','0','0-14-17','','','','gongcheng','list_masonry','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('18','古建文化','','article','','0','0','0-18','','','','list','detail','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('19','传承传习','','article','','18','0','0-18-19','','','','list','detail','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('20','技术总结','','article','','18','0','0-18-20','','','','list','detail','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('21','交流活动','','article','','18','0','0-18-21','','','','list','detail','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('22','古建常识','','article','','18','0','0-18-22','','','','list','detail','0','1');
INSERT INTO lygj_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('23','视频中心','','article','','0','0','0-23','','','','list','detail','0','1');
DROP TABLE IF EXISTS `lygj_user_favorites`;
CREATE TABLE `lygj_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `lygj_users`;
CREATE TABLE `lygj_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('1','lygj97','###252f30d696386d8c71df91c239d3d2a9','admin','lygj@lygj97.com','','','0','2000-01-01','','183.253.142.195','2017-03-26 21:55:09','2017-03-19 04:38:10','','1','0','1','0','');
DROP TABLE IF EXISTS `lygj_variable`;
CREATE TABLE `lygj_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '变量ID',
  `variableName` varchar(255) NOT NULL COMMENT '变量名',
  `variableValue` varchar(255) DEFAULT NULL COMMENT '变量值',
  `beizhu` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `listorder` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `variableName` (`variableName`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO lygj_variable ( `id`, `variablename`, `variablevalue`, `beizhu`, `listorder` ) VALUES  ('6','gs_email','http://mail.lygj97.com','企业邮箱','0');
INSERT INTO lygj_variable ( `id`, `variablename`, `variablevalue`, `beizhu`, `listorder` ) VALUES  ('7','address','福建泉州市安溪县城厢镇冬青村中心粮库旁龙亿古建','联系地址','0');
INSERT INTO lygj_variable ( `id`, `variablename`, `variablevalue`, `beizhu`, `listorder` ) VALUES  ('8','tell','0595-00000000','联系电话','0');
INSERT INTO lygj_variable ( `id`, `variablename`, `variablevalue`, `beizhu`, `listorder` ) VALUES  ('9','fax','0595-00000000','传真','0');
INSERT INTO lygj_variable ( `id`, `variablename`, `variablevalue`, `beizhu`, `listorder` ) VALUES  ('10','postcd','362400','邮编','0');
INSERT INTO lygj_variable ( `id`, `variablename`, `variablevalue`, `beizhu`, `listorder` ) VALUES  ('11','jingdu','118.147759','经度','0');
INSERT INTO lygj_variable ( `id`, `variablename`, `variablevalue`, `beizhu`, `listorder` ) VALUES  ('12','weidu','25.064676','维度','0');
INSERT INTO lygj_variable ( `id`, `variablename`, `variablevalue`, `beizhu`, `listorder` ) VALUES  ('13','company_name','泉州龙和古建筑工程有限公司','公司名称','0');
INSERT INTO lygj_variable ( `id`, `variablename`, `variablevalue`, `beizhu`, `listorder` ) VALUES  ('14','email','lygj@lygj97.com','电子邮箱','0');
