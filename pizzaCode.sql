-- MySQL Script generated by MySQL Workbench
-- Mon Oct  3 17:41:12 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`menu` ;

CREATE TABLE IF NOT EXISTS `mydb`.`menu` (
  `idMenu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pizza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pizza` ;

CREATE TABLE IF NOT EXISTS `mydb`.`pizza` (
  `idPizza` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPizza`),
  CONSTRAINT `FK_idPizzaFromMenu`
    FOREIGN KEY (`idPizza`)
    REFERENCES `mydb`.`menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dessert`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`dessert` ;

CREATE TABLE IF NOT EXISTS `mydb`.`dessert` (
  `idDessert` VARCHAR(45) NOT NULL,
  `price` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`idDessert`),
  CONSTRAINT `FK_idDessert`
    FOREIGN KEY (`idDessert`)
    REFERENCES `mydb`.`menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`drink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`drink` ;

CREATE TABLE IF NOT EXISTS `mydb`.`drink` (
  `idDrink` VARCHAR(45) NOT NULL,
  `price` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`idDrink`),
  CONSTRAINT `FK_idDrink`
    FOREIGN KEY (`idDrink`)
    REFERENCES `mydb`.`menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ingredient` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ingredient` (
  `idIngredient` VARCHAR(45) NOT NULL,
  `price` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`idIngredient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ingredient_pizza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ingredient_pizza` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ingredient_pizza` (
  `idPizza` VARCHAR(45) NOT NULL,
  `idIngredient` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPizza`, `idIngredient`),
  INDEX `Fk_ingredient_idx` (`idIngredient` ASC) VISIBLE,
  CONSTRAINT `Fk_ingredient`
    FOREIGN KEY (`idIngredient`)
    REFERENCES `mydb`.`ingredient` (`idIngredient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Fk_idPizzaFromPizza`
    FOREIGN KEY (`idPizza`)
    REFERENCES `mydb`.`pizza` (`idPizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`driver` ;

CREATE TABLE IF NOT EXISTS `mydb`.`driver` (
  `idDriver` INT NOT NULL,
  `available` TINYINT(1) NOT NULL,
  `phone` VARCHAR(16) NOT NULL,
  `birthday` DATE NOT NULL,
  `emploment_start` DATE NOT NULL,
  `emploment_end` DATE NULL,
  PRIMARY KEY (`idDriver`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`password`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`password` ;

CREATE TABLE IF NOT EXISTS `mydb`.`password` (
  `idCustomer` INT NOT NULL,
  `userName` VARCHAR(45) NULL,
  `userPassword` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`customer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`customer` (
  `idCustomer` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(16) NOT NULL,
  `zipcode` VARCHAR(6) NOT NULL,
  `street_name` VARCHAR(45) NOT NULL,
  `street_number` VARCHAR(6) NOT NULL,
  `street_addition` VARCHAR(10) NULL,
  `number_of_pizza` INT NOT NULL,
  PRIMARY KEY (`idCustomer`),
  CONSTRAINT `FK_idCustomer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `mydb`.`password` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`order` ;

CREATE TABLE IF NOT EXISTS `mydb`.`order` (
  `idOrder` INT NOT NULL,
  `idDriver` INT NULL,
  `order_date_time` DATETIME NOT NULL,
  `idCustomer` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `FK_idDriver_idx` (`idDriver` ASC) VISIBLE,
  INDEX `FK_idCustomer_idx` (`idCustomer` ASC) VISIBLE,
  CONSTRAINT `FK_idDriver`
    FOREIGN KEY (`idDriver`)
    REFERENCES `mydb`.`driver` (`idDriver`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_idCustomerFromOrder`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `mydb`.`customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`menu_Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`menu_Order` ;

CREATE TABLE IF NOT EXISTS `mydb`.`menu_Order` (
  `idMenu` VARCHAR(45) NOT NULL,
  `idOrder` INT NOT NULL,
  PRIMARY KEY (`idMenu`, `idOrder`),
  INDEX `FK_idOrder_idx` (`idOrder` ASC) VISIBLE,
  CONSTRAINT `FK_idMenu`
    FOREIGN KEY (`idMenu`)
    REFERENCES `mydb`.`menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_idOrder`
    FOREIGN KEY (`idOrder`)
    REFERENCES `mydb`.`order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`discount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`discount` ;

CREATE TABLE IF NOT EXISTS `mydb`.`discount` (
  `code` VARCHAR(45) NOT NULL,
  `idCustomer` INT NOT NULL,
  `date_created` DATE NOT NULL,
  `date_used` DATE NULL,
  PRIMARY KEY (`code`, `idCustomer`),
  INDEX `FK_idCustomer_idx` (`idCustomer` ASC) VISIBLE,
  CONSTRAINT `FK_idCustomerFromDiscount`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `mydb`.`customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
