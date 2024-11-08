-- MySQL Script generated by MySQL Workbench
-- Mon Oct 21 20:07:28 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema zoo_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zoo_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zoo_1` DEFAULT CHARACTER SET utf8 ;
USE `zoo_1` ;

-- -----------------------------------------------------
-- Table `zoo_1`.`food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo_1`.`food` (
  `id_food` INT NOT NULL AUTO_INCREMENT,
  `name_food` VARCHAR(45) NOT NULL,
  `price_for_unit` DECIMAL(10,2) NOT NULL,
  `unit_weight` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_food`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo_1`.`animal types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo_1`.`animal types` (
  `id_type` INT NOT NULL AUTO_INCREMENT,
  `name_type` VARCHAR(45) NOT NULL,
  `id_food` INT NOT NULL,
  `amount_of_food` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_type`),
  INDEX `food_idx` (`id_food` ASC) VISIBLE,
  CONSTRAINT `food`
    FOREIGN KEY (`id_food`)
    REFERENCES `zoo_1`.`food` (`id_food`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo_1`.`animals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo_1`.`animals` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_type` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `food` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `type_idx` (`id_type` ASC) VISIBLE,
  CONSTRAINT `type`
    FOREIGN KEY (`id_type`)
    REFERENCES `zoo_1`.`animal types` (`id_type`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo_1`.`sells`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo_1`.`sells` (
  `id_sell` INT NOT NULL AUTO_INCREMENT,
  `id` INT NOT NULL,
  `under_repair` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_sell`),
  INDEX `animal_idx` (`id` ASC) VISIBLE,
  CONSTRAINT `animal`
    FOREIGN KEY (`id`)
    REFERENCES `zoo_1`.`animals` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
