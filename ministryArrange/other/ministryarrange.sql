/*
Navicat MySQL Data Transfer

Source Server         : ALIYUN3year
Source Server Version : 50173
Source Host           : 47.98.206.171:3306
Source Database       : ministryarrange

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-10-31 17:03:30
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
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of serviceaddress
-- ----------------------------
INSERT INTO `serviceaddress` VALUES ('228', '江镜家', '前宅', '2');
INSERT INTO `serviceaddress` VALUES ('229', '江镜家', '酒店', '1');
INSERT INTO `serviceaddress` VALUES ('230', '江镜家', '城坂', '1');
INSERT INTO `serviceaddress` VALUES ('231', '江镜家', '塘边', '2');
INSERT INTO `serviceaddress` VALUES ('232', '江镜家', '南后', '2');
INSERT INTO `serviceaddress` VALUES ('233', '江镜家', '农场', '2');
INSERT INTO `serviceaddress` VALUES ('234', '江镜家', '东村', '2');
INSERT INTO `serviceaddress` VALUES ('235', '江镜家', '谢塘', '2');
INSERT INTO `serviceaddress` VALUES ('236', '江镜家', '上连', '1');
INSERT INTO `serviceaddress` VALUES ('237', '江镜家', '东洋边', '2');
INSERT INTO `serviceaddress` VALUES ('238', '江镜家', '东薛', '1');
INSERT INTO `serviceaddress` VALUES ('239', '前张家', '前张', '1');
INSERT INTO `serviceaddress` VALUES ('240', '前张家', '苍溪', '1');
INSERT INTO `serviceaddress` VALUES ('241', '前张家', '大定房', '2');
INSERT INTO `serviceaddress` VALUES ('242', '前张家', '大定房', '1');
INSERT INTO `serviceaddress` VALUES ('243', '前张家', '小定房', '1');
INSERT INTO `serviceaddress` VALUES ('244', '前张家', '林东', '1');
INSERT INTO `serviceaddress` VALUES ('245', '前张家', '林西', '1');
INSERT INTO `serviceaddress` VALUES ('246', '前张家', '里头', '1');
INSERT INTO `serviceaddress` VALUES ('247', '前张家', '文房东', '1');
INSERT INTO `serviceaddress` VALUES ('248', '前张家', '文房西', '1');
INSERT INTO `serviceaddress` VALUES ('249', '前张家', '蔡厝', '1');
INSERT INTO `serviceaddress` VALUES ('250', '前张家', '西江边', '1');
INSERT INTO `serviceaddress` VALUES ('251', '前张家', '院边', '1');
INSERT INTO `serviceaddress` VALUES ('252', '东宵家', '东宵', '2');
INSERT INTO `serviceaddress` VALUES ('253', '东宵家', '张厝', '1');
INSERT INTO `serviceaddress` VALUES ('254', '东宵家', '狮厝', '2');
INSERT INTO `serviceaddress` VALUES ('255', '东宵家', '塘沁', '2');
INSERT INTO `serviceaddress` VALUES ('256', '东宵家', '北陈', '2');
INSERT INTO `serviceaddress` VALUES ('257', '东宵家', '确坛', '2');
INSERT INTO `serviceaddress` VALUES ('258', '东宵家', '后薛', '2');
INSERT INTO `serviceaddress` VALUES ('259', '东宵家', '玉仑', '2');
INSERT INTO `serviceaddress` VALUES ('260', '岸斗家', '岸斗', '0');
INSERT INTO `serviceaddress` VALUES ('261', '岸斗家', '吴塘', '1');
INSERT INTO `serviceaddress` VALUES ('262', '岸斗家', '薛垱', '1');
INSERT INTO `serviceaddress` VALUES ('263', '岸斗家', '东曾', '1');
INSERT INTO `serviceaddress` VALUES ('264', '岸斗家', '前华', '1');
INSERT INTO `serviceaddress` VALUES ('265', '岸斗家', '陈厝', '1');
INSERT INTO `serviceaddress` VALUES ('266', '岸斗家', '芦塘', '1');
INSERT INTO `serviceaddress` VALUES ('267', '岸斗家', '城头', '2');
INSERT INTO `serviceaddress` VALUES ('268', '岸斗家', '后星期', '1');
INSERT INTO `serviceaddress` VALUES ('269', '岸斗家', '柯屿', '1');
INSERT INTO `serviceaddress` VALUES ('270', '岸斗家', '上郭', '1');
INSERT INTO `serviceaddress` VALUES ('271', '和洋家', '上和洋', '2');
INSERT INTO `serviceaddress` VALUES ('272', '和洋家', '下和洋', '2');
INSERT INTO `serviceaddress` VALUES ('273', '和洋家', '南宵', '2');
INSERT INTO `serviceaddress` VALUES ('274', '和洋家', '华塘', '2');
INSERT INTO `serviceaddress` VALUES ('275', '和洋家', '南华', '2');
INSERT INTO `serviceaddress` VALUES ('276', '和洋家', '北翁', '1');
INSERT INTO `serviceaddress` VALUES ('277', '和洋家', '院后', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5969 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of servicearrange
-- ----------------------------
INSERT INTO `servicearrange` VALUES ('5748', '江镜家', '前宅', '202', '2018-04-01', '星期日', '1', '1', '星期日', '228', '218');
INSERT INTO `servicearrange` VALUES ('5749', '江镜家', '前宅', '198', '2018-04-08', '星期日', '1', '2', '星期日', '228', '172');
INSERT INTO `servicearrange` VALUES ('5750', '江镜家', '前宅', '198', '2018-04-15', '星期日', '1', '3', '星期日', '228', '169');
INSERT INTO `servicearrange` VALUES ('5751', '江镜家', '前宅', '194', '2018-04-22', '星期日', '1', '4', '星期日', '228', '126');
INSERT INTO `servicearrange` VALUES ('5752', '江镜家', '前宅', null, '2018-04-29', '星期日', '1', '5', '星期日', '228', '20');
INSERT INTO `servicearrange` VALUES ('5753', '江镜家', '酒店', '196', '2018-04-07', '星期六', '1', '2', '星期六', '229', '150');
INSERT INTO `servicearrange` VALUES ('5754', '江镜家', '酒店', '193', '2018-04-14', '星期六', '1', '3', '星期六', '229', '114');
INSERT INTO `servicearrange` VALUES ('5755', '江镜家', '酒店', null, '2018-04-21', '星期六', '0', '4', '星期六', '229', '29');
INSERT INTO `servicearrange` VALUES ('5756', '江镜家', '酒店', null, '2018-04-28', '星期六', '0', '5', '星期六', '229', '81');
INSERT INTO `servicearrange` VALUES ('5757', '江镜家', '城坂', '189', '2018-04-07', '星期六', '1', '2', '星期六', '230', '58');
INSERT INTO `servicearrange` VALUES ('5758', '江镜家', '城坂', '201', '2018-04-14', '星期六', '1', '3', '星期六', '230', '221');
INSERT INTO `servicearrange` VALUES ('5759', '江镜家', '城坂', '186', '2018-04-21', '星期六', '1', '4', '星期六', '230', '16');
INSERT INTO `servicearrange` VALUES ('5760', '江镜家', '城坂', null, '2018-04-28', '星期六', '1', '5', '星期六', '230', '209');
INSERT INTO `servicearrange` VALUES ('5761', '江镜家', '塘边', '192', '2018-04-01', '星期日', '1', '1', '星期日', '231', '87');
INSERT INTO `servicearrange` VALUES ('5762', '江镜家', '塘边', '188', '2018-04-08', '星期日', '1', '2', '星期日', '231', '35');
INSERT INTO `servicearrange` VALUES ('5763', '江镜家', '塘边', '188', '2018-04-15', '星期日', '1', '3', '星期日', '231', '43');
INSERT INTO `servicearrange` VALUES ('5764', '江镜家', '塘边', '197', '2018-04-22', '星期日', '1', '4', '星期日', '231', '154');
INSERT INTO `servicearrange` VALUES ('5765', '江镜家', '塘边', null, '2018-04-29', '星期日', '1', '5', '星期日', '231', '123');
INSERT INTO `servicearrange` VALUES ('5766', '江镜家', '南后', '196', '2018-04-01', '星期日', '1', '1', '星期日', '232', '142');
INSERT INTO `servicearrange` VALUES ('5767', '江镜家', '南后', '194', '2018-04-08', '星期日', '1', '2', '星期日', '232', '122');
INSERT INTO `servicearrange` VALUES ('5768', '江镜家', '南后', '187', '2018-04-15', '星期日', '1', '3', '星期日', '232', '33');
INSERT INTO `servicearrange` VALUES ('5769', '江镜家', '南后', '192', '2018-04-22', '星期日', '1', '4', '星期日', '232', '98');
INSERT INTO `servicearrange` VALUES ('5770', '江镜家', '南后', null, '2018-04-29', '星期日', '1', '5', '星期日', '232', '53');
INSERT INTO `servicearrange` VALUES ('5771', '江镜家', '农场', '195', '2018-04-01', '星期日', '1', '1', '星期日', '233', '131');
INSERT INTO `servicearrange` VALUES ('5772', '江镜家', '农场', '187', '2018-04-08', '星期日', '1', '2', '星期日', '233', '32');
INSERT INTO `servicearrange` VALUES ('5773', '江镜家', '农场', '192', '2018-04-15', '星期日', '1', '3', '星期日', '233', '109');
INSERT INTO `servicearrange` VALUES ('5774', '江镜家', '农场', '191', '2018-04-22', '星期日', '1', '4', '星期日', '233', '96');
INSERT INTO `servicearrange` VALUES ('5775', '江镜家', '农场', null, '2018-04-29', '星期日', '1', '5', '星期日', '233', '214');
INSERT INTO `servicearrange` VALUES ('5776', '江镜家', '东村', '190', '2018-04-01', '星期日', '1', '1', '星期日', '234', '73');
INSERT INTO `servicearrange` VALUES ('5777', '江镜家', '东村', '191', '2018-04-08', '星期日', '1', '2', '星期日', '234', '105');
INSERT INTO `servicearrange` VALUES ('5778', '江镜家', '东村', '190', '2018-04-15', '星期日', '1', '3', '星期日', '234', '68');
INSERT INTO `servicearrange` VALUES ('5779', '江镜家', '东村', '189', '2018-04-22', '星期日', '1', '4', '星期日', '234', '54');
INSERT INTO `servicearrange` VALUES ('5780', '江镜家', '东村', null, '2018-04-29', '星期日', '1', '5', '星期日', '234', '66');
INSERT INTO `servicearrange` VALUES ('5781', '江镜家', '谢塘', '201', '2018-04-01', '星期日', '1', '1', '星期日', '235', '217');
INSERT INTO `servicearrange` VALUES ('5782', '江镜家', '谢塘', '195', '2018-04-08', '星期日', '1', '2', '星期日', '235', '137');
INSERT INTO `servicearrange` VALUES ('5783', '江镜家', '谢塘', '186', '2018-04-15', '星期日', '1', '3', '星期日', '235', '9');
INSERT INTO `servicearrange` VALUES ('5784', '江镜家', '谢塘', '200', '2018-04-22', '星期日', '1', '4', '星期日', '235', '215');
INSERT INTO `servicearrange` VALUES ('5785', '江镜家', '谢塘', null, '2018-04-29', '星期日', '1', '5', '星期日', '235', '97');
INSERT INTO `servicearrange` VALUES ('5786', '江镜家', '上连', '185', '2018-04-07', '星期六', '1', '2', '星期六', '236', '12');
INSERT INTO `servicearrange` VALUES ('5787', '江镜家', '上连', '194', '2018-04-14', '星期六', '1', '3', '星期六', '236', '129');
INSERT INTO `servicearrange` VALUES ('5788', '江镜家', '上连', '193', '2018-04-21', '星期六', '1', '4', '星期六', '236', '104');
INSERT INTO `servicearrange` VALUES ('5789', '江镜家', '上连', null, '2018-04-28', '星期六', '1', '5', '星期六', '236', '60');
INSERT INTO `servicearrange` VALUES ('5790', '江镜家', '东洋边', '191', '2018-04-01', '星期日', '1', '1', '星期日', '237', '76');
INSERT INTO `servicearrange` VALUES ('5791', '江镜家', '东洋边', '197', '2018-04-08', '星期日', '1', '2', '星期日', '237', '166');
INSERT INTO `servicearrange` VALUES ('5792', '江镜家', '东洋边', '199', '2018-04-15', '星期日', '1', '3', '星期日', '237', '177');
INSERT INTO `servicearrange` VALUES ('5793', '江镜家', '东洋边', '190', '2018-04-22', '星期日', '1', '4', '星期日', '237', '89');
INSERT INTO `servicearrange` VALUES ('5794', '江镜家', '东洋边', null, '2018-04-29', '星期日', '1', '5', '星期日', '237', '107');
INSERT INTO `servicearrange` VALUES ('5795', '江镜家', '东薛', '199', '2018-04-07', '星期六', '1', '2', '星期六', '238', '178');
INSERT INTO `servicearrange` VALUES ('5796', '江镜家', '东薛', '200', '2018-04-14', '星期六', '1', '3', '星期六', '238', '183');
INSERT INTO `servicearrange` VALUES ('5797', '江镜家', '东薛', '184', '2018-04-21', '星期六', '1', '4', '星期六', '238', '10');
INSERT INTO `servicearrange` VALUES ('5798', '江镜家', '东薛', null, '2018-04-28', '星期六', '1', '5', '星期六', '238', '7');
INSERT INTO `servicearrange` VALUES ('5799', '前张家', '前张', '156', '2018-04-07', '星期六', '1', '2', '星期六', '239', '161');
INSERT INTO `servicearrange` VALUES ('5800', '前张家', '前张', '143', '2018-04-14', '星期六', '1', '3', '星期六', '239', '55');
INSERT INTO `servicearrange` VALUES ('5801', '前张家', '前张', '156', '2018-04-21', '星期六', '1', '4', '星期六', '239', '153');
INSERT INTO `servicearrange` VALUES ('5802', '前张家', '前张', '187', '2018-04-28', '星期六', '1', '5', '星期六', '239', '174');
INSERT INTO `servicearrange` VALUES ('5803', '前张家', '苍溪', '151', '2018-04-07', '星期六', '1', '2', '星期六', '240', '138');
INSERT INTO `servicearrange` VALUES ('5804', '前张家', '苍溪', '142', '2018-04-14', '星期六', '1', '3', '星期六', '240', '42');
INSERT INTO `servicearrange` VALUES ('5805', '前张家', '苍溪', '153', '2018-04-21', '星期六', '1', '4', '星期六', '240', '219');
INSERT INTO `servicearrange` VALUES ('5806', '前张家', '苍溪', '181', '2018-04-28', '星期六', '1', '5', '星期六', '240', '127');
INSERT INTO `servicearrange` VALUES ('5807', '前张家', '大定房', '151', '2018-04-01', '星期日', '1', '1', '星期日', '241', '191');
INSERT INTO `servicearrange` VALUES ('5808', '前张家', '大定房', '154', '2018-04-08', '星期日', '1', '2', '星期日', '241', '198');
INSERT INTO `servicearrange` VALUES ('5809', '前张家', '大定房', '153', '2018-04-15', '星期日', '1', '3', '星期日', '241', '187');
INSERT INTO `servicearrange` VALUES ('5810', '前张家', '大定房', '140', '2018-04-22', '星期日', '1', '4', '星期日', '241', '26');
INSERT INTO `servicearrange` VALUES ('5811', '前张家', '大定房', '193', '2018-04-29', '星期日', '1', '5', '星期日', '241', '189');
INSERT INTO `servicearrange` VALUES ('5812', '前张家', '大定房', '150', '2018-04-07', '星期六', '1', '2', '星期六', '242', '134');
INSERT INTO `servicearrange` VALUES ('5813', '前张家', '大定房', '145', '2018-04-14', '星期六', '1', '3', '星期六', '242', '59');
INSERT INTO `servicearrange` VALUES ('5814', '前张家', '大定房', '149', '2018-04-21', '星期六', '1', '4', '星期六', '242', '120');
INSERT INTO `servicearrange` VALUES ('5815', '前张家', '大定房', '195', '2018-04-28', '星期六', '1', '5', '星期六', '242', '206');
INSERT INTO `servicearrange` VALUES ('5816', '前张家', '小定房', '140', '2018-04-07', '星期六', '1', '2', '星期六', '243', '14');
INSERT INTO `servicearrange` VALUES ('5817', '前张家', '小定房', '152', '2018-04-14', '星期六', '1', '3', '星期六', '243', '175');
INSERT INTO `servicearrange` VALUES ('5818', '前张家', '小定房', '141', '2018-04-21', '星期六', '1', '4', '星期六', '243', '41');
INSERT INTO `servicearrange` VALUES ('5819', '前张家', '小定房', '155', '2018-04-28', '星期六', '1', '5', '星期六', '243', '69');
INSERT INTO `servicearrange` VALUES ('5820', '前张家', '林东', '155', '2018-04-07', '星期六', '1', '2', '星期六', '244', '212');
INSERT INTO `servicearrange` VALUES ('5821', '前张家', '林东', '146', '2018-04-14', '星期六', '1', '3', '星期六', '244', '72');
INSERT INTO `servicearrange` VALUES ('5822', '前张家', '林东', null, '2018-04-21', '星期六', '0', '4', '星期六', '244', '8');
INSERT INTO `servicearrange` VALUES ('5823', '前张家', '林东', null, '2018-04-28', '星期六', '0', '5', '星期六', '244', '77');
INSERT INTO `servicearrange` VALUES ('5824', '前张家', '林西', '147', '2018-04-07', '星期六', '1', '2', '星期六', '245', '115');
INSERT INTO `servicearrange` VALUES ('5825', '前张家', '林西', '150', '2018-04-14', '星期六', '1', '3', '星期六', '245', '149');
INSERT INTO `servicearrange` VALUES ('5826', '前张家', '林西', '148', '2018-04-21', '星期六', '1', '4', '星期六', '245', '119');
INSERT INTO `servicearrange` VALUES ('5827', '前张家', '林西', '154', '2018-04-28', '星期六', '1', '5', '星期六', '245', '65');
INSERT INTO `servicearrange` VALUES ('5828', '前张家', '里头', '153', '2018-04-07', '星期六', '1', '2', '星期六', '246', '195');
INSERT INTO `servicearrange` VALUES ('5829', '前张家', '里头', '147', '2018-04-14', '星期六', '1', '3', '星期六', '246', '84');
INSERT INTO `servicearrange` VALUES ('5830', '前张家', '里头', '143', '2018-04-21', '星期六', '1', '4', '星期六', '246', '45');
INSERT INTO `servicearrange` VALUES ('5831', '前张家', '里头', '152', '2018-04-28', '星期六', '1', '5', '星期六', '246', '24');
INSERT INTO `servicearrange` VALUES ('5832', '前张家', '文房东', '141', '2018-04-07', '星期六', '1', '2', '星期六', '247', '21');
INSERT INTO `servicearrange` VALUES ('5833', '前张家', '文房东', '149', '2018-04-14', '星期六', '1', '3', '星期六', '247', '128');
INSERT INTO `servicearrange` VALUES ('5834', '前张家', '文房东', '144', '2018-04-21', '星期六', '1', '4', '星期六', '247', '47');
INSERT INTO `servicearrange` VALUES ('5835', '前张家', '文房东', '148', '2018-04-28', '星期六', '1', '5', '星期六', '247', '3');
INSERT INTO `servicearrange` VALUES ('5836', '前张家', '文房西', '142', '2018-04-07', '星期六', '1', '2', '星期六', '248', '27');
INSERT INTO `servicearrange` VALUES ('5837', '前张家', '文房西', '148', '2018-04-14', '星期六', '1', '3', '星期六', '248', '91');
INSERT INTO `servicearrange` VALUES ('5838', '前张家', '文房西', '147', '2018-04-21', '星期六', '1', '4', '星期六', '248', '93');
INSERT INTO `servicearrange` VALUES ('5839', '前张家', '文房西', '182', '2018-04-28', '星期六', '1', '5', '星期六', '248', '162');
INSERT INTO `servicearrange` VALUES ('5840', '前张家', '蔡厝', '144', '2018-04-07', '星期六', '1', '2', '星期六', '249', '57');
INSERT INTO `servicearrange` VALUES ('5841', '前张家', '蔡厝', '154', '2018-04-14', '星期六', '1', '3', '星期六', '249', '220');
INSERT INTO `servicearrange` VALUES ('5842', '前张家', '蔡厝', '146', '2018-04-21', '星期六', '1', '4', '星期六', '249', '88');
INSERT INTO `servicearrange` VALUES ('5843', '前张家', '蔡厝', '178', '2018-04-28', '星期六', '1', '5', '星期六', '249', '95');
INSERT INTO `servicearrange` VALUES ('5844', '前张家', '西江边', '139', '2018-04-07', '星期六', '1', '2', '星期六', '250', '1');
INSERT INTO `servicearrange` VALUES ('5845', '前张家', '西江边', '151', '2018-04-14', '星期六', '1', '3', '星期六', '250', '160');
INSERT INTO `servicearrange` VALUES ('5846', '前张家', '西江边', '139', '2018-04-21', '星期六', '1', '4', '星期六', '250', '4');
INSERT INTO `servicearrange` VALUES ('5847', '前张家', '西江边', '180', '2018-04-28', '星期六', '1', '5', '星期六', '250', '112');
INSERT INTO `servicearrange` VALUES ('5848', '前张家', '院边', '152', '2018-04-07', '星期六', '1', '2', '星期六', '251', '146');
INSERT INTO `servicearrange` VALUES ('5849', '前张家', '院边', '139', '2018-04-14', '星期六', '1', '3', '星期六', '251', '37');
INSERT INTO `servicearrange` VALUES ('5850', '前张家', '院边', '145', '2018-04-21', '星期六', '1', '4', '星期六', '251', '50');
INSERT INTO `servicearrange` VALUES ('5851', '前张家', '院边', '162', '2018-04-28', '星期六', '1', '5', '星期六', '251', '70');
INSERT INTO `servicearrange` VALUES ('5852', '东宵家', '东宵', '126', '2018-04-01', '星期日', '1', '1', '星期日', '252', '40');
INSERT INTO `servicearrange` VALUES ('5853', '东宵家', '东宵', '128', '2018-04-08', '星期日', '1', '2', '星期日', '252', '133');
INSERT INTO `servicearrange` VALUES ('5854', '东宵家', '东宵', '129', '2018-04-15', '星期日', '1', '3', '星期日', '252', '117');
INSERT INTO `servicearrange` VALUES ('5855', '东宵家', '东宵', '132', '2018-04-22', '星期日', '1', '4', '星期日', '252', '151');
INSERT INTO `servicearrange` VALUES ('5856', '东宵家', '东宵', '141', '2018-04-29', '星期日', '1', '5', '星期日', '252', '158');
INSERT INTO `servicearrange` VALUES ('5857', '东宵家', '张厝', '137', '2018-04-07', '星期六', '1', '2', '星期六', '253', '193');
INSERT INTO `servicearrange` VALUES ('5858', '东宵家', '张厝', '136', '2018-04-14', '星期六', '1', '3', '星期六', '253', '188');
INSERT INTO `servicearrange` VALUES ('5859', '东宵家', '张厝', '125', '2018-04-21', '星期六', '1', '4', '星期六', '253', '46');
INSERT INTO `servicearrange` VALUES ('5860', '东宵家', '张厝', '130', '2018-04-28', '星期六', '1', '5', '星期六', '253', '71');
INSERT INTO `servicearrange` VALUES ('5861', '东宵家', '狮厝', '128', '2018-04-01', '星期日', '1', '1', '星期日', '254', '63');
INSERT INTO `servicearrange` VALUES ('5862', '东宵家', '狮厝', '126', '2018-04-08', '星期日', '1', '2', '星期日', '254', '90');
INSERT INTO `servicearrange` VALUES ('5863', '东宵家', '狮厝', '124', '2018-04-15', '星期日', '1', '3', '星期日', '254', '6');
INSERT INTO `servicearrange` VALUES ('5864', '东宵家', '狮厝', '133', '2018-04-22', '星期日', '1', '4', '星期日', '254', '159');
INSERT INTO `servicearrange` VALUES ('5865', '东宵家', '狮厝', '145', '2018-04-29', '星期日', '1', '5', '星期日', '254', '210');
INSERT INTO `servicearrange` VALUES ('5866', '东宵家', '塘沁', '127', '2018-04-01', '星期日', '1', '1', '星期日', '255', '44');
INSERT INTO `servicearrange` VALUES ('5867', '东宵家', '塘沁', '125', '2018-04-08', '星期日', '1', '2', '星期日', '255', '74');
INSERT INTO `servicearrange` VALUES ('5868', '东宵家', '塘沁', '133', '2018-04-15', '星期日', '1', '3', '星期日', '255', '180');
INSERT INTO `servicearrange` VALUES ('5869', '东宵家', '塘沁', '135', '2018-04-22', '星期日', '1', '4', '星期日', '255', '165');
INSERT INTO `servicearrange` VALUES ('5870', '东宵家', '塘沁', '144', '2018-04-29', '星期日', '1', '5', '星期日', '255', '204');
INSERT INTO `servicearrange` VALUES ('5871', '东宵家', '北陈', '129', '2018-04-01', '星期日', '1', '1', '星期日', '256', '101');
INSERT INTO `servicearrange` VALUES ('5872', '东宵家', '北陈', '127', '2018-04-08', '星期日', '1', '2', '星期日', '256', '94');
INSERT INTO `servicearrange` VALUES ('5873', '东宵家', '北陈', '128', '2018-04-15', '星期日', '1', '3', '星期日', '256', '108');
INSERT INTO `servicearrange` VALUES ('5874', '东宵家', '北陈', '124', '2018-04-22', '星期日', '1', '4', '星期日', '256', '28');
INSERT INTO `servicearrange` VALUES ('5875', '东宵家', '北陈', '140', '2018-04-29', '星期日', '1', '5', '星期日', '256', '111');
INSERT INTO `servicearrange` VALUES ('5876', '东宵家', '确坛', '125', '2018-04-01', '星期日', '1', '1', '星期日', '257', '34');
INSERT INTO `servicearrange` VALUES ('5877', '东宵家', '确坛', '133', '2018-04-08', '星期日', '1', '2', '星期日', '257', '179');
INSERT INTO `servicearrange` VALUES ('5878', '东宵家', '确坛', '137', '2018-04-15', '星期日', '1', '3', '星期日', '257', '199');
INSERT INTO `servicearrange` VALUES ('5879', '东宵家', '确坛', '138', '2018-04-22', '星期日', '1', '4', '星期日', '257', '216');
INSERT INTO `servicearrange` VALUES ('5880', '东宵家', '确坛', '138', '2018-04-29', '星期日', '1', '5', '星期日', '257', '106');
INSERT INTO `servicearrange` VALUES ('5881', '东宵家', '后薛', '132', '2018-04-01', '星期日', '1', '1', '星期日', '258', '176');
INSERT INTO `servicearrange` VALUES ('5882', '东宵家', '后薛', '138', '2018-04-08', '星期日', '1', '2', '星期日', '258', '197');
INSERT INTO `servicearrange` VALUES ('5883', '东宵家', '后薛', '131', '2018-04-15', '星期日', '1', '3', '星期日', '258', '152');
INSERT INTO `servicearrange` VALUES ('5884', '东宵家', '后薛', '131', '2018-04-22', '星期日', '1', '4', '星期日', '258', '147');
INSERT INTO `servicearrange` VALUES ('5885', '东宵家', '后薛', '129', '2018-04-29', '星期日', '1', '5', '星期日', '258', '62');
INSERT INTO `servicearrange` VALUES ('5886', '东宵家', '玉仑', '135', '2018-04-01', '星期日', '1', '1', '星期日', '259', '185');
INSERT INTO `servicearrange` VALUES ('5887', '东宵家', '玉仑', '124', '2018-04-08', '星期日', '1', '2', '星期日', '259', '11');
INSERT INTO `servicearrange` VALUES ('5888', '东宵家', '玉仑', '130', '2018-04-15', '星期日', '1', '3', '星期日', '259', '139');
INSERT INTO `servicearrange` VALUES ('5889', '东宵家', '玉仑', '136', '2018-04-22', '星期日', '1', '4', '星期日', '259', '192');
INSERT INTO `servicearrange` VALUES ('5890', '东宵家', '玉仑', '131', '2018-04-29', '星期日', '1', '5', '星期日', '259', '78');
INSERT INTO `servicearrange` VALUES ('5891', '岸斗家', '岸斗', '182', '2018-04-05', '星期四', '1', '2', '星期四', '260', '167');
INSERT INTO `servicearrange` VALUES ('5892', '岸斗家', '岸斗', null, '2018-04-12', '星期四', '0', '3', '星期四', '260', '136');
INSERT INTO `servicearrange` VALUES ('5893', '岸斗家', '岸斗', null, '2018-04-19', '星期四', '0', '4', '星期四', '260', '92');
INSERT INTO `servicearrange` VALUES ('5894', '岸斗家', '岸斗', null, '2018-04-26', '星期四', '1', '5', '星期四', '260', '186');
INSERT INTO `servicearrange` VALUES ('5895', '岸斗家', '吴塘', '169', '2018-04-07', '星期六', '1', '2', '星期六', '261', '2');
INSERT INTO `servicearrange` VALUES ('5896', '岸斗家', '吴塘', '172', '2018-04-14', '星期六', '1', '3', '星期六', '261', '18');
INSERT INTO `servicearrange` VALUES ('5897', '岸斗家', '吴塘', '182', '2018-04-21', '星期六', '1', '4', '星期六', '261', '182');
INSERT INTO `servicearrange` VALUES ('5898', '岸斗家', '吴塘', null, '2018-04-28', '星期六', '1', '5', '星期六', '261', '168');
INSERT INTO `servicearrange` VALUES ('5899', '岸斗家', '薛垱', '181', '2018-04-07', '星期六', '1', '2', '星期六', '262', '155');
INSERT INTO `servicearrange` VALUES ('5900', '岸斗家', '薛垱', '184', '2018-04-14', '星期六', '1', '3', '星期六', '262', '202');
INSERT INTO `servicearrange` VALUES ('5901', '岸斗家', '薛垱', '176', '2018-04-21', '星期六', '1', '4', '星期六', '262', '83');
INSERT INTO `servicearrange` VALUES ('5902', '岸斗家', '薛垱', null, '2018-04-28', '星期六', '1', '5', '星期六', '262', '64');
INSERT INTO `servicearrange` VALUES ('5903', '岸斗家', '东曾', '170', '2018-04-07', '星期六', '1', '2', '星期六', '263', '19');
INSERT INTO `servicearrange` VALUES ('5904', '岸斗家', '东曾', '179', '2018-04-14', '星期六', '1', '3', '星期六', '263', '121');
INSERT INTO `servicearrange` VALUES ('5905', '岸斗家', '东曾', '169', '2018-04-21', '星期六', '1', '4', '星期六', '263', '5');
INSERT INTO `servicearrange` VALUES ('5906', '岸斗家', '东曾', null, '2018-04-28', '星期六', '1', '5', '星期六', '263', '79');
INSERT INTO `servicearrange` VALUES ('5907', '岸斗家', '前华', '177', '2018-04-07', '星期六', '1', '2', '星期六', '264', '85');
INSERT INTO `servicearrange` VALUES ('5908', '岸斗家', '前华', '178', '2018-04-14', '星期六', '1', '3', '星期六', '264', '103');
INSERT INTO `servicearrange` VALUES ('5909', '岸斗家', '前华', '177', '2018-04-21', '星期六', '1', '4', '星期六', '264', '75');
INSERT INTO `servicearrange` VALUES ('5910', '岸斗家', '前华', null, '2018-04-28', '星期六', '1', '5', '星期六', '264', '164');
INSERT INTO `servicearrange` VALUES ('5911', '岸斗家', '陈厝', '184', '2018-04-07', '星期六', '1', '2', '星期六', '265', '200');
INSERT INTO `servicearrange` VALUES ('5912', '岸斗家', '陈厝', '181', '2018-04-14', '星期六', '1', '3', '星期六', '265', '143');
INSERT INTO `servicearrange` VALUES ('5913', '岸斗家', '陈厝', '170', '2018-04-21', '星期六', '1', '4', '星期六', '265', '17');
INSERT INTO `servicearrange` VALUES ('5914', '岸斗家', '陈厝', null, '2018-04-28', '星期六', '1', '5', '星期六', '265', '213');
INSERT INTO `servicearrange` VALUES ('5915', '岸斗家', '芦塘', '173', '2018-04-07', '星期六', '1', '2', '星期六', '266', '36');
INSERT INTO `servicearrange` VALUES ('5916', '岸斗家', '芦塘', '183', '2018-04-14', '星期六', '1', '3', '星期六', '266', '201');
INSERT INTO `servicearrange` VALUES ('5917', '岸斗家', '芦塘', '178', '2018-04-21', '星期六', '1', '4', '星期六', '266', '116');
INSERT INTO `servicearrange` VALUES ('5918', '岸斗家', '芦塘', null, '2018-04-28', '星期六', '1', '5', '星期六', '266', '156');
INSERT INTO `servicearrange` VALUES ('5919', '岸斗家', '城头', '172', '2018-04-01', '星期日', '1', '1', '星期日', '267', '23');
INSERT INTO `servicearrange` VALUES ('5920', '岸斗家', '城头', '179', '2018-04-08', '星期日', '1', '2', '星期日', '267', '144');
INSERT INTO `servicearrange` VALUES ('5921', '岸斗家', '城头', '174', '2018-04-15', '星期日', '1', '3', '星期日', '267', '38');
INSERT INTO `servicearrange` VALUES ('5922', '岸斗家', '城头', '179', '2018-04-22', '星期日', '1', '4', '星期日', '267', '118');
INSERT INTO `servicearrange` VALUES ('5923', '岸斗家', '城头', null, '2018-04-29', '星期日', '1', '5', '星期日', '267', '196');
INSERT INTO `servicearrange` VALUES ('5924', '岸斗家', '后星期', '174', '2018-04-07', '星期六', '1', '2', '星期六', '268', '67');
INSERT INTO `servicearrange` VALUES ('5925', '岸斗家', '后星期', '185', '2018-04-14', '星期六', '1', '3', '星期六', '268', '203');
INSERT INTO `servicearrange` VALUES ('5926', '岸斗家', '后星期', '173', '2018-04-21', '星期六', '1', '4', '星期六', '268', '30');
INSERT INTO `servicearrange` VALUES ('5927', '岸斗家', '后星期', null, '2018-04-28', '星期六', '1', '5', '星期六', '268', '173');
INSERT INTO `servicearrange` VALUES ('5928', '岸斗家', '柯屿', '176', '2018-04-07', '星期六', '1', '2', '星期六', '269', '82');
INSERT INTO `servicearrange` VALUES ('5929', '岸斗家', '柯屿', '175', '2018-04-14', '星期六', '1', '3', '星期六', '269', '51');
INSERT INTO `servicearrange` VALUES ('5930', '岸斗家', '柯屿', '175', '2018-04-21', '星期六', '1', '4', '星期六', '269', '80');
INSERT INTO `servicearrange` VALUES ('5931', '岸斗家', '柯屿', null, '2018-04-28', '星期六', '1', '5', '星期六', '269', '148');
INSERT INTO `servicearrange` VALUES ('5932', '岸斗家', '上郭', '183', '2018-04-07', '星期六', '1', '2', '星期六', '270', '170');
INSERT INTO `servicearrange` VALUES ('5933', '岸斗家', '上郭', '180', '2018-04-14', '星期六', '1', '3', '星期六', '270', '140');
INSERT INTO `servicearrange` VALUES ('5934', '岸斗家', '上郭', '180', '2018-04-21', '星期六', '1', '4', '星期六', '270', '124');
INSERT INTO `servicearrange` VALUES ('5935', '岸斗家', '上郭', null, '2018-04-28', '星期六', '1', '5', '星期六', '270', '102');
INSERT INTO `servicearrange` VALUES ('5936', '和洋家', '上和洋', '167', '2018-04-01', '星期日', '1', '1', '星期日', '271', '190');
INSERT INTO `servicearrange` VALUES ('5937', '和洋家', '上和洋', '166', '2018-04-08', '星期日', '1', '2', '星期日', '271', '181');
INSERT INTO `servicearrange` VALUES ('5938', '和洋家', '上和洋', '161', '2018-04-15', '星期日', '1', '3', '星期日', '271', '125');
INSERT INTO `servicearrange` VALUES ('5939', '和洋家', '上和洋', '157', '2018-04-22', '星期日', '1', '4', '星期日', '271', '48');
INSERT INTO `servicearrange` VALUES ('5940', '和洋家', '上和洋', null, '2018-04-29', '星期日', '1', '5', '星期日', '271', '211');
INSERT INTO `servicearrange` VALUES ('5941', '和洋家', '下和洋', '168', '2018-04-01', '星期日', '1', '1', '星期日', '272', '208');
INSERT INTO `servicearrange` VALUES ('5942', '和洋家', '下和洋', '158', '2018-04-08', '星期日', '1', '2', '星期日', '272', '31');
INSERT INTO `servicearrange` VALUES ('5943', '和洋家', '下和洋', '160', '2018-04-15', '星期日', '1', '3', '星期日', '272', '100');
INSERT INTO `servicearrange` VALUES ('5944', '和洋家', '下和洋', '155', '2018-04-22', '星期日', '1', '4', '星期日', '272', '25');
INSERT INTO `servicearrange` VALUES ('5945', '和洋家', '下和洋', '206', '2018-04-29', '星期日', '1', '5', '星期日', '272', '86');
INSERT INTO `servicearrange` VALUES ('5946', '和洋家', '南宵', '154', '2018-04-01', '星期日', '1', '1', '星期日', '273', '13');
INSERT INTO `servicearrange` VALUES ('5947', '和洋家', '南宵', '162', '2018-04-08', '星期日', '1', '2', '星期日', '273', '113');
INSERT INTO `servicearrange` VALUES ('5948', '和洋家', '南宵', '166', '2018-04-15', '星期日', '1', '3', '星期日', '273', '184');
INSERT INTO `servicearrange` VALUES ('5949', '和洋家', '南宵', '164', '2018-04-22', '星期日', '1', '4', '星期日', '273', '132');
INSERT INTO `servicearrange` VALUES ('5950', '和洋家', '南宵', '202', '2018-04-29', '星期日', '1', '5', '星期日', '273', '22');
INSERT INTO `servicearrange` VALUES ('5951', '和洋家', '华塘', '157', '2018-04-01', '星期日', '1', '1', '星期日', '274', '39');
INSERT INTO `servicearrange` VALUES ('5952', '和洋家', '华塘', '161', '2018-04-08', '星期日', '1', '2', '星期日', '274', '110');
INSERT INTO `servicearrange` VALUES ('5953', '和洋家', '华塘', '167', '2018-04-15', '星期日', '1', '3', '星期日', '274', '205');
INSERT INTO `servicearrange` VALUES ('5954', '和洋家', '华塘', '158', '2018-04-22', '星期日', '1', '4', '星期日', '274', '49');
INSERT INTO `servicearrange` VALUES ('5955', '和洋家', '华塘', '203', '2018-04-29', '星期日', '1', '5', '星期日', '274', '56');
INSERT INTO `servicearrange` VALUES ('5956', '和洋家', '南华', '159', '2018-04-01', '星期日', '1', '1', '星期日', '275', '52');
INSERT INTO `servicearrange` VALUES ('5957', '和洋家', '南华', '157', '2018-04-08', '星期日', '1', '2', '星期日', '275', '15');
INSERT INTO `servicearrange` VALUES ('5958', '和洋家', '南华', '164', '2018-04-15', '星期日', '1', '3', '星期日', '275', '163');
INSERT INTO `servicearrange` VALUES ('5959', '和洋家', '南华', '165', '2018-04-22', '星期日', '1', '4', '星期日', '275', '141');
INSERT INTO `servicearrange` VALUES ('5960', '和洋家', '南华', null, '2018-04-29', '星期日', '1', '5', '星期日', '275', '194');
INSERT INTO `servicearrange` VALUES ('5961', '和洋家', '北翁', '163', '2018-04-07', '星期六', '1', '2', '星期六', '276', '145');
INSERT INTO `servicearrange` VALUES ('5962', '和洋家', '北翁', '159', '2018-04-14', '星期六', '1', '3', '星期六', '276', '61');
INSERT INTO `servicearrange` VALUES ('5963', '和洋家', '北翁', '160', '2018-04-21', '星期六', '1', '4', '星期六', '276', '99');
INSERT INTO `servicearrange` VALUES ('5964', '和洋家', '北翁', '209', '2018-04-28', '星期六', '1', '5', '星期六', '276', '157');
INSERT INTO `servicearrange` VALUES ('5965', '和洋家', '院后', '168', '2018-04-07', '星期六', '1', '2', '星期六', '277', '207');
INSERT INTO `servicearrange` VALUES ('5966', '和洋家', '院后', '165', '2018-04-14', '星期六', '1', '3', '星期六', '277', '171');
INSERT INTO `servicearrange` VALUES ('5967', '和洋家', '院后', '163', '2018-04-21', '星期六', '1', '4', '星期六', '277', '130');
INSERT INTO `servicearrange` VALUES ('5968', '和洋家', '院后', '204', '2018-04-28', '星期六', '1', '5', '星期六', '277', '135');

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
