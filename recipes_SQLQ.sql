-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema recipes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema recipes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `recipes` DEFAULT CHARACTER SET utf8 ;
USE `recipes` ;

-- -----------------------------------------------------
-- Table `recipes`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `pw` LONGTEXT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipes`.`recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes`.`recipes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `instructions` LONGTEXT NULL,
  `is_under` VARCHAR(3) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipes_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipes_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `recipes`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipes`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recipes`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `recipe_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `comment` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_recipes_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_comments_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_recipes`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipes`.`recipes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `recipes`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
