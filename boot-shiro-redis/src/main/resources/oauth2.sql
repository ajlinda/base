/*
Navicat MySQL Data Transfer

Source Server         : mysql8.0
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : oauth2

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-05-12 10:08:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '地区名称',
  `code` varchar(10) DEFAULT NULL COMMENT '地区编码',
  `type` int(1) DEFAULT NULL COMMENT '类型',
  `is_del` int(1) DEFAULT '0' COMMENT '是否删除',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('45', '浙江省', null, '0', '0', '0', '2017-09-14 07:28:00', null);
INSERT INTO `address` VALUES ('46', '杭州市', null, '1', '0', '45', '2017-09-14 07:28:15', null);
INSERT INTO `address` VALUES ('47', '西湖区', null, '2', '0', '46', '2017-09-14 07:28:28', null);
INSERT INTO `address` VALUES ('48', '湖北省', null, '0', '0', '0', '2017-09-14 07:28:48', null);
INSERT INTO `address` VALUES ('49', '武汉市', null, '1', '0', '48', '2017-09-14 07:29:00', null);
INSERT INTO `address` VALUES ('50', '武昌区', null, '2', '0', '49', '2017-09-14 07:29:10', null);
INSERT INTO `address` VALUES ('51', '汉口区', null, '2', '0', '49', '2017-09-14 15:35:36', '2017-09-14 15:35:36');
INSERT INTO `address` VALUES ('52', '江苏省', null, '0', '0', '0', '2017-09-14 07:37:18', null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL COMMENT '发送人ID',
  `from_name` varchar(20) NOT NULL COMMENT '发送人姓名',
  `to_id` int(11) NOT NULL COMMENT '接收人ID',
  `to_name` varchar(20) NOT NULL COMMENT '接收人姓名',
  `msg_content` varchar(200) NOT NULL COMMENT '消息内容',
  `send_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `msg_type` int(1) NOT NULL COMMENT '消息类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(255) DEFAULT NULL,
  KEY `token_id_index` (`token_id`),
  KEY `authentication_id_index` (`authentication_id`),
  KEY `user_name_index` (`user_name`),
  KEY `client_id_index` (`client_id`),
  KEY `refresh_token_index` (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------
INSERT INTO `oauth_access_token` VALUES ('2017-09-06 17:29:21', '526cd96024a7dfd264be252581d65356', 0xEFBFBDEFBFBD0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CEFBFBDEFBFBD361B24EFBFBDEFBFBD0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614EFBFBD5AEFBFBDEFBFBDEFBFBD02000078707372000E6A6176612E7574696C2E44617465686AEFBFBD014B597419030000787077080000015E58EFBFBD4AEFBFBD787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FEFBFBD4763EFBFBDEFBFBDC9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73EFBFBD0E0A6354EFBFBD5E0200014C000576616C756571007E0005787074002461316464323365642D326235392D343532312D623531382D3236663732636231353231327371007E000977080000015EEFBFBD76EFBFBD78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574EFBFBD1DEFBFBDD18FEFBFBDEFBFBD550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E194200EFBFBDEFBFBD5EEFBFBD1E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574EFBFBD6CEFBFBD5AEFBFBDEFBFBD2A1E020000787200116A6176612E7574696C2E48617368536574EFBFBD44EFBFBDEFBFBDEFBFBDEFBFBDEFBFBD340300007870770C000000023F40000000000001740004726561647874000662656172657274002433623231633532612D343132382D343431352D393862652D343635623739366266653832, '5ed6f8ca142962aa59a37718b487093f', 'admin', 'mobile-client', 0xEFBFBDEFBFBD0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EEFBFBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374EFBFBD0F2531EFBFBDEFBFBD100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E194200EFBFBDEFBFBD5EEFBFBD1E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C69737478EFBFBDEFBFBD1DEFBFBDEFBFBD61EFBFBD03000149000473697A65787000000003770400000003737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001EFBFBD0200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527371007E000D74000A524F4C455F554E4954597371007E000D74000B524F4C455F4D4F42494C457871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0018787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EEFBFBD7169EFBFBD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00164C000573636F706571007E0018787074000D6D6F62696C652D636C69656E74737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170EFBFBDEFBFBD74EFBFBD07420200014C00016D71007E00167870737200116A6176612E7574696C2E486173684D61700507EFBFBDEFBFBDEFBFBD1660EFBFBD03000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000474000A6772616E745F7479706574000870617373776F7264740009636C69656E745F696474000D6D6F62696C652D636C69656E7474000573636F706574000472656164740008757365726E616D6574000561646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574EFBFBD1DEFBFBDD18FEFBFBDEFBFBD550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574EFBFBD6CEFBFBD5AEFBFBDEFBFBD2A1E020000787200116A6176612E7574696C2E48617368536574EFBFBD44EFBFBDEFBFBDEFBFBDEFBFBDEFBFBD340300007870770C000000103F4000000000000171007E002578017371007E002B770C000000103F400000000000017371007E000D74000B524F4C455F434C49454E54787371007E001E3F40000000000000770800000010000000007870707371007E002B770C000000103F4000000000000174000F6D6F62696C652D7265736F75726365787371007E002B770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001EFBFBD0200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000377040000000371007E000F71007E001171007E00137871007E0037737200176A6176612E7574696C2E4C696E6B6564486173684D617034EFBFBD4E5C106CEFBFBDEFBFBD0200015A000B6163636573734F726465727871007E001E3F4000000000000C7708000000100000000571007E002071007E002171007E002471007E002574000D636C69656E745F7365637265747400066D6F62696C6571007E002271007E002371007E002671007E00277800707372001D636F6D2E687A6C682E656E746974792E4D795573657244657461696C73EFBFBDDCA16DEFBFBDEFBFBD5F320200035A00067374617475734C00126772616E746564417574686F72697469657371007E00084C0004757365727400164C636F6D2F687A6C682F656E746974792F557365723B7870007371007E000B0000000377040000000371007E000F71007E001171007E001378737200466F72672E6170616368652E6962617469732E6578656375746F722E6C6F616465722E6A61766173736973742E4A617661737369737453657269616C5374617465486F6C6465727C12EFBFBD2BEFBFBD7003750C00007872003B6F72672E6170616368652E6962617469732E6578656375746F722E6C6F616465722E416273747261637453657269616C5374617465486F6C6465727C12EFBFBD2BEFBFBD7003750C00007870757200025B42EFBFBDEFBFBD17EFBFBD060854EFBFBD0200007870000004EFBFBDEFBFBDEFBFBD000573720014636F6D2E687A6C682E656E746974792E55736572000000000000000102000B4C000861726368697665647400134C6A6176612F6C616E672F426F6F6C65616E3B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000B64656661756C745573657271007E00014C0005656D61696C7400124C6A6176612F6C616E672F537472696E673B4C00046775696471007E00034C000269647400104C6A6176612F6C616E672F4C6F6E673B4C000D6C6173744C6F67696E54696D6571007E00024C000870617373776F726471007E00034C000570686F6E6571007E00034C000A70726976696C656765737400104C6A6176612F7574696C2F4C6973743B4C0008757365726E616D6571007E00037870737200116A6176612E6C616E672E426F6F6C65616EEFBFBD2072EFBFBDD59CEFBFBDEFBFBD0200015A000576616C75657870007372000E6A6176612E7574696C2E44617465686AEFBFBD014B597419030000787077080000015E50DF8EEFBFBD787371007E00070174000D61646D696E40776463792E636374002032396636303034666231623034363666393537326230326266326163316265387372000E6A6176612E6C616E672E4C6F6E673BEFBFBDEFBFBDCC8F23EFBFBD0200014A000576616C7565787200106A6176612E6C616E672E4E756D626572EFBFBDEFBFBDEFBFBD1D0BEFBFBDEFBFBDEFBFBD0200007870000000000000001570740020323132333266323937613537613561373433383934613065346138303166633374000B3032382D31323334353637737200136A6176612E7574696C2E41727261794C69737478EFBFBDEFBFBD1DEFBFBDEFBFBD61EFBFBD03000149000473697A657870000000007704000000007874000561646D696E737200116A6176612E7574696C2E486173684D61700507EFBFBDEFBFBDEFBFBD1660EFBFBD03000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000174000A50524956494C454745537372003A6F72672E6170616368652E6962617469732E6578656375746F722E6C6F616465722E526573756C744C6F616465724D6170244C6F6164506169720000000001332A6C0200044C0014636F6E66696775726174696F6E466163746F72797400114C6A6176612F6C616E672F436C6173733B4C000F6D6170706564506172616D657465727400164C6A6176612F696F2F53657269616C697A61626C653B4C000F6D617070656453746174656D656E7471007E00034C000870726F706572747971007E0003787070737200116A6176612E6C616E672E496E746567657212E2A0A4EFBFBDEFBFBDEFBFBD3802000149000576616C75657871007E000F0000001574002E636F6D2E687A6C682E64616F2E557365724D61707065722E66696E6450726976696C65676573427955736572496474000A70726976696C6567657378737200396F72672E6170616368652E6962617469732E7265666C656374696F6E2E666163746F72792E44656661756C744F626A656374466163746F7279EFBFBD1C4AEFBFBDDBBBEFBFBDEFBFBD0200007870757200125B4C6A6176612E6C616E672E436C6173733BEFBFBD16D7AEEFBFBDEFBFBD5AEFBFBD020000787000000000757200135B4C6A6176612E6C616E672E4F626A6563743BEFBFBDEFBFBD58EFBFBD1073296C02000078700000000078, '3dd9989344db360d0385378c3719e632');

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` text,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archived` tinyint(1) DEFAULT '0',
  `trusted` tinyint(1) DEFAULT '0',
  `autoapprove` varchar(255) DEFAULT 'false',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('mobile-client', 'mobile-resource', 'mobile', 'read,write', 'password,refresh_token', null, 'ROLE_CLIENT', null, null, null, '2017-09-05 15:09:44', '0', '0', 'false');
INSERT INTO `oauth_client_details` VALUES ('unity-client', 'unity-resource', 'unity', 'read,write', 'authorization_code,refresh_token,implicit', null, 'ROLE_CLIENT', null, null, null, '2017-09-05 15:09:44', '0', '0', 'false');

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `code` varchar(255) DEFAULT NULL,
  `authentication` blob,
  KEY `code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_id` varchar(255) DEFAULT NULL,
  `token` blob,
  `authentication` blob,
  KEY `token_id_index` (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------
INSERT INTO `oauth_refresh_token` VALUES ('2017-09-06 14:54:37', '3dd9989344db360d0385378c3719e632', 0xEFBFBDEFBFBD00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FEFBFBD4763EFBFBDEFBFBDC9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73EFBFBD0E0A6354EFBFBD5E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002461316464323365642D326235392D343532312D623531382D3236663732636231353231327372000E6A6176612E7574696C2E44617465686AEFBFBD014B597419030000787077080000015EEFBFBD76EFBFBD78, 0xEFBFBDEFBFBD0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EEFBFBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374EFBFBD0F2531EFBFBDEFBFBD100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E194200EFBFBDEFBFBD5EEFBFBD1E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C69737478EFBFBDEFBFBD1DEFBFBDEFBFBD61EFBFBD03000149000473697A65787000000003770400000003737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001EFBFBD0200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B7870740009524F4C455F555345527371007E000D74000A524F4C455F554E4954597371007E000D74000B524F4C455F4D4F42494C457871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0018787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EEFBFBD7169EFBFBD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00164C000573636F706571007E0018787074000D6D6F62696C652D636C69656E74737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170EFBFBDEFBFBD74EFBFBD07420200014C00016D71007E00167870737200116A6176612E7574696C2E486173684D61700507EFBFBDEFBFBDEFBFBD1660EFBFBD03000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000474000A6772616E745F7479706574000870617373776F7264740009636C69656E745F696474000D6D6F62696C652D636C69656E7474000573636F706574000472656164740008757365726E616D6574000561646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574EFBFBD1DEFBFBDD18FEFBFBDEFBFBD550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574EFBFBD6CEFBFBD5AEFBFBDEFBFBD2A1E020000787200116A6176612E7574696C2E48617368536574EFBFBD44EFBFBDEFBFBDEFBFBDEFBFBDEFBFBD340300007870770C000000103F4000000000000171007E002578017371007E002B770C000000103F400000000000017371007E000D74000B524F4C455F434C49454E54787371007E001E3F40000000000000770800000010000000007870707371007E002B770C000000103F4000000000000174000F6D6F62696C652D7265736F75726365787371007E002B770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001EFBFBD0200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000377040000000371007E000F71007E001171007E00137871007E0037737200176A6176612E7574696C2E4C696E6B6564486173684D617034EFBFBD4E5C106CEFBFBDEFBFBD0200015A000B6163636573734F726465727871007E001E3F4000000000000C7708000000100000000571007E002071007E002171007E002471007E002574000D636C69656E745F7365637265747400066D6F62696C6571007E002271007E002371007E002671007E00277800707372001D636F6D2E687A6C682E656E746974792E4D795573657244657461696C73EFBFBDDCA16DEFBFBDEFBFBD5F320200035A00067374617475734C00126772616E746564417574686F72697469657371007E00084C0004757365727400164C636F6D2F687A6C682F656E746974792F557365723B7870007371007E000B0000000377040000000371007E000F71007E001171007E001378737200466F72672E6170616368652E6962617469732E6578656375746F722E6C6F616465722E6A61766173736973742E4A617661737369737453657269616C5374617465486F6C6465727C12EFBFBD2BEFBFBD7003750C00007872003B6F72672E6170616368652E6962617469732E6578656375746F722E6C6F616465722E416273747261637453657269616C5374617465486F6C6465727C12EFBFBD2BEFBFBD7003750C00007870757200025B42EFBFBDEFBFBD17EFBFBD060854EFBFBD0200007870000004EFBFBDEFBFBDEFBFBD000573720014636F6D2E687A6C682E656E746974792E55736572000000000000000102000B4C000861726368697665647400134C6A6176612F6C616E672F426F6F6C65616E3B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000B64656661756C745573657271007E00014C0005656D61696C7400124C6A6176612F6C616E672F537472696E673B4C00046775696471007E00034C000269647400104C6A6176612F6C616E672F4C6F6E673B4C000D6C6173744C6F67696E54696D6571007E00024C000870617373776F726471007E00034C000570686F6E6571007E00034C000A70726976696C656765737400104C6A6176612F7574696C2F4C6973743B4C0008757365726E616D6571007E00037870737200116A6176612E6C616E672E426F6F6C65616EEFBFBD2072EFBFBDD59CEFBFBDEFBFBD0200015A000576616C75657870007372000E6A6176612E7574696C2E44617465686AEFBFBD014B597419030000787077080000015E50DF8EEFBFBD787371007E00070174000D61646D696E40776463792E636374002032396636303034666231623034363666393537326230326266326163316265387372000E6A6176612E6C616E672E4C6F6E673BEFBFBDEFBFBDCC8F23EFBFBD0200014A000576616C7565787200106A6176612E6C616E672E4E756D626572EFBFBDEFBFBDEFBFBD1D0BEFBFBDEFBFBDEFBFBD0200007870000000000000001570740020323132333266323937613537613561373433383934613065346138303166633374000B3032382D31323334353637737200136A6176612E7574696C2E41727261794C69737478EFBFBDEFBFBD1DEFBFBDEFBFBD61EFBFBD03000149000473697A657870000000007704000000007874000561646D696E737200116A6176612E7574696C2E486173684D61700507EFBFBDEFBFBDEFBFBD1660EFBFBD03000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000174000A50524956494C454745537372003A6F72672E6170616368652E6962617469732E6578656375746F722E6C6F616465722E526573756C744C6F616465724D6170244C6F6164506169720000000001332A6C0200044C0014636F6E66696775726174696F6E466163746F72797400114C6A6176612F6C616E672F436C6173733B4C000F6D6170706564506172616D657465727400164C6A6176612F696F2F53657269616C697A61626C653B4C000F6D617070656453746174656D656E7471007E00034C000870726F706572747971007E0003787070737200116A6176612E6C616E672E496E746567657212E2A0A4EFBFBDEFBFBDEFBFBD3802000149000576616C75657871007E000F0000001574002E636F6D2E687A6C682E64616F2E557365724D61707065722E66696E6450726976696C65676573427955736572496474000A70726976696C6567657378737200396F72672E6170616368652E6962617469732E7265666C656374696F6E2E666163746F72792E44656661756C744F626A656374466163746F7279EFBFBD1C4AEFBFBDDBBBEFBFBDEFBFBD0200007870757200125B4C6A6176612E6C616E672E436C6173733BEFBFBD16D7AEEFBFBDEFBFBD5AEFBFBD020000787000000000757200135B4C6A6176612E6C616E672E4F626A6563743BEFBFBDEFBFBD58EFBFBD1073296C02000078700000000078);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) NOT NULL COMMENT '权限名称',
  `rid` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'add', '1');
INSERT INTO `permission` VALUES ('2', 'delete', '1');
INSERT INTO `permission` VALUES ('3', 'update', '1');
INSERT INTO `permission` VALUES ('4', 'query', '1');
INSERT INTO `permission` VALUES ('5', 'query', '2');
INSERT INTO `permission` VALUES ('6', 'query', '3');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'manager');
INSERT INTO `role` VALUES ('3', 'normal');

-- ----------------------------
-- Table structure for user_
-- ----------------------------
DROP TABLE IF EXISTS `user_`;
CREATE TABLE `user_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `default_user` tinyint(1) DEFAULT '0',
  `last_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guid` (`guid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_
-- ----------------------------
INSERT INTO `user_` VALUES ('21', '29f6004fb1b0466f9572b02bf2ac1be8', '2017-09-13 15:36:58', '0', 'admin@wdcy.cc', '21232f297a57a5a743894a0e4a801fc3', '028-1234567', 'admin', '1', '2017-09-13 08:45:02');
INSERT INTO `user_` VALUES ('22', '55b713df1c6f423e842ad68668523c49', '2017-09-05 15:09:43', '0', 'unity@wdcy.cc', '439b3a25b555b3bc8667a09a036ae70c', '', 'unity', '0', null);
INSERT INTO `user_` VALUES ('23', '612025cb3f964a64a48bbdf77e53c2c1', '2017-09-05 15:09:43', '0', 'mobile@wdcy.cc', '532c28d5412dd75bf975fb951c740a30', '', 'mobile', '0', '2017-09-13 08:45:38');

-- ----------------------------
-- Table structure for user_privilege
-- ----------------------------
DROP TABLE IF EXISTS `user_privilege`;
CREATE TABLE `user_privilege` (
  `user_id` int(11) DEFAULT NULL,
  `privilege` varchar(255) DEFAULT NULL,
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_privilege
-- ----------------------------
INSERT INTO `user_privilege` VALUES ('22', 'UNITY');
INSERT INTO `user_privilege` VALUES ('23', 'MOBILE');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `rid` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '21', '1');
INSERT INTO `user_role` VALUES ('2', '22', '2');
INSERT INTO `user_role` VALUES ('3', '23', '3');
