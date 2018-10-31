/*
Navicat MySQL Data Transfer

Source Server         : ALIYUN3year
Source Server Version : 50173
Source Host           : 47.98.206.171:3306
Source Database       : ministryarrange

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-10-31 17:36:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `addrcode`
-- ----------------------------
DROP TABLE IF EXISTS `addrcode`;
CREATE TABLE `addrcode` (
  `id` int(8) NOT NULL,
  `b_addr_code` varchar(10) DEFAULT NULL,
  `b_addr_name` varchar(10) DEFAULT NULL,
  `s_addr_code` varchar(20) DEFAULT NULL,
  `s_addr_name` varchar(20) DEFAULT NULL,
  `reunion_type` tinyint(1) DEFAULT NULL COMMENT ' 0:周四聚会 1:周六聚会 2:周日聚会 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addrcode
-- ----------------------------

-- ----------------------------
-- Table structure for `serviceaddress`
-- ----------------------------
DROP TABLE IF EXISTS `serviceaddress`;
CREATE TABLE `serviceaddress` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `area` varchar(100) NOT NULL,
  `church` varchar(100) DEFAULT NULL,
  `reunion_type` tinyint(1) DEFAULT '0' COMMENT ' 0:周四聚会 1:周六聚会 2:周日聚会 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of serviceaddress
-- ----------------------------
INSERT INTO `serviceaddress` VALUES ('278', '江镜家', '前宅', '2');
INSERT INTO `serviceaddress` VALUES ('279', '江镜家', '酒店', '1');
INSERT INTO `serviceaddress` VALUES ('280', '江镜家', '城坂', '1');
INSERT INTO `serviceaddress` VALUES ('281', '江镜家', '塘边', '2');
INSERT INTO `serviceaddress` VALUES ('282', '江镜家', '南后', '2');
INSERT INTO `serviceaddress` VALUES ('283', '江镜家', '农场', '2');
INSERT INTO `serviceaddress` VALUES ('284', '江镜家', '东村', '2');
INSERT INTO `serviceaddress` VALUES ('285', '江镜家', '谢塘', '2');
INSERT INTO `serviceaddress` VALUES ('286', '江镜家', '上连', '1');
INSERT INTO `serviceaddress` VALUES ('287', '江镜家', '东洋边', '2');
INSERT INTO `serviceaddress` VALUES ('288', '江镜家', '东薛', '1');
INSERT INTO `serviceaddress` VALUES ('289', '前张家', '前张', '1');
INSERT INTO `serviceaddress` VALUES ('290', '前张家', '苍溪', '1');
INSERT INTO `serviceaddress` VALUES ('291', '前张家', '大定房', '2');
INSERT INTO `serviceaddress` VALUES ('292', '前张家', '大定房', '1');
INSERT INTO `serviceaddress` VALUES ('293', '前张家', '小定房', '1');
INSERT INTO `serviceaddress` VALUES ('294', '前张家', '林东', '1');
INSERT INTO `serviceaddress` VALUES ('295', '前张家', '林西', '1');
INSERT INTO `serviceaddress` VALUES ('296', '前张家', '里头', '1');
INSERT INTO `serviceaddress` VALUES ('297', '前张家', '文房东', '1');
INSERT INTO `serviceaddress` VALUES ('298', '前张家', '文房西', '1');
INSERT INTO `serviceaddress` VALUES ('299', '前张家', '蔡厝', '1');
INSERT INTO `serviceaddress` VALUES ('300', '前张家', '西江边', '1');
INSERT INTO `serviceaddress` VALUES ('301', '前张家', '院边', '1');
INSERT INTO `serviceaddress` VALUES ('302', '东宵家', '东宵', '2');
INSERT INTO `serviceaddress` VALUES ('303', '东宵家', '张厝', '1');
INSERT INTO `serviceaddress` VALUES ('304', '东宵家', '狮厝', '2');
INSERT INTO `serviceaddress` VALUES ('305', '东宵家', '塘沁', '2');
INSERT INTO `serviceaddress` VALUES ('306', '东宵家', '北陈', '2');
INSERT INTO `serviceaddress` VALUES ('307', '东宵家', '确坛', '2');
INSERT INTO `serviceaddress` VALUES ('308', '东宵家', '后薛', '2');
INSERT INTO `serviceaddress` VALUES ('309', '东宵家', '玉仑', '2');
INSERT INTO `serviceaddress` VALUES ('310', '岸斗家', '岸斗', '0');
INSERT INTO `serviceaddress` VALUES ('311', '岸斗家', '吴塘', '1');
INSERT INTO `serviceaddress` VALUES ('312', '岸斗家', '薛垱', '1');
INSERT INTO `serviceaddress` VALUES ('313', '岸斗家', '东曾', '1');
INSERT INTO `serviceaddress` VALUES ('314', '岸斗家', '前华', '1');
INSERT INTO `serviceaddress` VALUES ('315', '岸斗家', '陈厝', '1');
INSERT INTO `serviceaddress` VALUES ('316', '岸斗家', '芦塘', '1');
INSERT INTO `serviceaddress` VALUES ('317', '岸斗家', '城头', '2');
INSERT INTO `serviceaddress` VALUES ('318', '岸斗家', '后星期', '1');
INSERT INTO `serviceaddress` VALUES ('319', '岸斗家', '柯屿', '1');
INSERT INTO `serviceaddress` VALUES ('320', '岸斗家', '上郭', '1');
INSERT INTO `serviceaddress` VALUES ('321', '和洋家', '上和洋', '2');
INSERT INTO `serviceaddress` VALUES ('322', '和洋家', '下和洋', '2');
INSERT INTO `serviceaddress` VALUES ('323', '和洋家', '南宵', '2');
INSERT INTO `serviceaddress` VALUES ('324', '和洋家', '华塘', '2');
INSERT INTO `serviceaddress` VALUES ('325', '和洋家', '南华', '2');
INSERT INTO `serviceaddress` VALUES ('326', '和洋家', '北翁', '2');
INSERT INTO `serviceaddress` VALUES ('327', '和洋家', '院后', '1');

-- ----------------------------
-- Table structure for `servicearrange`
-- ----------------------------
DROP TABLE IF EXISTS `servicearrange`;
CREATE TABLE `servicearrange` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `area` varchar(20) NOT NULL COMMENT '服侍地址id',
  `church` varchar(20) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `reuniondate` date DEFAULT NULL COMMENT '聚会日期',
  `reuniondateCN` varchar(20) DEFAULT NULL COMMENT '星期日',
  `arrangestatus` tinyint(1) DEFAULT '1' COMMENT '安排状态  0 不需要安排 1需要安排',
  `weekofdate` tinyint(1) DEFAULT NULL COMMENT '当前日期所在月份的第几周',
  `reunion_type` varchar(10) DEFAULT NULL,
  `address_id` int(7) DEFAULT NULL,
  `order_num` int(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6413 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of servicearrange
-- ----------------------------
INSERT INTO `servicearrange` VALUES ('6191', '江镜家', '前宅', null, '2018-04-01', '星期日', '1', '1', '星期日', '278', '144');
INSERT INTO `servicearrange` VALUES ('6192', '江镜家', '前宅', null, '2018-04-08', '星期日', '0', '2', '星期日', '278', '178');
INSERT INTO `servicearrange` VALUES ('6193', '江镜家', '前宅', null, '2018-04-15', '星期日', '0', '3', '星期日', '278', '41');
INSERT INTO `servicearrange` VALUES ('6194', '江镜家', '前宅', null, '2018-04-22', '星期日', '1', '4', '星期日', '278', '218');
INSERT INTO `servicearrange` VALUES ('6195', '江镜家', '前宅', null, '2018-04-29', '星期日', '1', '5', '星期日', '278', '59');
INSERT INTO `servicearrange` VALUES ('6196', '江镜家', '酒店', null, '2018-04-07', '星期六', '1', '2', '星期六', '279', '127');
INSERT INTO `servicearrange` VALUES ('6197', '江镜家', '酒店', null, '2018-04-14', '星期六', '1', '3', '星期六', '279', '95');
INSERT INTO `servicearrange` VALUES ('6198', '江镜家', '酒店', null, '2018-04-21', '星期六', '1', '4', '星期六', '279', '215');
INSERT INTO `servicearrange` VALUES ('6199', '江镜家', '酒店', null, '2018-04-28', '星期六', '1', '5', '星期六', '279', '134');
INSERT INTO `servicearrange` VALUES ('6200', '江镜家', '城坂', null, '2018-04-07', '星期六', '1', '2', '星期六', '280', '187');
INSERT INTO `servicearrange` VALUES ('6201', '江镜家', '城坂', null, '2018-04-14', '星期六', '1', '3', '星期六', '280', '188');
INSERT INTO `servicearrange` VALUES ('6202', '江镜家', '城坂', null, '2018-04-21', '星期六', '1', '4', '星期六', '280', '163');
INSERT INTO `servicearrange` VALUES ('6203', '江镜家', '城坂', null, '2018-04-28', '星期六', '1', '5', '星期六', '280', '47');
INSERT INTO `servicearrange` VALUES ('6204', '江镜家', '塘边', null, '2018-04-01', '星期日', '1', '1', '星期日', '281', '149');
INSERT INTO `servicearrange` VALUES ('6205', '江镜家', '塘边', null, '2018-04-08', '星期日', '1', '2', '星期日', '281', '123');
INSERT INTO `servicearrange` VALUES ('6206', '江镜家', '塘边', null, '2018-04-15', '星期日', '1', '3', '星期日', '281', '136');
INSERT INTO `servicearrange` VALUES ('6207', '江镜家', '塘边', null, '2018-04-22', '星期日', '1', '4', '星期日', '281', '158');
INSERT INTO `servicearrange` VALUES ('6208', '江镜家', '塘边', null, '2018-04-29', '星期日', '1', '5', '星期日', '281', '221');
INSERT INTO `servicearrange` VALUES ('6209', '江镜家', '南后', null, '2018-04-01', '星期日', '1', '1', '星期日', '282', '160');
INSERT INTO `servicearrange` VALUES ('6210', '江镜家', '南后', null, '2018-04-08', '星期日', '1', '2', '星期日', '282', '108');
INSERT INTO `servicearrange` VALUES ('6211', '江镜家', '南后', null, '2018-04-15', '星期日', '1', '3', '星期日', '282', '130');
INSERT INTO `servicearrange` VALUES ('6212', '江镜家', '南后', null, '2018-04-22', '星期日', '1', '4', '星期日', '282', '208');
INSERT INTO `servicearrange` VALUES ('6213', '江镜家', '南后', null, '2018-04-29', '星期日', '1', '5', '星期日', '282', '26');
INSERT INTO `servicearrange` VALUES ('6214', '江镜家', '农场', null, '2018-04-01', '星期日', '1', '1', '星期日', '283', '56');
INSERT INTO `servicearrange` VALUES ('6215', '江镜家', '农场', null, '2018-04-08', '星期日', '1', '2', '星期日', '283', '67');
INSERT INTO `servicearrange` VALUES ('6216', '江镜家', '农场', null, '2018-04-15', '星期日', '1', '3', '星期日', '283', '73');
INSERT INTO `servicearrange` VALUES ('6217', '江镜家', '农场', null, '2018-04-22', '星期日', '1', '4', '星期日', '283', '103');
INSERT INTO `servicearrange` VALUES ('6218', '江镜家', '农场', null, '2018-04-29', '星期日', '1', '5', '星期日', '283', '133');
INSERT INTO `servicearrange` VALUES ('6219', '江镜家', '东村', null, '2018-04-01', '星期日', '1', '1', '星期日', '284', '159');
INSERT INTO `servicearrange` VALUES ('6220', '江镜家', '东村', null, '2018-04-08', '星期日', '1', '2', '星期日', '284', '146');
INSERT INTO `servicearrange` VALUES ('6221', '江镜家', '东村', null, '2018-04-15', '星期日', '1', '3', '星期日', '284', '6');
INSERT INTO `servicearrange` VALUES ('6222', '江镜家', '东村', null, '2018-04-22', '星期日', '1', '4', '星期日', '284', '167');
INSERT INTO `servicearrange` VALUES ('6223', '江镜家', '东村', null, '2018-04-29', '星期日', '1', '5', '星期日', '284', '83');
INSERT INTO `servicearrange` VALUES ('6224', '江镜家', '谢塘', null, '2018-04-01', '星期日', '1', '1', '星期日', '285', '172');
INSERT INTO `servicearrange` VALUES ('6225', '江镜家', '谢塘', null, '2018-04-08', '星期日', '1', '2', '星期日', '285', '54');
INSERT INTO `servicearrange` VALUES ('6226', '江镜家', '谢塘', null, '2018-04-15', '星期日', '1', '3', '星期日', '285', '140');
INSERT INTO `servicearrange` VALUES ('6227', '江镜家', '谢塘', null, '2018-04-22', '星期日', '1', '4', '星期日', '285', '98');
INSERT INTO `servicearrange` VALUES ('6228', '江镜家', '谢塘', null, '2018-04-29', '星期日', '1', '5', '星期日', '285', '143');
INSERT INTO `servicearrange` VALUES ('6229', '江镜家', '上连', null, '2018-04-07', '星期六', '1', '2', '星期六', '286', '7');
INSERT INTO `servicearrange` VALUES ('6230', '江镜家', '上连', null, '2018-04-14', '星期六', '1', '3', '星期六', '286', '93');
INSERT INTO `servicearrange` VALUES ('6231', '江镜家', '上连', null, '2018-04-21', '星期六', '1', '4', '星期六', '286', '68');
INSERT INTO `servicearrange` VALUES ('6232', '江镜家', '上连', null, '2018-04-28', '星期六', '1', '5', '星期六', '286', '111');
INSERT INTO `servicearrange` VALUES ('6233', '江镜家', '东洋边', null, '2018-04-01', '星期日', '1', '1', '星期日', '287', '205');
INSERT INTO `servicearrange` VALUES ('6234', '江镜家', '东洋边', null, '2018-04-08', '星期日', '1', '2', '星期日', '287', '121');
INSERT INTO `servicearrange` VALUES ('6235', '江镜家', '东洋边', null, '2018-04-15', '星期日', '1', '3', '星期日', '287', '170');
INSERT INTO `servicearrange` VALUES ('6236', '江镜家', '东洋边', null, '2018-04-22', '星期日', '1', '4', '星期日', '287', '211');
INSERT INTO `servicearrange` VALUES ('6237', '江镜家', '东洋边', null, '2018-04-29', '星期日', '1', '5', '星期日', '287', '132');
INSERT INTO `servicearrange` VALUES ('6238', '江镜家', '东薛', null, '2018-04-07', '星期六', '1', '2', '星期六', '288', '50');
INSERT INTO `servicearrange` VALUES ('6239', '江镜家', '东薛', null, '2018-04-14', '星期六', '1', '3', '星期六', '288', '199');
INSERT INTO `servicearrange` VALUES ('6240', '江镜家', '东薛', null, '2018-04-21', '星期六', '1', '4', '星期六', '288', '220');
INSERT INTO `servicearrange` VALUES ('6241', '江镜家', '东薛', null, '2018-04-28', '星期六', '1', '5', '星期六', '288', '3');
INSERT INTO `servicearrange` VALUES ('6242', '前张家', '前张', null, '2018-04-07', '星期六', '1', '2', '星期六', '289', '186');
INSERT INTO `servicearrange` VALUES ('6243', '前张家', '前张', null, '2018-04-14', '星期六', '1', '3', '星期六', '289', '61');
INSERT INTO `servicearrange` VALUES ('6244', '前张家', '前张', null, '2018-04-21', '星期六', '1', '4', '星期六', '289', '37');
INSERT INTO `servicearrange` VALUES ('6245', '前张家', '前张', null, '2018-04-28', '星期六', '1', '5', '星期六', '289', '166');
INSERT INTO `servicearrange` VALUES ('6246', '前张家', '苍溪', null, '2018-04-07', '星期六', '1', '2', '星期六', '290', '152');
INSERT INTO `servicearrange` VALUES ('6247', '前张家', '苍溪', null, '2018-04-14', '星期六', '1', '3', '星期六', '290', '147');
INSERT INTO `servicearrange` VALUES ('6248', '前张家', '苍溪', null, '2018-04-21', '星期六', '1', '4', '星期六', '290', '196');
INSERT INTO `servicearrange` VALUES ('6249', '前张家', '苍溪', null, '2018-04-28', '星期六', '1', '5', '星期六', '290', '91');
INSERT INTO `servicearrange` VALUES ('6250', '前张家', '大定房', null, '2018-04-01', '星期日', '1', '1', '星期日', '291', '206');
INSERT INTO `servicearrange` VALUES ('6251', '前张家', '大定房', null, '2018-04-08', '星期日', '1', '2', '星期日', '291', '58');
INSERT INTO `servicearrange` VALUES ('6252', '前张家', '大定房', null, '2018-04-15', '星期日', '1', '3', '星期日', '291', '153');
INSERT INTO `servicearrange` VALUES ('6253', '前张家', '大定房', null, '2018-04-22', '星期日', '1', '4', '星期日', '291', '9');
INSERT INTO `servicearrange` VALUES ('6254', '前张家', '大定房', null, '2018-04-29', '星期日', '1', '5', '星期日', '291', '33');
INSERT INTO `servicearrange` VALUES ('6255', '前张家', '大定房', null, '2018-04-07', '星期六', '1', '2', '星期六', '292', '19');
INSERT INTO `servicearrange` VALUES ('6256', '前张家', '大定房', null, '2018-04-14', '星期六', '1', '3', '星期六', '292', '40');
INSERT INTO `servicearrange` VALUES ('6257', '前张家', '大定房', null, '2018-04-21', '星期六', '1', '4', '星期六', '292', '157');
INSERT INTO `servicearrange` VALUES ('6258', '前张家', '大定房', null, '2018-04-28', '星期六', '1', '5', '星期六', '292', '173');
INSERT INTO `servicearrange` VALUES ('6259', '前张家', '小定房', null, '2018-04-07', '星期六', '1', '2', '星期六', '293', '125');
INSERT INTO `servicearrange` VALUES ('6260', '前张家', '小定房', null, '2018-04-14', '星期六', '1', '3', '星期六', '293', '14');
INSERT INTO `servicearrange` VALUES ('6261', '前张家', '小定房', null, '2018-04-21', '星期六', '1', '4', '星期六', '293', '34');
INSERT INTO `servicearrange` VALUES ('6262', '前张家', '小定房', null, '2018-04-28', '星期六', '1', '5', '星期六', '293', '217');
INSERT INTO `servicearrange` VALUES ('6263', '前张家', '林东', null, '2018-04-07', '星期六', '1', '2', '星期六', '294', '94');
INSERT INTO `servicearrange` VALUES ('6264', '前张家', '林东', null, '2018-04-14', '星期六', '1', '3', '星期六', '294', '48');
INSERT INTO `servicearrange` VALUES ('6265', '前张家', '林东', null, '2018-04-21', '星期六', '1', '4', '星期六', '294', '161');
INSERT INTO `servicearrange` VALUES ('6266', '前张家', '林东', null, '2018-04-28', '星期六', '1', '5', '星期六', '294', '70');
INSERT INTO `servicearrange` VALUES ('6267', '前张家', '林西', null, '2018-04-07', '星期六', '1', '2', '星期六', '295', '106');
INSERT INTO `servicearrange` VALUES ('6268', '前张家', '林西', null, '2018-04-14', '星期六', '1', '3', '星期六', '295', '216');
INSERT INTO `servicearrange` VALUES ('6269', '前张家', '林西', null, '2018-04-21', '星期六', '1', '4', '星期六', '295', '162');
INSERT INTO `servicearrange` VALUES ('6270', '前张家', '林西', null, '2018-04-28', '星期六', '1', '5', '星期六', '295', '176');
INSERT INTO `servicearrange` VALUES ('6271', '前张家', '里头', null, '2018-04-07', '星期六', '1', '2', '星期六', '296', '110');
INSERT INTO `servicearrange` VALUES ('6272', '前张家', '里头', null, '2018-04-14', '星期六', '1', '3', '星期六', '296', '180');
INSERT INTO `servicearrange` VALUES ('6273', '前张家', '里头', null, '2018-04-21', '星期六', '1', '4', '星期六', '296', '82');
INSERT INTO `servicearrange` VALUES ('6274', '前张家', '里头', null, '2018-04-28', '星期六', '1', '5', '星期六', '296', '44');
INSERT INTO `servicearrange` VALUES ('6275', '前张家', '文房东', null, '2018-04-07', '星期六', '1', '2', '星期六', '297', '191');
INSERT INTO `servicearrange` VALUES ('6276', '前张家', '文房东', null, '2018-04-14', '星期六', '1', '3', '星期六', '297', '66');
INSERT INTO `servicearrange` VALUES ('6277', '前张家', '文房东', null, '2018-04-21', '星期六', '1', '4', '星期六', '297', '72');
INSERT INTO `servicearrange` VALUES ('6278', '前张家', '文房东', null, '2018-04-28', '星期六', '1', '5', '星期六', '297', '31');
INSERT INTO `servicearrange` VALUES ('6279', '前张家', '文房西', null, '2018-04-07', '星期六', '1', '2', '星期六', '298', '115');
INSERT INTO `servicearrange` VALUES ('6280', '前张家', '文房西', null, '2018-04-14', '星期六', '1', '3', '星期六', '298', '154');
INSERT INTO `servicearrange` VALUES ('6281', '前张家', '文房西', null, '2018-04-21', '星期六', '1', '4', '星期六', '298', '21');
INSERT INTO `servicearrange` VALUES ('6282', '前张家', '文房西', null, '2018-04-28', '星期六', '1', '5', '星期六', '298', '99');
INSERT INTO `servicearrange` VALUES ('6283', '前张家', '蔡厝', null, '2018-04-07', '星期六', '1', '2', '星期六', '299', '12');
INSERT INTO `servicearrange` VALUES ('6284', '前张家', '蔡厝', null, '2018-04-14', '星期六', '1', '3', '星期六', '299', '71');
INSERT INTO `servicearrange` VALUES ('6285', '前张家', '蔡厝', null, '2018-04-21', '星期六', '1', '4', '星期六', '299', '120');
INSERT INTO `servicearrange` VALUES ('6286', '前张家', '蔡厝', null, '2018-04-28', '星期六', '1', '5', '星期六', '299', '142');
INSERT INTO `servicearrange` VALUES ('6287', '前张家', '西江边', null, '2018-04-07', '星期六', '1', '2', '星期六', '300', '222');
INSERT INTO `servicearrange` VALUES ('6288', '前张家', '西江边', null, '2018-04-14', '星期六', '1', '3', '星期六', '300', '101');
INSERT INTO `servicearrange` VALUES ('6289', '前张家', '西江边', null, '2018-04-21', '星期六', '1', '4', '星期六', '300', '63');
INSERT INTO `servicearrange` VALUES ('6290', '前张家', '西江边', null, '2018-04-28', '星期六', '1', '5', '星期六', '300', '80');
INSERT INTO `servicearrange` VALUES ('6291', '前张家', '院边', null, '2018-04-07', '星期六', '1', '2', '星期六', '301', '212');
INSERT INTO `servicearrange` VALUES ('6292', '前张家', '院边', null, '2018-04-14', '星期六', '1', '3', '星期六', '301', '168');
INSERT INTO `servicearrange` VALUES ('6293', '前张家', '院边', null, '2018-04-21', '星期六', '1', '4', '星期六', '301', '74');
INSERT INTO `servicearrange` VALUES ('6294', '前张家', '院边', null, '2018-04-28', '星期六', '1', '5', '星期六', '301', '207');
INSERT INTO `servicearrange` VALUES ('6295', '东宵家', '东宵', null, '2018-04-01', '星期日', '1', '1', '星期日', '302', '203');
INSERT INTO `servicearrange` VALUES ('6296', '东宵家', '东宵', null, '2018-04-08', '星期日', '1', '2', '星期日', '302', '116');
INSERT INTO `servicearrange` VALUES ('6297', '东宵家', '东宵', null, '2018-04-15', '星期日', '1', '3', '星期日', '302', '184');
INSERT INTO `servicearrange` VALUES ('6298', '东宵家', '东宵', null, '2018-04-22', '星期日', '1', '4', '星期日', '302', '213');
INSERT INTO `servicearrange` VALUES ('6299', '东宵家', '东宵', null, '2018-04-29', '星期日', '1', '5', '星期日', '302', '164');
INSERT INTO `servicearrange` VALUES ('6300', '东宵家', '张厝', null, '2018-04-07', '星期六', '1', '2', '星期六', '303', '64');
INSERT INTO `servicearrange` VALUES ('6301', '东宵家', '张厝', null, '2018-04-14', '星期六', '1', '3', '星期六', '303', '1');
INSERT INTO `servicearrange` VALUES ('6302', '东宵家', '张厝', null, '2018-04-21', '星期六', '0', '4', '星期六', '303', '57');
INSERT INTO `servicearrange` VALUES ('6303', '东宵家', '张厝', null, '2018-04-28', '星期六', '0', '5', '星期六', '303', '139');
INSERT INTO `servicearrange` VALUES ('6304', '东宵家', '狮厝', null, '2018-04-01', '星期日', '1', '1', '星期日', '304', '4');
INSERT INTO `servicearrange` VALUES ('6305', '东宵家', '狮厝', null, '2018-04-08', '星期日', '1', '2', '星期日', '304', '112');
INSERT INTO `servicearrange` VALUES ('6306', '东宵家', '狮厝', null, '2018-04-15', '星期日', '1', '3', '星期日', '304', '10');
INSERT INTO `servicearrange` VALUES ('6307', '东宵家', '狮厝', null, '2018-04-22', '星期日', '1', '4', '星期日', '304', '155');
INSERT INTO `servicearrange` VALUES ('6308', '东宵家', '狮厝', null, '2018-04-29', '星期日', '1', '5', '星期日', '304', '89');
INSERT INTO `servicearrange` VALUES ('6309', '东宵家', '塘沁', null, '2018-04-01', '星期日', '1', '1', '星期日', '305', '39');
INSERT INTO `servicearrange` VALUES ('6310', '东宵家', '塘沁', null, '2018-04-08', '星期日', '1', '2', '星期日', '305', '88');
INSERT INTO `servicearrange` VALUES ('6311', '东宵家', '塘沁', null, '2018-04-15', '星期日', '1', '3', '星期日', '305', '87');
INSERT INTO `servicearrange` VALUES ('6312', '东宵家', '塘沁', null, '2018-04-22', '星期日', '1', '4', '星期日', '305', '137');
INSERT INTO `servicearrange` VALUES ('6313', '东宵家', '塘沁', null, '2018-04-29', '星期日', '1', '5', '星期日', '305', '90');
INSERT INTO `servicearrange` VALUES ('6314', '东宵家', '北陈', null, '2018-04-01', '星期日', '1', '1', '星期日', '306', '65');
INSERT INTO `servicearrange` VALUES ('6315', '东宵家', '北陈', null, '2018-04-08', '星期日', '1', '2', '星期日', '306', '15');
INSERT INTO `servicearrange` VALUES ('6316', '东宵家', '北陈', null, '2018-04-15', '星期日', '1', '3', '星期日', '306', '45');
INSERT INTO `servicearrange` VALUES ('6317', '东宵家', '北陈', null, '2018-04-22', '星期日', '1', '4', '星期日', '306', '175');
INSERT INTO `servicearrange` VALUES ('6318', '东宵家', '北陈', null, '2018-04-29', '星期日', '1', '5', '星期日', '306', '29');
INSERT INTO `servicearrange` VALUES ('6319', '东宵家', '确坛', null, '2018-04-01', '星期日', '1', '1', '星期日', '307', '122');
INSERT INTO `servicearrange` VALUES ('6320', '东宵家', '确坛', null, '2018-04-08', '星期日', '1', '2', '星期日', '307', '135');
INSERT INTO `servicearrange` VALUES ('6321', '东宵家', '确坛', null, '2018-04-15', '星期日', '1', '3', '星期日', '307', '107');
INSERT INTO `servicearrange` VALUES ('6322', '东宵家', '确坛', null, '2018-04-22', '星期日', '1', '4', '星期日', '307', '17');
INSERT INTO `servicearrange` VALUES ('6323', '东宵家', '确坛', null, '2018-04-29', '星期日', '1', '5', '星期日', '307', '55');
INSERT INTO `servicearrange` VALUES ('6324', '东宵家', '后薛', null, '2018-04-01', '星期日', '1', '1', '星期日', '308', '174');
INSERT INTO `servicearrange` VALUES ('6325', '东宵家', '后薛', null, '2018-04-08', '星期日', '1', '2', '星期日', '308', '79');
INSERT INTO `servicearrange` VALUES ('6326', '东宵家', '后薛', null, '2018-04-15', '星期日', '1', '3', '星期日', '308', '104');
INSERT INTO `servicearrange` VALUES ('6327', '东宵家', '后薛', null, '2018-04-22', '星期日', '1', '4', '星期日', '308', '51');
INSERT INTO `servicearrange` VALUES ('6328', '东宵家', '后薛', null, '2018-04-29', '星期日', '1', '5', '星期日', '308', '131');
INSERT INTO `servicearrange` VALUES ('6329', '东宵家', '玉仑', null, '2018-04-01', '星期日', '1', '1', '星期日', '309', '194');
INSERT INTO `servicearrange` VALUES ('6330', '东宵家', '玉仑', null, '2018-04-08', '星期日', '1', '2', '星期日', '309', '156');
INSERT INTO `servicearrange` VALUES ('6331', '东宵家', '玉仑', null, '2018-04-15', '星期日', '1', '3', '星期日', '309', '129');
INSERT INTO `servicearrange` VALUES ('6332', '东宵家', '玉仑', null, '2018-04-22', '星期日', '1', '4', '星期日', '309', '165');
INSERT INTO `servicearrange` VALUES ('6333', '东宵家', '玉仑', null, '2018-04-29', '星期日', '1', '5', '星期日', '309', '179');
INSERT INTO `servicearrange` VALUES ('6334', '岸斗家', '岸斗', null, '2018-04-05', '星期四', '1', '2', '星期四', '310', '182');
INSERT INTO `servicearrange` VALUES ('6335', '岸斗家', '岸斗', null, '2018-04-12', '星期四', '1', '3', '星期四', '310', '69');
INSERT INTO `servicearrange` VALUES ('6336', '岸斗家', '岸斗', null, '2018-04-19', '星期四', '1', '4', '星期四', '310', '209');
INSERT INTO `servicearrange` VALUES ('6337', '岸斗家', '岸斗', null, '2018-04-26', '星期四', '1', '5', '星期四', '310', '11');
INSERT INTO `servicearrange` VALUES ('6338', '岸斗家', '吴塘', null, '2018-04-07', '星期六', '1', '2', '星期六', '311', '119');
INSERT INTO `servicearrange` VALUES ('6339', '岸斗家', '吴塘', null, '2018-04-14', '星期六', '1', '3', '星期六', '311', '126');
INSERT INTO `servicearrange` VALUES ('6340', '岸斗家', '吴塘', null, '2018-04-21', '星期六', '1', '4', '星期六', '311', '117');
INSERT INTO `servicearrange` VALUES ('6341', '岸斗家', '吴塘', null, '2018-04-28', '星期六', '1', '5', '星期六', '311', '78');
INSERT INTO `servicearrange` VALUES ('6342', '岸斗家', '薛垱', null, '2018-04-07', '星期六', '1', '2', '星期六', '312', '84');
INSERT INTO `servicearrange` VALUES ('6343', '岸斗家', '薛垱', null, '2018-04-14', '星期六', '1', '3', '星期六', '312', '100');
INSERT INTO `servicearrange` VALUES ('6344', '岸斗家', '薛垱', null, '2018-04-21', '星期六', '1', '4', '星期六', '312', '46');
INSERT INTO `servicearrange` VALUES ('6345', '岸斗家', '薛垱', null, '2018-04-28', '星期六', '1', '5', '星期六', '312', '181');
INSERT INTO `servicearrange` VALUES ('6346', '岸斗家', '东曾', null, '2018-04-07', '星期六', '1', '2', '星期六', '313', '128');
INSERT INTO `servicearrange` VALUES ('6347', '岸斗家', '东曾', null, '2018-04-14', '星期六', '1', '3', '星期六', '313', '60');
INSERT INTO `servicearrange` VALUES ('6348', '岸斗家', '东曾', null, '2018-04-21', '星期六', '1', '4', '星期六', '313', '62');
INSERT INTO `servicearrange` VALUES ('6349', '岸斗家', '东曾', null, '2018-04-28', '星期六', '1', '5', '星期六', '313', '138');
INSERT INTO `servicearrange` VALUES ('6350', '岸斗家', '前华', null, '2018-04-07', '星期六', '1', '2', '星期六', '314', '24');
INSERT INTO `servicearrange` VALUES ('6351', '岸斗家', '前华', null, '2018-04-14', '星期六', '1', '3', '星期六', '314', '124');
INSERT INTO `servicearrange` VALUES ('6352', '岸斗家', '前华', null, '2018-04-21', '星期六', '1', '4', '星期六', '314', '183');
INSERT INTO `servicearrange` VALUES ('6353', '岸斗家', '前华', null, '2018-04-28', '星期六', '1', '5', '星期六', '314', '193');
INSERT INTO `servicearrange` VALUES ('6354', '岸斗家', '陈厝', null, '2018-04-07', '星期六', '1', '2', '星期六', '315', '30');
INSERT INTO `servicearrange` VALUES ('6355', '岸斗家', '陈厝', null, '2018-04-14', '星期六', '1', '3', '星期六', '315', '25');
INSERT INTO `servicearrange` VALUES ('6356', '岸斗家', '陈厝', null, '2018-04-21', '星期六', '1', '4', '星期六', '315', '219');
INSERT INTO `servicearrange` VALUES ('6357', '岸斗家', '陈厝', null, '2018-04-28', '星期六', '1', '5', '星期六', '315', '118');
INSERT INTO `servicearrange` VALUES ('6358', '岸斗家', '芦塘', null, '2018-04-07', '星期六', '1', '2', '星期六', '316', '204');
INSERT INTO `servicearrange` VALUES ('6359', '岸斗家', '芦塘', null, '2018-04-14', '星期六', '1', '3', '星期六', '316', '22');
INSERT INTO `servicearrange` VALUES ('6360', '岸斗家', '芦塘', null, '2018-04-21', '星期六', '1', '4', '星期六', '316', '86');
INSERT INTO `servicearrange` VALUES ('6361', '岸斗家', '芦塘', null, '2018-04-28', '星期六', '1', '5', '星期六', '316', '195');
INSERT INTO `servicearrange` VALUES ('6362', '岸斗家', '城头', null, '2018-04-01', '星期日', '1', '1', '星期日', '317', '38');
INSERT INTO `servicearrange` VALUES ('6363', '岸斗家', '城头', null, '2018-04-08', '星期日', '1', '2', '星期日', '317', '32');
INSERT INTO `servicearrange` VALUES ('6364', '岸斗家', '城头', null, '2018-04-15', '星期日', '1', '3', '星期日', '317', '52');
INSERT INTO `servicearrange` VALUES ('6365', '岸斗家', '城头', null, '2018-04-22', '星期日', '1', '4', '星期日', '317', '151');
INSERT INTO `servicearrange` VALUES ('6366', '岸斗家', '城头', null, '2018-04-29', '星期日', '1', '5', '星期日', '317', '113');
INSERT INTO `servicearrange` VALUES ('6367', '岸斗家', '后星期', null, '2018-04-07', '星期六', '1', '2', '星期六', '318', '8');
INSERT INTO `servicearrange` VALUES ('6368', '岸斗家', '后星期', null, '2018-04-14', '星期六', '1', '3', '星期六', '318', '114');
INSERT INTO `servicearrange` VALUES ('6369', '岸斗家', '后星期', null, '2018-04-21', '星期六', '1', '4', '星期六', '318', '18');
INSERT INTO `servicearrange` VALUES ('6370', '岸斗家', '后星期', null, '2018-04-28', '星期六', '1', '5', '星期六', '318', '20');
INSERT INTO `servicearrange` VALUES ('6371', '岸斗家', '柯屿', null, '2018-04-07', '星期六', '1', '2', '星期六', '319', '105');
INSERT INTO `servicearrange` VALUES ('6372', '岸斗家', '柯屿', null, '2018-04-14', '星期六', '1', '3', '星期六', '319', '13');
INSERT INTO `servicearrange` VALUES ('6373', '岸斗家', '柯屿', null, '2018-04-21', '星期六', '1', '4', '星期六', '319', '169');
INSERT INTO `servicearrange` VALUES ('6374', '岸斗家', '柯屿', null, '2018-04-28', '星期六', '1', '5', '星期六', '319', '5');
INSERT INTO `servicearrange` VALUES ('6375', '岸斗家', '上郭', null, '2018-04-07', '星期六', '1', '2', '星期六', '320', '27');
INSERT INTO `servicearrange` VALUES ('6376', '岸斗家', '上郭', null, '2018-04-14', '星期六', '1', '3', '星期六', '320', '35');
INSERT INTO `servicearrange` VALUES ('6377', '岸斗家', '上郭', null, '2018-04-21', '星期六', '1', '4', '星期六', '320', '76');
INSERT INTO `servicearrange` VALUES ('6378', '岸斗家', '上郭', null, '2018-04-28', '星期六', '1', '5', '星期六', '320', '96');
INSERT INTO `servicearrange` VALUES ('6379', '和洋家', '上和洋', null, '2018-04-01', '星期日', '1', '1', '星期日', '321', '97');
INSERT INTO `servicearrange` VALUES ('6380', '和洋家', '上和洋', null, '2018-04-08', '星期日', '1', '2', '星期日', '321', '92');
INSERT INTO `servicearrange` VALUES ('6381', '和洋家', '上和洋', null, '2018-04-15', '星期日', '1', '3', '星期日', '321', '102');
INSERT INTO `servicearrange` VALUES ('6382', '和洋家', '上和洋', null, '2018-04-22', '星期日', '1', '4', '星期日', '321', '75');
INSERT INTO `servicearrange` VALUES ('6383', '和洋家', '上和洋', null, '2018-04-29', '星期日', '1', '5', '星期日', '321', '53');
INSERT INTO `servicearrange` VALUES ('6384', '和洋家', '下和洋', null, '2018-04-01', '星期日', '0', '1', '星期日', '322', '148');
INSERT INTO `servicearrange` VALUES ('6385', '和洋家', '下和洋', null, '2018-04-08', '星期日', '1', '2', '星期日', '322', '43');
INSERT INTO `servicearrange` VALUES ('6386', '和洋家', '下和洋', null, '2018-04-15', '星期日', '1', '3', '星期日', '322', '198');
INSERT INTO `servicearrange` VALUES ('6387', '和洋家', '下和洋', null, '2018-04-22', '星期日', '1', '4', '星期日', '322', '214');
INSERT INTO `servicearrange` VALUES ('6388', '和洋家', '下和洋', null, '2018-04-29', '星期日', '1', '5', '星期日', '322', '85');
INSERT INTO `servicearrange` VALUES ('6389', '和洋家', '南宵', null, '2018-04-01', '星期日', '1', '1', '星期日', '323', '141');
INSERT INTO `servicearrange` VALUES ('6390', '和洋家', '南宵', null, '2018-04-08', '星期日', '1', '2', '星期日', '323', '200');
INSERT INTO `servicearrange` VALUES ('6391', '和洋家', '南宵', null, '2018-04-15', '星期日', '1', '3', '星期日', '323', '81');
INSERT INTO `servicearrange` VALUES ('6392', '和洋家', '南宵', null, '2018-04-22', '星期日', '1', '4', '星期日', '323', '201');
INSERT INTO `servicearrange` VALUES ('6393', '和洋家', '南宵', null, '2018-04-29', '星期日', '1', '5', '星期日', '323', '171');
INSERT INTO `servicearrange` VALUES ('6394', '和洋家', '华塘', null, '2018-04-01', '星期日', '1', '1', '星期日', '324', '150');
INSERT INTO `servicearrange` VALUES ('6395', '和洋家', '华塘', null, '2018-04-08', '星期日', '1', '2', '星期日', '324', '2');
INSERT INTO `servicearrange` VALUES ('6396', '和洋家', '华塘', null, '2018-04-15', '星期日', '1', '3', '星期日', '324', '42');
INSERT INTO `servicearrange` VALUES ('6397', '和洋家', '华塘', null, '2018-04-22', '星期日', '1', '4', '星期日', '324', '16');
INSERT INTO `servicearrange` VALUES ('6398', '和洋家', '华塘', null, '2018-04-29', '星期日', '1', '5', '星期日', '324', '49');
INSERT INTO `servicearrange` VALUES ('6399', '和洋家', '南华', null, '2018-04-01', '星期日', '1', '1', '星期日', '325', '177');
INSERT INTO `servicearrange` VALUES ('6400', '和洋家', '南华', null, '2018-04-08', '星期日', '1', '2', '星期日', '325', '109');
INSERT INTO `servicearrange` VALUES ('6401', '和洋家', '南华', null, '2018-04-15', '星期日', '1', '3', '星期日', '325', '185');
INSERT INTO `servicearrange` VALUES ('6402', '和洋家', '南华', null, '2018-04-22', '星期日', '1', '4', '星期日', '325', '197');
INSERT INTO `servicearrange` VALUES ('6403', '和洋家', '南华', null, '2018-04-29', '星期日', '1', '5', '星期日', '325', '36');
INSERT INTO `servicearrange` VALUES ('6404', '和洋家', '北翁', null, '2018-04-01', '星期日', '1', '1', '星期日', '326', '77');
INSERT INTO `servicearrange` VALUES ('6405', '和洋家', '北翁', null, '2018-04-08', '星期日', '1', '2', '星期日', '326', '192');
INSERT INTO `servicearrange` VALUES ('6406', '和洋家', '北翁', null, '2018-04-15', '星期日', '1', '3', '星期日', '326', '202');
INSERT INTO `servicearrange` VALUES ('6407', '和洋家', '北翁', null, '2018-04-22', '星期日', '1', '4', '星期日', '326', '210');
INSERT INTO `servicearrange` VALUES ('6408', '和洋家', '北翁', null, '2018-04-29', '星期日', '1', '5', '星期日', '326', '190');
INSERT INTO `servicearrange` VALUES ('6409', '和洋家', '院后', null, '2018-04-07', '星期六', '1', '2', '星期六', '327', '28');
INSERT INTO `servicearrange` VALUES ('6410', '和洋家', '院后', null, '2018-04-14', '星期六', '1', '3', '星期六', '327', '145');
INSERT INTO `servicearrange` VALUES ('6411', '和洋家', '院后', null, '2018-04-21', '星期六', '1', '4', '星期六', '327', '23');
INSERT INTO `servicearrange` VALUES ('6412', '和洋家', '院后', null, '2018-04-28', '星期六', '1', '5', '星期六', '327', '189');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL COMMENT '所属会点',
  `church` varchar(100) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(50) DEFAULT NULL COMMENT '纬度',
  `serve_days_pre_forth` tinyint(1) DEFAULT NULL COMMENT '前四周服侍天数',
  `serve_days_fifth` tinyint(1) DEFAULT NULL COMMENT '第五周服侍天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('124', '康弟', 'e663d6b0-dc17-11e8-899e-00163e1034ec', '18950311214', '江镜家', '前宅', null, null, '3', '0');
INSERT INTO `user` VALUES ('125', '海玲', 'e675550c-dc17-11e8-899e-00163e1034ec', '13075881045', '江镜家', '前宅', null, null, '3', '0');
INSERT INTO `user` VALUES ('126', '祥金', 'e6801712-dc17-11e8-899e-00163e1034ec', '15005940923', '江镜家', '前宅', null, null, '2', '0');
INSERT INTO `user` VALUES ('127', '淑玲', 'e696dd1c-dc17-11e8-899e-00163e1034ec', '13706974519', '江镜家', '前宅', null, null, '2', '0');
INSERT INTO `user` VALUES ('128', '凤琴', 'e6a02908-dc17-11e8-899e-00163e1034ec', '13067326640', '江镜家', '南后', null, null, '3', '0');
INSERT INTO `user` VALUES ('129', '德英', 'e6a91798-dc17-11e8-899e-00163e1034ec', '18259036679', '江镜家', '南后', null, null, '2', '1');
INSERT INTO `user` VALUES ('130', '良同', 'e6b42cdc-dc17-11e8-899e-00163e1034ec', '15960168577', '江镜家', '农场', null, null, '1', '1');
INSERT INTO `user` VALUES ('131', '何齐光', 'e6c2aac8-dc17-11e8-899e-00163e1034ec', '18950430430', '江镜家', '酒店', null, null, '2', '1');
INSERT INTO `user` VALUES ('132', '余华英', 'e6cb9606-dc17-11e8-899e-00163e1034ec', '85728941', '江镜家', '酒店', null, null, '2', '0');
INSERT INTO `user` VALUES ('133', '齐福', 'e6d50ace-dc17-11e8-899e-00163e1034ec', '15305902850', '江镜家', '酒店', null, null, '3', '0');
INSERT INTO `user` VALUES ('134', '何俊', 'e6df8594-dc17-11e8-899e-00163e1034ec', '13489188911', '江镜家', '酒店', null, null, '0', '0');
INSERT INTO `user` VALUES ('135', '何慧', 'e6e89e0e-dc17-11e8-899e-00163e1034ec', '15959078521', '江镜家', '酒店', null, null, '2', '0');
INSERT INTO `user` VALUES ('136', '泉兴', 'e6f1b87c-dc17-11e8-899e-00163e1034ec', '13067255379', '江镜家', '酒店', null, null, '2', '0');
INSERT INTO `user` VALUES ('137', '玉林', 'e703eef2-dc17-11e8-899e-00163e1034ec', '13706992648', '江镜家', '酒店', null, null, '2', '0');
INSERT INTO `user` VALUES ('138', '弟弟', 'e70e2642-dc17-11e8-899e-00163e1034ec', '13706993432', '江镜家', '城坂', null, null, '2', '1');
INSERT INTO `user` VALUES ('139', '孝明', 'e71715cc-dc17-11e8-899e-00163e1034ec', '13635228992', '江镜家', '城坂', null, null, '3', '0');
INSERT INTO `user` VALUES ('140', '品娟', 'e7202f04-dc17-11e8-899e-00163e1034ec', '15059409647', '江镜家', '城坂', null, null, '2', '1');
INSERT INTO `user` VALUES ('141', '何云', 'e729a6a6-dc17-11e8-899e-00163e1034ec', '85711839', '江镜家', '城坂', null, null, '2', '1');
INSERT INTO `user` VALUES ('142', '何华', 'e73321a4-dc17-11e8-899e-00163e1034ec', '13635252765', '江镜家', '城坂', null, null, '2', '0');
INSERT INTO `user` VALUES ('143', '秀辉', 'e7426d30-dc17-11e8-899e-00163e1034ec', '13459451757', '江镜家', '谢塘', null, null, '2', '0');
INSERT INTO `user` VALUES ('144', '祖强', 'e7555058-dc17-11e8-899e-00163e1034ec', '13123163535', '江镜家', '塘边', null, null, '2', '1');
INSERT INTO `user` VALUES ('145', '则兴', 'e7616366-dc17-11e8-899e-00163e1034ec', '13489123198', '江镜家', '塘边', null, null, '2', '1');
INSERT INTO `user` VALUES ('146', '明恩', 'e76f177c-dc17-11e8-899e-00163e1034ec', '13489186599', '江镜家', '塘边', null, null, '2', '0');
INSERT INTO `user` VALUES ('147', '增英', 'e77b1928-dc17-11e8-899e-00163e1034ec', '85724322', '江镜家', '塘边', null, null, '3', '0');
INSERT INTO `user` VALUES ('148', '吓平', 'e783f034-dc17-11e8-899e-00163e1034ec', '18950263313', '江镜家', '塘边', null, null, '2', '1');
INSERT INTO `user` VALUES ('149', '秀英', 'e78cd67c-dc17-11e8-899e-00163e1034ec', '85983890', '江镜家', '东薛', null, null, '2', '0');
INSERT INTO `user` VALUES ('150', '依钦', 'e7975c00-dc17-11e8-899e-00163e1034ec', '85717438', '江镜家', '东薛', null, null, '2', '0');
INSERT INTO `user` VALUES ('151', '华辉', 'e7a15840-dc17-11e8-899e-00163e1034ec', '13799337100', '前张家', '前张', null, null, '3', '0');
INSERT INTO `user` VALUES ('152', '秀云', 'e7aa16ba-dc17-11e8-899e-00163e1034ec', '15306071665', '前张家', '前张', null, null, '2', '1');
INSERT INTO `user` VALUES ('153', '文举', 'e7b43708-dc17-11e8-899e-00163e1034ec', '13276083275', '前张家', '前张', null, null, '3', '0');
INSERT INTO `user` VALUES ('154', '张英', 'e7bd0a40-dc17-11e8-899e-00163e1034ec', '18950270229', '前张家', '前张', null, null, '3', '1');
INSERT INTO `user` VALUES ('155', '坤云', 'e7c636f6-dc17-11e8-899e-00163e1034ec', '18965082808', '前张家', '前张', null, null, '2', '1');
INSERT INTO `user` VALUES ('156', '承清', 'e7cec6e0-dc17-11e8-899e-00163e1034ec', '13055254311', '前张家', '苍溪', null, null, '2', '0');
INSERT INTO `user` VALUES ('157', '莺莺', 'e7d78622-dc17-11e8-899e-00163e1034ec', '15980508158', '前张家', '里头', null, null, '3', '0');
INSERT INTO `user` VALUES ('158', '建宁', 'e7e1a5bc-dc17-11e8-899e-00163e1034ec', '13655067041', '前张家', '西边', null, null, '2', '0');
INSERT INTO `user` VALUES ('159', '林炎', 'e7ea7d2c-dc17-11e8-899e-00163e1034ec', '15880185352', '前张家', '林厝东', null, null, '2', '0');
INSERT INTO `user` VALUES ('160', '林文强', 'e7f39592-dc17-11e8-899e-00163e1034ec', '15980553030', '前张家', '林厝西', null, null, '2', '0');
INSERT INTO `user` VALUES ('161', '美云', 'e7fd3ec6-dc17-11e8-899e-00163e1034ec', '85713246', '前张家', '大定房', null, null, '2', '0');
INSERT INTO `user` VALUES ('162', '光荣', 'e805fb1a-dc17-11e8-899e-00163e1034ec', '13459176619', '前张家', '大定房', null, null, '1', '1');
INSERT INTO `user` VALUES ('163', '行略', 'e8105aba-dc17-11e8-899e-00163e1034ec', '15359195421', '岸斗家', '岸斗', null, null, '2', '0');
INSERT INTO `user` VALUES ('164', '亦霖', 'e819dbee-dc17-11e8-899e-00163e1034ec', '13459459017', '岸斗家', '岸斗', null, null, '2', '0');
INSERT INTO `user` VALUES ('165', '信云', 'e82280c8-dc17-11e8-899e-00163e1034ec', '15392011646', '岸斗家', '岸斗', null, null, '2', '0');
INSERT INTO `user` VALUES ('166', '宜珠', 'e82b2dfe-dc17-11e8-899e-00163e1034ec', '15860803223', '岸斗家', '岸斗', null, null, '2', '0');
INSERT INTO `user` VALUES ('167', '育凯', 'e833ca36-dc17-11e8-899e-00163e1034ec', '15960085631', '岸斗家', '陈厝', null, null, '2', '0');
INSERT INTO `user` VALUES ('168', '命命', 'e83dd90e-dc17-11e8-899e-00163e1034ec', '13960733165', '岸斗家', '陈厝', null, null, '2', '0');
INSERT INTO `user` VALUES ('169', '亦保', 'e8469d00-dc17-11e8-899e-00163e1034ec', '13599376120', '岸斗家', '南城', null, null, '2', '0');
INSERT INTO `user` VALUES ('170', '美珍', 'e850c546-dc17-11e8-899e-00163e1034ec', '85721256', '岸斗家', '吴塘', null, null, '2', '0');
INSERT INTO `user` VALUES ('171', '莲英', 'e85a6ce0-dc17-11e8-899e-00163e1034ec', '85717127', '岸斗家', '吴塘', null, null, '0', '0');
INSERT INTO `user` VALUES ('172', '吓珠', 'e86346b2-dc17-11e8-899e-00163e1034ec', '15392015532', '岸斗家', '前华', null, null, '2', '0');
INSERT INTO `user` VALUES ('173', '巧琴', 'e86d4b30-dc17-11e8-899e-00163e1034ec', '85718889', '岸斗家', '前华', null, null, '2', '0');
INSERT INTO `user` VALUES ('174', '风云', 'e876663e-dc17-11e8-899e-00163e1034ec', '18120883912', '岸斗家', '前华', null, null, '2', '0');
INSERT INTO `user` VALUES ('175', '秋艳', 'e87f2530-dc17-11e8-899e-00163e1034ec', '18060596916', '岸斗家', '前华', null, null, '2', '0');
INSERT INTO `user` VALUES ('176', '月云', 'e8886262-dc17-11e8-899e-00163e1034ec', '85718530', '岸斗家', '前华', null, null, '2', '0');
INSERT INTO `user` VALUES ('177', '洪光', 'e8911a06-dc17-11e8-899e-00163e1034ec', '15880180164', '东宵家', '东宵', null, null, '2', '0');
INSERT INTO `user` VALUES ('178', '恩光', 'e89aada0-dc17-11e8-899e-00163e1034ec', '13358234292', '东宵家', '东宵', null, null, '2', '1');
INSERT INTO `user` VALUES ('179', '义华', 'e8a334a2-dc17-11e8-899e-00163e1034ec', '158804516062', '东宵家', '东宵', null, null, '3', '0');
INSERT INTO `user` VALUES ('180', '上锦', 'e8ac210c-dc17-11e8-899e-00163e1034ec', '13276015582', '东宵家', '东宵', null, null, '2', '1');
INSERT INTO `user` VALUES ('181', '华明', 'e8b4edfa-dc17-11e8-899e-00163e1034ec', '13960849933', '东宵家', '东宵', null, null, '2', '1');
INSERT INTO `user` VALUES ('182', '品英', 'e8be8112-dc17-11e8-899e-00163e1034ec', '13960754234', '东宵家', '东宵', null, null, '2', '1');
INSERT INTO `user` VALUES ('183', '谢清', 'e8c88392-dc17-11e8-899e-00163e1034ec', '18960878823', '东宵家', '东宵', null, null, '2', '0');
INSERT INTO `user` VALUES ('184', '文芳', 'e8d12ae2-dc17-11e8-899e-00163e1034ec', '13015736460', '东宵家', '东宵', null, null, '3', '0');
INSERT INTO `user` VALUES ('185', '香平', 'e8d9e93e-dc17-11e8-899e-00163e1034ec', '15980552190', '东宵家', '东宵', null, null, '2', '0');
INSERT INTO `user` VALUES ('186', '昌栋', 'e8eb1b14-dc17-11e8-899e-00163e1034ec', '15392013895', '东宵家', '玉仑', null, null, '2', '0');
INSERT INTO `user` VALUES ('187', '世能', 'e8f6178a-dc17-11e8-899e-00163e1034ec', '13285916736', '东宵家', '玉仑', null, null, '2', '1');
INSERT INTO `user` VALUES ('188', '福兴', 'e8fecbfa-dc17-11e8-899e-00163e1034ec', '18960937202', '东宵家', '狮厝', null, null, '2', '0');
INSERT INTO `user` VALUES ('189', '秀清', 'e9076b02-dc17-11e8-899e-00163e1034ec', '18059174015', '东宵家', '确坛', null, null, '2', '0');
INSERT INTO `user` VALUES ('190', '珠钦', 'e90ffbc8-dc17-11e8-899e-00163e1034ec', '18065173475', '东宵家', '确坛', null, null, '3', '0');
INSERT INTO `user` VALUES ('191', '上华', 'e91923a6-dc17-11e8-899e-00163e1034ec', '13725310040', '东宵家', '张厝', null, null, '3', '0');
INSERT INTO `user` VALUES ('192', '永美', 'e92318f2-dc17-11e8-899e-00163e1034ec', '18960030495', '东宵家', '张厝', null, null, '3', '0');
INSERT INTO `user` VALUES ('193', '廷开', 'e92cafac-dc17-11e8-899e-00163e1034ec', '18950262388', '东宵家', '张厝', null, null, '2', '1');
INSERT INTO `user` VALUES ('194', '祥云', 'e935c15a-dc17-11e8-899e-00163e1034ec', '13710055149', '东宵家', '张厝', null, null, '3', '0');
INSERT INTO `user` VALUES ('195', '红云', 'e93e7caa-dc17-11e8-899e-00163e1034ec', '15396111674', '东宵家', '张厝', null, null, '2', '1');
INSERT INTO `user` VALUES ('196', '少平', 'e9473a16-dc17-11e8-899e-00163e1034ec', '18850358526', '东宵家', '北陈', null, null, '2', '0');
INSERT INTO `user` VALUES ('197', '张和和', 'e9523ea2-dc17-11e8-899e-00163e1034ec', '15859146056', '和洋家', '上和洋', null, null, '2', '0');
INSERT INTO `user` VALUES ('198', '得兴', 'e95b076c-dc17-11e8-899e-00163e1034ec', '18705079786', '和洋家', '上和洋', null, null, '2', '0');
INSERT INTO `user` VALUES ('199', '吓兰', 'e9666df0-dc17-11e8-899e-00163e1034ec', '85712045', '和洋家', '上和洋', null, null, '2', '0');
INSERT INTO `user` VALUES ('200', '香玲', 'e970992e-dc17-11e8-899e-00163e1034ec', '15359135604', '和洋家', '上和洋', null, null, '2', '0');
INSERT INTO `user` VALUES ('201', '祥朝', 'e97969d2-dc17-11e8-899e-00163e1034ec', '18050194331', '和洋家', '上和洋', null, null, '2', '0');
INSERT INTO `user` VALUES ('202', '学霖', 'e9823c6a-dc17-11e8-899e-00163e1034ec', '15059196523', '和洋家', '上和洋', null, null, '2', '1');
INSERT INTO `user` VALUES ('203', '志明', 'e98b42d8-dc17-11e8-899e-00163e1034ec', '13960735580', '和洋家', '下和洋', null, null, '2', '1');
INSERT INTO `user` VALUES ('204', '秀平', 'e9940918-dc17-11e8-899e-00163e1034ec', '85715680', '和洋家', '下和洋', null, null, '2', '1');
INSERT INTO `user` VALUES ('205', '华琴', 'e99eb444-dc17-11e8-899e-00163e1034ec', '13276040585', '和洋家', '下和洋', null, null, '2', '0');
INSERT INTO `user` VALUES ('206', '吓敏', 'e9a77836-dc17-11e8-899e-00163e1034ec', '13950332952', '和洋家', '南宵', null, null, '2', '1');
INSERT INTO `user` VALUES ('207', '秀琴', 'e9b02706-dc17-11e8-899e-00163e1034ec', '85728998', '和洋家', '上院后', null, null, '3', '0');
INSERT INTO `user` VALUES ('208', '忠堂', 'e9b91a8c-dc17-11e8-899e-00163e1034ec', '13276918502', '和洋家', '华塘', null, null, '2', '0');
INSERT INTO `user` VALUES ('209', '文龙', 'e9c1b8c2-dc17-11e8-899e-00163e1034ec', '13805037479', '和洋家', '华塘', null, null, '1', '1');
INSERT INTO `user` VALUES ('210', '彩娇', 'e9cc42f6-dc17-11e8-899e-00163e1034ec', '18659110454', '和洋家', '华塘', null, null, '2', '0');
INSERT INTO `user` VALUES ('211', '美娟', 'e9d5a88c-dc17-11e8-899e-00163e1034ec', '13960714918', '和洋家', '华塘', null, null, '2', '0');
INSERT INTO `user` VALUES ('212', '吓清', 'e9e03b94-dc17-11e8-899e-00163e1034ec', '15859038240', '和洋家', '北翁', null, null, '2', '0');
