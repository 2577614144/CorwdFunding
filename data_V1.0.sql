/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : project_crowd

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 07/06/2020 17:34:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inner_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `inner_admin_role`;
CREATE TABLE `inner_admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inner_admin_role
-- ----------------------------
INSERT INTO `inner_admin_role` VALUES (5, 2, 1);
INSERT INTO `inner_admin_role` VALUES (6, 2, 238);
INSERT INTO `inner_admin_role` VALUES (7, 3, 237);
INSERT INTO `inner_admin_role` VALUES (8, 3, 239);

-- ----------------------------
-- Table structure for inner_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `inner_role_auth`;
CREATE TABLE `inner_role_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `auth_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inner_role_auth
-- ----------------------------
INSERT INTO `inner_role_auth` VALUES (1, 1, 2);
INSERT INTO `inner_role_auth` VALUES (8, 238, 1);
INSERT INTO `inner_role_auth` VALUES (9, 238, 8);
INSERT INTO `inner_role_auth` VALUES (12, 239, 4);
INSERT INTO `inner_role_auth` VALUES (13, 239, 5);

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `receive_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ռ���',
  `phone_num` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ֻ���',
  `address` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ջ���ַ',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '�û� id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES (1, 'test', '18111145277', '�Ĵ�', 4);
INSERT INTO `t_address` VALUES (2, 'test', '18111145277', '�Ĵ�', 4);

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_acct` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pswd` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_acct`(`login_acct`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 251 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'tom', '$2a$10$XtrmAW1MRrzhJFDT75rBpu1HVVlffHjcmcmN161o7KhU1XUyrhcOK', '��ķ', '1822014927@qq.com', NULL);
INSERT INTO `t_admin` VALUES (2, 'adminOperator', '$2a$10$XtrmAW1MRrzhJFDT75rBpu1HVVlffHjcmcmN161o7KhU1XUyrhcOK', 'AAOO', '1822014927@qq.com', NULL);
INSERT INTO `t_admin` VALUES (3, 'roleOperator', '$2a$10$XtrmAW1MRrzhJFDT75rBpu1HVVlffHjcmcmN161o7KhU1XUyrhcOK', 'RROO', '18220214927@qq.com', NULL);
INSERT INTO `t_admin` VALUES (248, 'admin01', '2222', 'admin01', 'aaa', NULL);
INSERT INTO `t_admin` VALUES (249, 'admin02', '2222', 'admin02', 'bbb', NULL);
INSERT INTO `t_admin` VALUES (250, 'admin03', '3333', 'admin03', 'www', NULL);

-- ----------------------------
-- Table structure for t_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_auth`;
CREATE TABLE `t_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_auth
-- ----------------------------
INSERT INTO `t_auth` VALUES (1, '', '�û�ģ��', NULL);
INSERT INTO `t_auth` VALUES (2, 'user:delete', 'ɾ��', 1);
INSERT INTO `t_auth` VALUES (3, 'user:get', '��ѯ', 1);
INSERT INTO `t_auth` VALUES (4, '', '��ɫģ��', NULL);
INSERT INTO `t_auth` VALUES (5, 'role:delete', 'ɾ��', 4);
INSERT INTO `t_auth` VALUES (6, 'role:get', '��ѯ', 4);
INSERT INTO `t_auth` VALUES (7, 'role:add', '����', 4);
INSERT INTO `t_auth` VALUES (8, 'user:save', '����', 1);

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginacct` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpswd` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authstatus` int(4) NULL DEFAULT NULL COMMENT 'ʵ����֤״̬ 0 - δʵ����֤�� 1 - ʵ����֤�����У� 2 - ��ʵ����֤',
  `usertype` int(4) NULL DEFAULT NULL COMMENT ' 0 - ���ˣ� 1 - ��ҵ',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accttype` int(4) NULL DEFAULT NULL COMMENT '0 - ��ҵ�� 1 - ���壬 2 - ���ˣ� 3 - ����',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `loginacct`(`loginacct`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES (1, 'jack', '$2a$10$O8n15OCjebejO8CUnOrwjON6bi0kj6fpbY3p.Qez7W7yZGfHSJEOm', ' �� �� ', 'jack@qq.com', 1, 1, '�ܿ�', '123123', 2);
INSERT INTO `t_member` VALUES (2, 'tom', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (4, 'root', '$2a$10$6CWQZWx3UfBsMmKDmzEgWuRI2QgrmhZq4X/1fjOCaSlFi2WS4PHNa', 'nsu', '1822014927@qq.com', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_member_confirm_info
-- ----------------------------
DROP TABLE IF EXISTS `t_member_confirm_info`;
CREATE TABLE `t_member_confirm_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL COMMENT '��Ա id',
  `paynum` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�׸�����ҵ�˺�',
  `cardnum` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�������֤��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member_confirm_info
-- ----------------------------
INSERT INTO `t_member_confirm_info` VALUES (1, 4, 'test', 'test');
INSERT INTO `t_member_confirm_info` VALUES (2, 4, 'test', 'teset');

-- ----------------------------
-- Table structure for t_member_launch_info
-- ----------------------------
DROP TABLE IF EXISTS `t_member_launch_info`;
CREATE TABLE `t_member_launch_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL COMMENT '��Ա id',
  `description_simple` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�򵥽���',
  `description_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ϸ����',
  `phone_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��ϵ�绰',
  `service_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ͷ��绰',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_member_launch_info
-- ----------------------------
INSERT INTO `t_member_launch_info` VALUES (1, 4, 'i am mao', '����è��', '123456', '654321');
INSERT INTO `t_member_launch_info` VALUES (2, 4, 'i am mao', '����è��', '123456', '654321');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, NULL, 'ϵͳȨ�޲˵�', NULL, 'glyphicon\r\nglyphicon-th-list');
INSERT INTO `t_menu` VALUES (2, 1, '�� �� �� ��', 'main.htm', 'glyphicon glyphicon glyphicon-tasks');
INSERT INTO `t_menu` VALUES (3, 1, 'Ȩ�޹���', NULL, 'glyphicon glyphicon\r\nglyphicon-tasks');
INSERT INTO `t_menu` VALUES (4, 3, ' �� �� ά �� ', 'user/index.htm', 'glyphicon\r\nglyphicon-user');
INSERT INTO `t_menu` VALUES (5, 3, ' �� ɫ ά �� ', 'role/index.htm', 'glyphicon\r\nglyphicon-king');
INSERT INTO `t_menu` VALUES (6, 3, ' �� �� ά �� ', 'permission/index.htm', 'glyphicon\r\nglyphicon-lock');
INSERT INTO `t_menu` VALUES (7, 1, ' ҵ �� �� �� ', NULL, 'glyphicon\r\nglyphicon-ok');
INSERT INTO `t_menu` VALUES (8, 7, 'ʵ����֤���', 'auth_cert/index.htm', 'glyphicon\r\nglyphicon-check');
INSERT INTO `t_menu` VALUES (9, 7, ' �� �� �� �� ', 'auth_adv/index.htm', 'glyphicon\r\nglyphicon-check');
INSERT INTO `t_menu` VALUES (10, 7, ' �� Ŀ �� �� ', 'auth_project/index.htm', 'glyphicon\r\nglyphicon-check');
INSERT INTO `t_menu` VALUES (11, 1, ' ҵ �� �� �� ', NULL, 'glyphicon\r\nglyphicon-th-large');
INSERT INTO `t_menu` VALUES (12, 11, ' �� �� ά �� ', 'cert/index.htm', 'glyphicon\r\nglyphicon-picture');
INSERT INTO `t_menu` VALUES (13, 11, ' �� �� �� �� ', 'certtype/index.htm', 'glyphicon\r\nglyphicon-equalizer');
INSERT INTO `t_menu` VALUES (14, 11, ' �� �� �� �� ', 'process/index.htm', 'glyphicon\r\nglyphicon-random');
INSERT INTO `t_menu` VALUES (15, 11, ' �� �� �� �� ', 'advert/index.htm', 'glyphicon\r\nglyphicon-hdd');
INSERT INTO `t_menu` VALUES (16, 11, ' �� Ϣ ģ �� ', 'message/index.htm', 'glyphicon\r\nglyphicon-comment');
INSERT INTO `t_menu` VALUES (17, 11, ' �� Ŀ �� �� ', 'projectType/index.htm', 'glyphicon\r\nglyphicon-list');
INSERT INTO `t_menu` VALUES (18, 11, ' �� Ŀ �� ǩ ', 'tag/index.htm', 'glyphicon\r\nglyphicon-tags');
INSERT INTO `t_menu` VALUES (19, 1, ' �� �� �� �� ', 'param/index.htm', 'glyphicon\r\nglyphicon-list-alt');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `order_num` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������',
  `pay_order_num` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '֧������ˮ��',
  `order_amount` double(10, 5) NULL DEFAULT NULL COMMENT '�������',
  `invoice` int(11) NULL DEFAULT NULL COMMENT '�Ƿ񿪷�Ʊ��0 ������1 ����',
  `invoice_title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ʊ̧ͷ',
  `order_remark` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������ע',
  `address_id` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ջ���ַ id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_order_project
-- ----------------------------
DROP TABLE IF EXISTS `t_order_project`;
CREATE TABLE `t_order_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `project_name` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ����',
  `launch_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '������',
  `return_content` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ر�����',
  `return_count` int(11) NULL DEFAULT NULL COMMENT '�ر�����',
  `support_price` int(11) NULL DEFAULT NULL COMMENT '֧�ֵ���',
  `freight` int(11) NULL DEFAULT NULL COMMENT '���ͷ���',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '�����������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ����',
  `project_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ����',
  `money` bigint(11) NULL DEFAULT NULL COMMENT '�Ｏ���',
  `day` int(11) NULL DEFAULT NULL COMMENT '�Ｏ����',
  `status` int(4) NULL DEFAULT NULL COMMENT '0-������ʼ��1-�ڳ��У�2-�ڳ�ɹ���3-�ڳ�ʧ��',
  `deploydate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ����ʱ��',
  `supportmoney` bigint(11) NULL DEFAULT NULL COMMENT '�ѳＯ���Ľ��',
  `supporter` int(11) NULL DEFAULT NULL COMMENT '֧������',
  `completion` int(3) NULL DEFAULT NULL COMMENT '�ٷֱ���ɶ�',
  `memberid` int(11) NULL DEFAULT NULL COMMENT '�����˵Ļ�Ա id',
  `createdate` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��Ŀ����ʱ��',
  `follower` int(11) NULL DEFAULT NULL COMMENT '��ע����',
  `header_picture_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ͷͼ·��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES (3, 'brotherMao', '����˧��', 100000, 30, 0, '2020-6-1', 1000, 20, 25, 4, '2020-06-03', NULL, 'http://ccctop-first.oss-cn-chengdu.aliyuncs.com/20200603/935077885bd44007a38bb3b50282355f.png');
INSERT INTO `t_project` VALUES (4, 'brotherMao', '����˧��', 100000, 30, 0, '2020-6-1', 1000, 20, 25, 4, '2020-06-04', NULL, 'http://ccctop-first.oss-cn-chengdu.aliyuncs.com/20200604/5d9813ee713e46c892c3d3b1eff46dd3.png');

-- ----------------------------
-- Table structure for t_project_item_pic
-- ----------------------------
DROP TABLE IF EXISTS `t_project_item_pic`;
CREATE TABLE `t_project_item_pic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `item_pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_item_pic
-- ----------------------------
INSERT INTO `t_project_item_pic` VALUES (1, NULL, 'http://ccctop-first.oss-cn-chengdu.aliyuncs.com/20200603/085a3c34e0414c71948738adee371040.png');
INSERT INTO `t_project_item_pic` VALUES (2, 4, 'http://ccctop-first.oss-cn-chengdu.aliyuncs.com/20200604/31bbbe24ed1041ca934a7f11a98c7914.png');

-- ----------------------------
-- Table structure for t_project_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_project_tag`;
CREATE TABLE `t_project_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `tagid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_tag
-- ----------------------------
INSERT INTO `t_project_tag` VALUES (7, NULL, 5);
INSERT INTO `t_project_tag` VALUES (8, NULL, 7);
INSERT INTO `t_project_tag` VALUES (9, NULL, 9);
INSERT INTO `t_project_tag` VALUES (10, 1, 1);
INSERT INTO `t_project_tag` VALUES (11, 4, 5);
INSERT INTO `t_project_tag` VALUES (12, 4, 7);
INSERT INTO `t_project_tag` VALUES (13, 4, 9);

-- ----------------------------
-- Table structure for t_project_type
-- ----------------------------
DROP TABLE IF EXISTS `t_project_type`;
CREATE TABLE `t_project_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `typeid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_project_type
-- ----------------------------
INSERT INTO `t_project_type` VALUES (7, 3, 2);
INSERT INTO `t_project_type` VALUES (8, 4, 4);

-- ----------------------------
-- Table structure for t_return
-- ----------------------------
DROP TABLE IF EXISTS `t_return`;
CREATE TABLE `t_return`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectid` int(11) NULL DEFAULT NULL,
  `type` int(4) NULL DEFAULT NULL COMMENT '0 - ʵ��ر��� 1 ������Ʒ�ر�',
  `supportmoney` int(11) NULL DEFAULT NULL COMMENT '֧�ֽ��',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�ر�����',
  `count` int(11) NULL DEFAULT NULL COMMENT '�ر���Ʒ�޶��0��Ϊ���޻ر�����',
  `signalpurchase` int(11) NULL DEFAULT NULL COMMENT '�Ƿ����õ����޹�',
  `purchase` int(11) NULL DEFAULT NULL COMMENT '�����޹�����',
  `freight` int(11) NULL DEFAULT NULL COMMENT '�˷ѣ���0��Ϊ����',
  `invoice` int(4) NULL DEFAULT NULL COMMENT '0 - ������Ʊ�� 1 - ����Ʊ',
  `returndate` int(11) NULL DEFAULT NULL COMMENT '��Ŀ�������������֧���߷��ͻر�',
  `describ_pic_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '˵��ͼƬ·��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_return
-- ----------------------------
INSERT INTO `t_return` VALUES (1, NULL, NULL, 10, '��������', 5, NULL, 8, 0, NULL, 15, 'http://ccctop-first.oss-cn-chengdu.aliyuncs.com/20200603/f83b07fb27e6465da2f6ad67ac96f12f.png');
INSERT INTO `t_return` VALUES (2, 4, NULL, 10, '��������', 5, NULL, 8, 0, NULL, 15, 'http://ccctop-first.oss-cn-chengdu.aliyuncs.com/20200604/b6901356705844ab85b7ecfe6621ab9f.png');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 240 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '����');
INSERT INTO `t_role` VALUES (237, '����');
INSERT INTO `t_role` VALUES (238, '���������');
INSERT INTO `t_role` VALUES (239, '����������');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '��������',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '�������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, '�Ƽ�', '�����ǻ�����');
INSERT INTO `t_type` VALUES (2, '���', '�����ı�δ��');
INSERT INTO `t_type` VALUES (3, 'ũҵ', '�������·���');
INSERT INTO `t_type` VALUES (4, '����', '�㼯��㰮��');

SET FOREIGN_KEY_CHECKS = 1;
