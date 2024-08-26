CREATE DATABASE IF NOT EXISTS `shopping-cart`;

CREATE USER 'root'@'172.31.20.248' IDENTIFIED BY 'root@@123';
GRANT ALL PRIVILEGES ON `shopping-cart`.* TO 'root'@'172.31.20.248';

USE `shopping-cart`;

DROP TABLE IF EXISTS `shopping-cart`.`product`;
CREATE TABLE IF NOT EXISTS `shopping-cart`.`product`(
   `pid` VARCHAR(45) NOT NULL,
   `pname` VARCHAR(100) NULL DEFAULT NULL,
   `ptype` VARCHAR(20) NULL DEFAULT NULL,
   `pinfo` VARCHAR(350) NULL DEFAULT NULL,
   `pprice` DECIMAL(12,2) NULL DEFAULT NULL,
   `pquantity` INT NULL DEFAULT NULL,
   `image` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*-------------------------------------------------------
--Table `shopping-cart`.`orders`
-------------------------------------------------------*/
DROP TABLE IF EXISTS `shopping-cart`.`orders`;
CREATE TABLE IF NOT EXISTS `shopping-cart`.`orders` (
  `orderid` VARCHAR(45) NOT NULL,
  `prodid` VARCHAR(45) NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `shipped` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`orderid`, `prodid`),
  INDEX `productid_idx` (`prodid` ASC) VISIBLE,
  CONSTRAINT `productid`
    FOREIGN KEY (`prodid`)
    REFERENCES `shopping-cart`.`product` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*-------------------------------------------------------
--Table `shopping-cart`.`user`
-------------------------------------------------------*/
DROP TABLE IF EXISTS `shopping-cart`.`user` ;
CREATE TABLE IF NOT EXISTS `shopping-cart`.`user` (
  `email` VARCHAR(60) NOT NULL,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `mobile` BIGINT NULL DEFAULT NULL,
  `address` VARCHAR(250) NULL DEFAULT NULL,
  `pincode` INT NULL DEFAULT NULL,
  `password` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*-------------------------------------------------------
--Table `shopping-cart`.`transactions`
-------------------------------------------------------*/
DROP TABLE IF EXISTS `shopping-cart`.`transactions` ;
CREATE TABLE IF NOT EXISTS `shopping-cart`.`transactions` (
  `transid` VARCHAR(45) NOT NULL,
  `username` VARCHAR(60) NULL DEFAULT NULL,
  `time` DATETIME NULL DEFAULT NULL,
  `amount` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`transid`),
  INDEX `truserid_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `truserid`
    FOREIGN KEY (`username`)
    REFERENCES `shopping-cart`.`user` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `transorderid`
    FOREIGN KEY (`transid`)
    REFERENCES `shopping-cart`.`orders` (`orderid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*-------------------------------------------------------
--Table `shopping-cart`.`user_demand`
-------------------------------------------------------*/
DROP TABLE IF EXISTS `shopping-cart`.`user_demand` ;
CREATE TABLE IF NOT EXISTS `shopping-cart`.`user_demand` (
  `username` VARCHAR(60) NOT NULL,
  `prodid` VARCHAR(45) NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`username`, `prodid`),
  INDEX `prodid_idx` (`prodid` ASC) VISIBLE,
  CONSTRAINT `userdemailemail`
    FOREIGN KEY (`username`)
    REFERENCES `shopping-cart`.`user` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prodid`
    FOREIGN KEY (`prodid`)
    REFERENCES `shopping-cart`.`product` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
/*-------------------------------------------------------*/
--Table `shopping-cart`.`usercart`
/*-------------------------------------------------------*/
DROP TABLE IF EXISTS `shopping-cart`.`usercart` ;
CREATE TABLE IF NOT EXISTS `shopping-cart`.`usercart` (
  `username` VARCHAR(60) NULL DEFAULT NULL,
  `prodid` VARCHAR(45) NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  INDEX `useremail_idx` (`username` ASC) VISIBLE,
  INDEX `prodidcart_idx` (`prodid` ASC) VISIBLE,
  CONSTRAINT `useremail`
    FOREIGN KEY (`username`)
    REFERENCES `shopping-cart`.`user` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prodidcart`
    FOREIGN KEY (`prodid`)
    REFERENCES `shopping-cart`.`product` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;  

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
/*-------------------------------------------------------
--Data for table*/ 
 `shopping-cart`.`product`
/*-------------------------------------------------------*/
START TRANSACTION;
USE `shopping-cart`;
INSERT INTO `shopping-cart`.`product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`, `image`) VALUES ('P20230423082243', 'APPLE iPhone 13 Pro (Graphite, 512 GB)', 'mobile', '\r\niPhone 13. boasts an advanced dual-camera system that allows you to click mesmerising pictures with immaculate clarity.', 125999.00, 1000, 0x89504E470D0A1A0A0000000D49484452000001A7000001F4080600000099F5E2C1000000097048597300000EC400000EC401952B0E1B0000200049444154789CECBD69B025C7791D78326BB9CBBBF7DDFBD6DE5E6F686C048885044959A4A4092D1424CDD85A280D65529A19DA724CCC98A66722341133FEE3F04478C2138E50D8B26C0D2D89126D4BB248991249591241522445492009A0B10304
