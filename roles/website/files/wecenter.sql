-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: wecenter
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

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
-- Current Database: `wecenter`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wecenter` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `wecenter`;

--
-- Table structure for table `aws_active_data`
--

DROP TABLE IF EXISTS `aws_active_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_active_data` (
  `active_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `expire_time` int(10) DEFAULT NULL,
  `active_code` varchar(32) DEFAULT NULL,
  `active_type_code` varchar(16) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL,
  `add_ip` bigint(12) DEFAULT NULL,
  `active_time` int(10) DEFAULT NULL,
  `active_ip` bigint(12) DEFAULT NULL,
  PRIMARY KEY (`active_id`),
  KEY `active_code` (`active_code`),
  KEY `active_type_code` (`active_type_code`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_active_data`
--

LOCK TABLES `aws_active_data` WRITE;
/*!40000 ALTER TABLE `aws_active_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_active_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_answer`
--

DROP TABLE IF EXISTS `aws_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回答id',
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `answer_content` text CHARACTER SET utf8mb4 COMMENT '回答内容',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `against_count` int(11) NOT NULL DEFAULT '0' COMMENT '反对人数',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '支持人数',
  `uid` int(11) DEFAULT '0' COMMENT '发布问题用户ID',
  `comment_count` int(11) DEFAULT '0' COMMENT '评论总数',
  `uninterested_count` int(11) DEFAULT '0' COMMENT '不感兴趣',
  `thanks_count` int(11) DEFAULT '0' COMMENT '感谢数量',
  `category_id` int(11) DEFAULT '0' COMMENT '分类id',
  `has_attach` tinyint(1) DEFAULT '0' COMMENT '是否存在附件',
  `ip` bigint(11) DEFAULT NULL,
  `force_fold` tinyint(1) DEFAULT '0' COMMENT '强制折叠',
  `anonymous` tinyint(1) DEFAULT '0',
  `publish_source` varchar(16) DEFAULT NULL,
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  `is_best` tinyint(1) NOT NULL COMMENT '是否为最佳回复1是',
  `best_uid` int(10) NOT NULL COMMENT '最佳答案的设定人id',
  `best_time` int(10) NOT NULL COMMENT '最佳答案的设定时间',
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  KEY `agree_count` (`agree_count`),
  KEY `against_count` (`against_count`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `uninterested_count` (`uninterested_count`),
  KEY `force_fold` (`force_fold`),
  KEY `anonymous` (`anonymous`),
  KEY `publich_source` (`publish_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='回答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_answer`
--

LOCK TABLES `aws_answer` WRITE;
/*!40000 ALTER TABLE `aws_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_answer_comments`
--

DROP TABLE IF EXISTS `aws_answer_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_answer_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `time` int(10) DEFAULT '0',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_answer_comments`
--

LOCK TABLES `aws_answer_comments` WRITE;
/*!40000 ALTER TABLE `aws_answer_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_answer_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_answer_thanks`
--

DROP TABLE IF EXISTS `aws_answer_thanks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_answer_thanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_answer_thanks`
--

LOCK TABLES `aws_answer_thanks` WRITE;
/*!40000 ALTER TABLE `aws_answer_thanks` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_answer_thanks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_answer_uninterested`
--

DROP TABLE IF EXISTS `aws_answer_uninterested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_answer_uninterested` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_answer_uninterested`
--

LOCK TABLES `aws_answer_uninterested` WRITE;
/*!40000 ALTER TABLE `aws_answer_uninterested` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_answer_uninterested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_answer_vote`
--

DROP TABLE IF EXISTS `aws_answer_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_answer_vote` (
  `voter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动ID',
  `answer_id` int(11) DEFAULT NULL COMMENT '回复id',
  `answer_uid` int(11) DEFAULT NULL COMMENT '回复作者id',
  `vote_uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `vote_value` tinyint(4) NOT NULL COMMENT '-1反对 1 支持',
  `reputation_factor` int(10) DEFAULT '0',
  PRIMARY KEY (`voter_id`),
  KEY `answer_id` (`answer_id`),
  KEY `vote_value` (`vote_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_answer_vote`
--

LOCK TABLES `aws_answer_vote` WRITE;
/*!40000 ALTER TABLE `aws_answer_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_answer_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_approval`
--

DROP TABLE IF EXISTS `aws_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_approval` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT NULL,
  `data` mediumtext NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_approval`
--

LOCK TABLES `aws_approval` WRITE;
/*!40000 ALTER TABLE `aws_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_article`
--

DROP TABLE IF EXISTS `aws_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `message` text,
  `comments` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  `add_time` int(10) DEFAULT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `lock` int(1) NOT NULL DEFAULT '0',
  `votes` int(10) DEFAULT '0',
  `title_fulltext` text CHARACTER SET utf8,
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `column_id` int(11) DEFAULT NULL COMMENT '所属专栏id',
  `article_img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文章封面',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`id`),
  KEY `has_attach` (`has_attach`),
  KEY `uid` (`uid`),
  KEY `comments` (`comments`),
  KEY `views` (`views`),
  KEY `add_time` (`add_time`),
  KEY `lock` (`lock`),
  KEY `votes` (`votes`),
  KEY `category_id` (`category_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `chapter_id` (`chapter_id`),
  KEY `sort` (`sort`),
  FULLTEXT KEY `title_fulltext` (`title_fulltext`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_article`
--

LOCK TABLES `aws_article` WRITE;
/*!40000 ALTER TABLE `aws_article` DISABLE KEYS */;
INSERT INTO `aws_article` VALUES (1,1,'三体1','',0,1,1577278084,0,0,0,'1997720307',1,0,NULL,0,0,'https://wecenter.oldboyedu.com/uploads/article/20191225/7256e4d45e4151bfd03e256aeb287fc5.jpg?5565',0);
/*!40000 ALTER TABLE `aws_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_article_comments`
--

DROP TABLE IF EXISTS `aws_article_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_article_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `article_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `at_uid` int(10) DEFAULT NULL,
  `votes` int(10) DEFAULT '0',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `article_id` (`article_id`),
  KEY `add_time` (`add_time`),
  KEY `votes` (`votes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_article_comments`
--

LOCK TABLES `aws_article_comments` WRITE;
/*!40000 ALTER TABLE `aws_article_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_article_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_article_vote`
--

DROP TABLE IF EXISTS `aws_article_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_article_vote` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(10) NOT NULL,
  `rating` tinyint(1) DEFAULT '0',
  `time` int(10) NOT NULL,
  `reputation_factor` int(10) DEFAULT '0',
  `item_uid` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`),
  KEY `time` (`time`),
  KEY `item_uid` (`item_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_article_vote`
--

LOCK TABLES `aws_article_vote` WRITE;
/*!40000 ALTER TABLE `aws_article_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_article_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_attach`
--

DROP TABLE IF EXISTS `aws_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `access_key` varchar(32) DEFAULT NULL COMMENT '批次 Key',
  `add_time` int(10) DEFAULT '0' COMMENT '上传时间',
  `file_location` varchar(255) DEFAULT NULL COMMENT '文件位置',
  `is_image` int(1) DEFAULT '0',
  `item_type` varchar(32) DEFAULT '0' COMMENT '关联类型',
  `item_id` bigint(20) DEFAULT '0' COMMENT '关联 ID',
  `wait_approval` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `access_key` (`access_key`),
  KEY `is_image` (`is_image`),
  KEY `fetch` (`item_id`,`item_type`),
  KEY `wait_approval` (`wait_approval`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_attach`
--

LOCK TABLES `aws_attach` WRITE;
/*!40000 ALTER TABLE `aws_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_ban_ip`
--

DROP TABLE IF EXISTS `aws_ban_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_ban_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `ip` varchar(16) NOT NULL COMMENT 'IP',
  `time` int(10) unsigned DEFAULT NULL COMMENT '封禁时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='封禁列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_ban_ip`
--

LOCK TABLES `aws_ban_ip` WRITE;
/*!40000 ALTER TABLE `aws_ban_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_ban_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_category`
--

DROP TABLE IF EXISTS `aws_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `url_token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `url_token` (`url_token`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_category`
--

LOCK TABLES `aws_category` WRITE;
/*!40000 ALTER TABLE `aws_category` DISABLE KEYS */;
INSERT INTO `aws_category` VALUES (1,'默认分类','question',NULL,0,0,NULL);
/*!40000 ALTER TABLE `aws_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_column`
--

DROP TABLE IF EXISTS `aws_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_column` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专栏id',
  `column_name` varchar(64) DEFAULT NULL COMMENT '专栏标题',
  `is_verify` tinyint(1) DEFAULT '0' COMMENT '是否审核通过 （1通过0审核中-1通过）',
  `focus_count` int(11) DEFAULT '0' COMMENT '关注计数',
  `column_description` text COMMENT '专栏描述',
  `column_pic` varchar(255) DEFAULT NULL COMMENT '专栏图片',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `sort` int(10) DEFAULT '0' COMMENT '排序',
  `reson` varchar(100) DEFAULT NULL COMMENT '拒绝原因',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专栏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_column`
--

LOCK TABLES `aws_column` WRITE;
/*!40000 ALTER TABLE `aws_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_column_focus`
--

DROP TABLE IF EXISTS `aws_column_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_column_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `column_id` int(11) DEFAULT NULL COMMENT '专栏ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`focus_id`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`column_id`),
  KEY `topic_uid` (`column_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专栏关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_column_focus`
--

LOCK TABLES `aws_column_focus` WRITE;
/*!40000 ALTER TABLE `aws_column_focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_column_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_draft`
--

DROP TABLE IF EXISTS `aws_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_draft` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `data` text,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `item_id` (`item_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_draft`
--

LOCK TABLES `aws_draft` WRITE;
/*!40000 ALTER TABLE `aws_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_edm_task`
--

DROP TABLE IF EXISTS `aws_edm_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_edm_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_edm_task`
--

LOCK TABLES `aws_edm_task` WRITE;
/*!40000 ALTER TABLE `aws_edm_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_edm_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_edm_taskdata`
--

DROP TABLE IF EXISTS `aws_edm_taskdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_edm_taskdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sent_time` int(10) NOT NULL,
  `view_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `sent_time` (`sent_time`),
  KEY `view_time` (`view_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_edm_taskdata`
--

LOCK TABLES `aws_edm_taskdata` WRITE;
/*!40000 ALTER TABLE `aws_edm_taskdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_edm_taskdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_edm_unsubscription`
--

DROP TABLE IF EXISTS `aws_edm_unsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_edm_unsubscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_edm_unsubscription`
--

LOCK TABLES `aws_edm_unsubscription` WRITE;
/*!40000 ALTER TABLE `aws_edm_unsubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_edm_unsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_edm_userdata`
--

DROP TABLE IF EXISTS `aws_edm_userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_edm_userdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usergroup` (`usergroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_edm_userdata`
--

LOCK TABLES `aws_edm_userdata` WRITE;
/*!40000 ALTER TABLE `aws_edm_userdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_edm_userdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_edm_usergroup`
--

DROP TABLE IF EXISTS `aws_edm_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_edm_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_edm_usergroup`
--

LOCK TABLES `aws_edm_usergroup` WRITE;
/*!40000 ALTER TABLE `aws_edm_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_edm_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_education_experience`
--

DROP TABLE IF EXISTS `aws_education_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_education_experience` (
  `education_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `education_years` int(11) DEFAULT NULL COMMENT '入学年份',
  `school_name` varchar(64) DEFAULT NULL COMMENT '学校名',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '学校类别',
  `departments` varchar(64) DEFAULT NULL COMMENT '院系',
  `add_time` int(10) DEFAULT NULL COMMENT '记录添加时间',
  PRIMARY KEY (`education_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教育经历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_education_experience`
--

LOCK TABLES `aws_education_experience` WRITE;
/*!40000 ALTER TABLE `aws_education_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_education_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_favorite`
--

DROP TABLE IF EXISTS `aws_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `item_id` (`item_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_favorite`
--

LOCK TABLES `aws_favorite` WRITE;
/*!40000 ALTER TABLE `aws_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_favorite_tag`
--

DROP TABLE IF EXISTS `aws_favorite_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_favorite_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `item_id` int(11) DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `title` (`title`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_favorite_tag`
--

LOCK TABLES `aws_favorite_tag` WRITE;
/*!40000 ALTER TABLE `aws_favorite_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_favorite_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_feature`
--

DROP TABLE IF EXISTS `aws_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '专题标题',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '专题图标',
  `topic_count` int(11) NOT NULL DEFAULT '0' COMMENT '话题计数',
  `css` text COMMENT '自定义CSS',
  `url_token` varchar(32) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `url_token` (`url_token`),
  KEY `title` (`title`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_feature`
--

LOCK TABLES `aws_feature` WRITE;
/*!40000 ALTER TABLE `aws_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_feature_topic`
--

DROP TABLE IF EXISTS `aws_feature_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_feature_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题ID',
  `topic_id` int(11) NOT NULL DEFAULT '0' COMMENT '话题ID',
  PRIMARY KEY (`id`),
  KEY `feature_id` (`feature_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_feature_topic`
--

LOCK TABLES `aws_feature_topic` WRITE;
/*!40000 ALTER TABLE `aws_feature_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_feature_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_geo_location`
--

DROP TABLE IF EXISTS `aws_geo_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_geo_location` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `add_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_type` (`item_type`),
  KEY `add_time` (`add_time`),
  KEY `geo_location` (`latitude`,`longitude`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_geo_location`
--

LOCK TABLES `aws_geo_location` WRITE;
/*!40000 ALTER TABLE `aws_geo_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_geo_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_help_chapter`
--

DROP TABLE IF EXISTS `aws_help_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_help_chapter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url_token` varchar(32) DEFAULT NULL,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `url_token` (`url_token`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助中心';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_help_chapter`
--

LOCK TABLES `aws_help_chapter` WRITE;
/*!40000 ALTER TABLE `aws_help_chapter` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_help_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_inbox`
--

DROP TABLE IF EXISTS `aws_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '发送者 ID',
  `dialog_id` int(11) DEFAULT NULL COMMENT '对话id',
  `message` text COMMENT '内容',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `sender_remove` tinyint(1) DEFAULT '0',
  `recipient_remove` tinyint(1) DEFAULT '0',
  `receipt` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dialog_id` (`dialog_id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `sender_remove` (`sender_remove`),
  KEY `recipient_remove` (`recipient_remove`),
  KEY `sender_receipt` (`receipt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_inbox`
--

LOCK TABLES `aws_inbox` WRITE;
/*!40000 ALTER TABLE `aws_inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_inbox_dialog`
--

DROP TABLE IF EXISTS `aws_inbox_dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_inbox_dialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '对话ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者UID',
  `sender_unread` int(11) DEFAULT NULL COMMENT '发送者未读',
  `recipient_uid` int(11) DEFAULT NULL COMMENT '接收者UID',
  `recipient_unread` int(11) DEFAULT NULL COMMENT '接收者未读',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `sender_count` int(11) DEFAULT NULL COMMENT '发送者显示对话条数',
  `recipient_count` int(11) DEFAULT NULL COMMENT '接收者显示对话条数',
  PRIMARY KEY (`id`),
  KEY `recipient_uid` (`recipient_uid`),
  KEY `sender_uid` (`sender_uid`),
  KEY `update_time` (`update_time`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_inbox_dialog`
--

LOCK TABLES `aws_inbox_dialog` WRITE;
/*!40000 ALTER TABLE `aws_inbox_dialog` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_inbox_dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_integral_log`
--

DROP TABLE IF EXISTS `aws_integral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_integral_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `action` varchar(16) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `balance` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `action` (`action`),
  KEY `time` (`time`),
  KEY `integral` (`integral`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_integral_log`
--

LOCK TABLES `aws_integral_log` WRITE;
/*!40000 ALTER TABLE `aws_integral_log` DISABLE KEYS */;
INSERT INTO `aws_integral_log` VALUES (1,1,'REGISTER',2000,'初始资本',2000,0,1577277554);
/*!40000 ALTER TABLE `aws_integral_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_invitation`
--

DROP TABLE IF EXISTS `aws_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_invitation` (
  `invitation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '激活ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `invitation_code` varchar(32) DEFAULT NULL COMMENT '激活码',
  `invitation_email` varchar(255) DEFAULT NULL COMMENT '激活email',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `add_ip` bigint(12) DEFAULT NULL COMMENT '添加IP',
  `active_expire` tinyint(1) DEFAULT '0' COMMENT '激活过期',
  `active_time` int(10) DEFAULT NULL COMMENT '激活时间',
  `active_ip` bigint(12) DEFAULT NULL COMMENT '激活IP',
  `active_status` tinyint(4) DEFAULT '0' COMMENT '1已使用0未使用-1已删除',
  `active_uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `uid` (`uid`),
  KEY `invitation_code` (`invitation_code`),
  KEY `invitation_email` (`invitation_email`),
  KEY `active_time` (`active_time`),
  KEY `active_ip` (`active_ip`),
  KEY `active_status` (`active_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_invitation`
--

LOCK TABLES `aws_invitation` WRITE;
/*!40000 ALTER TABLE `aws_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_jobs`
--

DROP TABLE IF EXISTS `aws_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(64) DEFAULT NULL COMMENT '职位名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_jobs`
--

LOCK TABLES `aws_jobs` WRITE;
/*!40000 ALTER TABLE `aws_jobs` DISABLE KEYS */;
INSERT INTO `aws_jobs` VALUES (1,'销售'),(2,'市场/市场拓展/公关'),(3,'商务/采购/贸易'),(4,'计算机软、硬件/互联网/IT'),(5,'电子/半导体/仪表仪器'),(6,'通信技术'),(7,'客户服务/技术支持'),(8,'行政/后勤'),(9,'人力资源'),(10,'高级管理'),(11,'生产/加工/制造'),(12,'质控/安检'),(13,'工程机械'),(14,'技工'),(15,'财会/审计/统计'),(16,'金融/银行/保险/证券/投资'),(17,'建筑/房地产/装修/物业'),(18,'交通/仓储/物流'),(19,'普通劳动力/家政服务'),(20,'零售业'),(21,'教育/培训'),(22,'咨询/顾问'),(23,'学术/科研'),(24,'法律'),(25,'美术/设计/创意'),(26,'编辑/文案/传媒/影视/新闻'),(27,'酒店/餐饮/旅游/娱乐'),(28,'化工'),(29,'能源/矿产/地质勘查'),(30,'医疗/护理/保健/美容'),(31,'生物/制药/医疗器械'),(32,'翻译（口译与笔译）'),(33,'公务员'),(34,'环境科学/环保'),(35,'农/林/牧/渔业'),(36,'兼职/临时/培训生/储备干部'),(37,'在校学生'),(38,'其他');
/*!40000 ALTER TABLE `aws_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_mail_queue`
--

DROP TABLE IF EXISTS `aws_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_mail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_to` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_error` tinyint(1) NOT NULL DEFAULT '0',
  `error_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_error` (`is_error`),
  KEY `send_to` (`send_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_mail_queue`
--

LOCK TABLES `aws_mail_queue` WRITE;
/*!40000 ALTER TABLE `aws_mail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_mail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_menu`
--

DROP TABLE IF EXISTS `aws_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  `unid` varchar(50) DEFAULT NULL,
  `systerm` smallint(1) DEFAULT '0',
  `status` smallint(1) DEFAULT '1',
  `isleft` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_menu`
--

LOCK TABLES `aws_menu` WRITE;
/*!40000 ALTER TABLE `aws_menu` DISABLE KEYS */;
INSERT INTO `aws_menu` VALUES (1,'概述','home','admin/',0,NULL,0,1,0),(2,'全局设置','setting',NULL,0,NULL,0,1,0),(3,'站点信息',NULL,'admin/settings/category-site',2,'SETTINGS_SITE',0,1,0),(4,'注册访问',NULL,'admin/settings/category-register',2,'SETTINGS_REGISTER',0,1,0),(5,'站点设置',NULL,'admin/settings/category-functions',2,'SETTINGS_FUNCTIONS',0,1,0),(6,'功能设置',NULL,'admin/settings/category-contents',2,'SETTINGS_CONTENTS',0,1,0),(7,'威望积分',NULL,'admin/settings/category-integral',2,'SETTINGS_INTEGRAL',0,1,0),(8,'用户权限',NULL,'admin/settings/category-permissions',2,'SETTINGS_PERMISSIONS',0,1,0),(9,'邮件设置',NULL,'admin/settings/category-mail',2,'SETTINGS_MAIL',0,1,0),(10,'开放平台',NULL,'admin/settings/category-openid',2,'SETTINGS_OPENID',0,1,0),(11,'性能优化',NULL,'admin/settings/category-cache',2,'SETTINGS_CACHE',0,1,0),(12,'界面设置',NULL,'admin/settings/category-interface',2,'SETTINGS_INTERFACE',0,1,0),(13,'内容管理','reply',NULL,0,NULL,0,1,0),(14,'问题管理',NULL,'admin/question/question_list/',13,'301',0,1,0),(15,'文章管理',NULL,'admin/article/list/',13,'309',0,1,0),(16,'话题管理',NULL,'admin/topic/list/',13,'303',0,1,0),(17,'回复管理',NULL,'admin/comment/answer_list/',13,'901',0,1,0),(19,'问题评论管理',NULL,'admin/comment/question_comment_list/',13,'902',0,1,0),(20,'回复评论管理',NULL,'admin/comment/answer_comment_list/',13,'903',0,1,0),(21,'文章评论管理',NULL,'admin/article/comment/',13,'904',0,1,0),(22,'用户管理','user',NULL,0,NULL,0,1,0),(23,'用户列表',NULL,'admin/user/list/',22,'402',0,1,0),(24,'用户组',NULL,'admin/user/group_list/',22,'403',0,1,0),(25,'批量邀请',NULL,'admin/user/invites/',22,'406',0,1,0),(26,'职位设置',NULL,'admin/user/job_list/',22,'407',0,1,0),(27,'审核管理','report',NULL,0,NULL,0,1,0),(28,'内容审核',NULL,'admin/approval/list/',27,'300',0,1,0),(29,'认证审核',NULL,'admin/user/verify_approval_list/',27,'401',0,1,0),(30,'注册审核',NULL,'admin/user/register_approval_list/',27,'408',0,1,0),(31,'用户举报',NULL,'admin/question/report_list/',27,'306',0,1,0),(32,'活动管理','reply',NULL,0,NULL,0,1,0),(33,'活动管理',NULL,'admin/project/project_list/',32,'310',0,1,0),(34,'活动审核',NULL,'admin/project/approval_list/',32,'311',0,1,0),(35,'订单管理',NULL,'admin/project/order_list/',32,'312',0,1,0),(36,'内容设置','signup',NULL,0,NULL,0,1,0),(37,'导航设置',NULL,'admin/nav_menu/',36,'307',0,1,0),(38,'分类管理',NULL,'admin/category/list/',36,'302',0,1,0),(39,'专题管理',NULL,'admin/feature/list/',36,'304',0,1,0),(40,'页面管理',NULL,'admin/page/',36,'308',0,1,0),(41,'专栏管理',NULL,'admin/column/list/',36,'299',0,1,0),(42,'帮助中心',NULL,'admin/help/list/',36,'305',0,1,0),(43,'微信微博','share',NULL,0,NULL,0,1,0),(44,'微信多账号管理',NULL,'admin/weixin/accounts/',43,'802',0,1,0),(45,'微信菜单管理',NULL,'admin/weixin/mp_menu/',43,'803',0,1,0),(46,'微信自定义回复',NULL,'admin/weixin/reply/',43,'801',0,1,0),(47,'微信第三方接入',NULL,'admin/weixin/third_party_access/',43,'808',0,1,0),(48,'微信二维码管理',NULL,'admin/weixin/qr_code/',43,'805',0,1,0),(49,'微信消息群发',NULL,'admin/weixin/sent_msgs_list/',43,'804',0,1,0),(50,'微博消息接收',NULL,'admin/weibo/msg/',43,'806',0,1,0),(51,'邮件导入',NULL,'admin/edm/receiving_list/',43,'807',0,1,0),(52,'邮件群发','inbox',NULL,0,NULL,0,1,0),(53,'任务管理',NULL,'admin/edm/tasks/',52,'702',0,1,0),(54,'用户群管理',NULL,'admin/edm/groups/',52,'701',0,1,0),(55,'工具','job',NULL,0,NULL,0,1,0),(56,'系统维护',NULL,'admin/tools/',55,'501',0,1,0),(57,'插件扩展','plugin',NULL,0,NULL,0,1,0),(58,'插件管理',NULL,'admin/plugin/',57,'',0,1,0),(59,'短信功能',NULL,'admin/tools/sms/',57,NULL,0,1,0),(60,'支付功能',NULL,'admin/tools/pay/',57,NULL,0,1,0),(61,'后台菜单','','admin/menus/',36,NULL,0,1,0),(62,'交易管理','good','',0,NULL,0,1,0),(63,'交易流水','','admin/transaction/trading/',62,NULL,0,1,0),(64,'提现申请','','admin/transaction/apply/',62,NULL,0,1,0),(65,'短信记录','glyphicon glyphicon-phone','admin/tools/notes/',62,NULL,0,1,0);
/*!40000 ALTER TABLE `aws_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_nav_menu`
--

DROP TABLE IF EXISTS `aws_nav_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_nav_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `type_id` int(11) DEFAULT '0',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`link`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_nav_menu`
--

LOCK TABLES `aws_nav_menu` WRITE;
/*!40000 ALTER TABLE `aws_nav_menu` DISABLE KEYS */;
INSERT INTO `aws_nav_menu` VALUES (1,'默认分类','默认分类描述','category',1,NULL,NULL,0);
/*!40000 ALTER TABLE `aws_nav_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_notes`
--

DROP TABLE IF EXISTS `aws_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mobile` char(11) NOT NULL COMMENT '手机号',
  `send_type` varchar(32) NOT NULL COMMENT '短信商',
  `template_code` varchar(32) NOT NULL COMMENT '模板id',
  `content` text COMMENT '短信内容',
  `ip` varchar(32) NOT NULL COMMENT 'ip',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_notes`
--

LOCK TABLES `aws_notes` WRITE;
/*!40000 ALTER TABLE `aws_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_notification`
--

DROP TABLE IF EXISTS `aws_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者ID',
  `recipient_uid` int(11) DEFAULT '0' COMMENT '接收者ID',
  `action_type` int(4) DEFAULT NULL COMMENT '操作类型',
  `model_type` smallint(11) NOT NULL DEFAULT '0',
  `source_id` varchar(16) NOT NULL DEFAULT '0' COMMENT '关联 ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `read_flag` tinyint(1) DEFAULT '0' COMMENT '阅读状态',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`notification_id`),
  KEY `recipient_read_flag` (`recipient_uid`,`read_flag`),
  KEY `sender_uid` (`sender_uid`),
  KEY `model_type` (`model_type`),
  KEY `source_id` (`source_id`),
  KEY `action_type` (`action_type`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_notification`
--

LOCK TABLES `aws_notification` WRITE;
/*!40000 ALTER TABLE `aws_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_notification_data`
--

DROP TABLE IF EXISTS `aws_notification_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_notification_data` (
  `notification_id` int(11) unsigned NOT NULL,
  `data` text,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统通知数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_notification_data`
--

LOCK TABLES `aws_notification_data` WRITE;
/*!40000 ALTER TABLE `aws_notification_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_notification_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_order_detail`
--

DROP TABLE IF EXISTS `aws_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_order_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `no` varchar(20) DEFAULT NULL COMMENT '订单号(年月日+8位流水)',
  `trade_no` varchar(255) DEFAULT NULL COMMENT '三方订单号',
  `consume_type` tinyint(1) DEFAULT NULL COMMENT '交易类型(1：充值，2：提现，3：咨询-支付，4：打赏-支付，5：咨询-收入，6：打赏-收入；7：开通会员；8：购买应用；9：悬赏-支出；10悬赏-收入；11退款；0：冻结)',
  `mode` tinyint(1) DEFAULT NULL COMMENT '付款方式(1：余额，2：支付宝，3：微信，4：银联转账)',
  `relation_type` tinyint(1) DEFAULT NULL COMMENT '关联类型(1：咨询，2：打赏，3：开通会员；4：购买应用；5：悬赏;6：提现',
  `relation_id` int(11) DEFAULT NULL COMMENT '关联id',
  `amount` decimal(11,2) DEFAULT '0.00' COMMENT '交易金额',
  `time` int(10) DEFAULT NULL COMMENT '交易时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '交易状态（0：未完成，1：已完成，2：失败）',
  `money` decimal(11,2) DEFAULT '0.00' COMMENT '交易前金额',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `type` smallint(6) DEFAULT NULL COMMENT '1增加2减少',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易流水';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_order_detail`
--

LOCK TABLES `aws_order_detail` WRITE;
/*!40000 ALTER TABLE `aws_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_pages`
--

DROP TABLE IF EXISTS `aws_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_pages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url_token` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contents` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_token` (`url_token`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_pages`
--

LOCK TABLES `aws_pages` WRITE;
/*!40000 ALTER TABLE `aws_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_payment`
--

DROP TABLE IF EXISTS `aws_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_payment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `amount` double NOT NULL,
  `time` int(10) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_id` bigint(16) NOT NULL,
  `terrace_id` varchar(64) DEFAULT NULL,
  `payment_id` varchar(16) DEFAULT '',
  `source` varchar(16) NOT NULL DEFAULT '',
  `extra_param` text,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `terrace_id` (`terrace_id`),
  KEY `time` (`time`),
  KEY `payment_id` (`payment_id`),
  KEY `order_id` (`order_id`),
  KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_payment`
--

LOCK TABLES `aws_payment` WRITE;
/*!40000 ALTER TABLE `aws_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_plugins`
--

DROP TABLE IF EXISTS `aws_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `author` varchar(10) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `state` smallint(1) DEFAULT NULL,
  `config` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_plugins`
--

LOCK TABLES `aws_plugins` WRITE;
/*!40000 ALTER TABLE `aws_plugins` DISABLE KEYS */;
INSERT INTO `aws_plugins` VALUES (4,'editor','编辑器富文本','编辑器富文本','wecenter','1.0.0',1,'{\"type\":{\"title\":\"\\u5f00\\u542f\\u7c7b\\u578b\",\"type\":\"radio\",\"value\":\"ckeditor\",\"options\":{\"ueditor\":\"\\u767e\\u5ea6ueditor\",\"ckeditor\":\"ckeditor\"}}}');
/*!40000 ALTER TABLE `aws_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_posts_index`
--

DROP TABLE IF EXISTS `aws_posts_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_posts_index` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `post_id` int(10) NOT NULL,
  `post_type` varchar(16) NOT NULL DEFAULT '',
  `add_time` int(10) NOT NULL,
  `update_time` int(10) DEFAULT '0',
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `view_count` int(10) DEFAULT '0',
  `anonymous` tinyint(1) DEFAULT '0',
  `popular_value` int(10) DEFAULT '0',
  `uid` int(10) NOT NULL,
  `lock` tinyint(1) DEFAULT '0',
  `agree_count` int(10) DEFAULT '0',
  `answer_count` int(10) DEFAULT '0',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `post_type` (`post_type`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`),
  KEY `category_id` (`category_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `anonymous` (`anonymous`),
  KEY `popular_value` (`popular_value`),
  KEY `uid` (`uid`),
  KEY `lock` (`lock`),
  KEY `agree_count` (`agree_count`),
  KEY `answer_count` (`answer_count`),
  KEY `view_count` (`view_count`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_posts_index`
--

LOCK TABLES `aws_posts_index` WRITE;
/*!40000 ALTER TABLE `aws_posts_index` DISABLE KEYS */;
INSERT INTO `aws_posts_index` VALUES (1,1,'article',1577278084,1577278084,1,0,0,0,0,1,0,0,0,0);
/*!40000 ALTER TABLE `aws_posts_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_product_order`
--

DROP TABLE IF EXISTS `aws_product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_product_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `payment_order_id` bigint(16) NOT NULL DEFAULT '0',
  `product_id` int(10) NOT NULL,
  `project_id` int(10) NOT NULL,
  `project_title` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text,
  `shipping_address` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(64) DEFAULT NULL,
  `shipping_province` varchar(64) DEFAULT NULL,
  `shipping_city` varchar(64) DEFAULT NULL,
  `shipping_mobile` varchar(16) DEFAULT NULL,
  `shipping_zipcode` int(10) DEFAULT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `refund_time` int(10) NOT NULL DEFAULT '0',
  `shipping_time` int(10) NOT NULL DEFAULT '0',
  `is_donate` tinyint(1) NOT NULL DEFAULT '0',
  `track_no` varchar(32) NOT NULL DEFAULT '',
  `track_branch` varchar(64) NOT NULL DEFAULT '',
  `note` text,
  `payment_time` int(10) NOT NULL DEFAULT '0',
  `product_title` varchar(255) NOT NULL DEFAULT '',
  `cancel_time` int(10) NOT NULL DEFAULT '0',
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `project_type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `product_id` (`product_id`),
  KEY `project_id` (`project_id`),
  KEY `payment_order_id` (`payment_order_id`),
  KEY `track_no` (`track_no`),
  KEY `is_donate` (`is_donate`),
  KEY `refund_time` (`refund_time`),
  KEY `add_time` (`add_time`),
  KEY `payment_time` (`payment_time`),
  KEY `cancel_time` (`cancel_time`),
  KEY `project_type` (`project_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_product_order`
--

LOCK TABLES `aws_product_order` WRITE;
/*!40000 ALTER TABLE `aws_product_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_project`
--

DROP TABLE IF EXISTS `aws_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `open_notify` int(10) NOT NULL DEFAULT '0',
  `close_notify` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `category_id` int(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `country` varchar(16) NOT NULL,
  `province` varchar(16) NOT NULL,
  `city` varchar(16) DEFAULT NULL,
  `summary` text,
  `description` text,
  `start_time` int(10) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `contact` text,
  `paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sponsored_users` int(10) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `views` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `discuss_count` int(10) NOT NULL DEFAULT '0',
  `status` varchar(16) DEFAULT NULL,
  `like_count` int(10) NOT NULL DEFAULT '0',
  `video_link` varchar(255) NOT NULL DEFAULT '',
  `project_type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `open_notify` (`open_notify`),
  KEY `close_notify` (`close_notify`),
  KEY `category_id` (`category_id`),
  KEY `title` (`title`),
  KEY `country` (`country`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `start_time` (`start_time`),
  KEY `end_time` (`end_time`),
  KEY `amount` (`amount`),
  KEY `paid` (`paid`),
  KEY `approved` (`approved`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `views` (`views`),
  KEY `update_time` (`update_time`),
  KEY `discuss_count` (`discuss_count`),
  KEY `sponsored_users` (`sponsored_users`),
  KEY `status` (`status`),
  KEY `like_count` (`like_count`),
  KEY `project_type` (`project_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_project`
--

LOCK TABLES `aws_project` WRITE;
/*!40000 ALTER TABLE `aws_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_project_like`
--

DROP TABLE IF EXISTS `aws_project_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_project_like` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_project_like`
--

LOCK TABLES `aws_project_like` WRITE;
/*!40000 ALTER TABLE `aws_project_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_project_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_project_product`
--

DROP TABLE IF EXISTS `aws_project_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_project_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` int(10) NOT NULL DEFAULT '0',
  `description` text,
  `project_id` int(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `amount` (`amount`),
  KEY `project_id` (`project_id`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_project_product`
--

LOCK TABLES `aws_project_product` WRITE;
/*!40000 ALTER TABLE `aws_project_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_project_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_question`
--

DROP TABLE IF EXISTS `aws_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_content` varchar(255) NOT NULL DEFAULT '' COMMENT '问题内容',
  `question_detail` text CHARACTER SET utf8mb4 COMMENT '问题说明',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  `published_uid` int(11) DEFAULT NULL COMMENT '发布用户UID',
  `answer_count` int(11) NOT NULL DEFAULT '0' COMMENT '回答计数',
  `answer_users` int(11) NOT NULL DEFAULT '0' COMMENT '回答人数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `focus_count` int(11) NOT NULL DEFAULT '0' COMMENT '关注数',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `action_history_id` int(11) NOT NULL DEFAULT '0' COMMENT '动作的记录表的关连id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类 ID',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '回复赞同数总和',
  `against_count` int(11) NOT NULL DEFAULT '0' COMMENT '回复反对数总和',
  `best_answer` int(11) NOT NULL DEFAULT '0' COMMENT '最佳回复 ID',
  `has_attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存在附件',
  `unverified_modify` text,
  `unverified_modify_count` int(10) NOT NULL DEFAULT '0',
  `ip` bigint(11) DEFAULT NULL,
  `last_answer` int(11) NOT NULL DEFAULT '0' COMMENT '最后回答 ID',
  `popular_value` double NOT NULL DEFAULT '0',
  `popular_value_update` int(10) NOT NULL DEFAULT '0',
  `lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `thanks_count` int(10) NOT NULL DEFAULT '0',
  `question_content_fulltext` text,
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0',
  `weibo_msg_id` bigint(20) DEFAULT NULL,
  `received_email_id` int(10) DEFAULT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(10) unsigned DEFAULT NULL,
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`question_id`),
  KEY `category_id` (`category_id`),
  KEY `update_time` (`update_time`),
  KEY `add_time` (`add_time`),
  KEY `published_uid` (`published_uid`),
  KEY `answer_count` (`answer_count`),
  KEY `agree_count` (`agree_count`),
  KEY `question_content` (`question_content`),
  KEY `lock` (`lock`),
  KEY `thanks_count` (`thanks_count`),
  KEY `anonymous` (`anonymous`),
  KEY `popular_value` (`popular_value`),
  KEY `best_answer` (`best_answer`),
  KEY `popular_value_update` (`popular_value_update`),
  KEY `against_count` (`against_count`),
  KEY `is_recommend` (`is_recommend`),
  KEY `weibo_msg_id` (`weibo_msg_id`),
  KEY `received_email_id` (`received_email_id`),
  KEY `unverified_modify_count` (`unverified_modify_count`),
  KEY `chapter_id` (`chapter_id`),
  KEY `sort` (`sort`),
  KEY `ticket_id` (`ticket_id`),
  FULLTEXT KEY `question_content_fulltext` (`question_content_fulltext`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问题列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_question`
--

LOCK TABLES `aws_question` WRITE;
/*!40000 ALTER TABLE `aws_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_question_comments`
--

DROP TABLE IF EXISTS `aws_question_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_question_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `time` int(10) DEFAULT NULL,
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_question_comments`
--

LOCK TABLES `aws_question_comments` WRITE;
/*!40000 ALTER TABLE `aws_question_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_question_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_question_complain`
--

DROP TABLE IF EXISTS `aws_question_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_question_complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '投诉者id',
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `answer_id` int(11) NOT NULL COMMENT '最佳回复id',
  `stat` tinyint(1) NOT NULL COMMENT '0投诉申请1撤销该条最佳回复2拒绝此投诉',
  `contents` varchar(255) NOT NULL COMMENT '投诉理由',
  `remarks` varchar(255) NOT NULL COMMENT '备注',
  `addtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `hide` tinyint(1) NOT NULL COMMENT '1删除',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `question_id` (`question_id`) USING BTREE,
  KEY `answer_id` (`answer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题投诉表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_question_complain`
--

LOCK TABLES `aws_question_complain` WRITE;
/*!40000 ALTER TABLE `aws_question_complain` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_question_complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_question_focus`
--

DROP TABLE IF EXISTS `aws_question_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_question_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`focus_id`),
  KEY `question_id` (`question_id`),
  KEY `question_uid` (`question_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_question_focus`
--

LOCK TABLES `aws_question_focus` WRITE;
/*!40000 ALTER TABLE `aws_question_focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_question_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_question_invite`
--

DROP TABLE IF EXISTS `aws_question_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_question_invite` (
  `question_invite_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) NOT NULL COMMENT '问题ID',
  `sender_uid` int(11) NOT NULL,
  `recipients_uid` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '受邀Email',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `available_time` int(10) DEFAULT '0' COMMENT '生效时间',
  PRIMARY KEY (`question_invite_id`),
  KEY `question_id` (`question_id`),
  KEY `sender_uid` (`sender_uid`),
  KEY `recipients_uid` (`recipients_uid`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邀请问答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_question_invite`
--

LOCK TABLES `aws_question_invite` WRITE;
/*!40000 ALTER TABLE `aws_question_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_question_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_question_thanks`
--

DROP TABLE IF EXISTS `aws_question_thanks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_question_thanks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `question_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_question_thanks`
--

LOCK TABLES `aws_question_thanks` WRITE;
/*!40000 ALTER TABLE `aws_question_thanks` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_question_thanks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_question_uninterested`
--

DROP TABLE IF EXISTS `aws_question_uninterested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_question_uninterested` (
  `interested_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`interested_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题不感兴趣表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_question_uninterested`
--

LOCK TABLES `aws_question_uninterested` WRITE;
/*!40000 ALTER TABLE `aws_question_uninterested` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_question_uninterested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_received_email`
--

DROP TABLE IF EXISTS `aws_received_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_received_email` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `message_id` varchar(255) NOT NULL,
  `date` int(10) NOT NULL,
  `from` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `question_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `config_id` (`config_id`),
  KEY `message_id` (`message_id`),
  KEY `date` (`date`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已导入邮件列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_received_email`
--

LOCK TABLES `aws_received_email` WRITE;
/*!40000 ALTER TABLE `aws_received_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_received_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_receiving_email_config`
--

DROP TABLE IF EXISTS `aws_receiving_email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_receiving_email_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(10) NOT NULL,
  `server` varchar(255) NOT NULL,
  `ssl` tinyint(1) NOT NULL DEFAULT '0',
  `port` smallint(5) DEFAULT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid` int(10) NOT NULL,
  `access_key` varchar(32) NOT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `server` (`server`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件账号列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_receiving_email_config`
--

LOCK TABLES `aws_receiving_email_config` WRITE;
/*!40000 ALTER TABLE `aws_receiving_email_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_receiving_email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_redirect`
--

DROP TABLE IF EXISTS `aws_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_redirect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT '0',
  `target_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_redirect`
--

LOCK TABLES `aws_redirect` WRITE;
/*!40000 ALTER TABLE `aws_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_related_links`
--

DROP TABLE IF EXISTS `aws_related_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_related_links` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `link` varchar(255) NOT NULL,
  `add_time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `item_type` (`item_type`),
  KEY `item_id` (`item_id`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_related_links`
--

LOCK TABLES `aws_related_links` WRITE;
/*!40000 ALTER TABLE `aws_related_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_related_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_related_topic`
--

DROP TABLE IF EXISTS `aws_related_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_related_topic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT '0' COMMENT '话题 ID',
  `related_id` int(11) DEFAULT '0' COMMENT '相关话题 ID',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `related_id` (`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_related_topic`
--

LOCK TABLES `aws_related_topic` WRITE;
/*!40000 ALTER TABLE `aws_related_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_related_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_report`
--

DROP TABLE IF EXISTS `aws_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '举报用户id',
  `type` varchar(50) DEFAULT NULL COMMENT '类别',
  `target_id` int(11) DEFAULT '0' COMMENT 'ID',
  `reason` varchar(255) DEFAULT NULL COMMENT '举报理由',
  `url` varchar(255) DEFAULT NULL,
  `add_time` int(11) DEFAULT '0' COMMENT '举报时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否处理',
  PRIMARY KEY (`id`),
  KEY `add_time` (`add_time`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_report`
--

LOCK TABLES `aws_report` WRITE;
/*!40000 ALTER TABLE `aws_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_reputation_category`
--

DROP TABLE IF EXISTS `aws_reputation_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_reputation_category` (
  `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '0',
  `category_id` smallint(4) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  `reputation` int(10) DEFAULT '0',
  `thanks_count` int(10) DEFAULT '0',
  `agree_count` int(10) DEFAULT '0',
  `question_count` int(10) DEFAULT '0',
  PRIMARY KEY (`auto_id`),
  UNIQUE KEY `uid_category_id` (`uid`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_reputation_category`
--

LOCK TABLES `aws_reputation_category` WRITE;
/*!40000 ALTER TABLE `aws_reputation_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_reputation_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_reputation_topic`
--

DROP TABLE IF EXISTS `aws_reputation_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_reputation_topic` (
  `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题ID',
  `topic_count` int(10) DEFAULT '0' COMMENT '威望问题话题计数',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `agree_count` int(10) DEFAULT '0' COMMENT '赞成',
  `thanks_count` int(10) DEFAULT '0' COMMENT '感谢',
  `reputation` int(10) DEFAULT '0',
  PRIMARY KEY (`auto_id`),
  KEY `topic_count` (`topic_count`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`topic_id`),
  KEY `reputation` (`reputation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_reputation_topic`
--

LOCK TABLES `aws_reputation_topic` WRITE;
/*!40000 ALTER TABLE `aws_reputation_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_reputation_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_school`
--

DROP TABLE IF EXISTS `aws_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_school` (
  `school_id` int(11) NOT NULL COMMENT '自增ID',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '学校类型ID',
  `school_code` int(11) DEFAULT NULL COMMENT '学校编码',
  `school_name` varchar(64) DEFAULT NULL COMMENT '学校名称',
  `area_code` int(11) DEFAULT NULL COMMENT '地区代码',
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_school`
--

LOCK TABLES `aws_school` WRITE;
/*!40000 ALTER TABLE `aws_school` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_search_cache`
--

DROP TABLE IF EXISTS `aws_search_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_search_cache` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL,
  `data` mediumtext NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_search_cache`
--

LOCK TABLES `aws_search_cache` WRITE;
/*!40000 ALTER TABLE `aws_search_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_search_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_sessions`
--

DROP TABLE IF EXISTS `aws_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_sessions` (
  `id` varchar(32) NOT NULL,
  `modified` int(10) NOT NULL,
  `data` text NOT NULL,
  `lifetime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modified` (`modified`),
  KEY `lifetime` (`lifetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_sessions`
--

LOCK TABLES `aws_sessions` WRITE;
/*!40000 ALTER TABLE `aws_sessions` DISABLE KEYS */;
INSERT INTO `aws_sessions` VALUES ('4u4edirkkn4hfrsp9dv86jl9j2',1577325346,'vjg__Anwsion|a:2:{s:11:\"client_info\";a:3:{s:12:\"__CLIENT_UID\";i:1;s:18:\"__CLIENT_USER_NAME\";s:5:\"admin\";s:17:\"__CLIENT_PASSWORD\";s:32:\"4477b00dd1cbf792325d89671a8a88b2\";}s:10:\"permission\";a:21:{s:16:\"is_administortar\";s:1:\"1\";s:12:\"is_moderator\";s:1:\"1\";s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:12:\"edit_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";s:14:\"publish_column\";s:1:\"1\";s:11:\"edit_column\";s:1:\"1\";s:9:\"down_flie\";s:1:\"1\";s:10:\"is_service\";s:1:\"1\";s:14:\"publish_ticket\";s:1:\"1\";s:15:\"publish_project\";s:1:\"1\";}}',1440);
/*!40000 ALTER TABLE `aws_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_sysaccount`
--

DROP TABLE IF EXISTS `aws_sysaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_sysaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` smallint(1) DEFAULT NULL COMMENT '1入账2出账',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `total` decimal(10,2) DEFAULT NULL COMMENT '总余额',
  `uid` int(11) DEFAULT NULL COMMENT '打款人id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_sysaccount`
--

LOCK TABLES `aws_sysaccount` WRITE;
/*!40000 ALTER TABLE `aws_sysaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_sysaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_system_setting`
--

DROP TABLE IF EXISTS `aws_system_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `varname` varchar(255) NOT NULL COMMENT '字段名',
  `value` text COMMENT '变量值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `varname` (`varname`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COMMENT='系统设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_system_setting`
--

LOCK TABLES `aws_system_setting` WRITE;
/*!40000 ALTER TABLE `aws_system_setting` DISABLE KEYS */;
INSERT INTO `aws_system_setting` VALUES (1,'db_engine','s:6:\"InnoDB\";'),(2,'site_name','s:8:\"WeCenter\";'),(3,'description','s:30:\"WeCenter 社交化知识社区\";'),(4,'keywords','s:47:\"WeCenter,知识社区,社交社区,问答社区\";'),(5,'brand_name','s:0:\"\";'),(6,'sensitive_words','s:0:\"\";'),(7,'def_focus_uids','s:1:\"1\";'),(8,'answer_edit_time','s:2:\"30\";'),(9,'cache_level_high','s:2:\"60\";'),(10,'cache_level_normal','s:3:\"600\";'),(11,'cache_level_low','s:4:\"1800\";'),(12,'unread_flush_interval','s:3:\"100\";'),(13,'newer_invitation_num','s:1:\"5\";'),(14,'index_per_page','s:2:\"20\";'),(15,'from_email','s:19:\"admin@oldboyedu.com\";'),(16,'img_url','s:0:\"\";'),(17,'upload_url','s:38:\"https://wecenter.oldboyedu.com/uploads\";'),(18,'upload_dir','s:22:\"/code/wecenter/uploads\";'),(19,'ui_style','s:7:\"default\";'),(20,'uninterested_fold','s:1:\"5\";'),(21,'sina_akey','s:0:\"\";'),(22,'sina_skey','s:0:\"\";'),(23,'sina_weibo_enabled','s:1:\"N\";'),(24,'answer_unique','s:1:\"N\";'),(25,'notifications_per_page','s:2:\"10\";'),(26,'contents_per_page','s:2:\"10\";'),(27,'hot_question_period','s:1:\"7\";'),(28,'category_display_mode','s:4:\"icon\";'),(29,'recommend_users_number','s:1:\"6\";'),(30,'ucenter_enabled','s:1:\"N\";'),(31,'register_valid_type','s:5:\"email\";'),(32,'best_answer_day','s:2:\"30\";'),(33,'answer_self_question','s:1:\"Y\";'),(34,'censoruser','s:5:\"admin\";'),(35,'best_answer_min_count','s:1:\"3\";'),(36,'reputation_function','s:78:\"[最佳答案]*3+[赞同]*1-[反对]*1+[发起者赞同]*2-[发起者反对]*1\";'),(37,'db_version','s:8:\"20190612\";'),(38,'statistic_code','s:0:\"\";'),(39,'upload_enable','s:1:\"Y\";'),(40,'answer_length_lower','s:1:\"2\";'),(41,'quick_publish','s:1:\"Y\";'),(42,'register_type','s:4:\"open\";'),(43,'question_title_limit','s:3:\"100\";'),(44,'register_seccode','s:1:\"Y\";'),(45,'admin_login_seccode','s:1:\"Y\";'),(46,'comment_limit','s:1:\"0\";'),(47,'backup_dir',''),(48,'best_answer_reput','s:2:\"20\";'),(49,'publisher_reputation_factor','s:2:\"10\";'),(50,'request_route_custom','s:0:\"\";'),(51,'upload_size_limit','s:3:\"512\";'),(52,'upload_avatar_size_limit','s:3:\"512\";'),(53,'topic_title_limit','s:2:\"12\";'),(54,'url_rewrite_enable','s:1:\"N\";'),(55,'best_agree_min_count','s:1:\"3\";'),(56,'site_close','s:1:\"N\";'),(57,'close_notice','s:39:\"站点已关闭，管理员请登录。\";'),(58,'qq_login_enabled','s:1:\"N\";'),(59,'qq_login_app_id',''),(60,'qq_login_app_key',''),(61,'integral_system_enabled','s:1:\"N\";'),(62,'integral_system_config_register','s:4:\"2000\";'),(63,'integral_system_config_profile','s:3:\"100\";'),(64,'integral_system_config_invite','s:3:\"200\";'),(65,'integral_system_config_best_answer','s:3:\"200\";'),(66,'integral_system_config_answer_fold','s:3:\"-50\";'),(67,'integral_system_config_new_question','s:3:\"-20\";'),(68,'integral_system_config_new_answer','s:2:\"-5\";'),(69,'integral_system_config_thanks','s:3:\"-10\";'),(70,'integral_system_config_invite_answer','s:3:\"-10\";'),(71,'username_rule','s:1:\"1\";'),(72,'username_length_min','s:1:\"2\";'),(73,'username_length_max','s:2:\"14\";'),(74,'category_enable','s:1:\"Y\";'),(75,'integral_unit','s:6:\"金币\";'),(76,'nav_menu_show_child','s:1:\"1\";'),(77,'anonymous_enable','s:1:\"Y\";'),(78,'report_reason','s:50:\"广告/SPAM\\n违规内容\\n文不对题\\n重复发问\";'),(79,'allowed_upload_types','s:41:\"jpg,jpeg,png,gif,zip,doc,docx,rar,pdf,psd\";'),(80,'site_announce','s:0:\"\";'),(81,'icp_beian','s:0:\"\";'),(82,'report_message_uid','s:1:\"1\";'),(83,'today_topics','s:0:\"\";'),(84,'welcome_recommend_users','s:0:\"\";'),(85,'welcome_message_pm','s:180:\"尊敬的{username}，您已经注册成为{sitename}的会员，请您在发表言论时，遵守当地法律法规。\\n如果您有什么疑问可以联系管理员。\\n\\n{sitename}\";'),(86,'time_style','s:1:\"Y\";'),(87,'reputation_log_factor','s:1:\"3\";'),(88,'advanced_editor_enable','s:1:\"Y\";'),(89,'auto_question_lock_day','s:1:\"0\";'),(90,'default_timezone','s:9:\"Etc/GMT-8\";'),(91,'reader_questions_last_days','s:2:\"30\";'),(92,'reader_questions_agree_count','s:2:\"10\"'),(93,'weixin_mp_token','s:0:\"\";'),(94,'new_user_email_setting','a:2:{s:9:\"FOLLOW_ME\";s:1:\"N\";s:10:\"NEW_ANSWER\";s:1:\"N\";}'),(95,'new_user_notification_setting','a:0:{}'),(96,'user_action_history_fresh_upgrade','s:1:\"Y\";'),(97,'cache_dir','s:0:\"\";'),(98,'ucenter_charset','s:5:\"UTF-8\";'),(99,'question_topics_limit','s:2:\"10\";'),(100,'mail_config','a:7:{s:9:\"transport\";s:8:\"sendmail\";s:7:\"charset\";s:5:\"UTF-8\";s:6:\"server\";s:0:\"\";s:3:\"ssl\";s:1:\"0\";s:4:\"port\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}'),(101,'auto_create_social_topics','s:1:\"N\";'),(102,'weixin_subscribe_message_key','s:0:\"\";'),(103,'weixin_no_result_message_key','s:0:\"\";'),(104,'weixin_mp_menu','a:0:{}'),(105,'new_question_force_add_topic','s:1:\"N\";'),(106,'unfold_question_comments','s:1:\"N\";'),(107,'report_diagnostics','s:1:\"Y\";'),(108,'weixin_app_id','s:0:\"\";'),(109,'weixin_app_secret','s:0:\"\";'),(110,'weixin_account_role','s:7:\"base\";'),(111,'weibo_msg_enabled','s:1:\"N\";'),(112,'weibo_msg_published_user','a:0:\"\";'),(113,'admin_notifications','a:11:{s:15:\"answer_approval\";i:0;s:17:\"question_approval\";i:0;s:16:\"article_approval\";i:0;s:24:\"article_comment_approval\";i:0;s:23:\"unverified_modify_count\";i:0;s:11:\"user_report\";i:0;s:17:\"register_approval\";i:0;s:15:\"verify_approval\";i:0;s:12:\"last_version\";a:2:{s:7:\"version\";s:5:\"3.3.4\";s:9:\"build_day\";s:8:\"20190807\";}s:10:\"sina_users\";N;s:19:\"receive_email_error\";N;}'),(114,'slave_mail_config','s:0:\"\";'),(115,'receiving_email_global_config','a:2:{s:7:\"enabled\";s:1:\"N\";s:12:\"publish_user\";N;}'),(116,'last_sent_valid_email_id','i:0;'),(117,'google_login_enabled','s:1:\"N\";'),(118,'google_client_id','s:0:\"\";'),(119,'google_client_secret','s:0:\"\";'),(120,'facebook_login_enabled','s:1:\"N\";'),(121,'facebook_app_id','s:0:\"\";'),(122,'facebook_app_secret','s:0:\"\";'),(123,'twitter_login_enabled','s:1:\"N\";'),(124,'twitter_consumer_key','s:0:\"\";'),(125,'twitter_consumer_secret','s:0:\"\";'),(126,'weixin_encoding_aes_key','s:0:\"\";'),(127,'integral_system_config_answer_change_source','s:1:\"Y\";'),(128,'enable_help_center','s:1:\"N\";'),(129,'ucenter_path','s:0:\"\";'),(130,'wecenter_website','s:1:\"N\";'),(131,'weixin_build_account','s:1:\"N\";'),(132,'enable_column','s:1:\"Y\";'),(133,'draft_enabled','s:1:\"N\";'),(134,'project_enabled','s:1:\"N\";'),(135,'alipay_partner','s:0:\"\";'),(136,'alipay_key','s:0:\"\";'),(137,'alipay_seller_email','s:0:\"\";'),(138,'alipay_sign_type','s:3:\"MD5\";'),(139,'alipay_input_charset','s:5:\"utf-8\";'),(140,'alipay_transport','s:5:\"https\";'),(141,'alipay_private_key','s:0:\"\";'),(142,'alipay_ali_public_key','s:0:\"\";'),(143,'ticket_enabled','s:1:\"N\";'),(144,'payment','s:1:\"N\";'),(145,'del_reason','s:18:\"发布不良内容\";'),(146,'geetest_id','s:32:\"a241dea1b2b7e898276a912af75e9039\";'),(147,'geetest_key','s:32:\"6917453970f13d6e34135d89b794862c\";'),(148,'money_config','a:2:{s:6:\"status\";s:1:\"1\";s:5:\"money\";s:26:\"1,2,5,10,20,50,100,200,500\";}'),(149,'pay_config','a:3:{s:6:\"alipay\";a:5:{s:6:\"status\";s:1:\"1\";s:5:\"debug\";s:1:\"1\";s:6:\"app_id\";s:0:\"\";s:10:\"public_key\";s:0:\"\";s:11:\"private_key\";s:0:\"\";}s:6:\"wechat\";a:5:{s:6:\"status\";s:1:\"1\";s:5:\"debug\";s:1:\"1\";s:6:\"app_id\";s:0:\"\";s:6:\"mch_id\";s:0:\"\";s:7:\"mch_key\";s:0:\"\";}s:5:\"yxpay\";a:1:{s:6:\"status\";s:1:\"1\";}}'),(150,'sms_config','a:2:{s:2:\"dy\";a:5:{s:6:\"status\";s:1:\"N\";s:11:\"accessKeyId\";s:0:\"\";s:15:\"accessKeySecret\";s:0:\"\";s:8:\"SignName\";s:0:\"\";s:12:\"TemplateCode\";s:0:\"\";}s:2:\"sy\";a:3:{s:6:\"status\";s:1:\"Y\";s:7:\"account\";s:0:\"\";s:4:\"pswd\";s:0:\"\";}}'),(151,'',''),(152,'register_agreement','s:1626:\"当您申请用户时，表示您已经同意遵守本规章。\r\n欢迎您加入本站点参与交流和讨论，本站点为社区，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：\r\n\r\n一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：\r\n　（一）煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　（二）煽动颠覆国家政权，推翻社会主义制度的；\r\n　（三）煽动分裂国家、破坏国家统一的；\r\n　（四）煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　（八）损害国家机关信誉的；\r\n　（九）其他违反宪法和法律行政法规的；\r\n　（十）进行商业广告行为的。\r\n\r\n二、互相尊重，对自己的言论和行为负责。\r\n三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。\r\n四、禁止以任何方式对本站进行各种破坏行为。\r\n五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。\";');
/*!40000 ALTER TABLE `aws_system_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_ticket`
--

DROP TABLE IF EXISTS `aws_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `status` enum('pending','closed') NOT NULL DEFAULT 'pending',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `message` text,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` enum('valid','invalid','undefined') NOT NULL DEFAULT 'undefined',
  `service` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` bigint(11) unsigned DEFAULT NULL,
  `source` enum('local','weibo','weixin','email') NOT NULL DEFAULT 'local',
  `question_id` int(10) unsigned DEFAULT NULL,
  `weibo_msg_id` bigint(20) unsigned DEFAULT NULL,
  `received_email_id` int(10) unsigned DEFAULT NULL,
  `reply_time` int(10) unsigned NOT NULL DEFAULT '0',
  `close_time` int(10) unsigned NOT NULL DEFAULT '0',
  `has_attach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `status` (`status`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `rating` (`rating`),
  KEY `service` (`service`),
  KEY `source` (`source`),
  KEY `question_id` (`question_id`),
  KEY `weibo_msg_id` (`weibo_msg_id`),
  KEY `received_email_id` (`received_email_id`),
  KEY `reply_time` (`reply_time`),
  KEY `close_time` (`close_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_ticket`
--

LOCK TABLES `aws_ticket` WRITE;
/*!40000 ALTER TABLE `aws_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_ticket_invite`
--

DROP TABLE IF EXISTS `aws_ticket_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_ticket_invite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `sender_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `sender_uid` (`sender_uid`),
  KEY `recipient_uid` (`recipient_uid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_ticket_invite`
--

LOCK TABLES `aws_ticket_invite` WRITE;
/*!40000 ALTER TABLE `aws_ticket_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_ticket_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_ticket_log`
--

DROP TABLE IF EXISTS `aws_ticket_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_ticket_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `action` varchar(255) NOT NULL,
  `data` text,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `uid` (`uid`),
  KEY `action` (`action`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_ticket_log`
--

LOCK TABLES `aws_ticket_log` WRITE;
/*!40000 ALTER TABLE `aws_ticket_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_ticket_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_ticket_reply`
--

DROP TABLE IF EXISTS `aws_ticket_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_ticket_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `message` text,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` bigint(11) unsigned DEFAULT NULL,
  `has_attach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_ticket_reply`
--

LOCK TABLES `aws_ticket_reply` WRITE;
/*!40000 ALTER TABLE `aws_ticket_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_ticket_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_topic`
--

DROP TABLE IF EXISTS `aws_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题id',
  `topic_title` varchar(64) DEFAULT NULL COMMENT '话题标题',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `discuss_count` int(11) DEFAULT '0' COMMENT '讨论计数',
  `topic_description` text COMMENT '话题描述',
  `topic_pic` varchar(255) DEFAULT NULL COMMENT '话题图片',
  `topic_lock` tinyint(2) NOT NULL DEFAULT '0' COMMENT '话题是否锁定 1 锁定 0 未锁定',
  `focus_count` int(11) DEFAULT '0' COMMENT '关注计数',
  `user_related` tinyint(1) DEFAULT '0' COMMENT '是否被用户关联',
  `url_token` varchar(32) DEFAULT NULL,
  `merged_id` int(11) DEFAULT '0',
  `seo_title` varchar(255) DEFAULT NULL,
  `parent_id` int(10) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '0',
  `discuss_count_last_week` int(10) DEFAULT '0',
  `discuss_count_last_month` int(10) DEFAULT '0',
  `discuss_count_update` int(10) DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic_title` (`topic_title`),
  KEY `url_token` (`url_token`),
  KEY `merged_id` (`merged_id`),
  KEY `discuss_count` (`discuss_count`),
  KEY `add_time` (`add_time`),
  KEY `user_related` (`user_related`),
  KEY `focus_count` (`focus_count`),
  KEY `topic_lock` (`topic_lock`),
  KEY `parent_id` (`parent_id`),
  KEY `is_parent` (`is_parent`),
  KEY `discuss_count_last_week` (`discuss_count_last_week`),
  KEY `discuss_count_last_month` (`discuss_count_last_month`),
  KEY `discuss_count_update` (`discuss_count_update`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='话题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_topic`
--

LOCK TABLES `aws_topic` WRITE;
/*!40000 ALTER TABLE `aws_topic` DISABLE KEYS */;
INSERT INTO `aws_topic` VALUES (1,'默认话题',NULL,0,'默认话题',NULL,0,0,0,NULL,0,NULL,0,0,0,0,0);
/*!40000 ALTER TABLE `aws_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_topic_focus`
--

DROP TABLE IF EXISTS `aws_topic_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_topic_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `topic_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`focus_id`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`topic_id`),
  KEY `topic_uid` (`topic_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话题关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_topic_focus`
--

LOCK TABLES `aws_topic_focus` WRITE;
/*!40000 ALTER TABLE `aws_topic_focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_topic_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_topic_merge`
--

DROP TABLE IF EXISTS `aws_topic_merge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_topic_merge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL DEFAULT '0',
  `target_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`),
  KEY `target_id` (`target_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_topic_merge`
--

LOCK TABLES `aws_topic_merge` WRITE;
/*!40000 ALTER TABLE `aws_topic_merge` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_topic_merge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_topic_relation`
--

DROP TABLE IF EXISTS `aws_topic_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_topic_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题id',
  `item_id` int(11) DEFAULT '0',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `type` varchar(16) DEFAULT NULL,
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_topic_relation`
--

LOCK TABLES `aws_topic_relation` WRITE;
/*!40000 ALTER TABLE `aws_topic_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_topic_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_user_account`
--

DROP TABLE IF EXISTS `aws_user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_user_account` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `frozen_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结余额',
  `deal_pwd` varchar(255) NOT NULL COMMENT '交易密码',
  `deal_salt` varchar(255) NOT NULL COMMENT '盐值',
  `totalRecharge` decimal(11,2) NOT NULL COMMENT '充值的总额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_user_account`
--

LOCK TABLES `aws_user_account` WRITE;
/*!40000 ALTER TABLE `aws_user_account` DISABLE KEYS */;
INSERT INTO `aws_user_account` VALUES (1,0.00,0.00,'','',0.00);
/*!40000 ALTER TABLE `aws_user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_user_action_history`
--

DROP TABLE IF EXISTS `aws_user_action_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_user_action_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `associate_type` tinyint(1) DEFAULT NULL COMMENT '关联类型: 1 问题 2 回答 3 评论 4 话题',
  `associate_action` smallint(3) DEFAULT NULL COMMENT '操作类型',
  `associate_id` int(11) DEFAULT NULL COMMENT '关联ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `associate_attached` int(11) DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT '0' COMMENT '是否匿名',
  `fold_status` tinyint(1) DEFAULT '0',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`history_id`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `associate_id` (`associate_id`),
  KEY `anonymous` (`anonymous`),
  KEY `fold_status` (`fold_status`),
  KEY `associate` (`associate_type`,`associate_action`),
  KEY `associate_attached` (`associate_attached`),
  KEY `associate_with_id` (`associate_id`,`associate_type`,`associate_action`),
  KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户操作记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_user_action_history`
--

LOCK TABLES `aws_user_action_history` WRITE;
/*!40000 ALTER TABLE `aws_user_action_history` DISABLE KEYS */;
INSERT INTO `aws_user_action_history` VALUES (1,1,1,501,1,1577278084,-1,0,0,0);
/*!40000 ALTER TABLE `aws_user_action_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_user_action_history_data`
--

DROP TABLE IF EXISTS `aws_user_action_history_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_user_action_history_data` (
  `history_id` int(11) unsigned NOT NULL,
  `associate_content` text,
  `associate_attached` text,
  `addon_data` text COMMENT '附加数据',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_user_action_history_data`
--

LOCK TABLES `aws_user_action_history_data` WRITE;
/*!40000 ALTER TABLE `aws_user_action_history_data` DISABLE KEYS */;
INSERT INTO `aws_user_action_history_data` VALUES (1,'三体1','','',0);
/*!40000 ALTER TABLE `aws_user_action_history_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_user_action_history_fresh`
--

DROP TABLE IF EXISTS `aws_user_action_history_fresh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_user_action_history_fresh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NOT NULL,
  `associate_id` int(11) NOT NULL,
  `associate_type` tinyint(1) NOT NULL,
  `associate_action` smallint(3) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`id`),
  KEY `associate` (`associate_type`,`associate_action`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `history_id` (`history_id`),
  KEY `associate_with_id` (`id`,`associate_type`,`associate_action`),
  KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`),
  KEY `anonymous` (`anonymous`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_user_action_history_fresh`
--

LOCK TABLES `aws_user_action_history_fresh` WRITE;
/*!40000 ALTER TABLE `aws_user_action_history_fresh` DISABLE KEYS */;
INSERT INTO `aws_user_action_history_fresh` VALUES (1,1,1,1,501,1577278084,1,0,0);
/*!40000 ALTER TABLE `aws_user_action_history_fresh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_user_follow`
--

DROP TABLE IF EXISTS `aws_user_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_user_follow` (
  `follow_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fans_uid` int(11) DEFAULT NULL COMMENT '关注人的UID',
  `friend_uid` int(11) DEFAULT NULL COMMENT '被关注人的uid',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`follow_id`),
  KEY `fans_uid` (`fans_uid`),
  KEY `friend_uid` (`friend_uid`),
  KEY `user_follow` (`fans_uid`,`friend_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_user_follow`
--

LOCK TABLES `aws_user_follow` WRITE;
/*!40000 ALTER TABLE `aws_user_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_user_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_user_refund`
--

DROP TABLE IF EXISTS `aws_user_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_user_refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户id',
  `both_id` int(10) NOT NULL COMMENT '提现或者问题id',
  `type` tinyint(1) NOT NULL COMMENT '退款类型：1提现2悬赏',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `remarks` varchar(255) NOT NULL COMMENT '备注',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退款记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_user_refund`
--

LOCK TABLES `aws_user_refund` WRITE;
/*!40000 ALTER TABLE `aws_user_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_user_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_user_withdraw`
--

DROP TABLE IF EXISTS `aws_user_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_user_withdraw` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `bank` varchar(255) NOT NULL COMMENT '银行名称',
  `open_bank` varchar(255) NOT NULL COMMENT '开户行',
  `username` varchar(255) NOT NULL COMMENT '持卡人姓名',
  `mobile` char(11) NOT NULL COMMENT '银行预留手机号',
  `address` varchar(255) NOT NULL COMMENT '省市区',
  `identity` varchar(255) NOT NULL COMMENT '身份证号',
  `card` varchar(255) NOT NULL COMMENT '卡号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `status` tinyint(2) NOT NULL COMMENT '状态0申请1通过2拒绝3已转账',
  `remarks` varchar(255) NOT NULL COMMENT '备注',
  `addtime` int(10) NOT NULL,
  `updatetime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户提现表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_user_withdraw`
--

LOCK TABLES `aws_user_withdraw` WRITE;
/*!40000 ALTER TABLE `aws_user_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_user_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users`
--

DROP TABLE IF EXISTS `aws_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户的 UID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT 'EMAIL',
  `mobile` varchar(16) DEFAULT NULL COMMENT '用户手机',
  `password` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(16) DEFAULT NULL COMMENT '用户附加混淆码',
  `avatar_file` varchar(128) DEFAULT NULL COMMENT '头像文件',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` int(10) DEFAULT NULL COMMENT '生日',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `job_id` int(10) DEFAULT '0' COMMENT '职业ID',
  `reg_time` int(10) DEFAULT NULL COMMENT '注册时间',
  `reg_ip` bigint(12) DEFAULT NULL COMMENT '注册IP',
  `last_login` int(10) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` bigint(12) DEFAULT NULL COMMENT '最后登录 IP',
  `online_time` int(10) DEFAULT '0' COMMENT '在线时间',
  `last_active` int(10) DEFAULT NULL COMMENT '最后活跃时间',
  `notification_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未读系统通知',
  `inbox_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未读短信息',
  `inbox_recv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-所有人可以发给我,1-我关注的人',
  `fans_count` int(10) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `friend_count` int(10) NOT NULL DEFAULT '0' COMMENT '观众数',
  `invite_count` int(10) NOT NULL DEFAULT '0' COMMENT '邀请我回答数量',
  `article_count` int(10) NOT NULL DEFAULT '0' COMMENT '文章数量',
  `question_count` int(10) NOT NULL DEFAULT '0' COMMENT '问题数量',
  `answer_count` int(10) NOT NULL DEFAULT '0' COMMENT '回答数量',
  `topic_focus_count` int(10) NOT NULL DEFAULT '0' COMMENT '关注话题数量',
  `invitation_available` int(10) NOT NULL DEFAULT '0' COMMENT '邀请数量',
  `group_id` int(10) DEFAULT '0' COMMENT '用户组',
  `reputation_group` int(10) DEFAULT '0' COMMENT '威望对应组',
  `forbidden` tinyint(1) DEFAULT '0' COMMENT '是否禁止用户',
  `valid_email` tinyint(1) DEFAULT '0' COMMENT '邮箱验证',
  `is_first_login` tinyint(1) DEFAULT '1' COMMENT '首次登录标记',
  `agree_count` int(10) DEFAULT '0' COMMENT '赞同数量',
  `thanks_count` int(10) DEFAULT '0' COMMENT '感谢数量',
  `views_count` int(10) DEFAULT '0' COMMENT '个人主页查看数量',
  `reputation` int(10) DEFAULT '0' COMMENT '威望',
  `reputation_update_time` int(10) DEFAULT '0' COMMENT '威望更新',
  `weibo_visit` tinyint(1) DEFAULT '1' COMMENT '微博允许访问',
  `integral` int(10) DEFAULT '0',
  `draft_count` int(10) DEFAULT NULL,
  `common_email` varchar(255) DEFAULT NULL COMMENT '常用邮箱',
  `url_token` varchar(32) DEFAULT NULL COMMENT '个性网址',
  `url_token_update` int(10) DEFAULT '0',
  `verified` varchar(32) DEFAULT NULL,
  `default_timezone` varchar(32) DEFAULT NULL,
  `email_settings` varchar(255) DEFAULT '',
  `weixin_settings` varchar(255) DEFAULT '',
  `recent_topics` text,
  `theme` varchar(64) DEFAULT NULL COMMENT '主题',
  `column_count` int(10) NOT NULL DEFAULT '0' COMMENT '专栏数量',
  `skin` varchar(32) DEFAULT 'common.css' COMMENT '皮肤',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  `reason` varchar(255) DEFAULT '' COMMENT '删除/封禁原因',
  `valid_mobile` varchar(255) DEFAULT '' COMMENT '手机认证',
  PRIMARY KEY (`uid`),
  KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `reputation` (`reputation`),
  KEY `reputation_update_time` (`reputation_update_time`),
  KEY `group_id` (`group_id`),
  KEY `agree_count` (`agree_count`),
  KEY `thanks_count` (`thanks_count`),
  KEY `forbidden` (`forbidden`),
  KEY `valid_email` (`valid_email`),
  KEY `last_active` (`last_active`),
  KEY `integral` (`integral`),
  KEY `url_token` (`url_token`),
  KEY `verified` (`verified`),
  KEY `answer_count` (`answer_count`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users`
--

LOCK TABLES `aws_users` WRITE;
/*!40000 ALTER TABLE `aws_users` DISABLE KEYS */;
INSERT INTO `aws_users` VALUES (1,'admin','admin@oldboyedu.com',NULL,'4477b00dd1cbf792325d89671a8a88b2','qrvo',NULL,3,NULL,'','',0,1577277554,167772161,1577322284,167772161,3386,1577325346,0,0,0,0,0,0,1,0,0,0,10,1,5,0,1,0,0,0,0,0,1577322445,1,2000,0,NULL,NULL,0,NULL,'','','',NULL,NULL,0,'common.css',0,'','');
/*!40000 ALTER TABLE `aws_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_attrib`
--

DROP TABLE IF EXISTS `aws_users_attrib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_attrib` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `introduction` varchar(255) DEFAULT NULL COMMENT '个人简介',
  `signature` varchar(255) DEFAULT NULL COMMENT '个人签名',
  `qq` bigint(15) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除0正常1删除',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户附加属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_attrib`
--

LOCK TABLES `aws_users_attrib` WRITE;
/*!40000 ALTER TABLE `aws_users_attrib` DISABLE KEYS */;
INSERT INTO `aws_users_attrib` VALUES (1,1,NULL,'',0,'',0);
/*!40000 ALTER TABLE `aws_users_attrib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_facebook`
--

DROP TABLE IF EXISTS `aws_users_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_facebook` (
  `id` bigint(20) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `timezone` tinyint(3) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expires_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_facebook`
--

LOCK TABLES `aws_users_facebook` WRITE;
/*!40000 ALTER TABLE `aws_users_facebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_users_facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_google`
--

DROP TABLE IF EXISTS `aws_users_google`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_google` (
  `id` varchar(64) NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `access_token` varchar(128) DEFAULT NULL,
  `refresh_token` varchar(128) DEFAULT NULL,
  `expires_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_google`
--

LOCK TABLES `aws_users_google` WRITE;
/*!40000 ALTER TABLE `aws_users_google` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_users_google` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_group`
--

DROP TABLE IF EXISTS `aws_users_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) DEFAULT '0' COMMENT '0-会员组 1-系统组',
  `custom` tinyint(1) DEFAULT '0' COMMENT '是否自定义',
  `group_name` varchar(50) NOT NULL,
  `reputation_lower` int(11) DEFAULT '0',
  `reputation_higer` int(11) DEFAULT '0',
  `reputation_factor` float DEFAULT '0' COMMENT '威望系数',
  `permission` text COMMENT '权限设置',
  PRIMARY KEY (`group_id`),
  KEY `type` (`type`),
  KEY `custom` (`custom`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_group`
--

LOCK TABLES `aws_users_group` WRITE;
/*!40000 ALTER TABLE `aws_users_group` DISABLE KEYS */;
INSERT INTO `aws_users_group` VALUES (1,0,0,'超级管理员',0,0,5,'a:21:{s:16:\"is_administortar\";s:1:\"1\";s:12:\"is_moderator\";s:1:\"1\";s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:12:\"edit_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";s:14:\"publish_column\";s:1:\"1\";s:11:\"edit_column\";s:1:\"1\";s:9:\"down_flie\";s:1:\"1\";s:10:\"is_service\";s:1:\"1\";s:14:\"publish_ticket\";s:1:\"1\";s:15:\"publish_project\";s:1:\"1\";}'),(2,0,0,'前台管理员',0,0,4,'a:16:{s:12:\"is_moderator\";s:1:\"1\";s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:12:\"edit_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";s:10:\"is_service\";s:1:\"1\";s:14:\"publish_ticket\";s:1:\"1\";}'),(3,0,0,'未验证会员',0,0,0,'a:7:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:11:\"human_valid\";s:1:\"1\";s:19:\"question_valid_hour\";s:1:\"2\";s:17:\"answer_valid_hour\";s:1:\"2\";s:10:\"is_service\";s:1:\"1\";s:14:\"publish_ticket\";s:1:\"1\";}'),(4,0,0,'普通会员',0,0,0,'a:5:{s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:19:\"question_valid_hour\";s:2:\"10\";s:17:\"answer_valid_hour\";s:2:\"10\";s:10:\"is_service\";s:1:\"1\";s:14:\"publish_ticket\";s:1:\"1\";}'),(5,1,0,'注册会员',0,100,1,'a:7:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:11:\"human_valid\";s:1:\"1\";s:19:\"question_valid_hour\";s:1:\"5\";s:17:\"answer_valid_hour\";s:1:\"5\";s:15:\"publish_comment\";s:1:\"1\";s:14:\"publish_ticket\";s:1:\"1\";}'),(6,1,0,'初级会员',100,200,1,'a:8:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:19:\"question_valid_hour\";s:1:\"5\";s:17:\"answer_valid_hour\";s:1:\"5\";s:15:\"publish_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";}'),(7,1,0,'中级会员',200,500,1,'a:9:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:10:\"edit_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}'),(8,1,0,'高级会员',500,1000,1,'a:11:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}'),(9,1,0,'核心会员',1000,999999,1,'a:12:{s:16:\"publish_question\";s:1:\"1\";s:21:\"publish_approval_time\";a:2:{s:5:\"start\";s:0:\"\";s:3:\"end\";s:0:\"\";}s:13:\"edit_question\";s:1:\"1\";s:10:\"edit_topic\";s:1:\"1\";s:12:\"manage_topic\";s:1:\"1\";s:12:\"create_topic\";s:1:\"1\";s:17:\"redirect_question\";s:1:\"1\";s:13:\"upload_attach\";s:1:\"1\";s:11:\"publish_url\";s:1:\"1\";s:15:\"publish_article\";s:1:\"1\";s:19:\"edit_question_topic\";s:1:\"1\";s:15:\"publish_comment\";s:1:\"1\";}'),(99,0,0,'游客',0,0,0,'a:9:{s:10:\"visit_site\";s:1:\"1\";s:13:\"visit_explore\";s:1:\"1\";s:12:\"search_avail\";s:1:\"1\";s:14:\"visit_question\";s:1:\"1\";s:11:\"visit_topic\";s:1:\"1\";s:13:\"visit_feature\";s:1:\"1\";s:12:\"visit_people\";s:1:\"1\";s:13:\"visit_chapter\";s:1:\"1\";s:11:\"answer_show\";s:1:\"1\";}');
/*!40000 ALTER TABLE `aws_users_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_notification_setting`
--

DROP TABLE IF EXISTS `aws_users_notification_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_notification_setting` (
  `notice_setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) NOT NULL,
  `data` text COMMENT '设置数据',
  PRIMARY KEY (`notice_setting_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知设定';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_notification_setting`
--

LOCK TABLES `aws_users_notification_setting` WRITE;
/*!40000 ALTER TABLE `aws_users_notification_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_users_notification_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_online`
--

DROP TABLE IF EXISTS `aws_users_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_online` (
  `uid` int(11) NOT NULL COMMENT '用户 ID',
  `last_active` int(11) DEFAULT '0' COMMENT '上次活动时间',
  `ip` bigint(12) DEFAULT '0' COMMENT '客户端ip',
  `active_url` varchar(255) DEFAULT NULL COMMENT '停留页面',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户客户端信息',
  KEY `uid` (`uid`),
  KEY `last_active` (`last_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_online`
--

LOCK TABLES `aws_users_online` WRITE;
/*!40000 ALTER TABLE `aws_users_online` DISABLE KEYS */;
INSERT INTO `aws_users_online` VALUES (1,1577325346,167772161,'https://wecenter.oldboyedu.com/','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36');
/*!40000 ALTER TABLE `aws_users_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_qq`
--

DROP TABLE IF EXISTS `aws_users_qq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_qq` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户在本地的UID',
  `nickname` varchar(64) DEFAULT NULL,
  `openid` varchar(128) DEFAULT '',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `access_token` varchar(64) DEFAULT NULL,
  `refresh_token` varchar(64) DEFAULT NULL,
  `expires_time` int(10) DEFAULT NULL,
  `figureurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `access_token` (`access_token`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_qq`
--

LOCK TABLES `aws_users_qq` WRITE;
/*!40000 ALTER TABLE `aws_users_qq` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_users_qq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_sina`
--

DROP TABLE IF EXISTS `aws_users_sina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_sina` (
  `id` bigint(11) NOT NULL COMMENT '新浪用户 ID',
  `uid` int(11) NOT NULL COMMENT '用户在本地的UID',
  `name` varchar(64) DEFAULT NULL COMMENT '微博昵称',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `description` text COMMENT '个人描述',
  `url` varchar(255) DEFAULT NULL COMMENT '用户博客地址',
  `profile_image_url` varchar(255) DEFAULT NULL COMMENT 'Sina 自定义头像地址',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `expires_time` int(10) DEFAULT '0' COMMENT '过期时间',
  `access_token` varchar(64) DEFAULT NULL,
  `last_msg_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`),
  KEY `last_msg_id` (`last_msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_sina`
--

LOCK TABLES `aws_users_sina` WRITE;
/*!40000 ALTER TABLE `aws_users_sina` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_users_sina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_twitter`
--

DROP TABLE IF EXISTS `aws_users_twitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_twitter` (
  `id` bigint(20) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `screen_name` varchar(128) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `time_zone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `access_token` varchar(255) NOT NULL DEFAULT 'a:2:{s:11:"oauth_token";s:0:"";s:18:"oauth_token_secret";s:0:"";}',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `access_token` (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_twitter`
--

LOCK TABLES `aws_users_twitter` WRITE;
/*!40000 ALTER TABLE `aws_users_twitter` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_users_twitter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_ucenter`
--

DROP TABLE IF EXISTS `aws_users_ucenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_ucenter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `uc_uid` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uc_uid` (`uc_uid`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_ucenter`
--

LOCK TABLES `aws_users_ucenter` WRITE;
/*!40000 ALTER TABLE `aws_users_ucenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_users_ucenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_users_weixin`
--

DROP TABLE IF EXISTS `aws_users_weixin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_users_weixin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `expires_in` int(10) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `scope` varchar(64) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '0',
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `add_time` int(10) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location_update` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `openid` (`openid`),
  KEY `expires_in` (`expires_in`),
  KEY `scope` (`scope`),
  KEY `sex` (`sex`),
  KEY `province` (`province`),
  KEY `city` (`city`),
  KEY `country` (`country`),
  KEY `add_time` (`add_time`),
  KEY `latitude` (`latitude`,`longitude`),
  KEY `location_update` (`location_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_users_weixin`
--

LOCK TABLES `aws_users_weixin` WRITE;
/*!40000 ALTER TABLE `aws_users_weixin` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_users_weixin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_verify_apply`
--

DROP TABLE IF EXISTS `aws_verify_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_verify_apply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `time` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text,
  `status` tinyint(1) DEFAULT '0',
  `type` varchar(16) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `name` (`name`,`status`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_verify_apply`
--

LOCK TABLES `aws_verify_apply` WRITE;
/*!40000 ALTER TABLE `aws_verify_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_verify_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_weibo_msg`
--

DROP TABLE IF EXISTS `aws_weibo_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_weibo_msg` (
  `id` bigint(20) NOT NULL,
  `created_at` int(10) NOT NULL,
  `msg_author_uid` bigint(20) NOT NULL,
  `text` varchar(255) NOT NULL,
  `access_key` varchar(32) NOT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  `weibo_uid` bigint(20) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`),
  KEY `uid` (`uid`),
  KEY `weibo_uid` (`weibo_uid`),
  KEY `question_id` (`question_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新浪微博消息列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_weibo_msg`
--

LOCK TABLES `aws_weibo_msg` WRITE;
/*!40000 ALTER TABLE `aws_weibo_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_weibo_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_weixin_accounts`
--

DROP TABLE IF EXISTS `aws_weixin_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_weixin_accounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weixin_mp_token` varchar(255) NOT NULL,
  `weixin_account_role` varchar(20) DEFAULT 'base',
  `weixin_app_id` varchar(255) DEFAULT '',
  `weixin_app_secret` varchar(255) DEFAULT '',
  `weixin_mp_menu` text,
  `weixin_subscribe_message_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `weixin_no_result_message_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `weixin_encoding_aes_key` varchar(43) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `weixin_mp_token` (`weixin_mp_token`),
  KEY `weixin_account_role` (`weixin_account_role`),
  KEY `weixin_app_id` (`weixin_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信多账号设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_weixin_accounts`
--

LOCK TABLES `aws_weixin_accounts` WRITE;
/*!40000 ALTER TABLE `aws_weixin_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_weixin_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_weixin_login`
--

DROP TABLE IF EXISTS `aws_weixin_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_weixin_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` int(10) NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `session_id` varchar(32) NOT NULL,
  `expire` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `token` (`token`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_weixin_login`
--

LOCK TABLES `aws_weixin_login` WRITE;
/*!40000 ALTER TABLE `aws_weixin_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_weixin_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_weixin_message`
--

DROP TABLE IF EXISTS `aws_weixin_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_weixin_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weixin_id` varchar(32) NOT NULL,
  `content` varchar(255) NOT NULL,
  `action` text,
  `time` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `weixin_id` (`weixin_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_weixin_message`
--

LOCK TABLES `aws_weixin_message` WRITE;
/*!40000 ALTER TABLE `aws_weixin_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_weixin_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_weixin_msg`
--

DROP TABLE IF EXISTS `aws_weixin_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_weixin_msg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_id` bigint(20) NOT NULL,
  `group_name` varchar(255) NOT NULL DEFAULT '未分组',
  `status` varchar(15) NOT NULL DEFAULT 'unsent',
  `error_num` int(10) DEFAULT NULL,
  `main_msg` text,
  `articles_info` text,
  `questions_info` text,
  `create_time` int(10) NOT NULL,
  `filter_count` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`),
  KEY `group_name` (`group_name`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信群发列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_weixin_msg`
--

LOCK TABLES `aws_weixin_msg` WRITE;
/*!40000 ALTER TABLE `aws_weixin_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_weixin_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_weixin_qr_code`
--

DROP TABLE IF EXISTS `aws_weixin_qr_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_weixin_qr_code` (
  `scene_id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `subscribe_num` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`scene_id`),
  KEY `ticket` (`ticket`),
  KEY `subscribe_num` (`subscribe_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信二维码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_weixin_qr_code`
--

LOCK TABLES `aws_weixin_qr_code` WRITE;
/*!40000 ALTER TABLE `aws_weixin_qr_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_weixin_qr_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_weixin_reply_rule`
--

DROP TABLE IF EXISTS `aws_weixin_reply_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_weixin_reply_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL DEFAULT '0',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `sort_status` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `keyword` (`keyword`),
  KEY `enabled` (`enabled`),
  KEY `sort_status` (`sort_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_weixin_reply_rule`
--

LOCK TABLES `aws_weixin_reply_rule` WRITE;
/*!40000 ALTER TABLE `aws_weixin_reply_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_weixin_reply_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_weixin_third_party_api`
--

DROP TABLE IF EXISTS `aws_weixin_third_party_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_weixin_third_party_api` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `enabled` (`enabled`),
  KEY `rank` (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信第三方接入';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_weixin_third_party_api`
--

LOCK TABLES `aws_weixin_third_party_api` WRITE;
/*!40000 ALTER TABLE `aws_weixin_third_party_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_weixin_third_party_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aws_work_experience`
--

DROP TABLE IF EXISTS `aws_work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aws_work_experience` (
  `work_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `start_year` int(11) DEFAULT NULL COMMENT '开始年份',
  `end_year` int(11) DEFAULT NULL COMMENT '结束年月',
  `company_name` varchar(64) DEFAULT NULL COMMENT '公司名',
  `job_id` int(11) DEFAULT NULL COMMENT '职位ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`work_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作经历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aws_work_experience`
--

LOCK TABLES `aws_work_experience` WRITE;
/*!40000 ALTER TABLE `aws_work_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `aws_work_experience` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-26  9:55:56
