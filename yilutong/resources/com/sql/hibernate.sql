/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : hibernate

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2015-03-17 14:30:06
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `meuntable`
-- ----------------------------
DROP TABLE IF EXISTS `meuntable`;
CREATE TABLE `meuntable` (
  `noteid` int(11) NOT NULL DEFAULT '0',
  `noteName` varchar(255) DEFAULT '' COMMENT '节点名称',
  `fuid` int(11) DEFAULT '0' COMMENT '0代表根节点，没有父节点',
  `iconurl` varchar(255) DEFAULT '' COMMENT '节点图标url',
  `ordernote` varchar(255) DEFAULT NULL COMMENT '排序',
  `pageurl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meuntable
-- ----------------------------
INSERT INTO meuntable VALUES ('1', '管理页面', '0', '', '0', null);
INSERT INTO meuntable VALUES ('2', '用户管理', '1', 'icon-page', '1', 'user.do?method=userInfo');
INSERT INTO meuntable VALUES ('3', '系统管理', '1', 'icon-class', '2', 'www.baidu.com');
INSERT INTO meuntable VALUES ('4', '物流管理', '1', 'icon-role', '3', 'index.jsp');
INSERT INTO meuntable VALUES ('5', '信息页面', '0', 'icon-set', '0', 'www.baidu.com');
INSERT INTO meuntable VALUES ('6', '密码管理', '5', 'icon-log', '1', 'www.baidu.com');
INSERT INTO meuntable VALUES ('7', '权限管理', '5', 'icon-nav', '2', 'www.baidu.com');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO role VALUES ('1', '1', '超级管理员');
INSERT INTO role VALUES ('2', '2', '客服');
INSERT INTO role VALUES ('3', '3', '普通操作人员');

-- ----------------------------
-- Table structure for `roletomeun`
-- ----------------------------
DROP TABLE IF EXISTS `roletomeun`;
CREATE TABLE `roletomeun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `menuid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roletomeun
-- ----------------------------
INSERT INTO roletomeun VALUES ('1', '1', '1');
INSERT INTO roletomeun VALUES ('2', '1', '2');
INSERT INTO roletomeun VALUES ('3', '1', '3');
INSERT INTO roletomeun VALUES ('4', '1', '4');
INSERT INTO roletomeun VALUES ('5', '1', '5');
INSERT INTO roletomeun VALUES ('6', '1', '6');
INSERT INTO roletomeun VALUES ('7', '1', '7');
INSERT INTO roletomeun VALUES ('8', '2', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('13', '赵可进', '123', '123');
INSERT INTO user VALUES ('14', '朱左鹏', null, null);
INSERT INTO user VALUES ('15', '1', '2', null);
INSERT INTO user VALUES ('16', '1', '2', null);
INSERT INTO user VALUES ('17', '1', '2', null);
INSERT INTO user VALUES ('18', '1', '2', null);
INSERT INTO user VALUES ('19', null, null, null);
INSERT INTO user VALUES ('20', null, null, null);
INSERT INTO user VALUES ('21', null, null, null);
INSERT INTO user VALUES ('22', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('23', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('24', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('25', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('26', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('27', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('28', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('29', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('30', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('31', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('32', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('33', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('34', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('35', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('36', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('37', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('38', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('39', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('40', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('41', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('42', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('43', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('44', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('45', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('46', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('47', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('48', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('49', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('50', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('51', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('52', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('53', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('54', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('55', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('56', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('57', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('58', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('59', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('60', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('61', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('62', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('63', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('64', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('65', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('66', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('67', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('68', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('69', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('70', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('71', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('72', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('73', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('74', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('75', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('76', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('77', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('78', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('79', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('80', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('81', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('82', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('83', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('84', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('85', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('86', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('87', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('88', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('89', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('90', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('91', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('92', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('93', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('94', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('95', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('96', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('97', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('98', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('99', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('100', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('101', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('102', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('103', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('104', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('105', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('106', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('107', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('108', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('109', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('110', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('111', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('112', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('113', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('114', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('115', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('116', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('117', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('118', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('119', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('120', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('121', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('122', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('123', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('124', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('125', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('126', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('127', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('128', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('129', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('130', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('131', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('132', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('133', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('134', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('135', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('136', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('137', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('138', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('139', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('140', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('141', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('142', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('143', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('144', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('145', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('146', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('147', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('148', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('149', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('150', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('151', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('152', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('153', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('154', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('155', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('156', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('157', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('158', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('159', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('160', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('161', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('162', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('163', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('164', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('165', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('166', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('167', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('168', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('169', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('170', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('171', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('172', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('173', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('174', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('175', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('176', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('177', '赵可进', '中文测试', null);
INSERT INTO user VALUES ('178', '赵可进', '中文测试', null);
