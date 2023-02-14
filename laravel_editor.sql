/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : laravel_editor

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 13/12/2022 20:41:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for audiobooks
-- ----------------------------
DROP TABLE IF EXISTS `audiobooks`;
CREATE TABLE `audiobooks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `readingOrder` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of audiobooks
-- ----------------------------
INSERT INTO `audiobooks` VALUES (1, 'The Final Empire: Mistborn', 'Brandon Sanderson', 1479, 1);
INSERT INTO `audiobooks` VALUES (2, 'The Name of the Wind', 'Patrick Rothfuss', 983, 2);
INSERT INTO `audiobooks` VALUES (3, 'The Blade Itself: The First Law', 'Joe Abercrombie', 1340, 3);
INSERT INTO `audiobooks` VALUES (4, 'The Heroes', 'Joe Abercrombie', 1390, 4);
INSERT INTO `audiobooks` VALUES (5, 'Assassin\'s Apprentice: The Farseer Trilogy', 'Robin Hobb', 1043, 5);
INSERT INTO `audiobooks` VALUES (6, 'The Eye of the World: Wheel of Time', 'Robert Jordan', 1802, 6);
INSERT INTO `audiobooks` VALUES (7, 'The Wise Man\'s Fear', 'Patrick Rothfuss', 1211, 7);
INSERT INTO `audiobooks` VALUES (8, 'The Way of Kings: The Stormlight Archive', 'Brandon Sanderson', 2734, 8);
INSERT INTO `audiobooks` VALUES (9, 'The Lean Startup', 'Eric Ries', 523, 9);
INSERT INTO `audiobooks` VALUES (10, 'House of Suns', 'Alastair Reynolds', 1096, 10);
INSERT INTO `audiobooks` VALUES (11, 'The Lies of Locke Lamora', 'Scott Lynch', 1323, 11);
INSERT INTO `audiobooks` VALUES (12, 'Best Served Cold', 'Joe Abercrombie', 1592, 12);
INSERT INTO `audiobooks` VALUES (13, 'Thinking, Fast and Slow', 'Daniel Kahneman', 1206, 13);
INSERT INTO `audiobooks` VALUES (14, 'The Dark Tower I: The Gunslinger', 'Stephen King', 439, 14);
INSERT INTO `audiobooks` VALUES (15, 'Theft of Swords: Riyria Revelations', 'Michael J. Sullivan', 1357, 15);
INSERT INTO `audiobooks` VALUES (16, 'The Emperor\'s Blades: Chronicle of the Unhewn Throne', 'Brian Staveley', 1126, 16);
INSERT INTO `audiobooks` VALUES (17, 'The Magic of Recluce: Saga of Recluce', 'L. E. Modesitt Jr.', 1153, 17);
INSERT INTO `audiobooks` VALUES (18, 'Red Country', 'Joe Abercrombie', 1196, 18);
INSERT INTO `audiobooks` VALUES (19, 'Warbreaker', 'Brandon Sanderson', 1496, 19);
INSERT INTO `audiobooks` VALUES (20, 'Magician', 'Raymond E. Feist', 2173, 20);
INSERT INTO `audiobooks` VALUES (21, 'Blood Song', 'Anthony Ryan', 1385, 21);
INSERT INTO `audiobooks` VALUES (22, 'Half a King', 'Joe Abercrombie', 565, 22);
INSERT INTO `audiobooks` VALUES (23, 'Prince of Thorns: Broken Empire', 'Mark Lawrence', 537, 23);
INSERT INTO `audiobooks` VALUES (24, 'The Immortal Prince: Tide Lords', 'Jennifer Fallon', 1164, 24);
INSERT INTO `audiobooks` VALUES (25, 'Medalon: Demon Child', 'Jennifer Fallon', 1039, 25);
INSERT INTO `audiobooks` VALUES (26, 'The Black Company: Chronicles of The Black Company', 'Glen Cook', 654, 26);

-- ----------------------------
-- Table structure for continent
-- ----------------------------
DROP TABLE IF EXISTS `continent`;
CREATE TABLE `continent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of continent
-- ----------------------------
INSERT INTO `continent` VALUES (1, 'Africa');
INSERT INTO `continent` VALUES (2, 'Asia');
INSERT INTO `continent` VALUES (3, 'Europe');
INSERT INTO `continent` VALUES (4, 'N. America');
INSERT INTO `continent` VALUES (5, 'Oceania');
INSERT INTO `continent` VALUES (6, 'S. America');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continent` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `continent`(`continent` ASC) USING BTREE,
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`continent`) REFERENCES `continent` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES (1, 'Algeria', 1);
INSERT INTO `country` VALUES (2, 'Angola', 1);
INSERT INTO `country` VALUES (3, 'Benin', 1);
INSERT INTO `country` VALUES (4, 'Botswana', 1);
INSERT INTO `country` VALUES (5, 'Burkina', 1);
INSERT INTO `country` VALUES (6, 'Burundi', 1);
INSERT INTO `country` VALUES (7, 'Cameroon', 1);
INSERT INTO `country` VALUES (8, 'Cape Verde', 1);
INSERT INTO `country` VALUES (9, 'Central African Republic', 1);
INSERT INTO `country` VALUES (10, 'Chad', 1);
INSERT INTO `country` VALUES (11, 'Comoros', 1);
INSERT INTO `country` VALUES (12, 'Congo', 1);
INSERT INTO `country` VALUES (13, 'Congo, Democratic Republic of', 1);
INSERT INTO `country` VALUES (14, 'Djibouti', 1);
INSERT INTO `country` VALUES (15, 'Egypt', 1);
INSERT INTO `country` VALUES (16, 'Equatorial Guinea', 1);
INSERT INTO `country` VALUES (17, 'Eritrea', 1);
INSERT INTO `country` VALUES (18, 'Ethiopia', 1);
INSERT INTO `country` VALUES (19, 'Gabon', 1);
INSERT INTO `country` VALUES (20, 'Gambia', 1);
INSERT INTO `country` VALUES (21, 'Ghana', 1);
INSERT INTO `country` VALUES (22, 'Guinea', 1);
INSERT INTO `country` VALUES (23, 'Guinea-Bissau', 1);
INSERT INTO `country` VALUES (24, 'Ivory Coast', 1);
INSERT INTO `country` VALUES (25, 'Kenya', 1);
INSERT INTO `country` VALUES (26, 'Lesotho', 1);
INSERT INTO `country` VALUES (27, 'Liberia', 1);
INSERT INTO `country` VALUES (28, 'Libya', 1);
INSERT INTO `country` VALUES (29, 'Madagascar', 1);
INSERT INTO `country` VALUES (30, 'Malawi', 1);
INSERT INTO `country` VALUES (31, 'Mali', 1);
INSERT INTO `country` VALUES (32, 'Mauritania', 1);
INSERT INTO `country` VALUES (33, 'Mauritius', 1);
INSERT INTO `country` VALUES (34, 'Morocco', 1);
INSERT INTO `country` VALUES (35, 'Mozambique', 1);
INSERT INTO `country` VALUES (36, 'Namibia', 1);
INSERT INTO `country` VALUES (37, 'Niger', 1);
INSERT INTO `country` VALUES (38, 'Nigeria', 1);
INSERT INTO `country` VALUES (39, 'Rwanda', 1);
INSERT INTO `country` VALUES (40, 'Sao Tome and Principe', 1);
INSERT INTO `country` VALUES (41, 'Senegal', 1);
INSERT INTO `country` VALUES (42, 'Seychelles', 1);
INSERT INTO `country` VALUES (43, 'Sierra Leone', 1);
INSERT INTO `country` VALUES (44, 'Somalia', 1);
INSERT INTO `country` VALUES (45, 'South Africa', 1);
INSERT INTO `country` VALUES (46, 'South Sudan', 1);
INSERT INTO `country` VALUES (47, 'Sudan', 1);
INSERT INTO `country` VALUES (48, 'Swaziland', 1);
INSERT INTO `country` VALUES (49, 'Tanzania', 1);
INSERT INTO `country` VALUES (50, 'Togo', 1);
INSERT INTO `country` VALUES (51, 'Tunisia', 1);
INSERT INTO `country` VALUES (52, 'Uganda', 1);
INSERT INTO `country` VALUES (53, 'Zambia', 1);
INSERT INTO `country` VALUES (54, 'Zimbabwe', 1);
INSERT INTO `country` VALUES (55, 'Afghanistan', 2);
INSERT INTO `country` VALUES (56, 'Bahrain', 2);
INSERT INTO `country` VALUES (57, 'Bangladesh', 2);
INSERT INTO `country` VALUES (58, 'Bhutan', 2);
INSERT INTO `country` VALUES (59, 'Brunei', 2);
INSERT INTO `country` VALUES (60, 'Burma (Myanmar)', 2);
INSERT INTO `country` VALUES (61, 'Cambodia', 2);
INSERT INTO `country` VALUES (62, 'China', 2);
INSERT INTO `country` VALUES (63, 'East Timor', 2);
INSERT INTO `country` VALUES (64, 'India', 2);
INSERT INTO `country` VALUES (65, 'Indonesia', 2);
INSERT INTO `country` VALUES (66, 'Iran', 2);
INSERT INTO `country` VALUES (67, 'Iraq', 2);
INSERT INTO `country` VALUES (68, 'Israel', 2);
INSERT INTO `country` VALUES (69, 'Japan', 2);
INSERT INTO `country` VALUES (70, 'Jordan', 2);
INSERT INTO `country` VALUES (71, 'Kazakhstan', 2);
INSERT INTO `country` VALUES (72, 'Korea, North', 2);
INSERT INTO `country` VALUES (73, 'Korea, South', 2);
INSERT INTO `country` VALUES (74, 'Kuwait', 2);
INSERT INTO `country` VALUES (75, 'Kyrgyzstan', 2);
INSERT INTO `country` VALUES (76, 'Laos', 2);
INSERT INTO `country` VALUES (77, 'Lebanon', 2);
INSERT INTO `country` VALUES (78, 'Malaysia', 2);
INSERT INTO `country` VALUES (79, 'Maldives', 2);
INSERT INTO `country` VALUES (80, 'Mongolia', 2);
INSERT INTO `country` VALUES (81, 'Nepal', 2);
INSERT INTO `country` VALUES (82, 'Oman', 2);
INSERT INTO `country` VALUES (83, 'Pakistan', 2);
INSERT INTO `country` VALUES (84, 'Philippines', 2);
INSERT INTO `country` VALUES (85, 'Qatar', 2);
INSERT INTO `country` VALUES (86, 'Russian Federation', 2);
INSERT INTO `country` VALUES (87, 'Saudi Arabia', 2);
INSERT INTO `country` VALUES (88, 'Singapore', 2);
INSERT INTO `country` VALUES (89, 'Sri Lanka', 2);
INSERT INTO `country` VALUES (90, 'Syria', 2);
INSERT INTO `country` VALUES (91, 'Tajikistan', 2);
INSERT INTO `country` VALUES (92, 'Thailand', 2);
INSERT INTO `country` VALUES (93, 'Turkey', 2);
INSERT INTO `country` VALUES (94, 'Turkmenistan', 2);
INSERT INTO `country` VALUES (95, 'United Arab Emirates', 2);
INSERT INTO `country` VALUES (96, 'Uzbekistan', 2);
INSERT INTO `country` VALUES (97, 'Vietnam', 2);
INSERT INTO `country` VALUES (98, 'Yemen', 2);
INSERT INTO `country` VALUES (99, 'Albania', 3);
INSERT INTO `country` VALUES (100, 'Andorra', 3);
INSERT INTO `country` VALUES (101, 'Armenia', 3);
INSERT INTO `country` VALUES (102, 'Austria', 3);
INSERT INTO `country` VALUES (103, 'Azerbaijan', 3);
INSERT INTO `country` VALUES (104, 'Belarus', 3);
INSERT INTO `country` VALUES (105, 'Belgium', 3);
INSERT INTO `country` VALUES (106, 'Bosnia and Herzegovina', 3);
INSERT INTO `country` VALUES (107, 'Bulgaria', 3);
INSERT INTO `country` VALUES (108, 'Croatia', 3);
INSERT INTO `country` VALUES (109, 'Cyprus', 3);
INSERT INTO `country` VALUES (110, 'Czech Republic', 3);
INSERT INTO `country` VALUES (111, 'Denmark', 3);
INSERT INTO `country` VALUES (112, 'Estonia', 3);
INSERT INTO `country` VALUES (113, 'Finland', 3);
INSERT INTO `country` VALUES (114, 'France', 3);
INSERT INTO `country` VALUES (115, 'Georgia', 3);
INSERT INTO `country` VALUES (116, 'Germany', 3);
INSERT INTO `country` VALUES (117, 'Greece', 3);
INSERT INTO `country` VALUES (118, 'Hungary', 3);
INSERT INTO `country` VALUES (119, 'Iceland', 3);
INSERT INTO `country` VALUES (120, 'Ireland', 3);
INSERT INTO `country` VALUES (121, 'Italy', 3);
INSERT INTO `country` VALUES (122, 'Latvia', 3);
INSERT INTO `country` VALUES (123, 'Liechtenstein', 3);
INSERT INTO `country` VALUES (124, 'Lithuania', 3);
INSERT INTO `country` VALUES (125, 'Luxembourg', 3);
INSERT INTO `country` VALUES (126, 'Macedonia', 3);
INSERT INTO `country` VALUES (127, 'Malta', 3);
INSERT INTO `country` VALUES (128, 'Moldova', 3);
INSERT INTO `country` VALUES (129, 'Monaco', 3);
INSERT INTO `country` VALUES (130, 'Montenegro', 3);
INSERT INTO `country` VALUES (131, 'Netherlands', 3);
INSERT INTO `country` VALUES (132, 'Norway', 3);
INSERT INTO `country` VALUES (133, 'Poland', 3);
INSERT INTO `country` VALUES (134, 'Portugal', 3);
INSERT INTO `country` VALUES (135, 'Romania', 3);
INSERT INTO `country` VALUES (136, 'San Marino', 3);
INSERT INTO `country` VALUES (137, 'Serbia', 3);
INSERT INTO `country` VALUES (138, 'Slovakia', 3);
INSERT INTO `country` VALUES (139, 'Slovenia', 3);
INSERT INTO `country` VALUES (140, 'Spain', 3);
INSERT INTO `country` VALUES (141, 'Sweden', 3);
INSERT INTO `country` VALUES (142, 'Switzerland', 3);
INSERT INTO `country` VALUES (143, 'Ukraine', 3);
INSERT INTO `country` VALUES (144, 'United Kingdom', 3);
INSERT INTO `country` VALUES (145, 'Vatican City', 3);
INSERT INTO `country` VALUES (146, 'Antigua and Barbuda', 4);
INSERT INTO `country` VALUES (147, 'Bahamas', 4);
INSERT INTO `country` VALUES (148, 'Barbados', 4);
INSERT INTO `country` VALUES (149, 'Belize', 4);
INSERT INTO `country` VALUES (150, 'Canada', 4);
INSERT INTO `country` VALUES (151, 'Costa Rica', 4);
INSERT INTO `country` VALUES (152, 'Cuba', 4);
INSERT INTO `country` VALUES (153, 'Dominica', 4);
INSERT INTO `country` VALUES (154, 'Dominican Republic', 4);
INSERT INTO `country` VALUES (155, 'El Salvador', 4);
INSERT INTO `country` VALUES (156, 'Grenada', 4);
INSERT INTO `country` VALUES (157, 'Guatemala', 4);
INSERT INTO `country` VALUES (158, 'Haiti', 4);
INSERT INTO `country` VALUES (159, 'Honduras', 4);
INSERT INTO `country` VALUES (160, 'Jamaica', 4);
INSERT INTO `country` VALUES (161, 'Mexico', 4);
INSERT INTO `country` VALUES (162, 'Nicaragua', 4);
INSERT INTO `country` VALUES (163, 'Panama', 4);
INSERT INTO `country` VALUES (164, 'Saint Kitts and Nevis', 4);
INSERT INTO `country` VALUES (165, 'Saint Lucia', 4);
INSERT INTO `country` VALUES (166, 'Saint Vincent and the Grenadines', 4);
INSERT INTO `country` VALUES (167, 'Trinidad and Tobago', 4);
INSERT INTO `country` VALUES (168, 'United States', 4);
INSERT INTO `country` VALUES (169, 'Australia', 5);
INSERT INTO `country` VALUES (170, 'Fiji', 5);
INSERT INTO `country` VALUES (171, 'Kiribati', 5);
INSERT INTO `country` VALUES (172, 'Marshall Islands', 5);
INSERT INTO `country` VALUES (173, 'Micronesia', 5);
INSERT INTO `country` VALUES (174, 'Nauru', 5);
INSERT INTO `country` VALUES (175, 'New Zealand', 5);
INSERT INTO `country` VALUES (176, 'Palau', 5);
INSERT INTO `country` VALUES (177, 'Papua New Guinea', 5);
INSERT INTO `country` VALUES (178, 'Samoa', 5);
INSERT INTO `country` VALUES (179, 'Solomon Islands', 5);
INSERT INTO `country` VALUES (180, 'Tonga', 5);
INSERT INTO `country` VALUES (181, 'Tuvalu', 5);
INSERT INTO `country` VALUES (182, 'Vanuatu', 5);
INSERT INTO `country` VALUES (183, 'Argentina', 6);
INSERT INTO `country` VALUES (184, 'Bolivia', 6);
INSERT INTO `country` VALUES (185, 'Brazil', 6);
INSERT INTO `country` VALUES (186, 'Chile', 6);
INSERT INTO `country` VALUES (187, 'Colombia', 6);
INSERT INTO `country` VALUES (188, 'Ecuador', 6);
INSERT INTO `country` VALUES (189, 'Guyana', 6);
INSERT INTO `country` VALUES (190, 'Paraguay', 6);
INSERT INTO `country` VALUES (191, 'Peru', 6);
INSERT INTO `country` VALUES (192, 'Suriname', 6);
INSERT INTO `country` VALUES (193, 'Uruguay', 6);
INSERT INTO `country` VALUES (194, 'Venezuela', 6);

-- ----------------------------
-- Table structure for datatables_demo
-- ----------------------------
DROP TABLE IF EXISTS `datatables_demo`;
CREATE TABLE `datatables_demo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `office` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `start_date` datetime NULL DEFAULT NULL,
  `age` int(8) NULL DEFAULT NULL,
  `salary` int(8) NULL DEFAULT NULL,
  `seq` int(8) NULL DEFAULT NULL,
  `extn` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `seq`(`seq` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of datatables_demo
-- ----------------------------
INSERT INTO `datatables_demo` VALUES (1, 'Tiger', 'Nixon', 'System Architect', 't.nixon@datatables.net', 'Edinburgh', '2011-04-25 00:00:00', 61, 320800, 2, '5421');
INSERT INTO `datatables_demo` VALUES (2, 'Garrett', 'Winters', 'Accountant', 'g.winters@datatables.net', 'Tokyo', '2011-07-25 00:00:00', 63, 170750, 22, '8422');
INSERT INTO `datatables_demo` VALUES (3, 'Ashton', 'Cox', 'Junior Technical Author', 'a.cox@datatables.net', 'San Francisco', '2009-01-12 00:00:00', 66, 86000, 6, '1562');
INSERT INTO `datatables_demo` VALUES (4, 'Cedric', 'Kelly', 'Senior Javascript Developer', 'c.kelly@datatables.net', 'Edinburgh', '2012-03-29 00:00:00', 22, 433060, 41, '6224');
INSERT INTO `datatables_demo` VALUES (5, 'denis', 'ungarov', 'businessman', 'a.satou@datatables.net', 'New York', '2008-11-28 00:00:00', 33, 2147483647, 55, '5407');
INSERT INTO `datatables_demo` VALUES (6, 'Brielle', 'Williamson', 'Integration Specialist', 'b.williamson@datatables.net', 'New York', '2012-12-02 00:00:00', 61, 372000, 21, '4804');
INSERT INTO `datatables_demo` VALUES (7, 'Herrod', 'Chandler', 'Sales Assistant', 'h.chandler@datatables.net', 'San Francisco', '2012-08-06 00:00:00', 59, 137500, 46, '9608');
INSERT INTO `datatables_demo` VALUES (8, 'Rhona', 'Davidson', 'Integration Specialist', 'r.davidson@datatables.net', 'Tokyo', '2010-10-14 00:00:00', 55, 327900, 50, '6200');
INSERT INTO `datatables_demo` VALUES (9, 'Colleen', 'Hurst', 'Javascript Developer', 'c.hurst@datatables.net', 'San Francisco', '2009-09-15 00:00:00', 39, 205500, 26, '2360');
INSERT INTO `datatables_demo` VALUES (10, 'Sonya', 'Frost', 'Software Engineer', 's.frost@datatables.net', 'Edinburgh', '2008-12-13 00:00:00', 23, 103600, 18, '1667');
INSERT INTO `datatables_demo` VALUES (11, 'Jena', 'Gaines', 'Office Manager', 'j.gaines@datatables.net', 'London', '2008-12-19 00:00:00', 30, 90560, 13, '3814');
INSERT INTO `datatables_demo` VALUES (12, 'Quinn', 'Flynn', 'Support Lead', 'q.flynn@datatables.net', 'Edinburgh', '2013-03-03 00:00:00', 22, 342000, 23, '9497');
INSERT INTO `datatables_demo` VALUES (13, 'Charde', 'Marshall', 'Regional Director', 'c.marshall@datatables.net', 'San Francisco', '2008-10-16 00:00:00', 36, 470600, 14, '6741');
INSERT INTO `datatables_demo` VALUES (14, 'Haley', 'Kennedy', 'Senior Marketing Designer', 'h.kennedy@datatables.net', 'London', '2012-12-18 00:00:00', 43, 313500, 12, '3597');
INSERT INTO `datatables_demo` VALUES (15, 'Tatyana', 'Fitzpatrick', 'Regional Director', 't.fitzpatrick@datatables.net', 'London', '2010-03-17 00:00:00', 19, 385750, 54, '1965');
INSERT INTO `datatables_demo` VALUES (16, 'Michael', 'Silva', 'Marketing Designer', 'm.silva@datatables.net', 'London', '2012-11-27 00:00:00', 66, 198500, 37, '1581');
INSERT INTO `datatables_demo` VALUES (17, 'Paul', 'Byrd', 'Chief Financial Officer (CFO)', 'p.byrd@datatables.net', 'New York', '2010-06-09 00:00:00', 64, 725000, 32, '3059');
INSERT INTO `datatables_demo` VALUES (18, 'Gloria', 'Little', 'Systems Administrator', 'g.little@datatables.net', 'New York', '2009-04-10 00:00:00', 59, 237500, 35, '1721');
INSERT INTO `datatables_demo` VALUES (19, 'Bradley', 'Greer', 'Software Engineer', 'b.greer@datatables.net', 'London', '2012-10-13 00:00:00', 41, 132000, 48, '2558');
INSERT INTO `datatables_demo` VALUES (20, 'Dai', 'Rios', 'Personnel Lead', 'd.rios@datatables.net', 'Edinburgh', '2012-09-26 00:00:00', 35, 217500, 45, '2290');
INSERT INTO `datatables_demo` VALUES (21, 'Jenette', 'Caldwell', 'Development Lead', 'j.caldwell@datatables.net', 'New York', '2011-09-03 00:00:00', 30, 345000, 17, '1937');
INSERT INTO `datatables_demo` VALUES (22, 'Yuri', 'Berry', 'Chief Marketing Officer (CMO)', 'y.berry@datatables.net', 'New York', '2009-06-25 00:00:00', 40, 675000, 57, '6154');
INSERT INTO `datatables_demo` VALUES (23, 'Caesar', 'Vance', 'Pre-Sales Support', 'c.vance@datatables.net', 'New York', '2011-12-12 00:00:00', 21, 106450, 29, '8330');
INSERT INTO `datatables_demo` VALUES (24, 'Doris', 'Wilder', 'Sales Assistant', 'd.wilder@datatables.net', 'Sydney', '2010-09-20 00:00:00', 23, 85600, 56, '3023');
INSERT INTO `datatables_demo` VALUES (25, 'Angelica', 'Ramos', 'Chief Executive Officer (CEO)', 'a.ramos@datatables.net', 'London', '2009-10-09 00:00:00', 47, 1200000, 36, '5797');
INSERT INTO `datatables_demo` VALUES (26, 'Gavin', 'Joyce', 'Developer', 'g.joyce@datatables.net', 'Edinburgh', '2010-12-22 00:00:00', 42, 92575, 5, '8822');
INSERT INTO `datatables_demo` VALUES (27, 'Jennifer', 'Chang', 'Regional Director', 'j.chang@datatables.net', 'Singapore', '2010-11-14 00:00:00', 28, 357650, 51, '9239');
INSERT INTO `datatables_demo` VALUES (28, 'Brenden', 'Wagner', 'Software Engineer', 'b.wagner@datatables.net', 'San Francisco', '2011-06-07 00:00:00', 28, 206850, 20, '1314');
INSERT INTO `datatables_demo` VALUES (29, 'Fiona', 'Green', 'Chief Operating Officer (COO)', 'f.green@datatables.net', 'San Francisco', '2010-03-11 00:00:00', 48, 850000, 7, '2947');
INSERT INTO `datatables_demo` VALUES (30, 'Shou', 'Itou', 'Regional Marketing', 's.itou@datatables.net', 'Tokyo', '2011-08-14 00:00:00', 20, 163000, 1, '8899');
INSERT INTO `datatables_demo` VALUES (31, 'Michelle', 'House', 'Integration Specialist', 'm.house@datatables.net', 'Sydney', '2011-06-02 00:00:00', 37, 95400, 39, '2769');
INSERT INTO `datatables_demo` VALUES (32, 'Suki', 'Burks', 'Developer', 's.burks@datatables.net', 'London', '2009-10-22 00:00:00', 53, 114500, 40, '6832');
INSERT INTO `datatables_demo` VALUES (33, 'Prescott', 'Bartlett', 'Technical Author', 'p.bartlett@datatables.net', 'London', '2011-05-07 00:00:00', 27, 145000, 47, '3606');
INSERT INTO `datatables_demo` VALUES (34, 'Gavin', 'Cortez', 'Team Leader', 'g.cortez@datatables.net', 'San Francisco', '2008-10-26 00:00:00', 22, 235500, 52, '2860');
INSERT INTO `datatables_demo` VALUES (35, 'Martena', 'Mccray', 'Post-Sales support', 'm.mccray@datatables.net', 'Edinburgh', '2011-03-09 00:00:00', 46, 324050, 8, '8240');
INSERT INTO `datatables_demo` VALUES (36, 'Unity', 'Butler', 'Marketing Designer', 'u.butler@datatables.net', 'San Francisco', '2009-12-09 00:00:00', 47, 85675, 24, '5384');
INSERT INTO `datatables_demo` VALUES (37, 'Howard', 'Hatfield', 'Office Manager', 'h.hatfield@datatables.net', 'San Francisco', '2008-12-16 00:00:00', 51, 164500, 38, '7031');
INSERT INTO `datatables_demo` VALUES (38, 'Hope', 'Fuentes', 'Secretary', 'h.fuentes@datatables.net', 'San Francisco', '2010-02-12 00:00:00', 41, 109850, 53, '6318');
INSERT INTO `datatables_demo` VALUES (39, 'Vivian', 'Harrell', 'Financial Controller', 'v.harrell@datatables.net', 'San Francisco', '2009-02-14 00:00:00', 62, 452500, 30, '9422');
INSERT INTO `datatables_demo` VALUES (40, 'Timothy', 'Mooney', 'Office Manager', 't.mooney@datatables.net', 'London', '2008-12-11 00:00:00', 37, 136200, 28, '7580');
INSERT INTO `datatables_demo` VALUES (41, 'Jackson', 'Bradshaw', 'Director', 'j.bradshaw@datatables.net', 'New York', '2008-09-26 00:00:00', 65, 645750, 34, '1042');
INSERT INTO `datatables_demo` VALUES (42, 'Olivia', 'Liang', 'Support Engineer', 'o.liang@datatables.net', 'Singapore', '2011-02-03 00:00:00', 64, 234500, 4, '2120');
INSERT INTO `datatables_demo` VALUES (43, 'Bruno', 'Nash', 'Software Engineer', 'b.nash@datatables.net', 'London', '2011-05-03 00:00:00', 38, 163500, 3, '6222');
INSERT INTO `datatables_demo` VALUES (44, 'Sakura', 'Yamamoto', 'Support Engineer', 's.yamamoto@datatables.net', 'Tokyo', '2009-08-19 00:00:00', 37, 139575, 31, '9383');
INSERT INTO `datatables_demo` VALUES (45, 'Thor', 'Walton', 'Developer', 't.walton@datatables.net', 'New York', '2013-08-11 00:00:00', 61, 98540, 11, '8327');
INSERT INTO `datatables_demo` VALUES (46, 'Finn', 'Camacho', 'Support Engineer', 'f.camacho@datatables.net', 'San Francisco', '2009-07-07 00:00:00', 47, 87500, 10, '2927');
INSERT INTO `datatables_demo` VALUES (47, 'Serge', 'Baldwin', 'Data Coordinator', 's.baldwin@datatables.net', 'Singapore', '2012-04-09 00:00:00', 64, 138575, 44, '8352');
INSERT INTO `datatables_demo` VALUES (48, 'Zenaida', 'Frank', 'Software Engineer', 'z.frank@datatables.net', 'New York', '2010-01-04 00:00:00', 63, 125250, 42, '7439');
INSERT INTO `datatables_demo` VALUES (49, 'Zorita', 'Serrano', 'Software Engineer', 'z.serrano@datatables.net', 'San Francisco', '2012-06-01 00:00:00', 56, 115000, 27, '4389');
INSERT INTO `datatables_demo` VALUES (50, 'Jennifer', 'Acosta', 'Junior Javascript Developer', 'j.acosta@datatables.net', 'Edinburgh', '2013-02-01 00:00:00', 43, 75650, 49, '3431');
INSERT INTO `datatables_demo` VALUES (51, 'Cara', 'Stevens', 'Sales Assistant', 'c.stevens@datatables.net', 'New York', '2011-12-06 00:00:00', 46, 145600, 15, '3990');
INSERT INTO `datatables_demo` VALUES (52, 'Hermione', 'Butler', 'Regional Director', 'h.butler@datatables.net', 'London', '2011-03-21 00:00:00', 47, 356250, 9, '1016');
INSERT INTO `datatables_demo` VALUES (53, 'Lael', 'Greer', 'Systems Administrator', 'l.greer@datatables.net', 'London', '2009-02-27 00:00:00', 21, 103500, 25, '6733');
INSERT INTO `datatables_demo` VALUES (54, 'Jonas', 'Alexander', 'Developer', 'j.alexander@datatables.net', 'San Francisco', '2010-07-14 00:00:00', 30, 86500, 33, '8196');
INSERT INTO `datatables_demo` VALUES (55, 'Shad', 'Decker', 'Regional Director', 's.decker@datatables.net', 'Edinburgh', '2008-11-13 00:00:00', 51, 183000, 43, '6373');
INSERT INTO `datatables_demo` VALUES (56, 'Michael', 'Bruce', 'Javascript Developer', 'm.bruce@datatables.net', 'Singapore', '2011-06-27 00:00:00', 29, 183000, 16, '5384');
INSERT INTO `datatables_demo` VALUES (57, 'Donna', 'Snider', 'Customer Support', 'd.snider@datatables.net', 'New York', '2011-01-25 00:00:00', 27, 112000, 19, '4226');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, 'IT');
INSERT INTO `dept` VALUES (2, 'Sales');
INSERT INTO `dept` VALUES (3, 'Pre-Sales');
INSERT INTO `dept` VALUES (4, 'Marketing');
INSERT INTO `dept` VALUES (5, 'Senior Management');
INSERT INTO `dept` VALUES (6, 'Accounts');
INSERT INTO `dept` VALUES (7, 'Support');

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT 0,
  `web_path` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `system_path` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `test` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of files
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'Printer');
INSERT INTO `permission` VALUES (2, 'Servers');
INSERT INTO `permission` VALUES (3, 'Desktop');
INSERT INTO `permission` VALUES (4, 'VMs');
INSERT INTO `permission` VALUES (5, 'Web-site');
INSERT INTO `permission` VALUES (6, 'Accounts');

-- ----------------------------
-- Table structure for sites
-- ----------------------------
DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `continent` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sites
-- ----------------------------
INSERT INTO `sites` VALUES (1, 'Edinburgh', 'Europe');
INSERT INTO `sites` VALUES (2, 'London', 'Europe');
INSERT INTO `sites` VALUES (3, 'Paris', 'Europe');
INSERT INTO `sites` VALUES (4, 'New York', 'North America');
INSERT INTO `sites` VALUES (5, 'Singapore', 'Asia');
INSERT INTO `sites` VALUES (6, 'Los Angeles', 'North America');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continent` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `continent`(`continent` ASC) USING BTREE,
  INDEX `country`(`country` ASC) USING BTREE,
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`continent`) REFERENCES `continent` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `team_ibfk_2` FOREIGN KEY (`country`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, 'Caesar Vance', 4, 168);
INSERT INTO `team` VALUES (2, 'Cara Stevens', 4, 168);
INSERT INTO `team` VALUES (3, 'Doris Wilder', 5, 169);
INSERT INTO `team` VALUES (4, 'Herrod Chandler', 4, 168);
INSERT INTO `team` VALUES (5, 'Martena Mccray', 3, 144);

-- ----------------------------
-- Table structure for todo
-- ----------------------------
DROP TABLE IF EXISTS `todo`;
CREATE TABLE `todo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `done` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of todo
-- ----------------------------
INSERT INTO `todo` VALUES (1, 'Send business plan to clients', 1, 1);
INSERT INTO `todo` VALUES (2, 'Web-site copy revisions', 0, 2);
INSERT INTO `todo` VALUES (3, 'Review client tracking', 0, 2);
INSERT INTO `todo` VALUES (4, 'E-mail catchup', 0, 3);
INSERT INTO `todo` VALUES (5, 'Complete worksheet', 0, 4);
INSERT INTO `todo` VALUES (6, 'Prep sales presentation', 0, 5);

-- ----------------------------
-- Table structure for user_dept
-- ----------------------------
DROP TABLE IF EXISTS `user_dept`;
CREATE TABLE `user_dept`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `dept_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `dept_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `dept_id`(`dept_id` ASC) USING BTREE,
  CONSTRAINT `user_dept_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_dept_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_dept
-- ----------------------------
INSERT INTO `user_dept` VALUES (1, 1);
INSERT INTO `user_dept` VALUES (2, 4);
INSERT INTO `user_dept` VALUES (3, 7);
INSERT INTO `user_dept` VALUES (4, 3);
INSERT INTO `user_dept` VALUES (5, 2);
INSERT INTO `user_dept` VALUES (6, 6);
INSERT INTO `user_dept` VALUES (7, 2);
INSERT INTO `user_dept` VALUES (8, 1);
INSERT INTO `user_dept` VALUES (9, 2);
INSERT INTO `user_dept` VALUES (10, 3);
INSERT INTO `user_dept` VALUES (11, 4);
INSERT INTO `user_dept` VALUES (12, 5);
INSERT INTO `user_dept` VALUES (13, 6);
INSERT INTO `user_dept` VALUES (14, 4);
INSERT INTO `user_dept` VALUES (15, 3);
INSERT INTO `user_dept` VALUES (16, 6);
INSERT INTO `user_dept` VALUES (17, 3);
INSERT INTO `user_dept` VALUES (18, 7);
INSERT INTO `user_dept` VALUES (19, 7);
INSERT INTO `user_dept` VALUES (20, 1);
INSERT INTO `user_dept` VALUES (21, 2);
INSERT INTO `user_dept` VALUES (22, 6);
INSERT INTO `user_dept` VALUES (23, 3);
INSERT INTO `user_dept` VALUES (24, 4);
INSERT INTO `user_dept` VALUES (25, 5);
INSERT INTO `user_dept` VALUES (26, 6);
INSERT INTO `user_dept` VALUES (27, 7);
INSERT INTO `user_dept` VALUES (28, 2);
INSERT INTO `user_dept` VALUES (29, 3);
INSERT INTO `user_dept` VALUES (30, 1);
INSERT INTO `user_dept` VALUES (31, 3);
INSERT INTO `user_dept` VALUES (32, 4);
INSERT INTO `user_dept` VALUES (33, 6);
INSERT INTO `user_dept` VALUES (34, 7);
INSERT INTO `user_dept` VALUES (35, 2);
INSERT INTO `user_dept` VALUES (36, 3);

-- ----------------------------
-- Table structure for user_permission
-- ----------------------------
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission`  (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `permission_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `permission_id`) USING BTREE,
  INDEX `permission_id`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `user_permission_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_permission
-- ----------------------------
INSERT INTO `user_permission` VALUES (1, 1);
INSERT INTO `user_permission` VALUES (2, 1);
INSERT INTO `user_permission` VALUES (8, 1);
INSERT INTO `user_permission` VALUES (10, 1);
INSERT INTO `user_permission` VALUES (12, 1);
INSERT INTO `user_permission` VALUES (13, 1);
INSERT INTO `user_permission` VALUES (18, 1);
INSERT INTO `user_permission` VALUES (20, 1);
INSERT INTO `user_permission` VALUES (30, 1);
INSERT INTO `user_permission` VALUES (34, 1);
INSERT INTO `user_permission` VALUES (5, 2);
INSERT INTO `user_permission` VALUES (7, 2);
INSERT INTO `user_permission` VALUES (9, 2);
INSERT INTO `user_permission` VALUES (10, 2);
INSERT INTO `user_permission` VALUES (12, 2);
INSERT INTO `user_permission` VALUES (13, 2);
INSERT INTO `user_permission` VALUES (18, 2);
INSERT INTO `user_permission` VALUES (20, 2);
INSERT INTO `user_permission` VALUES (21, 2);
INSERT INTO `user_permission` VALUES (22, 2);
INSERT INTO `user_permission` VALUES (34, 2);
INSERT INTO `user_permission` VALUES (35, 2);
INSERT INTO `user_permission` VALUES (1, 3);
INSERT INTO `user_permission` VALUES (4, 3);
INSERT INTO `user_permission` VALUES (10, 3);
INSERT INTO `user_permission` VALUES (13, 3);
INSERT INTO `user_permission` VALUES (18, 3);
INSERT INTO `user_permission` VALUES (20, 3);
INSERT INTO `user_permission` VALUES (22, 3);
INSERT INTO `user_permission` VALUES (30, 3);
INSERT INTO `user_permission` VALUES (31, 3);
INSERT INTO `user_permission` VALUES (34, 3);
INSERT INTO `user_permission` VALUES (36, 3);
INSERT INTO `user_permission` VALUES (1, 4);
INSERT INTO `user_permission` VALUES (2, 4);
INSERT INTO `user_permission` VALUES (4, 4);
INSERT INTO `user_permission` VALUES (11, 4);
INSERT INTO `user_permission` VALUES (21, 4);
INSERT INTO `user_permission` VALUES (32, 4);
INSERT INTO `user_permission` VALUES (4, 5);
INSERT INTO `user_permission` VALUES (12, 5);
INSERT INTO `user_permission` VALUES (30, 5);
INSERT INTO `user_permission` VALUES (4, 6);
INSERT INTO `user_permission` VALUES (6, 6);
INSERT INTO `user_permission` VALUES (11, 6);
INSERT INTO `user_permission` VALUES (13, 6);
INSERT INTO `user_permission` VALUES (22, 6);
INSERT INTO `user_permission` VALUES (33, 6);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `updated_date` datetime NULL DEFAULT NULL,
  `registered_date` datetime NULL DEFAULT NULL,
  `removed_date` datetime NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `manager` int(11) NULL DEFAULT NULL,
  `site` int(11) NULL DEFAULT NULL,
  `image` int(11) NULL DEFAULT NULL,
  `shift_start` time NULL DEFAULT NULL,
  `shift_end` time NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Miss', 'Quynn', 'Contreras', '1-971-977-4681', 'Slidell', '81080', '2022-12-13 17:42:53', '2012-04-06 18:53:00', NULL, 0, 1, 1, NULL, '08:00:00', '16:00:00', NULL);
INSERT INTO `users` VALUES (2, 'Mr', 'Kaitlin', 'Smith', '1-436-523-6103', 'Orlando', 'U5G 7J3', '2022-12-13 17:42:53', '2012-11-20 05:58:25', NULL, 1, 1, 2, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (3, 'Mrs', 'Cruz', 'Reynolds', '1-776-102-6352', 'Lynn', 'EJ89 9DQ', '2022-12-13 17:42:53', '2011-12-31 23:34:03', NULL, 0, 2, 3, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (4, 'Dr', 'Sophia', 'Morris', '1-463-224-1405', 'Belleville', 'T1F 2X1', '2022-12-13 17:42:53', '2012-08-04 02:55:53', NULL, 0, 3, 4, NULL, '08:00:00', '15:30:00', NULL);
INSERT INTO `users` VALUES (5, 'Miss', 'Kamal', 'Roberson', '1-134-408-5227', 'Rehoboth Beach', 'V7I 6T5', '2022-12-13 17:42:53', '2012-12-23 00:17:03', NULL, 1, 1, 5, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (6, 'Dr', 'Dustin', 'Rosa', '1-875-919-3188', 'Jersey City', 'E4 8ZE', '2022-12-13 17:42:53', '2012-10-05 22:18:59', NULL, 0, 1, 6, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (7, 'Dr', 'Xantha', 'George', '1-106-884-4754', 'Billings', 'Y2I 6J7', '2022-12-13 17:42:53', '2012-11-25 12:50:16', NULL, 0, 6, 1, NULL, '07:00:00', '15:00:00', NULL);
INSERT INTO `users` VALUES (8, 'Mrs', 'Bryar', 'Long', '1-918-114-8083', 'San Bernardino', '82983', '2022-12-13 17:42:53', '2012-05-14 23:32:25', NULL, 0, 1, 2, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (9, 'Mrs', 'Kuame', 'Wynn', '1-101-692-4039', 'Truth or Consequences', '21290', '2022-12-13 17:42:53', '2011-06-21 16:27:07', NULL, 1, 2, 3, NULL, '06:00:00', '14:00:00', NULL);
INSERT INTO `users` VALUES (10, 'Ms', 'Indigo', 'Brennan', '1-756-756-8161', 'Moline', 'NO8 3UY', '2022-12-13 17:42:53', '2011-02-19 12:51:08', NULL, 1, 5, 4, NULL, '12:00:00', '00:00:00', NULL);
INSERT INTO `users` VALUES (11, 'Mrs', 'Avram', 'Allison', '1-751-507-2640', 'Rancho Palos Verdes', 'I7Q 8H4', '2022-12-13 17:42:53', '2012-12-30 17:02:10', NULL, 0, 1, 5, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (12, 'Mr', 'Martha', 'Burgess', '1-971-722-1203', 'Toledo', 'Q5R 9HI', '2022-12-13 17:42:53', '2011-02-04 17:25:55', NULL, 1, 1, 6, NULL, '12:00:00', '00:00:00', NULL);
INSERT INTO `users` VALUES (13, 'Miss', 'Lael', 'Kim', '1-626-697-2194', 'Lake Charles', '34209', '2022-12-13 17:42:53', '2012-07-24 06:44:22', NULL, 1, 7, 1, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (14, 'Dr', 'Lyle', 'Lewis', '1-231-793-3520', 'Simi Valley', 'H9B 2H4', '2022-12-13 17:42:53', '2012-08-30 03:28:54', NULL, 0, 1, 2, NULL, '00:00:00', '12:00:00', NULL);
INSERT INTO `users` VALUES (15, 'Miss', 'Veronica', 'Marks', '1-750-981-6759', 'Glens Falls', 'E3C 5D1', '2022-12-13 17:42:53', '2012-08-14 12:09:24', NULL, 1, 2, 3, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (16, 'Mrs', 'Wynne', 'Ruiz', '1-983-744-5362', 'Branson', 'L9E 6E2', '2022-12-13 17:42:53', '2012-11-06 01:04:07', NULL, 0, 1, 4, NULL, '12:00:00', '00:00:00', NULL);
INSERT INTO `users` VALUES (17, 'Ms', 'Jessica', 'Bryan', '1-949-932-6772', 'Boulder City', 'F5P 6NU', '2022-12-13 17:42:53', '2013-02-01 20:22:33', NULL, 0, 5, 5, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (18, 'Ms', 'Quinlan', 'Hyde', '1-625-664-6072', 'Sheridan', 'Y8A 1LQ', '2022-12-13 17:42:53', '2011-10-25 16:53:45', NULL, 1, 1, 6, NULL, '08:00:00', '15:00:00', NULL);
INSERT INTO `users` VALUES (19, 'Miss', 'Mona', 'Terry', '1-443-179-7343', 'Juneau', 'G62 1OF', '2022-12-13 17:42:53', '2012-01-15 09:26:59', NULL, 0, 1, 1, NULL, '08:30:00', '16:30:00', NULL);
INSERT INTO `users` VALUES (20, 'Mrs', 'Medge', 'Patterson', '1-636-979-0497', 'Texarkana', 'I5U 6E0', '2022-12-13 17:42:53', '2012-10-20 16:26:18', NULL, 1, 1, 2, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (21, 'Mrs', 'Perry', 'Gamble', '1-440-976-9560', 'Arcadia', '98923', '2022-12-13 17:42:53', '2012-06-06 02:03:49', NULL, 1, 2, 3, NULL, '00:00:00', '12:00:00', NULL);
INSERT INTO `users` VALUES (22, 'Mrs', 'Pandora', 'Armstrong', '1-197-431-4390', 'Glendora', '34124', '2022-12-13 17:42:53', '2011-08-29 01:45:06', NULL, 0, 7, 4, NULL, '21:00:00', '03:00:00', NULL);
INSERT INTO `users` VALUES (23, 'Mr', 'Pandora', 'Briggs', '1-278-288-9221', 'Oneida', 'T9M 4H9', '2022-12-13 17:42:53', '2012-07-16 08:44:41', NULL, 1, 4, 5, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (24, 'Mrs', 'Maris', 'Leblanc', '1-936-114-2921', 'Cohoes', 'V1H 6Z7', '2022-12-13 17:42:53', '2011-05-04 13:07:04', NULL, 1, 1, 6, NULL, '00:00:00', '12:00:00', NULL);
INSERT INTO `users` VALUES (25, 'Mrs', 'Ishmael', 'Crosby', '1-307-243-2684', 'Midwest City', 'T6 8PS', '2022-12-13 17:42:53', '2011-07-02 23:11:11', NULL, 0, 3, 1, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (26, 'Miss', 'Quintessa', 'Pickett', '1-801-122-7471', 'North Tonawanda', '09166', '2022-12-13 17:42:53', '2013-02-05 10:33:22', NULL, 1, 1, 2, NULL, '12:00:00', '00:00:00', NULL);
INSERT INTO `users` VALUES (27, 'Miss', 'Ifeoma', 'Mays', '1-103-883-0962', 'Parkersburg', '87377', '2022-12-13 17:42:53', '2011-08-22 12:19:09', NULL, 0, 1, 3, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (28, 'Mrs', 'Basia', 'Harrell', '1-528-238-4178', 'Cody', 'LJ54 1IU', '2022-12-13 17:42:53', '2012-05-07 14:42:55', NULL, 1, 1, 4, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (29, 'Mrs', 'Hamilton', 'Blackburn', '1-676-857-1423', 'Delta Junction', 'X5 9HE', '2022-12-13 17:42:53', '2011-05-19 07:39:48', NULL, 0, 6, 5, NULL, '10:00:00', '18:00:00', NULL);
INSERT INTO `users` VALUES (30, 'Ms', 'Dexter', 'Burton', '1-275-332-8186', 'Gainesville', '65914', '2022-12-13 17:42:53', '2013-02-01 16:21:20', NULL, 1, 5, 6, NULL, '21:00:00', '03:00:00', NULL);
INSERT INTO `users` VALUES (31, 'Mrs', 'Quinn', 'Mccall', '1-808-916-4497', 'Fallon', 'X4 8UB', '2022-12-13 17:42:53', '2012-03-24 19:31:51', NULL, 0, 1, 1, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (32, 'Mr', 'Alexa', 'Wilder', '1-727-307-1997', 'Johnson City', '16765', '2022-12-13 17:42:53', '2011-10-14 08:21:14', NULL, 0, 3, 2, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (33, 'Ms', 'Rhonda', 'Harrell', '1-934-906-6474', 'Minnetonka', 'I2R 1H2', '2022-12-13 17:42:53', '2011-11-15 00:08:02', NULL, 1, 1, 3, NULL, '12:00:00', '00:00:00', NULL);
INSERT INTO `users` VALUES (34, 'Mrs', 'Jocelyn', 'England', '1-826-860-7773', 'Chico', '71102', '2022-12-13 17:42:53', '2012-05-31 18:01:43', NULL, 1, 1, 4, NULL, '09:00:00', '17:00:00', NULL);
INSERT INTO `users` VALUES (35, 'Dr', 'Vincent', 'Banks', '1-225-418-0941', 'Palo Alto', '03281', '2022-12-13 17:42:53', '2011-08-07 07:22:43', NULL, 0, 1, 5, NULL, '18:00:00', '02:00:00', NULL);
INSERT INTO `users` VALUES (36, 'Mrs', 'Stewart', 'Chan', '1-781-793-2340', 'Grand Forks', 'L1U 3ED', '2022-12-13 17:42:53', '2012-11-01 23:14:44', NULL, 1, 6, 6, NULL, '08:00:00', '16:00:00', NULL);

-- ----------------------------
-- Table structure for users_files
-- ----------------------------
DROP TABLE IF EXISTS `users_files`;
CREATE TABLE `users_files`  (
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_files
-- ----------------------------

-- ----------------------------
-- Table structure for users_visits
-- ----------------------------
DROP TABLE IF EXISTS `users_visits`;
CREATE TABLE `users_visits`  (
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `visit_date` date NOT NULL,
  PRIMARY KEY (`user_id`, `visit_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_visits
-- ----------------------------
INSERT INTO `users_visits` VALUES (1, 1, '2016-08-12');
INSERT INTO `users_visits` VALUES (1, 4, '2016-08-14');
INSERT INTO `users_visits` VALUES (1, 7, '2016-08-19');
INSERT INTO `users_visits` VALUES (2, 6, '2016-07-01');
INSERT INTO `users_visits` VALUES (2, 2, '2016-07-07');
INSERT INTO `users_visits` VALUES (2, 3, '2016-07-12');
INSERT INTO `users_visits` VALUES (2, 1, '2016-07-30');
INSERT INTO `users_visits` VALUES (3, 1, '2016-06-26');
INSERT INTO `users_visits` VALUES (3, 2, '2016-12-05');
INSERT INTO `users_visits` VALUES (4, 4, '2016-10-10');
INSERT INTO `users_visits` VALUES (4, 3, '2016-11-21');
INSERT INTO `users_visits` VALUES (5, 5, '2016-08-02');
INSERT INTO `users_visits` VALUES (6, 6, '2016-08-05');

-- ----------------------------
-- View structure for staff_newyork
-- ----------------------------
DROP VIEW IF EXISTS `staff_newyork`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `staff_newyork` AS select `users`.`id` AS `id`,`users`.`first_name` AS `first_name`,`users`.`last_name` AS `last_name`,`users`.`phone` AS `phone`,`users`.`city` AS `city` from `users` where `users`.`site` in (select `sites`.`id` from `sites` where (`sites`.`name` = 'New York'));

-- ----------------------------
-- Triggers structure for table users
-- ----------------------------
DROP TRIGGER IF EXISTS `users_insert`;
delimiter ;;
CREATE TRIGGER `users_insert` BEFORE INSERT ON `users` FOR EACH ROW SET NEW.updated_date = IFNULL(NEW.updated_date, NOW())
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table users
-- ----------------------------
DROP TRIGGER IF EXISTS `users_update`;
delimiter ;;
CREATE TRIGGER `users_update` BEFORE UPDATE ON `users` FOR EACH ROW SET NEW.updated_date = IFNULL(NEW.updated_date, NOW())
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
