CREATE SCHEMA `quanlybanhang` ;
CREATE TABLE `quanlybanhang`.`customer` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(45) NULL,
  `CustomerAge` INT NOT NULL,
  CHECK(CustomerAge BETWEEN 0 AND 100),
  PRIMARY KEY (`CustomerID`));
CREATE TABLE `quanlybanhang`.`order` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `OrderTotalPrice` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `quanlybanhang`.`customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
CREATE TABLE `quanlybanhang`.`product` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `ProductPrice` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`ProductID`));
ALTER TABLE `quanlybanhang`.`order_detail` 
ADD INDEX `ProductID_idx` (`ProductID` ASC) VISIBLE;
;
ALTER TABLE `quanlybanhang`.`order_detail` 
ADD CONSTRAINT `ProductID`
  FOREIGN KEY (`ProductID`)
  REFERENCES `quanlybanhang`.`product` (`ProductID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;