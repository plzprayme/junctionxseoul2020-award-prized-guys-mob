-- --------------------------------------------------------
-- 호스트:                          hnu-pioneer.cwbiwxsjbu5c.ap-northeast-2.rds.amazonaws.com
-- 서버 버전:                        10.2.21-MariaDB-log - Source distribution
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- mob 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `mob` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `mob`;

-- 테이블 mob.areas 구조 내보내기
CREATE TABLE IF NOT EXISTS `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `pred_infected` int(11) NOT NULL,
  `susceptible` int(11) NOT NULL,
  `infected` int(11) NOT NULL,
  `site_area` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `vent_rate` int(11) NOT NULL,
  `scale` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 mob.areas:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` (`id`, `name`, `latitude`, `longitude`, `pred_infected`, `susceptible`, `infected`, `site_area`, `duration`, `vent_rate`, `scale`) VALUES
	(1, 'Buckingham Palace, England', '51.5017', '-0.1406', 18, 3366, 10, 8438, 35, 80, 5),
	(2, 'Brandenburger Tor, Germany', '52.5163', '13.3777', 3, 7213, 5, 12817, 51, 100, 5),
	(3, 'St. Perter\'s Basilica, Italy', '41.9022', '12.4539', 25, 4475, 18, 21674, 40, 80, 5),
	(4, 'Piazza San Marco, Italy', '45.4342', '12.3385', 114, 9705, 27, 21257, 59, 60, 5),
	(5, 'Washington, D.C', '38.8944', '-77.0261', 131, 47449, 43, 14496, 131, 50, 5),
	(6, 'Victoria Park, Hong Kong', '22.2823', '114.1887', 72, 14334, 16, 29283, 72, 72, 5),
	(7, 'AT&T Park, San Francisco', '37.7788', '-122.3886', 12, 1727, 11, 10339, 25, 80, 0),
	(8, 'Gwanghwamun, Repulic of Korea', '37.5740', '126.9768', 150, 245054, 9, 19463, 297, 70, 5);
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;

-- 테이블 mob.images 구조 내보내기
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `history` date NOT NULL,
  `image` varchar(150) NOT NULL,
  `is_svg` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 mob.images:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`id`, `area_id`, `history`, `image`, `is_svg`) VALUES
	(1, 1, '1999-09-01', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/1999-9.jpg', 0),
	(2, 1, '2003-12-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/2003-12.jpg', 0),
	(3, 1, '2008-09-22', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/2008-9.jpg', 0),
	(4, 1, '2010-06-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/2010-6.jpg', 0),
	(5, 1, '2013-07-03', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/2013-7.jpg', 0),
	(6, 1, '2017-04-01', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/2017-4.jpg', 0),
	(7, 1, '2018-05-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/2018-5.jpg', 0),
	(8, 1, '2018-05-12', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/2018-55.jpg', 0),
	(9, 1, '2019-06-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/2019-6.jpg', 0),
	(10, 1, '2020-10-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/buckingham_area.svg', 1),
	(11, 2, '2020-10-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/randenburg_area.svg', 1),
	(12, 3, '2020-10-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/victoria_2019-07.svg', 1),
	(13, 4, '2020-10-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/san_marco_2019-9.svg', 1),
	(14, 5, '2020-10-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/wasing_2018-3.svg', 1),
	(15, 6, '2020-10-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/victoria_2019-07_v2.svg', 1),
	(16, 7, '2020-10-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/AT%26T+Park.svg', 1),
	(17, 2, '2010-09-07', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/branden/2010-9.jpg', 0),
	(18, 2, '2012-07-09', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/branden/2012-7.jpg', 0),
	(19, 2, '2014-09-19', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/branden/2014-9.jpg', 0),
	(20, 2, '2015-03-04', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/branden/2015-3.jpg', 0),
	(21, 2, '2016-06-30', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/branden/2016-6.jpg', 0),
	(22, 2, '2017-03-21', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/branden/2017-3.jpg', 0),
	(23, 2, '2019-04-29', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/branden/2019-4.jpg', 0),
	(24, 2, '2019-04-02', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/branden/2019-44.jpg', 0),
	(25, 3, '2013-06-06', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/bedro/2013-6.jpg', 0),
	(26, 3, '2014-10-13', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/bedro/2014-10.jpg', 0),
	(27, 3, '2014-11-26', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/bedro/2014-11.jpg', 0),
	(28, 3, '2015-05-02', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/bedro/2015-5.jpg', 0),
	(29, 3, '2015-07-07', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/bedro/2015-7.jpg', 0),
	(30, 3, '2017-04-22', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/bedro/2017-4.jpg', 0),
	(31, 3, '2018-04-30', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/bedro/2018-4.jpg', 0),
	(32, 3, '2019-07-18', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/bedro/2019-7.jpg', 0),
	(41, 5, '2018-03-28', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/wasington/2018-3.jpg', 0),
	(42, 5, '2017-03-25', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/wasington/2017-3.jpg', 0),
	(43, 6, '2018-10-29', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/hongkong/2018-10.jpg', 0),
	(44, 6, '2017-01-20', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/hongkong/2017-01.jpg', 0),
	(45, 6, '2015-11-15', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/hongkong/2015-11.jpg', 0),
	(48, 6, '2019-07-22', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/hongkong/2019-07.jpg', 0),
	(52, 7, '2018-04-22', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/AT/2018-4.jpg', 0),
	(53, 7, '2018-03-01', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/AT/2018-3.jpg', 0),
	(54, 7, '2017-09-30', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/AT/2017-9.jpg', 0),
	(55, 7, '2016-06-23', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/AT/2016-6.jpg', 0),
	(56, 8, '2020-08-15', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/gwang/2020-07-23.jpg', 0),
	(57, 8, '2020-02-21', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/gwang/2019-02.jpg', 0),
	(58, 8, '2020-04-23', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/gwang/2018-04.jpg', 0),
	(59, 8, '2020-10-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/gwang_2020-07-23_v3.svg', 1),
	(60, 4, '2019-09-01', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/mark/2019-9.jpg', 0),
	(61, 4, '2018-10-11', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/mark/2018-8.jpg', 0),
	(62, 4, '2018-04-25', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/mark/2018-4.jpg', 0),
	(63, 4, '2017-05-21', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/mark/2017-5.jpg', 0),
	(64, 4, '2014-03-22', 'https://award-prized-guys.s3.ap-northeast-2.amazonaws.com/satellite-images/mark/2014-3.jpg', 0);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
