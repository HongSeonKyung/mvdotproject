-- MySQL dump 10.13  Distrib 5.5.27, for Win64 (x86)
--
-- Host: localhost    Database: mvdot
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `review_id` int(11) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `content` text,
  `writetime` datetime DEFAULT NULL,
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (2,'nanhee','난 송중기 별로였음 근데 영화는 짱!!!','2012-12-09 23:21:29',1),(2,'kjm427','남자가 볼때 이영화 별로입니다!!!','2012-12-09 23:27:42',2),(3,'kjm427','이병헌 연기잘함','2012-12-09 23:29:11',3);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_board`
--

DROP TABLE IF EXISTS `review_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_board` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `subject` varchar(20) DEFAULT NULL,
  `content` text,
  `stars_sum` int(11) DEFAULT NULL,
  `vote_cnt` int(11) DEFAULT NULL,
  `reply_cnt` int(11) DEFAULT NULL,
  `writetime` datetime DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `movie_api_id` varchar(20) DEFAULT NULL,
  `movie_title` varchar(20) DEFAULT NULL,
  `movie_subtitle` varchar(20) DEFAULT NULL,
  `movie_pubdate` varchar(20) DEFAULT NULL,
  `movie_director` varchar(20) DEFAULT NULL,
  `movie_story` text,
  `actor` varchar(20) DEFAULT NULL,
  `movie_img` text,
  PRIMARY KEY (`review_id`),
  KEY `review_id` (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_board`
--

LOCK TABLES `review_board` WRITE;
/*!40000 ALTER TABLE `review_board` DISABLE KEYS */;
INSERT INTO `review_board` VALUES (2,'sunkyung5530','늑대소년 완전 멋있음!!!','송중기란 배우를 처음에 봤을때... 완전 얼굴로 연기하겠구만 이란 생각이 드는 배우였는데....\r\n\r\n이영화에서 대사는 없고 표정연기만 하는데 왜 이렇게 연기를 잘한다고 느껴지느거지?!!\r\n\r\n송중기 완전 짱이다....!!!\r\n\r\n영화도 스토리 내용 배우 연지 완전 짱이다!!!',NULL,7,NULL,'2012-12-09 23:18:55',NULL,NULL,'늑대소년',NULL,'2012.10.31','조성희','체온 46도, 혈액형 판독불가… 세상에 없어야 할 위험한 존재 늑대소년, 운명적 사랑에 빠지다!  요양 차 가족들과 한적한 마을로 이사 간 소녀는 어둠 속에 몸을 숨긴 의문의 늑대소년을 발견한다. 야생의 눈빛으로 사람 같지 않은 행동을 보이는 소년에게 왠지 마음이 쓰이는 소녀는 먹을 것을 보고 기다리는 법, 옷 입는 법, 글을 읽고 쓰는 법 등 소년에게 세상에서 살아가는 방법들을 하나씩 가르쳐준다. 태어나 처음으로 자신을 향해 손을 내밀어준 소녀에게 애틋한 감정이 싹트는 소년. 그러던 어느 날 예기치 못한 위기 속에 소년의 숨겨져 있던 위험한 본성이 드러나고, 소년은 순식간에 마을 사람들에게 두려움과 공포의 대상이 되어버리는데……','송중기, 박보영, 장영남, 유연석','http://cfile16.uf.daum.net/C110x160/1528E64F507B6A520528D0'),(3,'nanhee','광해쩐다','		광해 완전 이병헌 새로 봤어요~~~ 이병헌 이런 연기 할줄 몰랐음 ㅋㅋㅋ 평소엔 별로였는데 영화보고 완전 반했어요 1인 2역을 하다니!!!!\r\n강추강추 짱이에요!!!!!!!',NULL,8,NULL,'2012-12-09 23:21:13',NULL,NULL,'광해, 왕이 된 남자',NULL,'2012.09.13','추창민','역사에 기록되지 않은 또 한 명의 광해   왕위를 둘러싼 권력 다툼과 당쟁으로 혼란이 극에 달한 광해군 8년. 자신의 목숨을 노리는 자들에 대한 분노와 두려움으로 점점 난폭해져 가던 왕 ‘광해’는 도승지 ‘허균’에게 자신을 대신하여 위협에 노출될 대역을 찾을 것을 지시한다. 이에 허균은 기방의 취객들 사이에 걸쭉한 만담으로 인기를 끌던 하선을 발견한다. 왕과 똑같은 외모는 물론 타고난 재주와 말솜씨로 왕의 흉내도 완벽하게 내는 하선. 영문도 모른 채 궁에 끌려간 하선은 광해군이 자리를 비운 하룻밤 가슴 조이며 왕의 대역을 하게 된다.   왕이 되어선 안 되는 남자, 조선의 왕이 되다!   그러던 어느 날 광해군이 갑자기 의식을 잃고 쓰러지는 엄청난 사건이 발생하고, 허균은 광해군이 치료를 받는 동안 하선에게 광해군을 대신하여 왕의 대역을 할 것을 명한다. 저잣거리의 한낱 만담꾼에서 하루아침에 조선의 왕이 되어버린 천민 하선. 허균의 지시 하에 말투부터 걸음걸이, 국정을 다스리는 법까지, 함부로 입을 놀려서도 들켜서도 안 되는 위험천만한 왕노릇을 시작한다. 하지만 예민하고 난폭했던 광해와는 달리 따뜻함과 인간미가 느껴지는 달라진 왕의 모습에 궁정이 조금씩 술렁이고, 점점 왕의 대역이 아닌 자신의 목소리를 내기 시작하는 하선의 모습에 허균도 당황하기 시작하는데...','이병헌, 류승룡, 한효주, 김인권','http://cfile19.uf.daum.net/C110x160/14333450503DA7502B27D9'),(5,'kjm427','나는 살인범이다!!','	마지막에 반전이 있을줄 알았는데 생각했던것보다 더 재미있는 반전이었네요!!',NULL,0,NULL,'2012-12-09 23:24:25',NULL,NULL,'내가 살인범이다',NULL,'2012.11.08','정병길','스타가 된 연쇄살인범 VS 법으로는 잡지 못하는 형사   15년 전, 세상을 떠들썩하게 만들었던 연곡 연쇄살인사건.  하지만 이 사건은 끝내 범인을 잡지 못한 채 공소시효가 끝난다.  사건 담당 형사 최형구는 범인을 잡지 못한 죄책감과  자신의 얼굴에 끔찍한 상처를 남기고 사라진 범인에 대한 분노로  15년 간 하루도 편히 잠들지 못한다.    그리고 2년 후,  자신을 연쇄살인사건의 범인이라고 밝힌 이두석이 ‘내가 살인범이다’라는 자서전을 출간하고,   이 책은 단숨에 베스트셀러가 된다. 미남형 외모와 수려한 말솜씨로 스타가 된 이두석.   최형구는 알려지지 않은 마지막 미해결 실종사건을 파헤쳐  세상이 용서한 이두석을 어떻게든 잡아넣으려 하는데…   법이 용서한 연쇄살인범  공소시효는 끝났지만, 사건은 아직 끝나지 않았다!','정재영, 박시후, 정해균, 김영애','http://cfile76.uf.daum.net/C110x160/19090A48507644D121D1A4'),(6,'sunkyung5530','광해 완전 멋있음','		이병헌이 이 영화의 90%를 차지 했다해도 과언이 아니다!!!!\r\n\r\n\r\n정말 진 심으로 연기 잘했습니다.',NULL,9,NULL,'2012-12-09 23:31:17',NULL,NULL,'광해, 왕이 된 남자',NULL,'2012.09.13','추창민','역사에 기록되지 않은 또 한 명의 광해   왕위를 둘러싼 권력 다툼과 당쟁으로 혼란이 극에 달한 광해군 8년. 자신의 목숨을 노리는 자들에 대한 분노와 두려움으로 점점 난폭해져 가던 왕 ‘광해’는 도승지 ‘허균’에게 자신을 대신하여 위협에 노출될 대역을 찾을 것을 지시한다. 이에 허균은 기방의 취객들 사이에 걸쭉한 만담으로 인기를 끌던 하선을 발견한다. 왕과 똑같은 외모는 물론 타고난 재주와 말솜씨로 왕의 흉내도 완벽하게 내는 하선. 영문도 모른 채 궁에 끌려간 하선은 광해군이 자리를 비운 하룻밤 가슴 조이며 왕의 대역을 하게 된다.   왕이 되어선 안 되는 남자, 조선의 왕이 되다!   그러던 어느 날 광해군이 갑자기 의식을 잃고 쓰러지는 엄청난 사건이 발생하고, 허균은 광해군이 치료를 받는 동안 하선에게 광해군을 대신하여 왕의 대역을 할 것을 명한다. 저잣거리의 한낱 만담꾼에서 하루아침에 조선의 왕이 되어버린 천민 하선. 허균의 지시 하에 말투부터 걸음걸이, 국정을 다스리는 법까지, 함부로 입을 놀려서도 들켜서도 안 되는 위험천만한 왕노릇을 시작한다. 하지만 예민하고 난폭했던 광해와는 달리 따뜻함과 인간미가 느껴지는 달라진 왕의 모습에 궁정이 조금씩 술렁이고, 점점 왕의 대역이 아닌 자신의 목소리를 내기 시작하는 하선의 모습에 허균도 당황하기 시작하는데...','이병헌, 류승룡, 한효주, 김인권','http://cfile19.uf.daum.net/C110x160/14333450503DA7502B27D9');
/*!40000 ALTER TABLE `review_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star_points`
--

DROP TABLE IF EXISTS `star_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_points` (
  `review_id` int(11) NOT NULL DEFAULT '0',
  `user_id` varchar(20) NOT NULL DEFAULT '',
  `star_point` int(11) DEFAULT NULL,
  PRIMARY KEY (`review_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star_points`
--

LOCK TABLES `star_points` WRITE;
/*!40000 ALTER TABLE `star_points` DISABLE KEYS */;
INSERT INTO `star_points` VALUES (2,'kjm427',2),(2,'nanhee',2),(3,'kjm427',5);
/*!40000 ALTER TABLE `star_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `facebook_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('kjm427','123456','김정민','hephi','rlwjal427@naver.com'),('master','master','master','master','master@nate.com'),('nanhee','111111','조난희','나니','nan0848@naver.com'),('ogy5212','ganzinam','오오오','용의자X','ogy5212@nate.com'),('sunkyung5530','hong11','홍선경','SK','sunkyung5530@nate.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `review_id` int(11) NOT NULL DEFAULT '0',
  `user_id` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`review_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (2,'nanhee'),(3,'kjm427'),(3,'sunkyung5530'),(6,'sunkyung5530');
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-09 23:58:08
