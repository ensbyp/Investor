/*Script to create the Investor Schema 

Description: Creates the Investor database schema (not the landing Tables)

Author: P Ensby
Date: 26/04/2017
Version: 0.1

Revision History:


*/
USE Investor;

/* CREATE the Stock Type Table */
Drop table if exists `INV_STOCK_TYPE`;
CREATE TABLE `INV_STOCK_TYPE` (
  `Id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Stock_Type` varchar(25) NOT NULL,
  `Valid_From` datetime NOT NULL DEFAULT current_timestamp ,
  `Valid_To` datetime NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;


/* CREATE THE Country Exchange Reference Table */

CREATE TABLE `INV_COUNTRY_EXCHANGE` (
  `Id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Country` varchar(20) NULL,
  `Exchange` varchar(3) NULL,
  `Valid_From` datetime NOT NULL DEFAULT current_timestamp ,
  `Valid_To` datetime NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_INV_COUNTRY_EXCHANGE_Country` (`Country`),
  KEY `idx_INV_COUNTRY_EXCHANGE_Exchange` (`Exchange`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;


/* Create the Stock Ticker Categories */

CREATE TABLE `INV_STOCK_CATEGORIES` (
	`Id` mediumint(9) NOT NULL AUTO_INCREMENT,
    `Category_No` varchar(3) NOT NULL,
    `Category_Name` varchar(50) NOT NULL,
    `Valid_From` datetime NOT NULL DEFAULT current_timestamp,
    `Valid_To` datetime NULL,
    PRIMARY KEY (`Id`),
    KEY `idx_INV_STOCK_CATEGORIES_Category_Name` (`Category_Name`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
    
/* Create the Ticker table */

CREATE TABLE `INV_TICKER` (
  `Id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Ticker` varchar(30) NOT NULL,
  `Ticker_Name` varchar(100) DEFAULT NULL,
  `Symbol_Type_Id` mediumint(9) NOT NULL,
  `Exchange_Id` mediumint(9) DEFAULT NULL,
  `Stock_Symbol_Cat_Id` mediumint(9) DEFAULT NULL,
  `Valid_From` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Valid_To` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_INV_TICKER_Symbol_Type_Id` (`Symbol_Type_Id`),
  KEY `idx_INV_TICKER_Exchange_Id` (`Exchange_Id`),
  KEY `idx_INV_TICKER_Stock_Symbol_Cat_Id` (`Stock_Symbol_Cat_Id`),
  KEY `idx_INV_TICKER_Ticker` (`Ticker`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1