-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2017 at 04:42 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ss-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Attribute','Attribute_Default') DEFAULT 'Attribute',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Description` mediumtext,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `ProductID` int(11) NOT NULL DEFAULT '0',
  `DefaultAttributeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProductID` (`ProductID`),
  KEY `DefaultAttributeID` (`DefaultAttributeID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_default`
--

CREATE TABLE IF NOT EXISTS `attribute_default` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ShopConfigID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ShopConfigID` (`ShopConfigID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `continent`
--

CREATE TABLE IF NOT EXISTS `continent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Continent') DEFAULT 'Continent',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Phone` mediumtext,
  `Code` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `Phone`, `Code`) VALUES
(2, '31232', 0),
(3, '123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE IF NOT EXISTS `distributor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Distributor') DEFAULT 'Distributor',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Title` varchar(100) DEFAULT NULL,
  `Tel` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Website` varchar(50) DEFAULT NULL,
  `ContinentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ContinentID` (`ContinentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `errorpage`
--

CREATE TABLE IF NOT EXISTS `errorpage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `errorpage`
--

INSERT INTO `errorpage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `errorpage_live`
--

CREATE TABLE IF NOT EXISTS `errorpage_live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `errorpage_live`
--

INSERT INTO `errorpage_live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `errorpage_versions`
--

CREATE TABLE IF NOT EXISTS `errorpage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `errorpage_versions`
--

INSERT INTO `errorpage_versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 5, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `evidenceitem`
--

CREATE TABLE IF NOT EXISTS `evidenceitem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EvidenceItem') DEFAULT 'EvidenceItem',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Title` varchar(50) DEFAULT NULL,
  `Content` mediumtext,
  `Published` varchar(50) DEFAULT NULL,
  `ProductEvidencePageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProductEvidencePageID` (`ProductEvidencePageID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','Folder','Image','Image_Cached') DEFAULT 'File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Filename` mediumtext,
  `Content` mediumtext,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') DEFAULT 'Group',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Code` varchar(255) DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'Group', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'Group', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0),
(3, 'Group', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'Customers', NULL, 'customers', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE IF NOT EXISTS `group_members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `group_roles`
--

CREATE TABLE IF NOT EXISTS `group_roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `homepage`
--

CREATE TABLE IF NOT EXISTS `homepage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BottomTitle` varchar(100) DEFAULT NULL,
  `BottomContent` mediumtext,
  `BottomImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `BottomImageID` (`BottomImageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `homepage_live`
--

CREATE TABLE IF NOT EXISTS `homepage_live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BottomTitle` varchar(100) DEFAULT NULL,
  `BottomContent` mediumtext,
  `BottomImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `BottomImageID` (`BottomImageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `homepage_versions`
--

CREATE TABLE IF NOT EXISTS `homepage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `BottomTitle` varchar(100) DEFAULT NULL,
  `BottomContent` mediumtext,
  `BottomImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `BottomImageID` (`BottomImageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Item') DEFAULT 'Item',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Price` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `Quantity` int(11) NOT NULL DEFAULT '0',
  `ProductVersion` int(11) NOT NULL DEFAULT '0',
  `VariationVersion` int(11) NOT NULL DEFAULT '0',
  `OrderID` int(11) NOT NULL DEFAULT '0',
  `ProductID` int(11) NOT NULL DEFAULT '0',
  `VariationID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  KEY `VariationID` (`VariationID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ID`, `ClassName`, `LastEdited`, `Created`, `Price`, `Quantity`, `ProductVersion`, `VariationVersion`, `OrderID`, `ProductID`, `VariationID`) VALUES
(1, 'Item', '2017-04-03 10:04:50', '2017-04-03 10:04:37', '2.00000000', 1, 5, 0, 1, 10, 0),
(2, 'Item', '2017-04-03 10:11:35', '2017-04-03 10:11:30', '2.00000000', 1, 5, 0, 2, 10, 0),
(3, 'Item', '2017-04-03 10:22:41', '2017-04-03 10:22:36', '2.00000000', 1, 5, 0, 4, 10, 0),
(4, 'Item', '2017-04-03 11:11:38', '2017-04-03 11:11:33', '2.00000000', 1, 5, 0, 5, 10, 0),
(5, 'Item', '2017-04-03 11:12:01', '2017-04-03 11:11:50', '2.00000000', 2, 5, 0, 6, 10, 0),
(6, 'Item', '2017-04-03 11:18:48', '2017-04-03 11:18:44', '2.00000000', 1, 5, 0, 7, 10, 0),
(7, 'Item', '2017-04-03 11:36:23', '2017-04-03 11:36:17', '2.00000000', 1, 5, 0, 8, 10, 0),
(8, 'Item', '2017-04-03 11:41:49', '2017-04-03 11:41:44', '2.00000000', 1, 5, 0, 9, 10, 0),
(9, 'Item', '2017-04-03 11:45:22', '2017-04-03 11:45:18', '2.00000000', 1, 5, 0, 10, 10, 0),
(10, 'Item', '2017-04-03 13:11:30', '2017-04-03 13:11:24', '2.00000000', 1, 5, 0, 11, 10, 0),
(11, 'Item', '2017-04-03 13:15:06', '2017-04-03 13:15:00', '2.00000000', 1, 5, 0, 12, 10, 0),
(12, 'Item', '2017-04-03 13:16:09', '2017-04-03 13:16:03', '2.00000000', 1, 5, 0, 13, 10, 0),
(13, 'Item', '2017-04-03 13:27:25', '2017-04-03 13:27:22', '2.00000000', 1, 5, 0, 15, 10, 0),
(14, 'Item', '2017-04-03 13:29:44', '2017-04-03 13:29:38', '2.00000000', 1, 5, 0, 16, 10, 0),
(15, 'Item', '2017-04-03 13:45:35', '2017-04-03 13:45:30', '2.00000000', 2, 5, 0, 17, 10, 0),
(16, 'Item', '2017-04-03 16:03:44', '2017-04-03 16:03:39', '2.00000000', 1, 5, 0, 18, 10, 0),
(17, 'Item', '2017-04-03 16:35:31', '2017-04-03 16:35:27', '2.00000000', 1, 5, 0, 19, 10, 0),
(18, 'Item', '2017-04-03 16:36:29', '2017-04-03 16:36:24', '2.00000000', 1, 5, 0, 20, 10, 0),
(19, 'Item', '2017-04-03 16:37:28', '2017-04-03 16:37:23', '2.00000000', 1, 5, 0, 21, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `itemoption`
--

CREATE TABLE IF NOT EXISTS `itemoption` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ItemOption') DEFAULT 'ItemOption',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Price` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `ItemID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ItemID` (`ItemID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `loginattempt`
--

CREATE TABLE IF NOT EXISTS `loginattempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') DEFAULT 'LoginAttempt',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Success','Failure') DEFAULT 'Success',
  `IP` varchar(255) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member','Customer') DEFAULT 'Member',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Email` varchar(254) DEFAULT NULL,
  `TempIDHash` varchar(160) DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `RememberLoginToken` varchar(160) DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) DEFAULT NULL,
  `TimeFormat` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`ID`, `ClassName`, `LastEdited`, `Created`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`) VALUES
(1, 'Member', '2017-04-03 16:36:00', '2017-04-03 09:51:48', 'Default Admin', NULL, 'admin', 'e9e7f6dfc68d0f3e65bcbd9612deb22e2e9402ce', '2017-04-06 16:33:05', NULL, NULL, 3, '2017-04-03 16:40:34', NULL, NULL, NULL, NULL, NULL, NULL, 'en_US', 0, NULL, NULL),
(2, 'Customer', '2017-04-03 16:36:19', '2017-04-03 11:36:40', NULL, NULL, 'phung1471@sandbox.com', 'c0fcfedf19d0a570911c37a0d389d9c2f420acd5', '2017-04-06 16:36:19', '$2y$10$a5b5f292268b285bbcdedOGiVveZfaiHQvIAVnr5z4BG4GYPwZXa2', NULL, 3, '2017-04-03 16:38:32', NULL, NULL, 'blowfish', '10$a5b5f292268b285bbcdedc', NULL, NULL, 'en_US', 0, NULL, NULL),
(3, 'Customer', '2017-04-03 16:33:01', '2017-04-03 13:45:50', NULL, NULL, 'phung1471-buyer@gmail.com', '5ac1a47ef2aa1a40e036e9774fb08e7085a955e8', '2017-04-06 13:45:51', '$2y$10$d339f0c0cf478a90dfe25uem60y.7aUH/6hJ6.N4RuCDoKvUjXKyi', NULL, 1, '2017-04-03 16:33:01', NULL, NULL, 'blowfish', '10$d339f0c0cf478a90dfe254', NULL, NULL, 'en_US', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `memberpassword`
--

CREATE TABLE IF NOT EXISTS `memberpassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') DEFAULT 'MemberPassword',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `memberpassword`
--

INSERT INTO `memberpassword` (`ID`, `ClassName`, `LastEdited`, `Created`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'MemberPassword', '2017-04-03 11:36:41', '2017-04-03 11:36:41', '$2y$10$a5b5f292268b285bbcdedOGiVveZfaiHQvIAVnr5z4BG4GYPwZXa2', '10$a5b5f292268b285bbcdedc', 'blowfish', 2),
(2, 'MemberPassword', '2017-04-03 13:45:50', '2017-04-03 13:45:50', '$2y$10$d339f0c0cf478a90dfe25uem60y.7aUH/6hJ6.N4RuCDoKvUjXKyi', '10$d339f0c0cf478a90dfe254', 'blowfish', 3);

-- --------------------------------------------------------

--
-- Table structure for table `modification`
--

CREATE TABLE IF NOT EXISTS `modification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Modification') DEFAULT 'Modification',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Value` int(11) NOT NULL DEFAULT '0',
  `Price` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `Description` mediumtext,
  `SubTotalModifier` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `OrderID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `OrderID` (`OrderID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newscategory`
--

CREATE TABLE IF NOT EXISTS `newscategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('NewsCategory') DEFAULT 'NewsCategory',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newspage`
--

CREATE TABLE IF NOT EXISTS `newspage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newspage_live`
--

CREATE TABLE IF NOT EXISTS `newspage_live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newspage_newscategories`
--

CREATE TABLE IF NOT EXISTS `newspage_newscategories` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NewsPageID` int(11) NOT NULL DEFAULT '0',
  `NewsCategoryID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `NewsPageID` (`NewsPageID`),
  KEY `NewsCategoryID` (`NewsCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newspage_newstags`
--

CREATE TABLE IF NOT EXISTS `newspage_newstags` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NewsPageID` int(11) NOT NULL DEFAULT '0',
  `NewsTagID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `NewsPageID` (`NewsPageID`),
  KEY `NewsTagID` (`NewsTagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newspage_versions`
--

CREATE TABLE IF NOT EXISTS `newspage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newstag`
--

CREATE TABLE IF NOT EXISTS `newstag` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('NewsTag') DEFAULT 'NewsTag',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE IF NOT EXISTS `option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Option','Option_Default') DEFAULT 'Option',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `AttributeID` int(11) NOT NULL DEFAULT '0',
  `ProductID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `AttributeID` (`AttributeID`),
  KEY `ProductID` (`ProductID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Order') DEFAULT 'Order',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Status` enum('Pending','Processing','Dispatched','Cancelled','Cart') DEFAULT 'Cart',
  `PaymentStatus` enum('Unpaid','Paid') DEFAULT 'Unpaid',
  `TotalPrice` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `SubTotalPrice` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `BaseCurrency` varchar(3) DEFAULT NULL,
  `BaseCurrencySymbol` varchar(10) DEFAULT NULL,
  `OrderedOn` datetime DEFAULT NULL,
  `LastActive` datetime DEFAULT NULL,
  `Env` varchar(10) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`ID`, `ClassName`, `LastEdited`, `Created`, `Status`, `PaymentStatus`, `TotalPrice`, `SubTotalPrice`, `BaseCurrency`, `BaseCurrencySymbol`, `OrderedOn`, `LastActive`, `Env`, `MemberID`) VALUES
(1, 'Order', '2017-04-03 10:11:09', '2017-04-03 10:04:37', 'Processing', 'Paid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 10:11:08', '2017-04-03 10:11:08', 'dev', 0),
(2, 'Order', '2017-04-03 10:58:48', '2017-04-03 10:11:30', 'Pending', 'Paid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 10:11:39', '2017-04-03 10:11:39', 'dev', 0),
(3, 'Order', '2017-04-03 10:22:31', '2017-04-03 10:22:31', 'Cart', 'Paid', '0.00000000', '0.00000000', 'USD', '$', NULL, '2017-04-03 10:22:31', 'dev', 0),
(4, 'Order', '2017-04-03 10:58:28', '2017-04-03 10:22:35', 'Dispatched', 'Paid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 10:34:52', '2017-04-03 10:34:52', 'dev', 0),
(5, 'Order', '2017-04-03 11:11:43', '2017-04-03 11:11:33', 'Processing', 'Paid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 11:11:43', '2017-04-03 11:11:43', 'dev', 0),
(6, 'Order', '2017-04-03 11:12:09', '2017-04-03 11:11:50', 'Pending', 'Unpaid', '4.00000000', '4.00000000', 'USD', '$', '2017-04-03 11:12:09', '2017-04-03 11:12:08', 'dev', 0),
(7, 'Order', '2017-04-03 11:18:55', '2017-04-03 11:18:43', 'Pending', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 11:18:54', '2017-04-03 11:18:54', 'dev', 0),
(8, 'Order', '2017-04-03 11:36:41', '2017-04-03 11:36:17', 'Pending', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 11:36:41', '2017-04-03 11:36:40', 'dev', 2),
(9, 'Order', '2017-04-03 11:43:00', '2017-04-03 11:41:44', 'Pending', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 11:43:00', '2017-04-03 11:42:59', 'dev', 2),
(10, 'Order', '2017-04-03 11:45:27', '2017-04-03 11:45:17', 'Pending', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 11:45:27', '2017-04-03 11:45:27', 'dev', 2),
(11, 'Order', '2017-04-03 13:11:36', '2017-04-03 13:11:24', 'Pending', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 13:11:36', '2017-04-03 13:11:35', 'dev', 2),
(12, 'Order', '2017-04-03 13:15:11', '2017-04-03 13:15:00', 'Processing', 'Paid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 13:15:10', '2017-04-03 13:15:10', 'dev', 2),
(13, 'Order', '2017-04-03 13:16:13', '2017-04-03 13:16:03', 'Pending', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 13:16:13', '2017-04-03 13:16:13', 'dev', 2),
(14, 'Order', '2017-04-03 13:27:16', '2017-04-03 13:27:16', 'Cart', 'Paid', '0.00000000', '0.00000000', 'USD', '$', NULL, '2017-04-03 13:27:16', 'dev', 0),
(15, 'Order', '2017-04-03 13:29:24', '2017-04-03 13:27:21', 'Processing', 'Paid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 13:27:29', '2017-04-03 13:27:29', 'dev', 2),
(16, 'Order', '2017-04-03 13:29:48', '2017-04-03 13:29:38', 'Pending', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 13:29:48', '2017-04-03 13:29:48', 'dev', 2),
(17, 'Order', '2017-04-03 13:45:51', '2017-04-03 13:45:30', 'Pending', 'Unpaid', '4.00000000', '4.00000000', 'USD', '$', '2017-04-03 13:45:51', '2017-04-03 13:45:50', 'dev', 3),
(18, 'Order', '2017-04-03 16:03:49', '2017-04-03 16:03:38', 'Pending', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 16:03:49', '2017-04-03 16:03:49', 'dev', 3),
(19, 'Order', '2017-04-03 16:35:33', '2017-04-03 16:35:26', 'Cart', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', NULL, '2017-04-03 16:35:33', 'dev', 0),
(20, 'Order', '2017-04-03 16:36:32', '2017-04-03 16:36:23', 'Processing', 'Paid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 16:36:32', '2017-04-03 16:36:31', 'dev', 2),
(21, 'Order', '2017-04-03 16:37:34', '2017-04-03 16:37:23', 'Pending', 'Unpaid', '2.00000000', '2.00000000', 'USD', '$', '2017-04-03 16:37:34', '2017-04-03 16:37:34', 'dev', 2),
(22, 'Order', '2017-04-03 16:38:32', '2017-04-03 16:38:32', 'Cart', 'Paid', '0.00000000', '0.00000000', 'USD', '$', NULL, '2017-04-03 16:38:32', 'dev', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_update`
--

CREATE TABLE IF NOT EXISTS `order_update` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Order_Update') DEFAULT 'Order_Update',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Status` enum('Pending','Processing','Dispatched','Cancelled') DEFAULT 'Pending',
  `Note` mediumtext,
  `Visible` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `OrderID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `OrderID` (`OrderID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `order_update`
--

INSERT INTO `order_update` (`ID`, `ClassName`, `LastEdited`, `Created`, `Status`, `Note`, `Visible`, `OrderID`, `MemberID`) VALUES
(1, 'Order_Update', '2017-04-03 10:58:20', '2017-04-03 10:58:20', 'Pending', NULL, 1, 4, 1),
(2, 'Order_Update', '2017-04-03 10:58:28', '2017-04-03 10:58:28', 'Dispatched', NULL, 1, 4, 1),
(3, 'Order_Update', '2017-04-03 10:58:48', '2017-04-03 10:58:48', 'Pending', NULL, 1, 2, 1),
(4, 'Order_Update', '2017-04-03 10:58:51', '2017-04-03 10:58:51', 'Pending', NULL, 1, 2, 1),
(5, 'Order_Update', '2017-04-03 10:58:52', '2017-04-03 10:58:52', 'Pending', NULL, 1, 2, 1),
(6, 'Order_Update', '2017-04-03 10:58:53', '2017-04-03 10:58:53', 'Pending', NULL, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Payment','PayPal_Express','') DEFAULT 'Payment',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Method` varchar(100) DEFAULT NULL,
  `Status` enum('Incomplete','Success','Failure','Pending') DEFAULT 'Incomplete',
  `HTTPStatus` varchar(10) DEFAULT NULL,
  `Reference` varchar(50) DEFAULT NULL,
  `AmountCurrency` varchar(3) DEFAULT NULL,
  `AmountAmount` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `PaidByID` int(11) NOT NULL DEFAULT '0',
  `OrderID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PaidByID` (`PaidByID`),
  KEY `OrderID` (`OrderID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`ID`, `ClassName`, `LastEdited`, `Created`, `Method`, `Status`, `HTTPStatus`, `Reference`, `AmountCurrency`, `AmountAmount`, `PaidByID`, `OrderID`) VALUES
(1, 'Payment', '2017-04-03 10:11:09', '2017-04-03 10:11:09', 'Cheque', 'Success', '200', '1', 'USD', '2.0000', 0, 1),
(2, 'Payment', '2017-04-03 10:11:39', '2017-04-03 10:11:39', 'Cheque', 'Success', '200', '2', 'USD', '2.0000', 0, 2),
(3, 'Payment', '2017-04-03 10:34:52', '2017-04-03 10:34:52', 'Cheque', 'Success', '200', '4', 'USD', '2.0000', 0, 4),
(4, 'Payment', '2017-04-03 11:11:43', '2017-04-03 11:11:43', 'Cheque', 'Success', '200', '5', 'USD', '2.0000', 0, 5),
(5, '', '2017-04-03 11:12:09', '2017-04-03 11:12:09', 'PayPalExpress', 'Pending', NULL, '6', 'USD', '4.0000', 0, 6),
(6, '', '2017-04-03 11:12:35', '2017-04-03 11:12:35', 'PayPalExpress', 'Pending', NULL, '6', 'USD', '4.0000', 0, 6),
(7, '', '2017-04-03 11:12:57', '2017-04-03 11:12:57', 'PayPalExpress', 'Pending', NULL, '6', 'USD', '4.0000', 0, 6),
(8, '', '2017-04-03 11:15:31', '2017-04-03 11:15:31', 'PayPalExpress', 'Pending', NULL, '6', 'USD', '4.0000', 0, 6),
(9, '', '2017-04-03 11:15:48', '2017-04-03 11:15:48', 'PayPalExpress', 'Pending', NULL, '6', 'USD', '4.0000', 0, 6),
(10, '', '2017-04-03 11:18:55', '2017-04-03 11:18:55', 'PayPalExpress', 'Pending', NULL, '7', 'USD', '2.0000', 0, 7),
(11, 'PayPal_Express', '2017-04-03 11:24:09', '2017-04-03 11:24:08', 'PayPalExpress', 'Failure', '500', '7', 'USD', '2.0000', 0, 7),
(12, 'PayPal_Express', '2017-04-03 11:24:23', '2017-04-03 11:24:23', 'PayPalExpress', 'Failure', '500', '7', 'USD', '2.0000', 0, 7),
(13, 'PayPal_Express', '2017-04-03 11:36:41', '2017-04-03 11:36:41', 'PayPalExpress', 'Failure', '500', '8', 'USD', '2.0000', 2, 8),
(14, 'PayPal_Express', '2017-04-03 11:36:53', '2017-04-03 11:36:53', 'PayPalExpress', 'Failure', '500', '8', 'USD', '2.0000', 2, 8),
(15, 'PayPal_Express', '2017-04-03 11:43:01', '2017-04-03 11:43:00', 'PayPalExpress', 'Failure', '500', '9', 'USD', '2.0000', 2, 9),
(16, 'PayPal_Express', '2017-04-03 11:43:09', '2017-04-03 11:43:09', 'PayPalExpress', 'Failure', '500', '9', 'USD', '2.0000', 2, 9),
(17, 'PayPal_Express', '2017-04-03 11:45:28', '2017-04-03 11:45:27', 'PayPalExpress', 'Failure', '500', '10', 'USD', '2.0000', 2, 10),
(18, 'PayPal_Express', '2017-04-03 11:45:38', '2017-04-03 11:45:38', 'PayPalExpress', 'Failure', '500', '10', 'USD', '2.0000', 2, 10),
(19, 'PayPal_Express', '2017-04-03 13:11:36', '2017-04-03 13:11:36', 'PayPalExpress', 'Failure', '500', '11', 'USD', '2.0000', 2, 11),
(20, 'PayPal_Express', '2017-04-03 13:11:44', '2017-04-03 13:11:44', 'PayPalExpress', 'Failure', '500', '11', 'USD', '2.0000', 2, 11),
(21, 'Payment', '2017-04-03 13:15:11', '2017-04-03 13:15:11', 'Cheque', 'Success', '200', '12', 'USD', '2.0000', 2, 12),
(22, 'PayPal_Express', '2017-04-03 13:16:14', '2017-04-03 13:16:13', 'PayPalExpress', 'Failure', '500', '13', 'USD', '2.0000', 2, 13),
(23, 'PayPal_Express', '2017-04-03 13:27:30', '2017-04-03 13:27:29', 'PayPalExpress', 'Failure', '500', '15', 'USD', '2.0000', 2, 15),
(24, 'Payment', '2017-04-03 13:29:24', '2017-04-03 13:29:24', 'Cheque', 'Success', '200', '15', 'USD', '2.0000', 2, 15),
(25, 'PayPal_Express', '2017-04-03 13:29:49', '2017-04-03 13:29:49', 'PayPalExpress', 'Failure', '500', '16', 'USD', '2.0000', 2, 16),
(26, 'PayPal_Express', '2017-04-03 13:45:51', '2017-04-03 13:45:51', 'PayPalExpress', 'Failure', '500', '17', 'USD', '4.0000', 3, 17),
(27, 'PayPal_Express', '2017-04-03 16:01:36', '2017-04-03 16:01:36', 'PayPalExpress', 'Failure', '500', '17', 'USD', '4.0000', 3, 17),
(28, 'PayPal_Express', '2017-04-03 16:02:40', '2017-04-03 16:02:39', 'PayPalExpress', 'Failure', '500', '17', 'USD', '4.0000', 3, 17),
(29, 'PayPal_Express', '2017-04-03 16:03:50', '2017-04-03 16:03:50', 'PayPalExpress', 'Failure', '500', '18', 'USD', '2.0000', 3, 18),
(30, 'Payment', '2017-04-03 16:36:32', '2017-04-03 16:36:32', 'Cheque', 'Success', '200', '20', 'USD', '2.0000', 2, 20),
(31, 'PayPal_Express', '2017-04-03 16:37:35', '2017-04-03 16:37:34', 'PayPalExpress', 'Failure', '500', '21', 'USD', '2.0000', 2, 21);

-- --------------------------------------------------------

--
-- Table structure for table `payment_error`
--

CREATE TABLE IF NOT EXISTS `payment_error` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Payment_Error') DEFAULT 'Payment_Error',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `ErrorCode` varchar(10) DEFAULT NULL,
  `ErrorMessage` mediumtext,
  `PaymentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `payment_error`
--

INSERT INTO `payment_error` (`ID`, `ClassName`, `LastEdited`, `Created`, `ErrorCode`, `ErrorMessage`, `PaymentID`) VALUES
(1, 'Payment_Error', '2017-04-03 11:24:09', '2017-04-03 11:24:09', NULL, 'You are attempting to make a payment without the necessary credentials set', 11),
(2, 'Payment_Error', '2017-04-03 11:24:23', '2017-04-03 11:24:23', NULL, 'You are attempting to make a payment without the necessary credentials set', 12),
(3, 'Payment_Error', '2017-04-03 11:36:41', '2017-04-03 11:36:41', NULL, 'You are attempting to make a payment without the necessary credentials set', 13),
(4, 'Payment_Error', '2017-04-03 11:36:53', '2017-04-03 11:36:53', NULL, 'You are attempting to make a payment without the necessary credentials set', 14),
(5, 'Payment_Error', '2017-04-03 11:43:00', '2017-04-03 11:43:00', NULL, 'You are attempting to make a payment without the necessary credentials set', 15),
(6, 'Payment_Error', '2017-04-03 11:43:09', '2017-04-03 11:43:09', NULL, 'You are attempting to make a payment without the necessary credentials set', 16),
(7, 'Payment_Error', '2017-04-03 11:45:27', '2017-04-03 11:45:27', NULL, 'You are attempting to make a payment without the necessary credentials set', 17),
(8, 'Payment_Error', '2017-04-03 11:45:38', '2017-04-03 11:45:38', NULL, 'You are attempting to make a payment without the necessary credentials set', 18),
(9, 'Payment_Error', '2017-04-03 13:11:36', '2017-04-03 13:11:36', NULL, 'You are attempting to make a payment without the necessary credentials set', 19),
(10, 'Payment_Error', '2017-04-03 13:11:44', '2017-04-03 13:11:44', NULL, 'You are attempting to make a payment without the necessary credentials set', 20),
(11, 'Payment_Error', '2017-04-03 13:16:14', '2017-04-03 13:16:14', NULL, 'You are attempting to make a payment without the necessary credentials set', 22),
(12, 'Payment_Error', '2017-04-03 13:27:30', '2017-04-03 13:27:30', NULL, 'You are attempting to make a payment without the necessary credentials set', 23),
(13, 'Payment_Error', '2017-04-03 13:29:49', '2017-04-03 13:29:49', NULL, 'You are attempting to make a payment without the necessary credentials set', 25),
(14, 'Payment_Error', '2017-04-03 13:45:51', '2017-04-03 13:45:51', NULL, 'You are attempting to make a payment without the necessary credentials set', 26),
(15, 'Payment_Error', '2017-04-03 16:01:36', '2017-04-03 16:01:36', NULL, 'You are attempting to make a payment without the necessary credentials set', 27),
(16, 'Payment_Error', '2017-04-03 16:02:40', '2017-04-03 16:02:40', NULL, 'You are attempting to make a payment without the necessary credentials set', 28),
(17, 'Payment_Error', '2017-04-03 16:03:50', '2017-04-03 16:03:50', NULL, 'You are attempting to make a payment without the necessary credentials set', 29),
(18, 'Payment_Error', '2017-04-03 16:37:35', '2017-04-03 16:37:35', NULL, 'You are attempting to make a payment without the necessary credentials set', 31);

-- --------------------------------------------------------

--
-- Table structure for table `paypal_express`
--

CREATE TABLE IF NOT EXISTS `paypal_express` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Token` varchar(50) DEFAULT NULL,
  `PayerID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `paypal_express`
--

INSERT INTO `paypal_express` (`ID`, `Token`, `PayerID`) VALUES
(11, NULL, NULL),
(12, NULL, NULL),
(13, NULL, NULL),
(14, NULL, NULL),
(15, NULL, NULL),
(16, NULL, NULL),
(17, NULL, NULL),
(18, NULL, NULL),
(19, NULL, NULL),
(20, NULL, NULL),
(22, NULL, NULL),
(23, NULL, NULL),
(25, NULL, NULL),
(26, NULL, NULL),
(27, NULL, NULL),
(28, NULL, NULL),
(29, NULL, NULL),
(31, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') DEFAULT 'Permission',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`ID`, `ClassName`, `LastEdited`, `Created`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'Permission', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'Permission', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'Permission', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'Permission', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'Permission', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'ADMIN', 0, 1, 2),
(6, 'Permission', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'VIEW_ORDER', 0, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `permissionrole`
--

CREATE TABLE IF NOT EXISTS `permissionrole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') DEFAULT 'PermissionRole',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `permissionrolecode`
--

CREATE TABLE IF NOT EXISTS `permissionrolecode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') DEFAULT 'PermissionRoleCode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Price` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `Currency` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ID`, `Price`, `Currency`) VALUES
(10, '2.00000000', 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `productpage`
--

CREATE TABLE IF NOT EXISTS `productpage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Display` enum('Vertical','Horizontal') DEFAULT 'Vertical',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `productpage_distributors`
--

CREATE TABLE IF NOT EXISTS `productpage_distributors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductPageID` int(11) NOT NULL DEFAULT '0',
  `DistributorID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProductPageID` (`ProductPageID`),
  KEY `DistributorID` (`DistributorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `productpage_live`
--

CREATE TABLE IF NOT EXISTS `productpage_live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Display` enum('Vertical','Horizontal') DEFAULT 'Vertical',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `productpage_versions`
--

CREATE TABLE IF NOT EXISTS `productpage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Display` enum('Vertical','Horizontal') DEFAULT 'Vertical',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ImageID` (`ImageID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `productpage_versions`
--

INSERT INTO `productpage_versions` (`ID`, `RecordID`, `Version`, `Display`, `ImageID`) VALUES
(1, 9, 1, 'Vertical', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_live`
--

CREATE TABLE IF NOT EXISTS `product_live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Price` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `Currency` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `product_live`
--

INSERT INTO `product_live` (`ID`, `Price`, `Currency`) VALUES
(10, '2.00000000', 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `product_versions`
--

CREATE TABLE IF NOT EXISTS `product_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Price` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `Currency` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `product_versions`
--

INSERT INTO `product_versions` (`ID`, `RecordID`, `Version`, `Price`, `Currency`) VALUES
(1, 10, 1, '0.00000000', 'USD'),
(2, 10, 2, '0.00000000', 'USD'),
(3, 10, 3, '0.00000000', 'USD'),
(4, 10, 4, '0.00000000', 'USD'),
(5, 10, 5, '2.00000000', 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `redirectorpage`
--

CREATE TABLE IF NOT EXISTS `redirectorpage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `redirectorpage_live`
--

CREATE TABLE IF NOT EXISTS `redirectorpage_live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `redirectorpage_versions`
--

CREATE TABLE IF NOT EXISTS `redirectorpage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shopconfig`
--

CREATE TABLE IF NOT EXISTS `shopconfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ShopConfig') DEFAULT 'ShopConfig',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `LicenceKey` varchar(50) DEFAULT NULL,
  `BaseCurrency` varchar(3) DEFAULT NULL,
  `BaseCurrencyPrecision` int(11) NOT NULL DEFAULT '0',
  `BaseCurrencySymbol` varchar(10) DEFAULT NULL,
  `CartTimeout` int(11) NOT NULL DEFAULT '0',
  `CartTimeoutUnit` enum('minute','hour','day') DEFAULT 'hour',
  `StockCheck` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `StockManagement` enum('strict','relaxed') DEFAULT 'strict',
  `EmailSignature` mediumtext,
  `ReceiptSubject` varchar(50) DEFAULT NULL,
  `ReceiptBody` mediumtext,
  `ReceiptFrom` varchar(50) DEFAULT NULL,
  `NotificationSubject` varchar(50) DEFAULT NULL,
  `NotificationBody` mediumtext,
  `NotificationTo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `shopconfig`
--

INSERT INTO `shopconfig` (`ID`, `ClassName`, `LastEdited`, `Created`, `LicenceKey`, `BaseCurrency`, `BaseCurrencyPrecision`, `BaseCurrencySymbol`, `CartTimeout`, `CartTimeoutUnit`, `StockCheck`, `StockManagement`, `EmailSignature`, `ReceiptSubject`, `ReceiptBody`, `ReceiptFrom`, `NotificationSubject`, `NotificationBody`, `NotificationTo`) VALUES
(1, 'ShopConfig', '2017-04-03 16:34:13', '2017-04-03 10:01:36', NULL, 'USD', 2, '$', 1, 'hour', 0, 'strict', 'dfasdf', 'Thanks for your order', 'afs', 'noreply@singasong.sg', 'af', 'dfsadfg', 'sstest1470@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `siteconfig`
--

CREATE TABLE IF NOT EXISTS `siteconfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') DEFAULT 'SiteConfig',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Tagline` varchar(255) DEFAULT NULL,
  `Theme` varchar(255) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `CompanyName` varchar(100) DEFAULT NULL,
  `Address` mediumtext,
  `Tel` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `Twitter` varchar(50) DEFAULT NULL,
  `Facebook` varchar(50) DEFAULT NULL,
  `Vimeo` varchar(50) DEFAULT NULL,
  `Youtube` varchar(50) DEFAULT NULL,
  `Intagrams` varchar(50) DEFAULT NULL,
  `LogoID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LogoID` (`LogoID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `siteconfig`
--

INSERT INTO `siteconfig` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`, `CompanyName`, `Address`, `Tel`, `Fax`, `Twitter`, `Facebook`, `Vimeo`, `Youtube`, `Intagrams`, `LogoID`) VALUES
(1, 'SiteConfig', '2017-04-03 09:57:07', '2017-04-03 09:57:07', 'Your Site Name', 'your tagline here', NULL, 'Anyone', 'LoggedInUsers', 'LoggedInUsers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `siteconfig_createtoplevelgroups`
--

CREATE TABLE IF NOT EXISTS `siteconfig_createtoplevelgroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `siteconfig_editorgroups`
--

CREATE TABLE IF NOT EXISTS `siteconfig_editorgroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `siteconfig_viewergroups`
--

CREATE TABLE IF NOT EXISTS `siteconfig_viewergroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sitetree`
--

CREATE TABLE IF NOT EXISTS `sitetree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','SitemapPage','ErrorPage','RedirectorPage','VirtualPage','ContactPage','HomePage','NewsHolderPage','NewsPage','ProductEducationPage','ProductEvidencePage','ProductPage','AccountPage','CartPage','CheckoutPage','Product') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Priority` varchar(5) DEFAULT NULL,
  `HideOnSitemap` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`),
  FULLTEXT KEY `SearchFields` (`Title`,`MenuTitle`,`Content`,`MetaDescription`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `sitetree`
--

INSERT INTO `sitetree` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Priority`, `HideOnSitemap`, `Version`, `ParentID`) VALUES
(1, 'Page', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(2, 'Page', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(3, 'Page', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(4, 'ErrorPage', '2017-04-03 09:51:49', '2017-04-03 09:51:49', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(5, 'ErrorPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(6, 'AccountPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'account', 'Account', NULL, NULL, NULL, NULL, 0, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(7, 'CartPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'cart', 'Cart', NULL, NULL, NULL, NULL, 0, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(8, 'CheckoutPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'checkout', 'Checkout', NULL, NULL, NULL, NULL, 0, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(10, 'Product', '2017-04-03 10:03:48', '2017-04-03 10:03:29', 'new-product', 'New Product', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_editorgroups`
--

CREATE TABLE IF NOT EXISTS `sitetree_editorgroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_imagetracking`
--

CREATE TABLE IF NOT EXISTS `sitetree_imagetracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_linktracking`
--

CREATE TABLE IF NOT EXISTS `sitetree_linktracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_live`
--

CREATE TABLE IF NOT EXISTS `sitetree_live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','SitemapPage','ErrorPage','RedirectorPage','VirtualPage','ContactPage','HomePage','NewsHolderPage','NewsPage','ProductEducationPage','ProductEvidencePage','ProductPage','AccountPage','CartPage','CheckoutPage','Product') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Priority` varchar(5) DEFAULT NULL,
  `HideOnSitemap` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`),
  FULLTEXT KEY `SearchFields` (`Title`,`MenuTitle`,`Content`,`MetaDescription`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `sitetree_live`
--

INSERT INTO `sitetree_live` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Priority`, `HideOnSitemap`, `Version`, `ParentID`) VALUES
(1, 'Page', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(2, 'Page', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(3, 'Page', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(4, 'ErrorPage', '2017-04-03 09:51:49', '2017-04-03 09:51:49', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(5, 'ErrorPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(6, 'AccountPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'account', 'Account', NULL, NULL, NULL, NULL, 0, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(7, 'CartPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'cart', 'Cart', NULL, NULL, NULL, NULL, 0, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(8, 'CheckoutPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'checkout', 'Checkout', NULL, NULL, NULL, NULL, 0, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 1, 0),
(10, 'Product', '2017-04-03 10:03:48', '2017-04-03 10:03:29', 'new-product', 'New Product', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_versions`
--

CREATE TABLE IF NOT EXISTS `sitetree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','SitemapPage','ErrorPage','RedirectorPage','VirtualPage','ContactPage','HomePage','NewsHolderPage','NewsPage','ProductEducationPage','ProductEvidencePage','ProductPage','AccountPage','CartPage','CheckoutPage','Product') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Priority` varchar(5) DEFAULT NULL,
  `HideOnSitemap` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`),
  FULLTEXT KEY `SearchFields` (`Title`,`MenuTitle`,`Content`,`MetaDescription`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `sitetree_versions`
--

INSERT INTO `sitetree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Priority`, `HideOnSitemap`, `ParentID`) VALUES
(1, 1, 1, 1, 1, 1, 'Page', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(2, 2, 1, 1, 1, 1, 'Page', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(3, 3, 1, 1, 1, 1, 'Page', '2017-04-03 09:51:48', '2017-04-03 09:51:48', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(4, 4, 1, 1, 1, 1, 'ErrorPage', '2017-04-03 09:51:49', '2017-04-03 09:51:49', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(5, 5, 1, 1, 1, 1, 'ErrorPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(6, 6, 1, 1, 1, 1, 'AccountPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'account', 'Account', NULL, NULL, NULL, NULL, 0, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(7, 7, 1, 1, 1, 1, 'CartPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'cart', 'Cart', NULL, NULL, NULL, NULL, 0, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(8, 8, 1, 1, 1, 1, 'CheckoutPage', '2017-04-03 10:01:36', '2017-04-03 10:01:36', 'checkout', 'Checkout', NULL, NULL, NULL, NULL, 0, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(9, 9, 1, 0, 1, 0, 'ProductPage', '2017-04-03 10:02:43', '2017-04-03 10:02:43', 'new-product-page', 'New Product Page', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(10, 10, 1, 0, 1, 0, 'Product', '2017-04-03 10:03:29', '2017-04-03 10:03:29', 'new-product', 'New Product', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 8),
(11, 10, 2, 0, 1, 0, 'Product', '2017-04-03 10:03:35', '2017-04-03 10:03:29', 'new-product', 'New Product', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(12, 10, 3, 0, 1, 0, 'Product', '2017-04-03 10:03:36', '2017-04-03 10:03:29', 'new-product', 'New Product', NULL, NULL, NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(13, 10, 4, 0, 1, 0, 'Product', '2017-04-03 10:03:38', '2017-04-03 10:03:29', 'new-product', 'New Product', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0),
(14, 10, 5, 1, 1, 1, 'Product', '2017-04-03 10:03:48', '2017-04-03 10:03:29', 'new-product', 'New Product', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_viewergroups`
--

CREATE TABLE IF NOT EXISTS `sitetree_viewergroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE IF NOT EXISTS `slide` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Slide') DEFAULT 'Slide',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Content` mediumtext,
  `Link` mediumtext,
  `PageID` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PageID` (`PageID`),
  KEY `ImageID` (`ImageID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `variation`
--

CREATE TABLE IF NOT EXISTS `variation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Variation') DEFAULT 'Variation',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Price` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `Currency` varchar(3) DEFAULT NULL,
  `Status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ProductID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProductID` (`ProductID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `variation_options`
--

CREATE TABLE IF NOT EXISTS `variation_options` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Variation_Options') DEFAULT 'Variation_Options',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `VariationID` int(11) NOT NULL DEFAULT '0',
  `OptionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `VariationID` (`VariationID`),
  KEY `OptionID` (`OptionID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `variation_versions`
--

CREATE TABLE IF NOT EXISTS `variation_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('Variation') DEFAULT 'Variation',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Price` decimal(19,8) NOT NULL DEFAULT '0.00000000',
  `Currency` varchar(3) DEFAULT NULL,
  `Status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  `ProductID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ProductID` (`ProductID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `virtualpage`
--

CREATE TABLE IF NOT EXISTS `virtualpage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `virtualpage_live`
--

CREATE TABLE IF NOT EXISTS `virtualpage_live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `virtualpage_versions`
--

CREATE TABLE IF NOT EXISTS `virtualpage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE IF NOT EXISTS `widget` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Widget') DEFAULT 'Widget',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widgetarea`
--

CREATE TABLE IF NOT EXISTS `widgetarea` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('WidgetArea') DEFAULT 'WidgetArea',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
