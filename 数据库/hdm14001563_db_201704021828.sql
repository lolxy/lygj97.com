/*
Navicat MySQL Data Transfer

Source Server         : hdm14001563.my3w.com
Source Server Version : 50148
Source Host           : hdm14001563.my3w.com:3306
Source Database       : hdm14001563_db

Target Server Type    : MYSQL
Target Server Version : 50148
File Encoding         : 65001

Date: 2017-04-02 18:29:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lygj_ad`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_ad`;
CREATE TABLE `lygj_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lygj_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_asset`
-- ----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of lygj_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_auth_access`;
CREATE TABLE `lygj_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of lygj_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_auth_rule`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of lygj_auth_rule
-- ----------------------------
INSERT INTO `lygj_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/default', null, '分类管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '图片管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '图片管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '图片分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '管理员信息', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '注册邮件模板', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('162', 'Demo', 'admin_url', 'demo/adminindex/index', null, '', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('163', 'Demo', 'admin_url', 'demo/adminindex/last', null, '', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('166', 'Admin', 'admin_url', 'admin/mailer/test', null, '测试邮件', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('167', 'Admin', 'admin_url', 'admin/setting/upload', null, '上传设置', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('168', 'Admin', 'admin_url', 'admin/setting/upload_post', null, '上传设置提交', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('169', 'Portal', 'admin_url', 'portal/adminpost/copy', null, '文章批量复制', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('170', 'Admin', 'admin_url', 'admin/menu/backup_menu', null, '备份菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('171', 'Admin', 'admin_url', 'admin/menu/export_menu_lang', null, '导出后台菜单多语言包', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('172', 'Admin', 'admin_url', 'admin/menu/restore_menu', null, '还原菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('173', 'Admin', 'admin_url', 'admin/menu/getactions', null, '导入新菜单', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('174', 'Admin', 'admin_url', 'admin/variable/index', null, '变量管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('175', 'Portal', 'admin_url', 'portal/adminproduct/index', null, '工程管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('176', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类列表', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('177', 'Portal', 'admin_url', 'portal/admingongyi/index', null, '工艺管理', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('178', 'Portal', 'admin_url', 'portal/adminproduct/recyclebin', null, '工程回收', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('179', 'Portal', 'admin_url', 'portal/adminproduct/restore', null, '工程还原', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('180', 'Portal', 'admin_url', 'portal/adminproduct/clean', null, '彻底删除', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('181', 'Portal', 'admin_url', 'portal/admingongyi/recyclebin', null, '工艺回收', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('182', 'Portal', 'admin_url', 'portal/admingongyi/restore', null, '工艺还原', '1', '');
INSERT INTO `lygj_auth_rule` VALUES ('183', 'Portal', 'admin_url', 'portal/admingongyi/clean', null, '彻底删除', '1', '');

-- ----------------------------
-- Table structure for `lygj_comments`
-- ----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of lygj_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_common_action_log`
-- ----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of lygj_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_guestbook`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of lygj_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_links`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of lygj_links
-- ----------------------------
INSERT INTO `lygj_links` VALUES ('1', 'http://www.lygj97.com', '龙和古建', 'admin/20170331/58de082b1d6e9.png', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `lygj_menu`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of lygj_menu
-- ----------------------------
INSERT INTO `lygj_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '2');
INSERT INTO `lygj_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '0', '评论管理', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `lygj_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('18', '0', 'Portal', 'AdminTerm', 'default', '', '0', '1', '分类管理', '', '', '3');
INSERT INTO `lygj_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '1', '添加分类', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `lygj_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('32', '0', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', 'retweet', '', '6');
INSERT INTO `lygj_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `lygj_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '5');
INSERT INTO `lygj_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '0', '插件管理', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('53', '0', 'Admin', 'Slide', 'default', '', '1', '1', '图片管理', 'image', '', '4');
INSERT INTO `lygj_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '图片管理', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '图片分类', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `lygj_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `lygj_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '0', '第三方登陆', 'leaf', '', '4');
INSERT INTO `lygj_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '1');
INSERT INTO `lygj_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '0', '后台菜单', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `lygj_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '管理员信息', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '0', '邮箱配置', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '注册邮件模板', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('131', '0', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', 'trash', '', '7');
INSERT INTO `lygj_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '0', '用户管理', 'group', '', '10');
INSERT INTO `lygj_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `lygj_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `lygj_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `lygj_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('156', '109', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('166', '127', 'Admin', 'Mailer', 'test', '', '1', '0', '测试邮件', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('167', '109', 'Admin', 'Setting', 'upload', '', '1', '1', '上传设置', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('168', '167', 'Admin', 'Setting', 'upload_post', '', '1', '0', '上传设置提交', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('169', '7', 'Portal', 'AdminPost', 'copy', '', '1', '0', '文章批量复制', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('174', '100', 'Admin', 'Menu', 'backup_menu', '', '1', '0', '备份菜单', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('175', '100', 'Admin', 'Menu', 'export_menu_lang', '', '1', '0', '导出后台菜单多语言包', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('176', '100', 'Admin', 'Menu', 'restore_menu', '', '1', '0', '还原菜单', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('177', '100', 'Admin', 'Menu', 'getactions', '', '1', '0', '导入新菜单', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('187', '1', 'Admin', 'Variable', 'index', '', '1', '1', '变量管理', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('188', '1', 'Portal', 'AdminProduct', 'index', '', '1', '1', '工程管理', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('189', '18', 'Portal', 'AdminTerm', 'index', '', '1', '1', '分类列表', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('190', '1', 'Portal', 'AdminGongyi', 'index', '', '1', '1', '工艺管理', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('191', '32', 'Portal', 'AdminProduct', 'recyclebin', '', '1', '1', '工程回收', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('192', '191', 'Portal', 'AdminProduct', 'restore', '', '1', '0', '工程还原', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('193', '191', 'Portal', 'AdminProduct', 'clean', '', '1', '0', '彻底删除', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('194', '32', 'Portal', 'AdminGongyi', 'recyclebin', '', '1', '1', '工艺回收', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('195', '194', 'Portal', 'AdminGongyi', 'restore', '', '1', '0', '工艺还原', '', '', '0');
INSERT INTO `lygj_menu` VALUES ('196', '194', 'Portal', 'AdminGongyi', 'clean', '', '1', '0', '彻底删除', '', '', '0');

-- ----------------------------
-- Table structure for `lygj_nav`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_nav`;
CREATE TABLE `lygj_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `label_en` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of lygj_nav
-- ----------------------------
INSERT INTO `lygj_nav` VALUES ('1', '1', '0', '首页', 'Home', '', 'home', '', '1', '0', '0-1');
INSERT INTO `lygj_nav` VALUES ('2', '1', '0', '关于我们', 'About', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-2');
INSERT INTO `lygj_nav` VALUES ('3', '1', '0', '资讯中心', 'News', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '1', '0', '0-3');
INSERT INTO `lygj_nav` VALUES ('5', '2', '0', '工程展示', 'Engineer', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '0', '0-5');
INSERT INTO `lygj_nav` VALUES ('4', '1', '0', '营造工艺', 'Construction', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"8\";}}', '', '1', '0', '0-4');
INSERT INTO `lygj_nav` VALUES ('6', '2', '0', '古建文化', 'Culture', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"18\";}}', '', '1', '0', '0-6');
INSERT INTO `lygj_nav` VALUES ('7', '2', '0', '视频中心', 'Video', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"23\";}}', '', '1', '0', '0-7');
INSERT INTO `lygj_nav` VALUES ('8', '2', '0', '联系我们', 'Contact', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '1', '0', '0-8');
INSERT INTO `lygj_nav` VALUES ('9', '3', '0', '网站首页', 'Home', '', 'home', '', '1', '0', '0-9');
INSERT INTO `lygj_nav` VALUES ('10', '3', '0', '关于我们', 'About', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-10');
INSERT INTO `lygj_nav` VALUES ('11', '3', '0', '资讯中心', 'News', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '1', '0', '0-11');
INSERT INTO `lygj_nav` VALUES ('12', '3', '0', '营造工艺', 'Construction', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"8\";}}', '', '1', '0', '0-12');
INSERT INTO `lygj_nav` VALUES ('13', '3', '0', '工程展示', 'Engineering', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '0', '0-13');
INSERT INTO `lygj_nav` VALUES ('14', '3', '0', '古建文化', 'Ancient Culture', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"18\";}}', '', '1', '0', '0-14');
INSERT INTO `lygj_nav` VALUES ('15', '3', '0', '视频中心', 'Video', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"23\";}}', '', '1', '0', '0-15');
INSERT INTO `lygj_nav` VALUES ('16', '3', '0', '联系我们', 'Contact Us', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '1', '0', '0-16');
INSERT INTO `lygj_nav` VALUES ('17', '4', '0', '关于我们', 'About', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-17');
INSERT INTO `lygj_nav` VALUES ('18', '4', '0', '联系我们', 'Contact Us', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '1', '0', '0-18');
INSERT INTO `lygj_nav` VALUES ('19', '4', '0', '工程展示', 'Engineering', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '0', '0-19');
INSERT INTO `lygj_nav` VALUES ('20', '4', '0', '视频中心', 'Video', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"23\";}}', '', '1', '0', '0-20');
INSERT INTO `lygj_nav` VALUES ('21', '1', '2', '企业文化', 'Corporate Culture', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2-21');
INSERT INTO `lygj_nav` VALUES ('22', '1', '2', '组织机构', 'Organization', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-2-22');
INSERT INTO `lygj_nav` VALUES ('23', '1', '2', '公司简介', 'Company Profile', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-2-23');
INSERT INTO `lygj_nav` VALUES ('24', '1', '2', '企业历程', 'Company History', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '0', '0', '0-2-24');
INSERT INTO `lygj_nav` VALUES ('25', '1', '2', '荣誉资质', 'Honor', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"7\";}}', '', '1', '0', '0-2-25');
INSERT INTO `lygj_nav` VALUES ('26', '1', '3', '企业动态', 'Company News', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}', '', '1', '0', '0-3-26');
INSERT INTO `lygj_nav` VALUES ('27', '1', '3', '行业资讯', 'Industry', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"7\";}}', '', '1', '0', '0-3-27');
INSERT INTO `lygj_nav` VALUES ('28', '1', '4', '石雕石作', 'Stone Carving', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"9\";}}', '', '1', '0', '0-4-28');
INSERT INTO `lygj_nav` VALUES ('29', '1', '4', '木雕木作', 'Wood Carving', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"10\";}}', '', '1', '0', '0-4-29');
INSERT INTO `lygj_nav` VALUES ('30', '1', '4', '泥水瓦作', 'Slurry Tile', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"11\";}}', '', '1', '0', '0-4-30');
INSERT INTO `lygj_nav` VALUES ('31', '1', '4', '堆塑剪贴', 'Plastic Clip', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"12\";}}', '', '1', '0', '0-4-31');
INSERT INTO `lygj_nav` VALUES ('32', '1', '4', '油漆彩绘', 'Paint Painting', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"13\";}}', '', '1', '0', '0-4-32');
INSERT INTO `lygj_nav` VALUES ('33', '2', '5', '国内工程', 'Domestic Engineering', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"15\";}}', '', '1', '0', '0-5-33');
INSERT INTO `lygj_nav` VALUES ('34', '2', '5', '国外工程', 'Overseas Projects', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"16\";}}', '', '1', '0', '0-5-34');
INSERT INTO `lygj_nav` VALUES ('35', '2', '5', '在施工程', 'Engineering', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"17\";}}', '', '1', '0', '0-5-35');
INSERT INTO `lygj_nav` VALUES ('36', '2', '6', '传承传习', 'Inheritance', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"19\";}}', '', '1', '0', '0-6-36');
INSERT INTO `lygj_nav` VALUES ('37', '2', '6', '技术总结', 'Technical Summary', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"20\";}}', '', '1', '0', '0-6-37');
INSERT INTO `lygj_nav` VALUES ('38', '2', '6', '交流活动', 'Exchange Activity', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"21\";}}', '', '1', '0', '0-6-38');
INSERT INTO `lygj_nav` VALUES ('39', '2', '6', '古建常识', 'Ancient Knowledge', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"22\";}}', '', '1', '0', '0-6-39');
INSERT INTO `lygj_nav` VALUES ('42', '2', '8', '联系我们', 'Contact Us', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '1', '0', '0-8-42');
INSERT INTO `lygj_nav` VALUES ('43', '2', '8', '加入我们', 'Join Us', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '1', '0', '0-8-43');
INSERT INTO `lygj_nav` VALUES ('44', '2', '5', '工程效果图', 'Engineering renderings', '', 'http://www.lygj97.com/article/115/cid/14.html', '', '1', '0', '0-5-44');

-- ----------------------------
-- Table structure for `lygj_nav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_nav_cat`;
CREATE TABLE `lygj_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of lygj_nav_cat
-- ----------------------------
INSERT INTO `lygj_nav_cat` VALUES ('1', '主导航左侧', '1', '主导航');
INSERT INTO `lygj_nav_cat` VALUES ('2', '主导航右侧', '0', '主导航');
INSERT INTO `lygj_nav_cat` VALUES ('3', '手机导航', '0', '手机导航');
INSERT INTO `lygj_nav_cat` VALUES ('4', '底部导航', '0', '底部导航');

-- ----------------------------
-- Table structure for `lygj_oauth_user`
-- ----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of lygj_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_options`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_options`;
CREATE TABLE `lygj_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of lygj_options
-- ----------------------------
INSERT INTO `lygj_options` VALUES ('1', 'member_email_active', '{\"title\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.lygj97.com\\\" target=\\\"_self\\\" textvalue=\\\"\\u9f99\\u548c\\u53e4\\u5efa\\\">\\u9f99\\u548c\\u53e4\\u5efa<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662f\\u9f99\\u548c\\u53e4\\u5efa\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; \\u9f99\\u548c\\u53e4\\u5efa \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `lygj_options` VALUES ('6', 'site_options', '{\"site_name\":\"\\u9f99\\u548c\\u53e4\\u5efa\",\"site_name_en\":\"Lung He Ancient Architectural\",\"site_host\":\"http:\\/\\/www.lygj97.com\\/\",\"site_logo\":\"admin\\/20170401\\/58df3171d0883.png\",\"site_erweima\":\"admin\\/20170401\\/58df27abb8869.jpg\",\"site_admin_url_password\":\"\",\"site_tpl\":\"lygj97\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\\u95fdICP\\u590717004417\\u53f7-1\",\"site_admin_email\":\"lygj@lygj97.com\",\"site_tongji\":\"\",\"site_copyright\":\"copyrught 2016 - 2018 \\u6cc9\\u5dde\\u9f99\\u548c\\u53e4\\u5efa\\u7b51\\u5de5\\u7a0b\\u6709\\u9650\\u516c\\u53f8 lygj97.com  all rights reserved\",\"site_copyright_en\":\"copyrught 2016 - 2018 Lung He Ancient Architectural lygj97.com  all rights reserved\",\"site_seo_title\":\"\\u9f99\\u548c\\u53e4\\u5efa\\uff08\\u9f99\\u4ebf\\u53e4\\u5efa\\uff09\",\"site_seo_title_en\":\"Home\",\"site_seo_keywords\":\"\\u9f99\\u548c\\u53e4\\u5efa,\\u9f99\\u4ebf\\u53e4\\u5efa,\\u53e4\\u5efa\\u7b51,\\u6728\\u96d5\\u5382,\\u53e4\\u5efa,\\u5bab\\u6bbf,\\u5e99\\u5b87\",\"site_seo_keywords_en\":\"\",\"site_seo_description\":\"\\u9f99\\u548c\\u53e4\\u5efa,\\u9f99\\u548c\\u53e4\\u5efa,\\u6728\\u96d5\\u5382,\\u53e4\\u5efa\\u7b51,\\u53e4\\u5efa,\\u5bab\\u6bbf,\\u5e99\\u5b87\",\"urlmode\":\"2\",\"html_suffix\":\".html\",\"comment_time_interval\":\"60\"}', '1');
INSERT INTO `lygj_options` VALUES ('7', 'cmf_settings', '{\"banned_usernames\":\"\",\"storage\":{\"type\":\"Qiniu\",\"Qiniu\":{\"accessKey\":\"dA8cRLd97pGHbixKqZUzdrCDPiutI4G-kfUwXx36\",\"secretKey\":\"Na0vEsGD5A2wjos42ioduEJOL2-f2lVCE6ytu0km\",\"upHost\":\"http:\\/\\/up.qiniu.com\",\"setting\":{\"protocol\":\"http\",\"enable_picture_protect\":\"1\",\"style_separator\":\"!\",\"styles\":{\"watermark\":\"watermark\",\"avatar\":\"watermark\",\"thumbnail120x120\":\"thumbnail120x120\",\"thumbnail300x300\":\"thumbnail300x300\",\"thumbnail640x640\":\"thumbnail640x640\",\"thumbnail1080x1080\":\"thumbnail1080x1080\"}},\"domain\":\"imgs.lygj97.com\",\"bucket\":\"lygj1997\"}}}', '1');
INSERT INTO `lygj_options` VALUES ('8', 'cdn_settings', '{\"cdn_static_root\":\"\"}', '1');

-- ----------------------------
-- Table structure for `lygj_plugins`
-- ----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of lygj_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_posts`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_posts`;
CREATE TABLE `lygj_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_keywords_en` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_source_en` varchar(150) NOT NULL COMMENT '转载文章的来源(英文)',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_content_en` longtext NOT NULL COMMENT 'post内容（英文）',
  `post_title` text COMMENT 'post标题',
  `post_title_en` text NOT NULL COMMENT 'post标题(英文)',
  `post_excerpt` text COMMENT 'post摘要',
  `post_excerpt_en` text NOT NULL COMMENT 'post摘要(英文)',
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
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of lygj_posts
-- ----------------------------
INSERT INTO `lygj_posts` VALUES ('1', '1', '', '', null, '', '2017-03-20 01:01:20', '<p><span style=\"font-size: 36px; color: rgb(192, 0, 0);\"><strong>传承榫卯，敢于创新，质量第一，信誉第一</strong></span></p>', '', '企业文化', 'Corporate Culture', '', '', '1', '1', '2017-03-20 01:00:51', null, '0', '2', '', '0', '{\"template\":\"about\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('72', '1', '', '', null, '', '2017-03-31 23:41:23', '', '', '南安显灵殿', '', '', '', '1', '1', '2017-03-31 23:44:53', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de78d138351.JPG\",\"photo\":[{\"url\":\"portal\\/20170331\\/58de78ec44b8b.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf1\"},{\"url\":\"portal\\/20170331\\/58de78f0cc98a.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf2\"},{\"url\":\"portal\\/20170331\\/58de78f5c6fb8.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf3\"},{\"url\":\"portal\\/20170331\\/58de78fa2125a.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf4\"},{\"url\":\"portal\\/20170331\\/58de78feb1dbf.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf5\"},{\"url\":\"portal\\/20170331\\/58de7902ec942.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf6\"},{\"url\":\"portal\\/20170331\\/58de7908302c0.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf7\"},{\"url\":\"portal\\/20170331\\/58de790bbe83f.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf8\"},{\"url\":\"portal\\/20170331\\/58de791053dfb.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf9\"},{\"url\":\"portal\\/20170331\\/58de7918dea24.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf10\"},{\"url\":\"portal\\/20170331\\/58de79214fa48.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf11\"},{\"url\":\"portal\\/20170331\\/58de79266943d.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf12\"},{\"url\":\"portal\\/20170331\\/58de7930315cf.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf13\"},{\"url\":\"portal\\/20170331\\/58de79343eb17.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf14\"},{\"url\":\"portal\\/20170331\\/58de7939721d4.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf15\"},{\"url\":\"portal\\/20170331\\/58de793f79c85.JPG\",\"alt\":\"\\u5357\\u5b89\\u663e\\u7075\\u6bbf16\"}]}', '56', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('2', '1', '', '', null, '', '2017-03-20 01:02:44', '<p style=\"text-align: center;\"><img src=\"http://www.lygj97.com/data/upload/ueditor/20170322/58d25687701ed.jpg\" title=\"1457951026136892.jpg\" alt=\"1457951026136892.jpg\" style=\"text-align: center; white-space: normal;\"/></p>', '&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://www.lygj97.com/data/upload/ueditor/20170322/58d25687701ed.jpg&quot; title=&quot;1457951026136892.jpg&quot; alt=&quot;1457951026136892.jpg&quot; style=&quot;text-align: center; white-space: normal;&quot;/&gt;&lt;/p&gt;', '组织机构', 'Organization', '', '', '1', '1', '2017-03-20 01:02:37', null, '0', '2', '', '0', '{\"template\":\"about\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('3', '1', '龙亿古建,龙和古建,木雕厂', 'Dragon Dragon billion ancient architecture, ancient architecture, wood carving factory', null, '', '2017-03-20 01:03:00', '<p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, \" microsoft=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;福建省安溪县龙亿古建木雕厂，位于福建省泉州市安溪县城厢镇德苑工业区冬青村中心粮库。木雕厂成立于2008年，是一家个人独资企业。企业前身是在马来西亚创建于1997年中马龙亿古建艺术文化有限公司。工厂主要承接国内外的园林、寺、庙的建设及装修工程，同时生产、销售仿古、园林寺庙、祖厝、酒楼、公寓、中、欧式等古建雕刻艺术品。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, \" microsoft=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工厂由五人开始从租住200多平方米民房加工场地，在安溪县人民政府支持下发展到目前拥有10亩自建园区，现有中国各地高技术木雕师傅、产品研究开发技术员、设计绘图技术员及生产员工一百多人。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, \" microsoft=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工厂本着“传承榫卯，敢于创新，质量第一，信誉第一”的经营理念，工程准时完工，产品如期交货，实现了客户与厂家双赢的目标。产品以人工精雕刻为主，主要销往马来西亚、印度尼西亚、新加坡等东南亚国家、台湾地区及国内各省份。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, \" microsoft=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工厂主要成绩有承建国外：马来西亚文良港《檺林宫》，台湾嘉义《代天府》国内主要承建了：安溪清水岩《海会院》、《文化长廊》。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, \" microsoft=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未来工厂将致力于古建筑项目的设计、研发、生产、施工建设一体化，争取五年之内发展成为同行业的龙头企业。</span></p><p style=\"text-align: right; line-height: 2em;\"><span style=\"font-family: 微软雅黑, \" microsoft=\"\">&nbsp;&nbsp;福建省安溪县龙亿古建木雕厂</span></p><p style=\"text-align: right; line-height: 2em;\"><span style=\"font-family: 微软雅黑, \" microsoft=\"\"><br/></span></p><p style=\"text-align: right; line-height: 2em;\"><span style=\"font-family: 微软雅黑, \" microsoft=\"\"><img src=\"http://imgs.lygj97.com/ueditor/20170331/58ddfd99cd0f6.JPG!watermark\" title=\"DSC_8873.JPG\" alt=\"DSC_8873.JPG\" style=\"white-space: normal;\"/></span></p>', '&lt;p style=&quot;line-height: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;Fujian province Anxi County Dragon billion ancient wood carving factory, located in Chengxiang Anxi County of Quanzhou City, Fujian Province town of Tak Beiyuan Industrial Zone Holly Village Central depot. Wood carving factory was founded in 2008, is a wholly owned enterprise. Enterprise is the predecessor in&lt;/span&gt;&lt;st1:country-region w:st=&quot;on&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Malaysia&lt;/span&gt;&lt;/st1:country-region&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;was founded in 1997 in Malone billion ancient art culture Co. ltd.. The factory to undertake major construction and renovation projects at home and abroad of the garden, temple, temple, production and sale of antique gardens, temples, ancestral home, restaurants, apartments, etc. at the same time, the European ancient carving art.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;The factory by five start processing from the rental of more than and 200 square meters of houses site, Anxi County People&amp;#39;s Government in support of the development of the park has 10 acres of self built, existing China around the high technology product research and development, wood carving master technicians, design technicians and production staff of more than and 100 people.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;The factory is in line with the business philosophy of &amp;quot;inheriting the tenon and mortise, dare to innovate, quality first, credit first&amp;quot;, the project is completed on time, the products are delivered on schedule, and the goal of win-win between customers and manufacturers is realized. Products are mainly based on artificial carving, mainly sold to&lt;/span&gt;&lt;st1:country-region w:st=&quot;on&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Malaysia&lt;/span&gt;&lt;/st1:country-region&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;,&lt;/span&gt;&lt;st1:country-region w:st=&quot;on&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Indonesia&lt;/span&gt;&lt;/st1:country-region&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;,&lt;/span&gt;&lt;st1:country-region w:st=&quot;on&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Singapore&lt;/span&gt;&lt;/st1:country-region&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;and other Southeast Asian countries,&lt;/span&gt;&lt;st1:country-region w:st=&quot;on&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Taiwan&lt;/span&gt;&lt;/st1:country-region&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;and the provinces.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;The main results are: the construction of factories abroad Malaysia setapak &amp;quot;Gao Lin Palace&amp;quot;, Taiwan Chiayi &amp;quot;Tianfu&amp;quot; construction of the main domestic generation: the &amp;quot;Anxi academy&amp;quot;, &amp;quot;sea cultural corridor&amp;quot;.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;The factory will be committed to the future of the ancient building project design, development, production, construction and integration, for five years to develop into a leading enterprise in the same industry.&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: right; line-height: 2em;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;Fujian province Anxi County Dragon billion ancient wood carving factory&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '公司简介', 'Company Profile', '福建省安溪县龙亿古建木雕厂，位于福建省泉州市安溪县城厢镇德苑工业区冬青村中心粮库。木雕厂成立于2008年，是一家个人独资企业。企业前身是在马来西亚创建于1997年中马龙亿古建艺术文化有限公司。工厂主要承接国内外的园林、寺、庙的建设及装修工程，同时生产、销售仿古、园林寺庙、祖厝、酒楼、公寓、中、欧式等古建雕刻艺术品。', 'Fujian province Anxi County Dragon billion ancient wood carving factory, located in Chengxiang Anxi County of Quanzhou City, Fujian Province town of Tak Beiyuan Industrial Zone Holly Village Central depot. Wood carving factory was founded in 2008, is a wholly owned enterprise. Enterprise is the predecessor inMalaysiawas founded in 1997 in Malone billion ancient art culture Co. ltd.. The factory to undertake major construction and renovation projects at home and abroad of the garden, temple, temple, production and sale of antique gardens, temples, ancestral home, restaurants, apartments, etc. at the same time, the European ancient carving art.', '1', '1', '2017-03-20 01:02:53', null, '0', '2', '', '0', '{\"template\":\"about\",\"thumb\":\"portal\\/20170331\\/58de03c5bb526.jpg\"}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('4', '1', '', '', null, '', '2017-03-20 01:03:25', '', '', '联系我们', '', '', '', '1', '1', '2017-03-20 01:03:01', null, '0', '2', '', '0', '{\"template\":\"contact\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('5', '1', '', '', null, '', '2017-03-20 01:03:37', '<p style=\"font-family: &#39;Microsoft YaHei&#39;;font-size: 12px;white-space: normal;text-align: center\"><span style=\"color: rgb(0, 0, 0); font-size: 20px;\"><strong>泉州龙和古建筑工程有限公司招聘启事</strong></span></p><p style=\"font-family: \" microsoft=\"\" font-size:=\"\" white-space:=\"\" line-height:=\"\"><span style=\"color: rgb(0, 0, 0); font-size: 20px;\">暂无招聘信息</span><br/></p>', '', '加入我们', '', '', '', '1', '1', '2017-03-20 01:03:26', null, '0', '2', '', '0', '{\"template\":\"about\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('114', '1', '', '', '龙和古建', '', '2017-04-01 01:49:22', '<p style=\"text-align: center;\"><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"https://imgcache.qq.com/tencentvideo_v1/playerv3/TPout.swf?max_age=86400&v=20161117&vid=u0389xgwm6r&auto=0\" width=\"420\" height=\"280\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p>', '', '龙和古建竣工剪彩仪式（视频）', '', '', '', '1', '1', '2017-04-01 01:50:45', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de96bb5d11b.jpg\",\"template\":\"\"}', '7', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('115', '1', '', '', null, '', '2017-04-02 17:58:21', '', '', '工程效果图', '', '', '', '1', '1', '2017-04-02 17:59:37', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170402\\/58e0cb6a91c40.jpg\",\"photo\":[{\"url\":\"portal\\/20170402\\/58e0cb7adfcb4.jpg\",\"alt\":\"\\u6210\\u90fd\\u5357\\u5b89\\u5546\\u4f1a\\u6e05\\u6c34\\u5ca9\\u5206\\u6bbf\\u6548\\u679c\\u56fe\\u6700\\u65b0.jpg\"},{\"url\":\"portal\\/20170402\\/58e0cb7b45762.jpg\",\"alt\":\"\\u6aba\\u6797\\u5bab\\u6548\\u679c\\u56fe.jpg\"},{\"url\":\"portal\\/20170402\\/58e0cb7d8f906.jpg\",\"alt\":\"\\u664b\\u6c5f\\u6148\\u6d4e\\u5e99\\u6548\\u679c\\u56fe20161109.jpg\"},{\"url\":\"portal\\/20170402\\/58e0cb7fa32ed.jpg\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u805a\\u5c71\\u5e99\\u6548\\u679c\\u56fe.jpg\"},{\"url\":\"portal\\/20170402\\/58e0cb81695b1.jpg\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u592a\\u516c\\u6bbf\\u6548\\u679c.jpg\"}]}', '6', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('116', '1', '', '', null, '', '2017-04-02 18:03:28', '', '', '公寓精装木雕', '', '', '', '1', '1', '2017-04-02 18:07:34', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170402\\/58e0cc8ba61fc.JPG\",\"photo\":[{\"url\":\"portal\\/20170402\\/58e0cc9af10fe.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d51\"},{\"url\":\"portal\\/20170402\\/58e0cc9f8fcb6.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d52\"},{\"url\":\"portal\\/20170402\\/58e0cca3b909d.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d53\"},{\"url\":\"portal\\/20170402\\/58e0cca8ea219.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d54\"},{\"url\":\"portal\\/20170402\\/58e0ccadab473.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d55\"},{\"url\":\"portal\\/20170402\\/58e0ccb2a2d86.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d56\"},{\"url\":\"portal\\/20170402\\/58e0ccb497be5.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d57\"},{\"url\":\"portal\\/20170402\\/58e0ccb9758b1.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d58\"},{\"url\":\"portal\\/20170402\\/58e0ccbb44bf7.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d59\"},{\"url\":\"portal\\/20170402\\/58e0ccbf12d52.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d510\"},{\"url\":\"portal\\/20170402\\/58e0ccc21a63a.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d511\"},{\"url\":\"portal\\/20170402\\/58e0cccab3996.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d512\"},{\"url\":\"portal\\/20170402\\/58e0ccd30f7e8.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d513\"},{\"url\":\"portal\\/20170402\\/58e0ccd8cc2f0.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d514\"},{\"url\":\"portal\\/20170402\\/58e0ccdde8ee3.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d515\"},{\"url\":\"portal\\/20170402\\/58e0cce32801a.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d516\"},{\"url\":\"portal\\/20170402\\/58e0cce868c9c.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d517\"},{\"url\":\"portal\\/20170402\\/58e0cced5421b.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d518\"},{\"url\":\"portal\\/20170402\\/58e0ccf26472e.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d519\"},{\"url\":\"portal\\/20170402\\/58e0ccf7c58e3.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d520\"},{\"url\":\"portal\\/20170402\\/58e0ccfc96a4e.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d521\"},{\"url\":\"portal\\/20170402\\/58e0cd0164931.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d522\"},{\"url\":\"portal\\/20170402\\/58e0cd06097f8.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d523\"},{\"url\":\"portal\\/20170402\\/58e0cd0a9768f.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d524\"},{\"url\":\"portal\\/20170402\\/58e0cd103210a.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d525\"},{\"url\":\"portal\\/20170402\\/58e0cd156ef38.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d526\"},{\"url\":\"portal\\/20170402\\/58e0cd259678d.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d527\"},{\"url\":\"portal\\/20170402\\/58e0cd26dd35b.JPG\",\"alt\":\"\\u516c\\u5bd3\\u7cbe\\u88c5\\u6728\\u96d528\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('117', '1', '', '', null, '', '2017-04-02 18:07:48', '', '', '南安檺林宫', '', '', '', '1', '1', '2017-04-02 18:13:11', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170402\\/58e0ce738370b.JPG\",\"photo\":[{\"url\":\"portal\\/20170402\\/58e0ce94e12ee.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab1\"},{\"url\":\"portal\\/20170402\\/58e0ce9741c63.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab2\"},{\"url\":\"portal\\/20170402\\/58e0ce996c566.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab3\"},{\"url\":\"portal\\/20170402\\/58e0ce9b86f1a.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab4\"},{\"url\":\"portal\\/20170402\\/58e0ce9da50e8.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab5\"},{\"url\":\"portal\\/20170402\\/58e0ce9fd4e18.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab6\"},{\"url\":\"portal\\/20170402\\/58e0cea24e3ca.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab7\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('118', '1', '', '', null, '', '2017-04-02 18:13:18', '', '', '南安檺林宫', '', '', '', '1', '1', '2017-04-02 18:14:44', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170402\\/58e0cec7cb972.JPG\",\"photo\":[{\"url\":\"portal\\/20170402\\/58e0cee7236ab.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab1\"},{\"url\":\"portal\\/20170402\\/58e0cee7cf848.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab2\"},{\"url\":\"portal\\/20170402\\/58e0ceea197ab.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab3\"},{\"url\":\"portal\\/20170402\\/58e0ceeb59dee.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab4\"},{\"url\":\"portal\\/20170402\\/58e0ceed06c73.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab5\"},{\"url\":\"portal\\/20170402\\/58e0ceee81635.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab6\"},{\"url\":\"portal\\/20170402\\/58e0ceefd032a.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab7\"},{\"url\":\"portal\\/20170402\\/58e0cef1213e0.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab8\"},{\"url\":\"portal\\/20170402\\/58e0cef3585c8.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab9\"},{\"url\":\"portal\\/20170402\\/58e0cef55fed5.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab10\"},{\"url\":\"portal\\/20170402\\/58e0cef7241f2.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab11\"},{\"url\":\"portal\\/20170402\\/58e0cef8940ce.JPG\",\"alt\":\"\\u5357\\u5b89\\u6aba\\u6797\\u5bab12\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('119', '1', '', '', null, '', '2017-04-02 18:15:33', '', '', '布袋和尚', '', '', '', '1', '1', '2017-04-02 18:16:15', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170402\\/58e0cf51a8262.JPG\",\"photo\":[{\"url\":\"portal\\/20170402\\/58e0cf640dfaf.JPG\",\"alt\":\"\\u5e03\\u888b\\u548c\\u5c1a\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('120', '1', '', '', null, '', '2017-04-02 18:16:38', '', '', '漳浦瓦作项目', '', '', '', '1', '1', '2017-04-02 18:17:47', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170402\\/58e0cfab3324c.JPG\",\"photo\":[{\"url\":\"portal\\/20170402\\/58e0cfbc8d4d5.JPG\",\"alt\":\"\\u6f33\\u6d66\\u74e6\\u4f5c\\u9879\\u76ee1\"},{\"url\":\"portal\\/20170402\\/58e0cfbd9da1e.JPG\",\"alt\":\"\\u6f33\\u6d66\\u74e6\\u4f5c\\u9879\\u76ee2\"},{\"url\":\"portal\\/20170402\\/58e0cfbf924dc.JPG\",\"alt\":\"\\u6f33\\u6d66\\u74e6\\u4f5c\\u9879\\u76ee3\"},{\"url\":\"portal\\/20170402\\/58e0cfc113470.JPG\",\"alt\":\"\\u6f33\\u6d66\\u74e6\\u4f5c\\u9879\\u76ee4\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('121', '1', '', '', null, '', '2017-04-02 18:17:50', '', '', '漳浦石作项目', '', '', '', '1', '1', '2017-04-02 18:19:32', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170402\\/58e0cfdf970b4.JPG\",\"photo\":[{\"url\":\"portal\\/20170402\\/58e0cff5dfc5d.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee1\"},{\"url\":\"portal\\/20170402\\/58e0cff77895b.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee2\"},{\"url\":\"portal\\/20170402\\/58e0cffae4376.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee3\"},{\"url\":\"portal\\/20170402\\/58e0cffe68773.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee4\"},{\"url\":\"portal\\/20170402\\/58e0d00267c05.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee5\"},{\"url\":\"portal\\/20170402\\/58e0d0049f925.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee6\"},{\"url\":\"portal\\/20170402\\/58e0d0089ccb3.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee7\"},{\"url\":\"portal\\/20170402\\/58e0d009e3ba0.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee8\"},{\"url\":\"portal\\/20170402\\/58e0d00b87bfb.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee9\"},{\"url\":\"portal\\/20170402\\/58e0d00e1c3a5.JPG\",\"alt\":\"\\u6f33\\u6d66\\u77f3\\u4f5c\\u9879\\u76ee10\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('122', '1', '', '', null, '', '2017-04-02 18:19:35', '', '', '油漆彩绘工艺', '', '', '', '1', '1', '2017-04-02 18:20:33', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170402\\/58e0d05b53ce0.jpg\",\"photo\":[{\"url\":\"portal\\/20170402\\/58e0d064b8b59.jpg\",\"alt\":\"\\u6cb9\\u6f06\\u5f69\\u7ed8\\u5de5\\u827a1\"},{\"url\":\"portal\\/20170402\\/58e0d0663950b.jpg\",\"alt\":\"\\u6cb9\\u6f06\\u5f69\\u7ed8\\u5de5\\u827a2\"},{\"url\":\"portal\\/20170402\\/58e0d06846e3c.jpg\",\"alt\":\"\\u6cb9\\u6f06\\u5f69\\u7ed8\\u5de5\\u827a3\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('7', '1', '', '', null, '', '2017-03-20 22:11:14', '', '', '荣誉资质', 'Honor', '', '', '1', '1', '2017-03-20 22:10:58', null, '0', '2', '', '0', '{\"template\":\"honor\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('67', '1', '', '', '闽南日报', '', '2017-03-31 22:29:30', '<p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">3月19日起，在漳州市图书馆一楼记艺展厅开展的《阿嬷的厝——闽南古建筑木雕展》，雕梁画栋、镌花刻鸟、砖石浮雕，户对、斗拱、雀替、额枋等富有闽南特色的古建筑木雕，吸引了观众的眼球，唤醒了人们对闽南古厝的回忆。参观者对此展览给予很高的评价，感叹：“若无古建筑，何处觅乡愁。”</p><p style=\"text-align:center;margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\"><img src=\"http://imgs.lygj97.com/ueditor/20170331/58de67e29bb11.jpg!watermark\" style=\"border: none;\"/></p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　此次展出的124件闽南古建筑木雕藏品，有93件出自漳浦民间古建筑木雕收藏爱好者林江富的手。1988年出生的林江富显得比实际年龄来得成熟、稳重。他毕业于厦门大学建筑系，如今是漳州科技学院建筑专业的教师，创建有自己的装饰设计工作室。2014年，他辞去上海的一家全国知名建筑企业的高薪工作，回到家乡漳浦参与设计漳浦多个建筑及景观工程项目，参与设计的漳浦美丽乡村建设项目获得好评。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　“在从事景观建设的过程中，特别是从事漳浦美丽乡村的建设中，我深刻地体会到漳浦的每一个乡村，每一座老宅，每一方碑刻，都有沧桑的故事、厚重的历史，让我沉迷不已。”林江富一听说哪里古厝有拆迁，他就会第一时间赶过去察看。3年多来，他下乡“淘宝”收藏闽南古建筑木雕，从“户对”到“斗拱”，从“门板”到“额枋”，再到印模具、木篮等日常生活用品，他都不轻易放过。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　对于闽南古建筑构件，林江富有一种迫切的责任感和使命感。“随着城市化进程的加快，闽南古建筑的数量已经越来越少，收集古建筑石木构件和各类雕刻品，主要是想让古韵得以延续，让更多现代人和我们的儿孙辈看到我们的优秀文化和祖先的精湛工艺。”这是林江富走上收藏之路的初衷。而更为难得的是，在收藏古建筑构件的路上，林江富做的不仅仅是收藏，他通过自己教师的身份，通过微信等新兴媒体，通过受邀开设讲座，将闽南古建筑文化进行挖掘、记录，再进行传播，甚至将作品以画画、文章、手绘明信片等形式将美丽家乡形象推广给自己全国的粉丝，分享他与家乡的美丽故事。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　当下，林江富正在跟漳浦有关部门协商，准备开辟一个闽南古建筑文化的展览馆，将他所收藏的物件展览出来，让更多的人了解、欣赏闽南古建筑文化，把闽南古建筑文化传承下去。林江富说：“收藏的意义在于展览，展览的精髓在于呈现与传承，我所做的一切就是要将我们的闽南古建筑文化发扬光大。”(记者庄文剑通讯员林惠卿严峥文/图)</p>', '', '漳州市图书馆举办闽南古建筑木雕展', '', '3月19日起，在漳州市图书馆一楼记艺展厅开展的《阿嬷的厝——闽南古建筑木雕展》，雕梁画栋、镌花刻鸟、砖石浮雕，户对、斗拱、雀替、额枋等富有闽南特色的古建筑木雕，吸引了观众的眼球，唤醒了人们对闽南古厝的回忆。参观者对此展览给予很高的评价，感叹：“若无古建筑，何处觅乡愁。”', '', '1', '1', '2017-03-31 22:31:12', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de6826bf200.jpg\",\"template\":\"\"}', '8', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('66', '1', '', '', '北京日报', '', '2017-03-31 22:27:20', '<p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">北部長城文化帶、西部西山文化帶和東部運河文化帶將逐漸亮出來。北京市文物局昨天發布消息：今年年內，本市80余處古建將大修，四分之一扎堆兒在三個文化帶上，其中圓明園考古及大宮門修繕、香山二十八景、懷柔箭扣長城、通州潞城考古等項目將繼續推動。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　市文物局局長舒小峰說：“文物修繕后如何轉化成社會效益，一直是瓶頸。從今年起，文物部門將聯合發展改革、規劃、園林和交通等部門，發揮各家優勢，嘗試逐步引入市場機制，讓文物活起來，用歷史說話。”</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　副中心核心區文物不拆不改</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　“今后再也不是保護與建設必須二選其一。”市文物局新聞發言人、副局長於平介紹，以通州考古為例，城市副中心建設任務嚴峻，但考古工作卻罕見地沒有設定完工時間。“北京早已過了保護與發展二選一的時期，保護與發展建設並重。”</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　經過文物部門盤點，北京城市副中心155平方公裡的核心區內，共有各類不可移動文物104處。通州區政府相關負責人明確：這些古跡充分代表了通州歷史及運河文化，將採取不拆、不遷、不改，逐步修繕、改善整體環境的保護方式，做好重要片區的專項保護利用規劃，進行整體運營管理，展示“通州味”文化。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　“城市副中心的規劃建設也會根據考古進度進行及時調整。”市文物局文物保護處處長王有泉說，本市將依據北京“十三五”發展規劃和北京“三個文化帶”發展規劃，推進東部運河文化帶、北京市文物收藏修復展示中心文化項目，打造以“三廟一塔”為中心的“通州味”傳統文化圈。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　香山北法海寺年內修完</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　曾經一度銷聲匿跡的香山二十八景恢復工作年內將取得階段性進展。這些景是經乾隆命名題署的，分別為勤政殿、麗矚樓、綠雲舫、虛朗齋、瓔珞岩、翠微亭、青未了、馴鹿坡、蟾蜍峰、棲雲樓、知樂濠、香山寺、聽法鬆、來青軒、唳霜皋、香岩室、霞標蹬、玉乳泉、絢秋林、雨香館、晞陽阿、芙蓉坪、香霧窟、棲月崖、重翠崦、玉華岫、森玉笏和隔雲鐘。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　截至去年秋天，已經有十七景再現。今年，香山一帶的北法海寺修繕工程也將完成。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　市文物局列出的年內修繕計劃中，類似成片的項目還有不少。北部長城文化帶、西部西山文化帶和東部運河文化帶上的項目佔了全市大修項目的四分之一。其中，黑龍潭行宮院倒座房及龍潭廟碑亭等修復工程，既是運河文化帶項目又是西山文化帶項目，方案已經完成審批，預計年內啟動。通州區相關部門也將做好文物集中區域連片保護利用，實施文物惠民工程，建設配套服務設施，打造“文物+”產業鏈。國家文物局也表示，“十三五”期間將在北京城市副中心、2022年冬奧會文物保護等方面進一步加大支持力度，助推人文北京建設。</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　箭扣長城將“全周期”護理</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　“在一般人的印象中，長城就是一堵牆，這並不准確。長城是古代軍事防御設施，除了長度還有縱深可以發掘。”王有泉舉例，“軍隊要有營房、有屯田，保障自給自足，我們可以通過考古將這些復原。周邊的鄉村游也能借上長城的文氣，留住人氣兒。”</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　京津冀三地也將攜手打通文脈。以長城為例，不僅跨越三地，有時候一牆兩側所在區縣鄉鎮的利益訴求也各不相同。頂牛干，隻能兩敗俱傷。舒小峰說：“保護要順勢借力，本市已與河北、天津簽訂京津冀長城保護管理框架協議，推進三地交界的紅石門長城及京冀交界的古北口長城、南口長城文物保護與利用區域發展規劃，共同打造三地長城沿線抗戰遺址宣傳平台，加強三地長城保護聯合執法。”</p><p style=\"margin-top: 25px; margin-bottom: 25px; padding: 0px; font-stretch: normal; font-size: 18px; line-height: 32.4px; font-family: 微软雅黑; color: rgb(34, 34, 34); white-space: normal;\">　　今年，箭扣長城天梯至鷹飛倒仰段將修繕。密雲東段長城也將啟動修繕。這些長城的保護不光是對牆體的加固，而且是有一定寬度的帶狀保護。一場“全周期”護理的思路將運用到文物保護中。最初為功能、實用營造的古建筑，將煥發新生機，最終實現文物保護、環境整治、百姓致富、旅游開發和經濟發展齊頭並進、共贏多贏的局面。</p>', '', '北京80余處古建年內大修', '', '北部長城文化帶、西部西山文化帶和東部運河文化帶將逐漸亮出來。北京市文物局昨天發布消息：今年年內，本市80余處古建將大修，四分之一扎堆兒在三個文化帶上，其中圓明園考古及大宮門修繕、香山二十八景、懷柔箭扣長城、通州潞城考古等項目將繼續推動。', '', '1', '1', '2017-03-31 22:28:46', null, '0', '4', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '9', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('64', '1', '', '', '泉州网', '', '2017-03-31 15:43:16', '<p style=\"line-height: 3em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2013年8月26日，对于泉州来说，是个难以忘怀的日子。当天，随着“泉州”二字从文化部评审专家委员会的口中宣布，中国首个“东亚文化之都”花落泉州！</p><p style=\"line-height: 3em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一个月后，泉州与韩国光州、日本横滨的艺术团体同台亮相演出，并正式被授予“东亚文化之都”称号，开启了一轮文化发展的新篇章。无论是推陈出新的文娱活动， 还是紧锣密鼓的文化设施建设，抑或频频亮相央视的城市形象，2013年当选“东亚文化之都”的泉州，几乎每一天都发生着与“文化”有关的新鲜改变。</p><p style=\"text-align: center; line-height: 3em;\"><img alt=\"118494672_31n.jpg\" src=\"http://imgs.lygj97.com/ueditor/20170331/58de08ca7f15e.jpg!watermark\" title=\"1457955055234824.jpg\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; margin-bottom: 10px; max-width: 100%;\"/></p><p style=\"line-height: 3em;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;镜头回放</strong></p><p style=\"line-height: 3em;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;精彩口述赢“满堂彩”</strong></p><p style=\"line-height: 3em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高规格、高标准，铸就了泉州“东亚文化之都”的高含金量，这不仅因为各国仅能选出一个能够代表本国文化的城市，而且评选的指标囊括对各个参选城市文化传统、非遗传承、对外交流、文化建设等各个层面的综合评价。</p><p style=\"line-height: 3em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;今年8月26日，在首届“东亚文化之都”评选活动终审工作会议上，经过紧张角逐，泉州以88.92分的全场最高分，力压苏州、杭州、青岛、武汉、西安等城市，最终当选首届“东亚文化之都”。</p><p style=\"line-height: 3em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最激动也最令人骄傲的是城市陈述和答辩两个环节。当天16时许，市委书记黄少萍从容大气的口头陈述，与PPT、视频短片互动融合，大跨度、分层次地展现泉州 深远厚重的多元文化底蕴、悠久广泛的对外交流史，以及精心策划的东亚文化交流方案——前期日夜筹备的精雕细琢，加上评审时底气十足的多元陈述，终于赢得来 之不易的桂冠。</p><p style=\"line-height: 3em;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;传承保护</strong></p><p style=\"line-height: 3em;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修复古建筑新建剧院</strong></p><p style=\"line-height: 3em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在当选“东亚文化之都”后，无论是具体可感的固态文化建设，还是探索创新的非遗传承，都马不停蹄，彰显着首个中国“东亚文化之都”言必信、行必果的执行力。</p><p style=\"line-height: 3em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;继市区府文庙百年泮宫重焕光彩之后，其价值最高的大成殿维修也紧随其后。日前，省政府关于《泉州府文庙保护规划》的一纸批文，更是为这一“国保”单位的建筑修整、恢复全貌等提供法律保障。</p><p style=\"line-height: 3em;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;放眼泉州，关于古建筑的保护修复比比皆是，永宁古卫城修复城门城楼，五店市传统街区打造文化遗产存留工程，安海镇安平桥文化公园抓紧施工。我市还同步谋划对 泉州影剧院、泉州南音艺苑、梨园古典剧院等一批文化设施进行改造提升。此外，泉州木偶剧院将于年底全面竣工，泉州歌舞剧院力争明年初开工。</p>', '', '“文都”泉州修古建筑建剧院 推陈出新绽放风华', '', '', '', '1', '1', '2017-03-31 15:47:44', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de0940718d5.jpg\"}', '11', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('61', '1', '龙亿古建,龙和古建,木雕厂', '', '龙和古建', '', '2017-03-31 15:24:48', '', '', '龙和古建竣工剪彩仪式（一）', '', '', '', '1', '1', '2017-03-31 22:53:50', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de057bd9f66.jpg\",\"template\":\"list_masonry\",\"photo\":[{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de054d1b42a.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u51c6\\u5907\\u4e2d\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de054d6a8b3.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u51c6\\u5907\\u4e2d\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de054ee8de7.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u51c6\\u5907\\u4e2d\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de055030720.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u51c6\\u5907\\u4e2d\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de0551ef015.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u51c6\\u5907\\u4e2d\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de05532a9ce.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u51c6\\u5907\\u4e2d\"}]}', '58', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('76', '1', '', '', null, '', '2017-04-01 00:17:36', '', '', '龙居姚氏祖厝', '', '', '', '1', '1', '2017-04-01 00:18:49', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de81294ce1d.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de813c28854.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d1\"},{\"url\":\"portal\\/20170401\\/58de8140b3e07.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d2\"},{\"url\":\"portal\\/20170401\\/58de814584ccb.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d3\"},{\"url\":\"portal\\/20170401\\/58de814861675.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d4\"},{\"url\":\"portal\\/20170401\\/58de814bd3e47.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d5\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('62', '1', '龙亿古建,龙和古建,木雕厂', '', '龙和古建', '', '2017-03-31 15:31:38', '', '', ' 龙和古建竣工剪彩仪式（二） ', '', '', '', '1', '1', '2017-03-31 22:56:57', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de066db7255.jpg\",\"template\":\"list_masonry\",\"photo\":[{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de064ac9541.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de064b88da6.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de064c5cd3b.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de064d8fde2.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de064ec5421.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06500a0ef.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"}]}', '41', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('75', '1', '', '', null, '', '2017-04-01 00:16:25', '', '', '龙居姚氏祖厝', '', '', '', '1', '1', '2017-04-01 00:17:24', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de810d3a077.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de80fb64f98.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d\"}]}', '6', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('63', '1', '龙亿古建,龙和古建,木雕厂', '', '龙和古建', '', '2017-03-31 15:34:56', '', '', '龙和古建竣工剪彩仪式（三）', '', '', '', '1', '1', '2017-03-31 23:00:37', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de07412d382.jpg\",\"template\":\"list_masonry\",\"photo\":[{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06ce020e8.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06ce56546.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06cf9151a.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d14bbb9.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d28556c.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d37f868.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"}]}', '32', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('71', '1', '', '', '龙和古建', '', '2017-03-31 23:05:23', '', '', '龙和古建竣工剪彩仪式（五）', '', '', '', '1', '1', '2017-03-31 23:07:40', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de7054e0d3e.jpg\",\"template\":\"list_masonry\",\"photo\":[{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d994913.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u7ed3\\u675f\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06da8ef96.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u7ed3\\u675f\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06db608c1.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u7ed3\\u675f\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06dc607b2.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u7ed3\\u675f\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06ddcf672.jpg!watermark\",\"alt\":\"\\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u7ed3\\u675f\"}]}', '19', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('73', '1', '', '', null, '', '2017-03-31 23:54:50', '', '', '龙居厚鼎祖厝', '', '', '', '1', '1', '2017-03-31 23:57:01', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de7be380751.JPG\",\"photo\":[{\"url\":\"portal\\/20170331\\/58de7bf89655c.JPG\",\"alt\":\"\\u9f99\\u5c45\\u539a\\u9f0e\\u7956\\u539d1\"},{\"url\":\"portal\\/20170331\\/58de7bff76af1.JPG\",\"alt\":\"\\u9f99\\u5c45\\u539a\\u9f0e\\u7956\\u539d2\"},{\"url\":\"portal\\/20170331\\/58de7c04dc6af.JPG\",\"alt\":\"\\u9f99\\u5c45\\u539a\\u9f0e\\u7956\\u539d3\"},{\"url\":\"portal\\/20170331\\/58de7c0d3d452.JPG\",\"alt\":\"\\u9f99\\u5c45\\u539a\\u9f0e\\u7956\\u539d4\"},{\"url\":\"portal\\/20170331\\/58de7c120fbb8.JPG\",\"alt\":\"\\u9f99\\u5c45\\u539a\\u9f0e\\u7956\\u539d5\"},{\"url\":\"portal\\/20170331\\/58de7c1746cc3.JPG\",\"alt\":\"\\u9f99\\u5c45\\u539a\\u9f0e\\u7956\\u539d6\"},{\"url\":\"portal\\/20170331\\/58de7c1e05adf.JPG\",\"alt\":\"\\u9f99\\u5c45\\u539a\\u9f0e\\u7956\\u539d7\"},{\"url\":\"portal\\/20170331\\/58de7c227e6be.JPG\",\"alt\":\"\\u9f99\\u5c45\\u539a\\u9f0e\\u7956\\u539d8\"},{\"url\":\"portal\\/20170331\\/58de7c2716d52.JPG\",\"alt\":\"\\u9f99\\u5c45\\u539a\\u9f0e\\u7956\\u539d9\"}]}', '18', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('74', '1', '', '', null, '', '2017-04-01 00:11:57', '', '', '龙居姚氏祖厝', '', '', '', '1', '1', '2017-04-01 00:16:15', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de800c48c91.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de808b3f98c.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d1\"},{\"url\":\"portal\\/20170401\\/58de809113abb.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d2\"},{\"url\":\"portal\\/20170401\\/58de8094e89ab.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d3\"},{\"url\":\"portal\\/20170401\\/58de809ac9ee4.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d4\"},{\"url\":\"portal\\/20170401\\/58de80a1c2cfd.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d5\"},{\"url\":\"portal\\/20170401\\/58de80aa8b334.JPG\",\"alt\":\"\\u9f99\\u5c45\\u59da\\u6c0f\\u7956\\u539d6\"}]}', '12', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('70', '1', '', '', '龙和古建', '', '2017-03-31 23:00:52', '', '', '龙和古建竣工剪彩仪式（四）', '', '', '', '1', '1', '2017-03-31 23:05:15', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de6f790b555.jpg\",\"template\":\"list_masonry\",\"photo\":[{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d492cb1.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d5983da.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d69725e.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d75f07f.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d822b18.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/ueditor\\/20170331\\/58de06d91707c.jpg!watermark\",\"alt\":\" \\u9f99\\u548c\\u53e4\\u5efa\\u7ae3\\u5de5\\u526a\\u5f69\\u4eea\\u5f0f\\uff1a\\u8fdb\\u884c\\u65f6\"}]}', '24', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('65', '1', '', '', '南方日报', '', '2017-03-31 22:25:06', '<p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">何湛泉是个“怪人”。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">电窑、煤窑早已盛行，他却偏要使用成功率极低的柴火龙窑，做着自诩为“今天的文化，明天的古董”的陶艺;很多人在追求“短平快”的生活节奏，他却愿意用7年时间去修筑恢复悦城龙母祖庙屋脊;当许多人都在使用规模化机械时，他却说“唯有精神才能支撑所有”。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">在传统与现代的博弈中，何湛泉常显得“格格不入”，但正是这些“格格不入”，造就了这位在古建筑修复领域首屈一指的大师。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\"><img id=\"12346600\" title=\"\" border=\"0\" src=\"http://zhongshan.southcn.com/content/images/attachement/jpg/site4/20170331/b886874284751a47f6fe06.jpg\" sourcedescription=\"编辑提供的本地文件\" sourcename=\"本地文件\" style=\"border: 0px; margin: 0px auto 15px; max-width: 640px; display: block;\"/></p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\"><span style=\"font-weight: 700;\">一年打磨一件作品</span></p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">走进菊城陶屋，一眼可以看到何湛泉视为珍宝的柴火龙窑。从慢火开启到烧窑结束，需要18个小时。在这个过程中，是否能掌握好上火燃烧的两个小时，是龙窑成败的关键。何湛泉从最开始的“烧一窑坏一窑”到如今接近九成的烧成率，前后历经了30多年。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">这30多年里，外面的世界早已发生了翻天覆地的变化，而何湛泉却几十年如一日坚守自己的老本行。这坚守，伴随着时代的变迁显得有些“特别”：外面供应商已经生产出了专门用于陶瓷制作的泥土，但他非要亲自从泥井挑选提炼调配;外界早已有现成的化工材料，他却偏要自己用植物和矿物调制釉料;外界早已通过流水线实现规模化生产，一小时可生产上千个产品，他却偏要耗费几个月甚至一年的时间打磨出一件作品。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">在传统与现代的十字路口，何湛泉也经受过许多诱惑。“20多年前就有朋友对我说，你练就满身本领，不实行产业化生产做大太可惜。”他却坚守着作坊“执迷不悟”。“我坚决不让作坊人数超过30人，因为一旦产业化，做出来的东西就不是作品，而是产品。”</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">“我认为龙窑就像一架飞机，里面有经济舱也有商务舱，放在不同位置烧出来的作品会有不一样的效果。‘一色入窑，出窑万彩’，只有真正懂欣赏的人才能读懂它的价值。”在长达18米的柴火龙窑面前，何湛泉用一个颇为现代化的比喻，表达对柴火龙窑这个传统事物的看法。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\"><span style=\"font-weight: 700;\">不爱高楼偏爱锌铁棚</span></p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">1983年，何湛泉学师两年之后，拿着全家仅有的积蓄——3000元开始创业，但由于烧制技术不过关，“烧一窑坏一窑，基本每一窑都失败”。随后，何湛泉通过无比艰辛的努力，才取得今日的成绩。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">在这过程中，他培养出来的工艺师傅，通过机械化、批量化生产，很快在这个行业里找到赚钱的机会。面对“高楼大厦与锌铁棚”的差距，何湛泉却不为所动，依旧我行我素。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">就在许多人都习惯对着现代化生产设备“复制粘贴”时，他宁愿花上一年半的时间去雕琢一条长9米多、高达1.68米的大型人物屋脊，为的是“传统屋脊工艺能与粤剧艺术博物馆共存”;就在许多人在为“总经理”等职位奔波的时候，他更珍惜的是获得广东民间工艺博物馆为其编撰个人书籍的宝贵机会;就在身边许多人早已发财致富时，他更看重的，1997年时石湾陶艺一代宗师刘传的一句“石湾陶花小榄开!”</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">“我要做的是今天的文化，明天的古董，未来的历史。”在名与利之间，何湛泉早已心如明镜。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\"><span style=\"font-weight: 700;\">一生甘愿做陶艺的“奴隶”</span></p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">历经30多年的时间冲刷，在何湛泉身上，除了多了几分沧桑、名声更为响亮之外，身边的很多事物似乎跟以前一样。</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">30多年前，他曾以“日踩一吨泥”铸造陶艺界传奇;如今穿上工作服的他，依旧跟普通工人没什么两样。30多年前，从第一窑开始，他就用笔头记下烧窑的经验和教训;如今烧过数百窑后，他依旧延续“好记性不如烂笔头”的习惯……</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">在多年的坚守中，何湛泉并不是没有碰到过走出锌铁棚改变命运的机会。“大约在17年前，有一位老板很喜欢收藏我的东西，他说你总是‘藏’在角落里，太可惜了。你要多少钱我都给你，你就帮我专门开拓一条生产线。”何湛泉听完就当场拒绝了，“我收你的钱，就必须听你的话，这对我一点诱惑都没有，我这辈子只甘心做陶艺的‘奴隶’。”</p><p style=\"margin: 0px 3px 15px; padding: 0px; line-height: 34px; color: rgb(27, 27, 27); white-space: normal; text-indent: 30px; font-family: &quot;\\\\5B8B体&quot;, Arial, sans-serif !important;\">这是最坏的时代，也是最好的时代，这句话是对当前陶艺行业发展际遇最好的解注。当传统手工业普遍面临“坚守容易传承难”这个困境时，何湛泉却在转角处遇到了春天——在机器化生产的时代，很多工厂濒临淘汰，而他却在守望里等来了传统行业的复兴时期。“现在外面做传统手工的越来越少，我们的订单也越来越多。”</p>', '', '古建筑修复大师何湛泉： 在守望中等待陶艺复兴', '', '电窑、煤窑早已盛行，他却偏要使用成功率极低的柴火龙窑，做着自诩为“今天的文化，明天的古董”的陶艺;很多人在追求“短平快”的生活节奏，他却愿意用7年时间去修筑恢复悦城龙母祖庙屋脊;当许多人都在使用规模化机械时，他却说“唯有精神才能支撑所有”。', '', '1', '1', '2017-03-31 22:26:22', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de67086791b.jpg\",\"template\":\"\"}', '8', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('68', '1', '', '', '浙江新闻客户端', '', '2017-03-31 22:43:21', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">古建筑承载了现代人的“乡愁”，一座座雕梁画栋、沉稳大气的建筑是当年工匠们的智慧结晶。在位于义乌市赤岸镇的古村落尚阳村，以老街为主线，两侧紧密地分布着各式各样的古建筑，村民称它们为厅或堂，都有上百年的历史了。</p><p><figure class=\"wg wgImage\" style=\"margin: 10px 0px; padding: 0px; overflow: hidden; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><p class=\"wgImage-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 16px; line-height: 30px; text-align: center; word-wrap: break-word; word-break: normal; max-width: 100%;\"><img src=\"http://stc.zjol.com.cn/g1/M000524CggSA1jY_mGAOXV0AAEoULQWD_k347.jpg?width=720&height=238\" style=\"border: none; max-width: 100%;\"/></p><p class=\"wgImage-content\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; line-height: 30px; word-wrap: break-word; word-break: normal; color: rgb(153, 153, 153); border-bottom: 1px dashed rgb(204, 204, 204);\">六行堂外观</p></figure></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">尚阳村位于义乌南部、距城区30公里，2016年被列入第四批中国传统村落名录。近年来，义乌开展了尚阳古村落保护开发工程，对分布在尚阳村的古建筑实施修缮，一栋栋破败的古建筑开始“复苏”了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">在古建筑“复苏”的背后，有一群埋头工作的工匠，他们的工作艰苦漫长，他们的故事却不为人所知。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"padding: 10px 0px;\">木工：平均年龄50岁以上 希望100%还原古建筑</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">“六行堂”是尚阳村目前在修复的古建筑之一，据村里老人介绍，“六行堂”因建造者有六个孩子而得名，至少有170年的历史了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">在“六行堂”内，记者见到了正在修复木制部件的毛应洪。做了大半辈子木工，毛师傅也是最近几年开始接触古建筑修复，在他看来，这个工作需要细心、耐心，还要有一定的天赋。</p><p><figure class=\"wg wgImage\" style=\"margin: 10px 0px; padding: 0px; overflow: hidden; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><p class=\"wgImage-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 16px; line-height: 30px; text-align: center; word-wrap: break-word; word-break: normal; max-width: 100%;\"><img src=\"http://stc.zjol.com.cn/g1/M000E96CggSDVjY_oWAYfuGAAI2h5r8jlg197.jpg?width=600&height=450\" style=\"border: none; max-width: 100%;\"/></p><p class=\"wgImage-content\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; line-height: 30px; word-wrap: break-word; word-break: normal; color: rgb(153, 153, 153); border-bottom: 1px dashed rgb(204, 204, 204);\">全榫卯结构的花窗</p></figure></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">“这种花纹的窗在这栋房子里只有两块，修复起来很费工夫”，毛师傅指着一扇“万字纹”花窗向记者介绍，两扇窗曾经被嵌在“六行堂”临街的墙上，一扇损毁严重需要重做，一扇则需要修复。本着“修旧如旧”的原则，毛师傅一方面按原样修复花窗，一方面制作出了一个一比一的“复制品”。“这种花窗的看似简单，其实它的部件很多，而且部件之间利用榫卯结构连接，不用一个钉子”，记者看到，毛师傅手中的“复制品”，从造型、颜色上看，几乎都和原件没有差别了。</p><p><figure class=\"wg wgImage\" style=\"margin: 10px 0px; padding: 0px; overflow: hidden; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><p class=\"wgImage-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 16px; line-height: 30px; text-align: center; word-wrap: break-word; word-break: normal; max-width: 100%;\"><img src=\"http://stc.zjol.com.cn/g1/M000E96CggSDVjY_piAVtFRAAICL_k4MI0557.jpg?width=600&height=450\" style=\"border: none; max-width: 100%;\"/></p><p class=\"wgImage-content\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; line-height: 30px; word-wrap: break-word; word-break: normal; color: rgb(153, 153, 153); border-bottom: 1px dashed rgb(204, 204, 204);\">毛师傅向记者展示需要修复的窗户底座</p></figure></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">木工作为古建筑修复中最关键的工种，也是非常稀缺的，毛师傅告诉记者，“六行堂”里目前有十名木工，年龄都在50岁以上，这些木工师傅又分别负责不同部件的修复工作。毛师傅还说，修复古建筑具有挑战性，比如一栋房子里单单花窗就有四五个样式，修复它们有难度但也能学到新的东西。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\"><strong style=\"padding: 10px 0px;\">木雕师：每天工作9个小时 想把木雕发扬光大</strong></p><p><figure class=\"wg wgImage\" style=\"margin: 10px 0px; padding: 0px; overflow: hidden; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><p class=\"wgImage-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 16px; line-height: 30px; text-align: center; word-wrap: break-word; word-break: normal; max-width: 100%;\"><img src=\"http://stc.zjol.com.cn/g1/M000524CggSA1jY_waAZmBwAAHiD7aWxLU637.jpg?width=600&height=450\" style=\"border: none; max-width: 100%;\"/></p><p class=\"wgImage-content\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; line-height: 30px; word-wrap: break-word; word-break: normal; color: rgb(153, 153, 153); border-bottom: 1px dashed rgb(204, 204, 204);\">王宝基在雕花</p></figure></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">在古建筑修复现场，木雕师是不用在工地现场的工种，但他们的工作也是极具有挑战的。东阳人王宝基14岁开始学习木雕，也是木雕界的“老司机”了。在尚阳村一处正在修缮的古建筑旁，王宝基手握刀具，仔仔细细在木头上雕刻花纹。</p><p><figure class=\"wg wgImage\" style=\"margin: 10px 0px; padding: 0px; overflow: hidden; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><p class=\"wgImage-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 16px; line-height: 30px; text-align: center; word-wrap: break-word; word-break: normal; max-width: 100%;\"><img src=\"http://stc.zjol.com.cn/g1/M001AA9CggSDljY_q-AfSwcAAHSVOA1yfI047.jpg?width=600&height=450\" style=\"border: none; max-width: 100%;\"/></p><p class=\"wgImage-content\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; line-height: 30px; word-wrap: break-word; word-break: normal; color: rgb(153, 153, 153); border-bottom: 1px dashed rgb(204, 204, 204);\">古建筑里精美的雕花</p></figure></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">“现在我们做的主要是老房子里的牛腿、押头、角花、下托。”王师傅告诉记者，这几个部件可以说是古建筑里画龙点睛的部位，比如押头，都是镂空的结构，里面刻有象征吉祥的花、鸟等图案，非常精美，雕刻起来也非常费时，工艺复杂的要十多天。</p><p><figure class=\"wg wgImage\" style=\"margin: 10px 0px; padding: 0px; overflow: hidden; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><p class=\"wgImage-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 16px; line-height: 30px; text-align: center; word-wrap: break-word; word-break: normal; max-width: 100%;\"><img src=\"http://stc.zjol.com.cn/g1/M000524CggSA1jY_saAAZW3AAJroBwAuBk666.jpg?width=600&height=450\" style=\"border: none; max-width: 100%;\"/></p><p class=\"wgImage-content\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; line-height: 30px; word-wrap: break-word; word-break: normal; color: rgb(153, 153, 153); border-bottom: 1px dashed rgb(204, 204, 204);\">雕刻牛腿</p></figure></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 30px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255);\">王师傅今年已经55岁，也是木雕师傅里年纪最大的一位，每天早上七点开始，要工作九个小时。“现在雕花离不开老花镜了，这个工作对新手来说是很困难的”，王师傅说，之所以还坚守着，是出于对木雕的热爱，想通过这种形式把工艺传下去。</p><p><figure class=\"wg wgImage\" style=\"margin: 10px 0px; padding: 0px; overflow: hidden; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><p class=\"wgImage-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 16px; line-height: 30px; text-align: center; word-wrap: break-word; word-break: normal; max-width: 100%;\"><img src=\"http://stc.zjol.com.cn/g1/M000524CggSA1jY_tqAbfDAAAKbEz0lgTw197.jpg?width=600&height=450\" style=\"border: none; max-width: 100%;\"/></p><p class=\"wgImage-content\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; line-height: 30px; word-wrap: break-word; word-break: normal; color: rgb(153, 153, 153); border-bottom: 1px dashed rgb(204, 204, 204);\">万字纹花窗只在临街墙面上有</p></figure><figure class=\"wg wgImage\" style=\"margin: 10px 0px; padding: 0px; overflow: hidden; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><p class=\"wgImage-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 16px; line-height: 30px; text-align: center; word-wrap: break-word; word-break: normal; max-width: 100%;\"><img src=\"http://stc.zjol.com.cn/g1/M0004FACggSBFjY_u2Aa9-iAAJb5HZZBhY377.jpg?width=600&height=450\" style=\"border: none; max-width: 100%;\"/></p><p class=\"wgImage-content\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; line-height: 30px; word-wrap: break-word; word-break: normal; color: rgb(153, 153, 153); border-bottom: 1px dashed rgb(204, 204, 204);\">加工木料</p></figure><figure class=\"wg wgImage\" style=\"margin: 10px 0px; padding: 0px; overflow: hidden; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><p class=\"wgImage-source\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; font-size: 16px; line-height: 30px; text-align: center; word-wrap: break-word; word-break: normal; max-width: 100%;\"><img src=\"http://stc.zjol.com.cn/g1/M000E96CggSDVjY_xuAevBWAAGe9jOlSHo596.jpg?width=600&height=450\" style=\"border: none; max-width: 100%;\"/></p><p class=\"wgImage-content\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; line-height: 30px; word-wrap: break-word; word-break: normal; color: rgb(153, 153, 153); border-bottom: 1px dashed rgb(204, 204, 204);\">屋顶修复</p></figure></p>', '', '义乌这帮“宅男” 在古建筑里践行“工匠精神”', '', '', '', '1', '1', '2017-03-31 22:45:24', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de6b801e626.jpg\",\"template\":\"\"}', '11', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('69', '1', '', '', '浙江文物网', '', '2017-03-31 22:48:11', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; line-height: 26px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;, 宋体, Verdana, SimHei, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\"><img src=\"http://imgs.lygj97.com/ueditor/20170331/58de6c463b66b.jpg!watermark\" title=\"图片版权归原作者所有\" alt=\"图片版权归原作者所有\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; vertical-align: middle;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; line-height: 26px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;, 宋体, Verdana, SimHei, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; line-height: 26px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;, 宋体, Verdana, SimHei, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">　　日前，普陀区文物办、普陀区文物监察大队对“天丰寺”、“接待寺”、“鲁家峙东南岙天后宫”、“黄泉源商行”等文物古建筑开展了消防安全巡查工作。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; line-height: 26px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;, 宋体, Verdana, SimHei, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; line-height: 26px; color: rgb(102, 102, 102); font-family: &quot;Microsoft YaHei&quot;, 宋体, Verdana, SimHei, Helvetica, Arial, sans-serif; font-size: 15px; white-space: normal; background-color: rgb(255, 255, 255);\">　　检查组仔细询问了各文物古建筑单位日常管理情况，重点检查了各单位消防安全管理制度及消防安全设施，在文物保护范围及建设控制地带内是否存在私搭乱建等情况。从本次巡查来看，被检单位消防安全制度及设施设备等基本到位，文物建筑本体及周边环境状况良好。（普陀区文体广电新闻出版局）</p><p><br/></p>', '', '舟山普陀区开展文物古建筑消防安全巡查', '', '', '', '1', '1', '2017-03-31 22:48:58', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170331\\/58de6c5383326.jpg\",\"template\":\"\"}', '9', '0', '0', '1');
INSERT INTO `lygj_posts` VALUES ('77', '1', '', '', null, '', '2017-04-01 00:19:42', '', '', '寮海华龙宫', '', '', '', '1', '1', '2017-04-01 00:21:20', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de81e61d935.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de81bdaf261.JPG\",\"alt\":\"\\u5bee\\u6d77\\u534e\\u9f99\\u5bab1\"},{\"url\":\"portal\\/20170401\\/58de81c375db8.JPG\",\"alt\":\"\\u5bee\\u6d77\\u534e\\u9f99\\u5bab2\"},{\"url\":\"portal\\/20170401\\/58de81c98773b.JPG\",\"alt\":\"\\u5bee\\u6d77\\u534e\\u9f99\\u5bab3\"},{\"url\":\"portal\\/20170401\\/58de81d0b5eb1.JPG\",\"alt\":\"\\u5bee\\u6d77\\u534e\\u9f99\\u5bab4\"}]}', '10', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('78', '1', '', '', null, '', '2017-04-01 00:21:24', '', '', '漳浦塘南法济庙', '', '', '', '1', '1', '2017-04-01 00:24:12', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8219ecccb.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8233b2807.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e991\"},{\"url\":\"portal\\/20170401\\/58de8237d6ad7.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e992\"},{\"url\":\"portal\\/20170401\\/58de823d18af0.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e993\"},{\"url\":\"portal\\/20170401\\/58de824204f5b.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e994\"},{\"url\":\"portal\\/20170401\\/58de8245aba68.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e995\"},{\"url\":\"portal\\/20170401\\/58de82497c084.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e996\"},{\"url\":\"portal\\/20170401\\/58de824ecaf81.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e997\"},{\"url\":\"portal\\/20170401\\/58de8253f12b3.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e998\"},{\"url\":\"portal\\/20170401\\/58de8259e6bcf.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e999\"},{\"url\":\"portal\\/20170401\\/58de8285c1d8e.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e9910\"}]}', '9', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('79', '1', '', '', null, '', '2017-04-01 00:24:24', '', '', '漳浦塘南法济庙', '', '', '', '1', '1', '2017-04-01 00:27:35', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de82c1926db.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de831723b41.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e991\"},{\"url\":\"portal\\/20170401\\/58de831c02460.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e992\"},{\"url\":\"portal\\/20170401\\/58de8320e5799.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e993\"},{\"url\":\"portal\\/20170401\\/58de8326811ab.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e994\"},{\"url\":\"portal\\/20170401\\/58de832b327e3.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e995\"},{\"url\":\"portal\\/20170401\\/58de832fd593f.JPG\",\"alt\":\"\\u6f33\\u6d66\\u5858\\u5357\\u6cd5\\u6d4e\\u5e996\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('80', '1', '', '', null, '', '2017-04-01 00:28:20', '', '', '龙居天凤宫', '', '', '', '1', '1', '2017-04-01 00:29:43', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de83bc53db9.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de83cf0de8c.JPG\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab1\"},{\"url\":\"portal\\/20170401\\/58de83d8409b3.JPG\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab2\"},{\"url\":\"portal\\/20170401\\/58de83ddd7944.jpg\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab3\"},{\"url\":\"portal\\/20170401\\/58de83e35497f.jpg\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab4\"}]}', '7', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('81', '1', '', '', null, '', '2017-04-01 00:29:47', '', '', '龙居天凤宫', '', '', '', '1', '1', '2017-04-01 00:31:28', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8415a2af8.jpg\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8431113a3.JPG\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab1\"},{\"url\":\"portal\\/20170401\\/58de8436c2c75.JPG\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab2\"},{\"url\":\"portal\\/20170401\\/58de843ccbd07.JPG\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab3\"},{\"url\":\"portal\\/20170401\\/58de84456c503.jpg\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab4\"},{\"url\":\"portal\\/20170401\\/58de844a9731c.jpg\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab5\"}]}', '16', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('82', '1', '', '', null, '', '2017-04-01 00:31:32', '', '', '龙居天凤宫', '', '', '', '1', '1', '2017-04-01 00:33:00', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de847717a96.jpg\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de848a27d85.jpg\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab1\"},{\"url\":\"portal\\/20170401\\/58de8491f2db4.jpg\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab2\"},{\"url\":\"portal\\/20170401\\/58de84983e9cd.jpg\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab3\"},{\"url\":\"portal\\/20170401\\/58de849d5a49b.jpg\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab4\"},{\"url\":\"portal\\/20170401\\/58de84a400643.jpg\",\"alt\":\"\\u9f99\\u5c45\\u5929\\u51e4\\u5bab5\"}]}', '1', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('83', '1', '', '', null, '', '2017-04-01 00:33:47', '', '', '漳浦杜浔镇木雕工艺项目', '', '', '', '1', '1', '2017-04-01 00:35:54', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de850e2db52.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de85248bd46.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee1\"},{\"url\":\"portal\\/20170401\\/58de852923597.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee2\"},{\"url\":\"portal\\/20170401\\/58de852dd72f3.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee3\"},{\"url\":\"portal\\/20170401\\/58de8533e8e5d.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee4\"},{\"url\":\"portal\\/20170401\\/58de853db9ead.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee5\"},{\"url\":\"portal\\/20170401\\/58de8543753eb.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee6\"},{\"url\":\"portal\\/20170401\\/58de854a4999e.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee7\"},{\"url\":\"portal\\/20170401\\/58de854f0e036.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee8\"}]}', '1', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('84', '1', '', '', null, '', '2017-04-01 00:35:58', '', '', '漳浦杜浔镇木雕工艺项目', '', '', '', '1', '1', '2017-04-01 00:37:49', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de857ba0589.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de859372bc4.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee1\"},{\"url\":\"portal\\/20170401\\/58de859f6ef3d.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee2\"},{\"url\":\"portal\\/20170401\\/58de85aa8fbef.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee3\"},{\"url\":\"portal\\/20170401\\/58de85b3f18b1.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee4\"},{\"url\":\"portal\\/20170401\\/58de85bcbfbd8.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee5\"},{\"url\":\"portal\\/20170401\\/58de85c52bceb.JPG\",\"alt\":\"\\u6f33\\u6d66\\u675c\\u6d54\\u9547\\u6728\\u96d5\\u5de5\\u827a\\u9879\\u76ee6\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('85', '1', '', '', null, '', '2017-04-01 00:37:59', '', '', '怀德堂', '', '', '', '1', '1', '2017-04-01 00:39:52', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de860d4b3af.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de86201846c.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58021\"},{\"url\":\"portal\\/20170401\\/58de86245423d.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58022\"},{\"url\":\"portal\\/20170401\\/58de8628b3767.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58023\"},{\"url\":\"portal\\/20170401\\/58de862d7062b.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58024\"},{\"url\":\"portal\\/20170401\\/58de8631af5de.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58025\"},{\"url\":\"portal\\/20170401\\/58de8636533db.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58026\"}]}', '11', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('86', '1', '', '', null, '', '2017-04-01 00:39:58', '', '', '怀德堂', '', '', '', '1', '1', '2017-04-01 00:41:38', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de86b914fa3.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de868bc35e3.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58021\"},{\"url\":\"portal\\/20170401\\/58de8692caf9a.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58022\"},{\"url\":\"portal\\/20170401\\/58de869946585.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58023\"},{\"url\":\"portal\\/20170401\\/58de869fa5b3a.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58024\"}]}', '6', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('87', '1', '', '', null, '', '2017-04-01 00:41:41', '', '', '怀德堂', '', '', '', '1', '1', '2017-04-01 00:42:53', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de86ceef686.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de86e450373.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58021\"},{\"url\":\"portal\\/20170401\\/58de86e884dee.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58022\"},{\"url\":\"portal\\/20170401\\/58de86ecf0ae8.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58023\"},{\"url\":\"portal\\/20170401\\/58de86f126d19.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58024\"},{\"url\":\"portal\\/20170401\\/58de86f5e568f.JPG\",\"alt\":\"\\u6000\\u5fb7\\u58025\"}]}', '6', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('88', '1', '', '', null, '', '2017-04-01 00:43:30', '', '', '履坦宗祠', '', '', '', '1', '1', '2017-04-01 00:46:11', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de87445a5e5.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de875b38252.JPG\",\"alt\":\"\\u5c65\\u5766\\u5b97\\u79601\"},{\"url\":\"portal\\/20170401\\/58de8762f07bb.JPG\",\"alt\":\"\\u5c65\\u5766\\u5b97\\u79602\"},{\"url\":\"portal\\/20170401\\/58de87666e68b.JPG\",\"alt\":\"\\u5c65\\u5766\\u5b97\\u79603\"},{\"url\":\"portal\\/20170401\\/58de876adbccc.JPG\",\"alt\":\"\\u5c65\\u5766\\u5b97\\u79604\"},{\"url\":\"portal\\/20170401\\/58de87704e8eb.JPG\",\"alt\":\"\\u5c65\\u5766\\u5b97\\u79605\"},{\"url\":\"portal\\/20170401\\/58de877396ba2.JPG\",\"alt\":\"\\u5c65\\u5766\\u5b97\\u79606\"},{\"url\":\"portal\\/20170401\\/58de87768c564.JPG\",\"alt\":\"\\u5c65\\u5766\\u5b97\\u79607\"},{\"url\":\"portal\\/20170401\\/58de877a43130.JPG\",\"alt\":\"\\u5c65\\u5766\\u5b97\\u79608\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('89', '1', '', '', null, '', '2017-04-01 00:46:32', '', '', '凤楼后', '', '', '', '1', '1', '2017-04-01 00:48:55', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de881325f7a.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de882d4ba2d.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e1\"},{\"url\":\"portal\\/20170401\\/58de883207409.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e2\"},{\"url\":\"portal\\/20170401\\/58de88355c152.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e3\"},{\"url\":\"portal\\/20170401\\/58de8838a3207.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e4\"},{\"url\":\"portal\\/20170401\\/58de883e44beb.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e5\"},{\"url\":\"portal\\/20170401\\/58de884632628.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e6\"}]}', '7', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('90', '1', '', '', null, '', '2017-04-01 00:49:01', '', '', '凤楼后', '', '', '', '1', '1', '2017-04-01 00:50:20', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de888d856c4.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de88a435bf8.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e1\"},{\"url\":\"portal\\/20170401\\/58de88a819970.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e2\"},{\"url\":\"portal\\/20170401\\/58de88acae33a.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e3\"},{\"url\":\"portal\\/20170401\\/58de88b0a53d3.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e4\"},{\"url\":\"portal\\/20170401\\/58de88b5e6ee5.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e5\"},{\"url\":\"portal\\/20170401\\/58de88b947c49.JPG\",\"alt\":\"\\u51e4\\u697c\\u540e6\"}]}', '10', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('91', '1', '', '', null, '', '2017-04-01 00:50:25', '', '', '宝光堂', '', '', '', '1', '1', '2017-04-01 00:52:07', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de88ee1c8fc.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de89090d87c.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58021\"},{\"url\":\"portal\\/20170401\\/58de890d0aab6.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58022\"},{\"url\":\"portal\\/20170401\\/58de8913c12b4.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58023\"},{\"url\":\"portal\\/20170401\\/58de891902d78.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58024\"},{\"url\":\"portal\\/20170401\\/58de891ec2336.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58025\"},{\"url\":\"portal\\/20170401\\/58de89233a228.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58026\"}]}', '10', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('92', '1', '', '', null, '', '2017-04-01 00:52:12', '', '', '宝光堂', '', '', '', '1', '1', '2017-04-01 00:53:49', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de894c2127b.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de896ca5c05.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58021\"},{\"url\":\"portal\\/20170401\\/58de89713e3e6.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58022\"},{\"url\":\"portal\\/20170401\\/58de897691ad4.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58023\"},{\"url\":\"portal\\/20170401\\/58de897c90b4b.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58024\"},{\"url\":\"portal\\/20170401\\/58de89828ae3b.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58025\"},{\"url\":\"portal\\/20170401\\/58de898a4a21f.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58026\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('93', '1', '', '', null, '', '2017-04-01 00:53:51', '', '', '宝光堂', '', '', '', '1', '1', '2017-04-01 00:55:26', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de89accd4dd.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de89c47c4c9.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58021\"},{\"url\":\"portal\\/20170401\\/58de89c885e53.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58022\"},{\"url\":\"portal\\/20170401\\/58de89cd50a18.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58023\"},{\"url\":\"portal\\/20170401\\/58de89d289335.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58024\"},{\"url\":\"portal\\/20170401\\/58de89dbf1450.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58025\"},{\"url\":\"portal\\/20170401\\/58de89e4b5702.JPG\",\"alt\":\"\\u5b9d\\u5149\\u58026\"}]}', '6', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('94', '1', '', '', null, '', '2017-04-01 00:55:32', '', '', '金谷中莲庙', '', '', '', '1', '1', '2017-04-01 00:57:03', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8a23e4c26.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8a389eb7e.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e991\"},{\"url\":\"portal\\/20170401\\/58de8a3c76f8f.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e992\"},{\"url\":\"portal\\/20170401\\/58de8a420dd4a.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e993\"},{\"url\":\"portal\\/20170401\\/58de8a46324d1.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e994\"},{\"url\":\"portal\\/20170401\\/58de8a4a02c6b.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e995\"},{\"url\":\"portal\\/20170401\\/58de8a4daf56d.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e996\"}]}', '23', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('95', '1', '', '', null, '', '2017-04-01 00:57:08', '', '', '金谷中莲庙', '', '', '', '1', '1', '2017-04-01 00:58:21', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8a7083738.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8a81945ae.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e991\"},{\"url\":\"portal\\/20170401\\/58de8a87afd15.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e992\"},{\"url\":\"portal\\/20170401\\/58de8a8d701f2.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e993\"},{\"url\":\"portal\\/20170401\\/58de8a9253171.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e994\"},{\"url\":\"portal\\/20170401\\/58de8a97bc7f1.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e995\"},{\"url\":\"portal\\/20170401\\/58de8a9b4a2ca.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e996\"}]}', '0', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('96', '1', '', '', null, '', '2017-04-01 00:58:25', '', '', '金谷中莲庙', '', '', '', '1', '1', '2017-04-01 00:59:40', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8acad4221.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8ad9d3d34.jpg\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e991\"},{\"url\":\"portal\\/20170401\\/58de8add15d05.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e992\"},{\"url\":\"portal\\/20170401\\/58de8ae1667b8.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e993\"},{\"url\":\"portal\\/20170401\\/58de8ae6d3dea.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e994\"},{\"url\":\"portal\\/20170401\\/58de8aebe318a.JPG\",\"alt\":\"\\u91d1\\u8c37\\u4e2d\\u83b2\\u5e995\"}]}', '6', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('97', '1', '', '', null, '', '2017-04-01 00:59:45', '', '', '湖头林氏祖厝', '', '', '', '1', '1', '2017-04-01 01:01:28', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8b164df34.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8b46bb74a.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d1\"},{\"url\":\"portal\\/20170401\\/58de8b479f900.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d2\"},{\"url\":\"portal\\/20170401\\/58de8b48f3583.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d3\"},{\"url\":\"portal\\/20170401\\/58de8b499e029.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d4\"},{\"url\":\"portal\\/20170401\\/58de8b4adde6f.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d5\"},{\"url\":\"portal\\/20170401\\/58de8b4ea1741.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d6\"},{\"url\":\"portal\\/20170401\\/58de8b5310a7d.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d7\"}]}', '10', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('98', '1', '', '', null, '', '2017-04-01 01:01:33', '', '', '湖头林氏祖厝', '', '', '', '1', '1', '2017-04-01 01:02:39', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8b77e02f6.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8b9531a68.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d1\"},{\"url\":\"portal\\/20170401\\/58de8b956b598.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d2\"},{\"url\":\"portal\\/20170401\\/58de8b97088b0.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d3\"},{\"url\":\"portal\\/20170401\\/58de8b97d522e.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d4\"},{\"url\":\"portal\\/20170401\\/58de8b98b550a.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d5\"},{\"url\":\"portal\\/20170401\\/58de8b99a30a2.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d6\"},{\"url\":\"portal\\/20170401\\/58de8b9acd3bb.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d7\"},{\"url\":\"portal\\/20170401\\/58de8b9cd8f54.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d8\"}]}', '9', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('99', '1', '', '', null, '', '2017-04-01 01:02:42', '', '', '湖头林氏祖厝', '', '', '', '1', '1', '2017-04-01 01:04:19', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8bcc35d70.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8bf04b85e.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d1\"},{\"url\":\"portal\\/20170401\\/58de8bf183c78.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d2\"},{\"url\":\"portal\\/20170401\\/58de8bf36689f.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d3\"},{\"url\":\"portal\\/20170401\\/58de8bf4c0e84.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d4\"},{\"url\":\"portal\\/20170401\\/58de8bf9680e7.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d5\"},{\"url\":\"portal\\/20170401\\/58de8bfeb0e75.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d6\"}]}', '1', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('100', '1', '', '', null, '', '2017-04-01 01:04:21', '', '', '湖头林氏祖厝', '', '', '', '1', '1', '2017-04-01 01:06:18', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8c23c6af0.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8c436b69c.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d1\"},{\"url\":\"portal\\/20170401\\/58de8c448ddac.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d2\"},{\"url\":\"portal\\/20170401\\/58de8c465482e.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d3\"},{\"url\":\"portal\\/20170401\\/58de8c4ad4926.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d4\"},{\"url\":\"portal\\/20170401\\/58de8c54c7bf4.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d5\"},{\"url\":\"portal\\/20170401\\/58de8c5f2dfa0.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d6\"},{\"url\":\"portal\\/20170401\\/58de8c68e3ebf.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d7\"},{\"url\":\"portal\\/20170401\\/58de8c7206352.JPG\",\"alt\":\"\\u6e56\\u5934\\u6797\\u6c0f\\u7956\\u539d8\"}]}', '7', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('101', '1', '', '', null, '', '2017-04-01 01:06:36', '', '', '化龙宫', '', '', '', '1', '1', '2017-04-01 01:07:34', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8ca8f1adc.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8cbdc4a5f.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab1\"},{\"url\":\"portal\\/20170401\\/58de8cbf093b2.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab2\"},{\"url\":\"portal\\/20170401\\/58de8cc10533c.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab3\"},{\"url\":\"portal\\/20170401\\/58de8cc3322f6.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab4\"},{\"url\":\"portal\\/20170401\\/58de8cc51ff06.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab5\"},{\"url\":\"portal\\/20170401\\/58de8cc759e6a.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab6\"}]}', '15', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('102', '1', '', '', null, '', '2017-04-01 01:07:39', '', '', '化龙宫', '', '', '', '1', '1', '2017-04-01 01:08:57', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8cea58da8.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8d02a9deb.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab1\"},{\"url\":\"portal\\/20170401\\/58de8d04b303d.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab2\"},{\"url\":\"portal\\/20170401\\/58de8d079ec4c.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab3\"},{\"url\":\"portal\\/20170401\\/58de8d0a87dac.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab4\"},{\"url\":\"portal\\/20170401\\/58de8d0f27e28.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab5\"},{\"url\":\"portal\\/20170401\\/58de8d137d24c.JPG\",\"alt\":\"\\u5316\\u9f99\\u5bab6\"}]}', '8', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('103', '1', '', '', null, '', '2017-04-01 01:09:07', '', '', '安溪清水岩', '', '', '', '1', '1', '2017-04-02 18:21:20', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8d526c29c.JPG\",\"photo\":[{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8d88bf5ca.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca91\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8d89075e8.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca92\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8d8b5d95e.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca93\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8d8c32a1d.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca94\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8d8d96dee.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca95\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8d8fb46bc.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca96\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8d9168d62.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca97\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8d9318520.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca98\"},{\"url\":\"portal\\/20170402\\/58e0d09481d83.JPG\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca99\"},{\"url\":\"portal\\/20170402\\/58e0d0959899f.JPG\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca910\"}]}', '15', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('104', '1', '', '', null, '', '2017-04-01 01:11:07', '', '', '安溪清水岩', '', '是中国古代建筑业中的屋面工程专业。在宋《营造法式》中“瓦作”一项包括苫背、铺瓦、瓦和瓦饰的规格和选用原则等。清代的瓦作内容大增，在清工部《工程做法》中的“瓦作”一项中，除上述内容外，还包括宋代属于砖作的内容，如砌筑磉墩、基墙、房屋外墙、内隔墙、廊墙、围墙、砖墁地、台基等。', '', '1', '1', '2017-04-01 01:26:28', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8dc250ebb.JPG\",\"photo\":[{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8ddbee106.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca91\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8ddc39ec7.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca92\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8dde1918b.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca93\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8de001c96.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca94\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8de26783c.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca95\"},{\"url\":\"http:\\/\\/imgs.lygj97.com\\/portal\\/20170401\\/58de8de3d5c42.JPG!watermark\",\"alt\":\"\\u5b89\\u6eaa\\u6e05\\u6c34\\u5ca96\"}]}', '13', '0', '0', '0');
INSERT INTO `lygj_posts` VALUES ('105', '1', '', '', null, '', '2017-04-01 01:12:24', '', '', '马来西亚天尊宫', '', '', '', '1', '1', '2017-04-01 01:14:03', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8e22b6860.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8e3d8673a.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5929\\u5c0a\\u5bab1\"},{\"url\":\"portal\\/20170401\\/58de8e3e46161.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5929\\u5c0a\\u5bab2\"},{\"url\":\"portal\\/20170401\\/58de8e403ba4b.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5929\\u5c0a\\u5bab3\"},{\"url\":\"portal\\/20170401\\/58de8e42ed8db.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5929\\u5c0a\\u5bab4\"},{\"url\":\"portal\\/20170401\\/58de8e4444e10.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5929\\u5c0a\\u5bab5\"},{\"url\":\"portal\\/20170401\\/58de8e45df902.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5929\\u5c0a\\u5bab6\"},{\"url\":\"portal\\/20170401\\/58de8e474da8f.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5929\\u5c0a\\u5bab7\"}]}', '13', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('106', '1', '', '', null, '', '2017-04-01 01:14:05', '', '', '马来西亚威灵庙', '', '', '', '1', '1', '2017-04-01 01:15:03', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8e7178505.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8e7e52656.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e991\"},{\"url\":\"portal\\/20170401\\/58de8e7f0c512.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e992\"},{\"url\":\"portal\\/20170401\\/58de8e803c5b6.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e993\"},{\"url\":\"portal\\/20170401\\/58de8e826447c.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e994\"},{\"url\":\"portal\\/20170401\\/58de8e84cc5a4.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e995\"},{\"url\":\"portal\\/20170401\\/58de8e86bb99a.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e996\"}]}', '13', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('107', '1', '', '', null, '', '2017-04-01 01:15:05', '', '', '马来西亚太公殿', '', '', '', '1', '1', '2017-04-01 01:16:13', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8eb147a3d.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8ec2b43e5.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u592a\\u516c\\u6bbf1\"},{\"url\":\"portal\\/20170401\\/58de8ec43cb97.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u592a\\u516c\\u6bbf2\"},{\"url\":\"portal\\/20170401\\/58de8ec637d5c.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u592a\\u516c\\u6bbf3\"},{\"url\":\"portal\\/20170401\\/58de8ec76551f.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u592a\\u516c\\u6bbf4\"},{\"url\":\"portal\\/20170401\\/58de8ec9097a3.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u592a\\u516c\\u6bbf5\"},{\"url\":\"portal\\/20170401\\/58de8eca43183.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u592a\\u516c\\u6bbf6\"},{\"url\":\"portal\\/20170401\\/58de8eccad8a1.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u592a\\u516c\\u6bbf7\"}]}', '12', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('108', '1', '', '', null, '', '2017-04-01 01:16:17', '', '', '印尼义合庙', '', '', '', '1', '1', '2017-04-01 01:17:20', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8ef5870e7.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8f07cd78d.JPG\",\"alt\":\"\\u5370\\u5c3c\\u4e49\\u5408\\u5e991\"},{\"url\":\"portal\\/20170401\\/58de8f090664f.JPG\",\"alt\":\"\\u5370\\u5c3c\\u4e49\\u5408\\u5e992\"},{\"url\":\"portal\\/20170401\\/58de8f0ac181e.JPG\",\"alt\":\"\\u5370\\u5c3c\\u4e49\\u5408\\u5e993\"},{\"url\":\"portal\\/20170401\\/58de8f0c6688a.JPG\",\"alt\":\"\\u5370\\u5c3c\\u4e49\\u5408\\u5e994\"},{\"url\":\"portal\\/20170401\\/58de8f0deed0b.JPG\",\"alt\":\"\\u5370\\u5c3c\\u4e49\\u5408\\u5e995\"},{\"url\":\"portal\\/20170401\\/58de8f0fe5fe4.JPG\",\"alt\":\"\\u5370\\u5c3c\\u4e49\\u5408\\u5e996\"},{\"url\":\"portal\\/20170401\\/58de8f1146a1f.JPG\",\"alt\":\"\\u5370\\u5c3c\\u4e49\\u5408\\u5e997\"}]}', '9', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('109', '1', '', '', null, '', '2017-04-01 01:18:11', '', '', '马来西亚威灵庙', '', '', '', '1', '1', '2017-04-01 01:19:10', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8f6975ef3.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8f7450dae.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e991\"},{\"url\":\"portal\\/20170401\\/58de8f74b6dd4.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e992\"},{\"url\":\"portal\\/20170401\\/58de8f759b612.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e993\"},{\"url\":\"portal\\/20170401\\/58de8f7706045.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e994\"},{\"url\":\"portal\\/20170401\\/58de8f782ad6a.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e995\"},{\"url\":\"portal\\/20170401\\/58de8f79ce581.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e996\"},{\"url\":\"portal\\/20170401\\/58de8f7bbb67c.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e997\"},{\"url\":\"portal\\/20170401\\/58de8f7ccf8ce.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u5a01\\u7075\\u5e998\"}]}', '13', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('110', '1', '', '', null, '', '2017-04-01 01:19:13', '', '', '马来西亚友心宫', '', '', '', '1', '1', '2017-04-01 01:20:29', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8fa133139.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de8fbe21edf.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u53cb\\u5fc3\\u5bab1\"},{\"url\":\"portal\\/20170401\\/58de8fbe948b8.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u53cb\\u5fc3\\u5bab2\"},{\"url\":\"portal\\/20170401\\/58de8fbf7246a.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u53cb\\u5fc3\\u5bab3\"},{\"url\":\"portal\\/20170401\\/58de8fc051653.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u53cb\\u5fc3\\u5bab4\"},{\"url\":\"portal\\/20170401\\/58de8fc165675.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u53cb\\u5fc3\\u5bab5\"},{\"url\":\"portal\\/20170401\\/58de8fc248ce2.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u53cb\\u5fc3\\u5bab6\"},{\"url\":\"portal\\/20170401\\/58de8fc3a04f2.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u53cb\\u5fc3\\u5bab7\"},{\"url\":\"portal\\/20170401\\/58de8fc5012d2.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u53cb\\u5fc3\\u5bab8\"}]}', '14', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('111', '1', '', '', null, '', '2017-04-01 01:20:39', '', '', '马来西亚灵惠庙', '', '', '', '1', '1', '2017-04-01 01:21:48', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de8ffa8e797.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de900c7653e.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u7075\\u60e0\\u5e991\"},{\"url\":\"portal\\/20170401\\/58de900d6b902.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u7075\\u60e0\\u5e992\"},{\"url\":\"portal\\/20170401\\/58de900f3f4ae.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u7075\\u60e0\\u5e993\"},{\"url\":\"portal\\/20170401\\/58de9010d8ff4.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u7075\\u60e0\\u5e994\"},{\"url\":\"portal\\/20170401\\/58de90121cfc0.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u7075\\u60e0\\u5e995\"},{\"url\":\"portal\\/20170401\\/58de901436edc.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u7075\\u60e0\\u5e996\"},{\"url\":\"portal\\/20170401\\/58de9016ef700.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u7075\\u60e0\\u5e997\"},{\"url\":\"portal\\/20170401\\/58de9018b0802.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u7075\\u60e0\\u5e998\"}]}', '20', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('112', '1', '', '', null, '', '2017-04-01 01:21:51', '', '', '印尼南吧玄天上帝', '', '', '', '1', '1', '2017-04-01 01:22:53', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de903f5afe4.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de9051ad2de.JPG\",\"alt\":\"\\u5370\\u5c3c\\u5357\\u5427\\u7384\\u5929\\u4e0a\\u5e1d1\"},{\"url\":\"portal\\/20170401\\/58de90526bf56.JPG\",\"alt\":\"\\u5370\\u5c3c\\u5357\\u5427\\u7384\\u5929\\u4e0a\\u5e1d2\"},{\"url\":\"portal\\/20170401\\/58de9053cd628.JPG\",\"alt\":\"\\u5370\\u5c3c\\u5357\\u5427\\u7384\\u5929\\u4e0a\\u5e1d3\"},{\"url\":\"portal\\/20170401\\/58de905547a63.JPG\",\"alt\":\"\\u5370\\u5c3c\\u5357\\u5427\\u7384\\u5929\\u4e0a\\u5e1d4\"},{\"url\":\"portal\\/20170401\\/58de905707d05.JPG\",\"alt\":\"\\u5370\\u5c3c\\u5357\\u5427\\u7384\\u5929\\u4e0a\\u5e1d5\"},{\"url\":\"portal\\/20170401\\/58de9058a490d.JPG\",\"alt\":\"\\u5370\\u5c3c\\u5357\\u5427\\u7384\\u5929\\u4e0a\\u5e1d6\"},{\"url\":\"portal\\/20170401\\/58de905a1a39a.JPG\",\"alt\":\"\\u5370\\u5c3c\\u5357\\u5427\\u7384\\u5929\\u4e0a\\u5e1d7\"}]}', '9', '0', '1', '1');
INSERT INTO `lygj_posts` VALUES ('113', '1', '', '', null, '', '2017-04-01 01:22:56', '', '', '马来西亚斗母宫', '', '', '', '1', '1', '2017-04-01 01:23:44', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170401\\/58de9081c89a9.JPG\",\"photo\":[{\"url\":\"portal\\/20170401\\/58de908e536db.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u6597\\u6bcd\\u5bab1\"},{\"url\":\"portal\\/20170401\\/58de90904046c.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u6597\\u6bcd\\u5bab2\"},{\"url\":\"portal\\/20170401\\/58de90922e47b.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u6597\\u6bcd\\u5bab3\"},{\"url\":\"portal\\/20170401\\/58de90942c634.JPG\",\"alt\":\"\\u9a6c\\u6765\\u897f\\u4e9a\\u6597\\u6bcd\\u5bab4\"}]}', '10', '0', '1', '1');

-- ----------------------------
-- Table structure for `lygj_role`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of lygj_role
-- ----------------------------
INSERT INTO `lygj_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `lygj_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_role_user`;
CREATE TABLE `lygj_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of lygj_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_route`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_route`;
CREATE TABLE `lygj_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of lygj_route
-- ----------------------------
INSERT INTO `lygj_route` VALUES ('1', 'portal/page/index?id=1', 'culture', '0', '1');
INSERT INTO `lygj_route` VALUES ('2', 'portal/page/index?id=2', 'organization', '0', '1');
INSERT INTO `lygj_route` VALUES ('3', 'portal/page/index?id=3', 'profile', '0', '1');
INSERT INTO `lygj_route` VALUES ('4', 'portal/list/index?id=3', 'process', '0', '1');
INSERT INTO `lygj_route` VALUES ('5', 'portal/page/index?id=7', 'honor', '0', '1');
INSERT INTO `lygj_route` VALUES ('6', 'portal/list/index?id=6', 'trends', '0', '1');
INSERT INTO `lygj_route` VALUES ('7', 'portal/list/index?id=7', 'industry', '0', '1');
INSERT INTO `lygj_route` VALUES ('8', 'portal/list/index?id=5', 'news', '0', '1');
INSERT INTO `lygj_route` VALUES ('9', 'portal/list/index?id=9', 'stone', '0', '1');
INSERT INTO `lygj_route` VALUES ('10', 'portal/list/index?id=10', 'woodcarving', '0', '1');
INSERT INTO `lygj_route` VALUES ('11', 'portal/list/index?id=11', 'mud', '0', '1');
INSERT INTO `lygj_route` VALUES ('12', 'portal/list/index?id=12', 'plasticclip', '0', '1');
INSERT INTO `lygj_route` VALUES ('13', 'portal/list/index?id=13', 'paintpainting', '0', '1');
INSERT INTO `lygj_route` VALUES ('14', 'portal/list/index?id=8', 'construction', '0', '1');
INSERT INTO `lygj_route` VALUES ('15', 'portal/list/index?id=15', 'domestic', '0', '1');
INSERT INTO `lygj_route` VALUES ('16', 'portal/list/index?id=16', 'overseas', '0', '1');
INSERT INTO `lygj_route` VALUES ('17', 'portal/list/index?id=17', 'engineering', '0', '1');
INSERT INTO `lygj_route` VALUES ('18', 'portal/list/index?id=14', 'demonstration', '0', '1');
INSERT INTO `lygj_route` VALUES ('19', 'portal/list/index?id=19', 'inheritance', '0', '1');
INSERT INTO `lygj_route` VALUES ('20', 'portal/list/index?id=20', 'summary', '0', '1');
INSERT INTO `lygj_route` VALUES ('21', 'portal/list/index?id=12', 'activity', '0', '1');
INSERT INTO `lygj_route` VALUES ('22', 'portal/list/index?id=22', 'ancientknowledge', '0', '1');
INSERT INTO `lygj_route` VALUES ('23', 'portal/list/index?id=18', 'ancientculture', '0', '1');
INSERT INTO `lygj_route` VALUES ('24', 'portal/list/index?id=23', 'video', '0', '1');
INSERT INTO `lygj_route` VALUES ('25', 'portal/page/index?id=4', 'contactus', '0', '1');
INSERT INTO `lygj_route` VALUES ('26', 'portal/page/index?id=5', 'joinus', '0', '1');
INSERT INTO `lygj_route` VALUES ('27', 'portal/article/index', 'article/:id\\d', '0', '1');

-- ----------------------------
-- Table structure for `lygj_slide`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_slide`;
CREATE TABLE `lygj_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_name_en` varchar(255) NOT NULL COMMENT '幻灯片名称(英文)',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) NOT NULL COMMENT '幻灯片描述',
  `slide_des_en` varchar(255) DEFAULT NULL COMMENT '幻灯片描述(英文)',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_content_en` text NOT NULL COMMENT '幻灯片内容(英文)',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of lygj_slide
-- ----------------------------
INSERT INTO `lygj_slide` VALUES ('1', '1', '1', '', 'admin/20170329/58db91c1108dd.png', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('2', '1', '2', '', 'admin/20170329/58db91da0fe7f.png', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('5', '3', '关于我们', '', 'admin/20170329/58db927891354.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('6', '4', '企业历程', '', 'admin/20170329/58db95c72ca06.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('7', '5', '荣誉资质', '', 'admin/20170329/58db95eff1ef0.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('8', '6', '资讯中心', '', 'admin/20170329/58db966bcc993.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('9', '7', '营造工艺', '', 'admin/20170329/58db96ccaef42.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('10', '8', '工程展示', '', 'admin/20170329/58db96b724084.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('11', '9', '联系我们', '', 'admin/20170329/58db96ab39e4c.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('12', '10', '文章详情', '', 'admin/20170329/58db969c92e9f.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('13', '11', '工程工艺详细', '', 'admin/20170329/58db9688b22c0.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('14', '12', '搜索结果详细', '', 'admin/20170329/58db967bdf7d9.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('16', '2', '福建省安溪龙亿古建木雕厂营业执照', '', 'admin/20170331/58de7593e3a63.jpg', '', '', null, '', '', '1', '0');
INSERT INTO `lygj_slide` VALUES ('15', '2', '泉州龙和古建筑工程有限公司营业执照', '', 'admin/20170331/58de75b3d643b.jpg', '', '', null, '', '', '1', '0');

-- ----------------------------
-- Table structure for `lygj_slide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_slide_cat`;
CREATE TABLE `lygj_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of lygj_slide_cat
-- ----------------------------
INSERT INTO `lygj_slide_cat` VALUES ('1', '幻灯片', 'slider', '首页幻灯片', '1');
INSERT INTO `lygj_slide_cat` VALUES ('2', '荣誉资质', 'honor', '荣誉资质列表', '1');
INSERT INTO `lygj_slide_cat` VALUES ('3', '关于我们广告位', 'about_ads', '关于我们广告位(1005px*242px)', '1');
INSERT INTO `lygj_slide_cat` VALUES ('4', '企业历程广告位', 'process_ads', '企业历程广告位（1005*242）', '1');
INSERT INTO `lygj_slide_cat` VALUES ('5', '荣誉资质广告位', 'honor_ads', '荣誉资质广告位（1005*242）', '1');
INSERT INTO `lygj_slide_cat` VALUES ('6', '资讯中心广告位', 'news_ads', '资讯中心广告位（1005*242）', '1');
INSERT INTO `lygj_slide_cat` VALUES ('7', '营造工艺广告位', 'gongyi_ads', '营造工艺广告位（1005*242）', '1');
INSERT INTO `lygj_slide_cat` VALUES ('8', '工程展示广告位', 'gongcheng_ads', '工程展示广告位（1005*242）', '1');
INSERT INTO `lygj_slide_cat` VALUES ('9', '联系我们广告位', 'contact_ads', '联系我们广告位（1005*242）', '1');
INSERT INTO `lygj_slide_cat` VALUES ('10', '文章详情广告位', 'article_ads', '文章详情广告位（1005*242）', '1');
INSERT INTO `lygj_slide_cat` VALUES ('11', '工程工艺详细广告位', 'gcgy_ads', '工程工艺详细广告位（1005*242）', '1');
INSERT INTO `lygj_slide_cat` VALUES ('12', '搜索结果页广告位', 'search_ads', '搜索结果页广告位（1005*242）', '1');

-- ----------------------------
-- Table structure for `lygj_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_term_relationships`;
CREATE TABLE `lygj_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of lygj_term_relationships
-- ----------------------------
INSERT INTO `lygj_term_relationships` VALUES ('115', '113', '16', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('114', '112', '16', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('113', '111', '16', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('112', '110', '16', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('81', '79', '10', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('80', '78', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('79', '77', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('78', '76', '10', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('77', '75', '9', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('76', '74', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('75', '73', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('74', '72', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('73', '71', '6', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('104', '102', '12', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('72', '70', '6', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('71', '69', '7', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('70', '68', '7', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('103', '101', '17', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('111', '109', '16', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('69', '67', '7', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('102', '100', '9', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('110', '108', '16', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('109', '107', '17', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('108', '106', '16', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('107', '105', '16', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('68', '66', '7', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('67', '65', '7', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('66', '64', '7', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('65', '63', '6', '3', '1');
INSERT INTO `lygj_term_relationships` VALUES ('64', '62', '6', '2', '1');
INSERT INTO `lygj_term_relationships` VALUES ('63', '61', '6', '1', '1');
INSERT INTO `lygj_term_relationships` VALUES ('101', '99', '10', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('100', '98', '11', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('99', '97', '17', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('106', '104', '11', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('98', '96', '9', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('97', '95', '10', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('96', '94', '17', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('95', '93', '9', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('94', '92', '10', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('93', '91', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('92', '90', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('91', '89', '11', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('90', '88', '10', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('89', '87', '9', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('88', '86', '12', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('87', '85', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('86', '84', '13', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('85', '83', '10', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('84', '82', '13', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('83', '81', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('82', '80', '9', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('105', '103', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('116', '114', '23', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('117', '115', '14', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('118', '116', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('119', '117', '15', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('120', '118', '9', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('121', '119', '10', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('122', '120', '11', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('123', '121', '9', '0', '1');
INSERT INTO `lygj_term_relationships` VALUES ('124', '122', '13', '0', '1');

-- ----------------------------
-- Table structure for `lygj_terms`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_terms`;
CREATE TABLE `lygj_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `name_en` varchar(200) NOT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_title_en` varchar(500) NOT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_keywords_en` varchar(500) NOT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `seo_description_en` varchar(500) NOT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of lygj_terms
-- ----------------------------
INSERT INTO `lygj_terms` VALUES ('10', '木雕木作', 'Wood Carving', '', 'gongyi', '', '8', '0', '0-8-10', '木雕木作', 'Wood Carving', '', '', '', '', 'gongyi', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('3', '企业历程', 'Company History', '', 'article', '', '0', '0', '0-3', '企业历程', 'Company History', '', '', '', '', 'course', 'detail', '0', '1');
INSERT INTO `lygj_terms` VALUES ('6', '企业动态', 'Company News', '', 'article', '', '5', '0', '0-5-6', '企业动态', 'Company News', '', '', '', '', 'list', 'detail', '0', '1');
INSERT INTO `lygj_terms` VALUES ('5', '资讯中心', 'News', '', 'article', '', '0', '0', '0-5', '资讯中心', ' News', '', '', '', '', 'list', 'detail', '0', '1');
INSERT INTO `lygj_terms` VALUES ('7', '行业资讯', ' Industry', '', 'article', '', '5', '0', '0-5-7', '行业资讯', ' Industry', '', '', '', '', 'list', 'detail', '0', '1');
INSERT INTO `lygj_terms` VALUES ('8', '营造工艺', 'Construction', '', 'gongyi', '', '0', '0', '0-8', '营造工艺', 'Construction', '', '', '', '', 'gongyi', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('9', '石雕石作', 'Stone Carving', '', 'gongyi', '', '8', '0', '0-8-9', '石雕石作', 'Stone Carving', '', '', '', '', 'gongyi', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('11', '泥水瓦作', 'Slurry Tile', '', 'gongyi', '', '8', '0', '0-8-11', '泥水瓦作', 'Slurry Tile', '', '', '', '', 'gongyi', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('12', '堆塑剪贴', 'Plastic Clip', '', 'gongyi', '', '8', '0', '0-8-12', '堆塑剪贴', 'Plastic Clip', '', '', '', '', 'gongyi', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('13', '油漆彩绘', 'Paint Painting', '', 'gongyi', '', '8', '0', '0-8-13', '油漆彩绘', 'Paint Painting', '', '', '', '', 'gongyi', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('14', '工程展示', 'Engineer', '', 'product', '', '0', '0', '0-14', '工程展示', 'Engineer', '', '', '', '', 'gongcheng', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('15', '国内工程', 'Domestic Engineering', '', 'product', '', '14', '0', '0-14-15', '国内工程', 'Domestic Engineering', '', '', '', '', 'gongcheng', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('16', '国外工程', 'Overseas Projects', '', 'product', '', '14', '0', '0-14-16', '国外工程', 'Overseas Projects', '', '', '', '', 'gongcheng', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('17', '在施工程', 'Engineering', '', 'product', '', '14', '0', '0-14-17', '在施工程', 'Engineering', '', '', '', '', 'gongcheng', 'list_masonry', '0', '1');
INSERT INTO `lygj_terms` VALUES ('18', '古建文化', 'Culture', '', 'article', '', '0', '0', '0-18', '古建文化', 'Culture', '', '', '', '', 'list', 'detail', '0', '1');
INSERT INTO `lygj_terms` VALUES ('19', '传承传习', 'Inheritance', '', 'article', '', '18', '0', '0-18-19', '传承传习', 'Inheritance', '', '', '', '', 'list', 'detail', '0', '1');
INSERT INTO `lygj_terms` VALUES ('20', '技术总结', 'Technical Summary', '', 'article', '', '18', '0', '0-18-20', '技术总结', 'Technical Summary', '', '', '', '', 'list', 'detail', '0', '1');
INSERT INTO `lygj_terms` VALUES ('21', '交流活动', 'Exchange Activity', '', 'article', '', '18', '0', '0-18-21', '交流活动', 'Exchange Activity', '', '', '', '', 'list', 'detail', '0', '1');
INSERT INTO `lygj_terms` VALUES ('22', '古建常识', 'Ancient Knowledge', '', 'article', '', '18', '0', '0-18-22', '古建常识', 'Ancient Knowledge', '', '', '', '', 'list', 'detail', '0', '1');
INSERT INTO `lygj_terms` VALUES ('23', '视频中心', 'Video', '', 'article', '', '0', '0', '0-23', '视频中心', 'Video', '', '', '', '', 'list', 'detail', '0', '1');

-- ----------------------------
-- Table structure for `lygj_user_favorites`
-- ----------------------------
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of lygj_user_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `lygj_users`
-- ----------------------------
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of lygj_users
-- ----------------------------
INSERT INTO `lygj_users` VALUES ('1', 'lygj97', '###252f30d696386d8c71df91c239d3d2a9', 'admin', 'lygj@lygj97.com', '', null, '0', '2000-01-01', null, '120.33.107.163', '2017-04-02 17:57:29', '2017-03-19 04:38:10', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `lygj_variable`
-- ----------------------------
DROP TABLE IF EXISTS `lygj_variable`;
CREATE TABLE `lygj_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '变量ID',
  `variableName` varchar(255) NOT NULL COMMENT '变量名',
  `variableValue` varchar(255) DEFAULT NULL COMMENT '变量值',
  `beizhu` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `listorder` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `variableName` (`variableName`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lygj_variable
-- ----------------------------
INSERT INTO `lygj_variable` VALUES ('6', 'gs_email', 'http://mail.lygj97.com', '企业邮箱', '0');
INSERT INTO `lygj_variable` VALUES ('7', 'address', '福建泉州市安溪县城厢镇冬青村中心粮库旁龙亿古建', '联系地址', '0');
INSERT INTO `lygj_variable` VALUES ('8', 'tell', '0595-23307778', '联系电话', '0');
INSERT INTO `lygj_variable` VALUES ('9', 'fax', '0595-23307778', '传真', '0');
INSERT INTO `lygj_variable` VALUES ('10', 'postcd', '362400', '邮编', '0');
INSERT INTO `lygj_variable` VALUES ('11', 'jingdu', '118.147759', '经度', '0');
INSERT INTO `lygj_variable` VALUES ('12', 'weidu', '25.064676', '维度', '0');
INSERT INTO `lygj_variable` VALUES ('13', 'company_name', '泉州龙和古建筑工程有限公司', '公司名称', '0');
INSERT INTO `lygj_variable` VALUES ('14', 'email', 'lygj97@hotmail.com', '电子邮箱', '0');
INSERT INTO `lygj_variable` VALUES ('15', 'address_en', 'Holly village center in Chengxiang town of Fujian Quanzhou city Anxi County grain depot near the ancient dragon billion', '英文地址', '0');
INSERT INTO `lygj_variable` VALUES ('16', 'company_name_en', 'Lung He Ancient Architectural CO. LTD.', '公司英文名称', '0');
