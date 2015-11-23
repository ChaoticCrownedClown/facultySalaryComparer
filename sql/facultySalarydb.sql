-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema FacultySalarydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FacultySalarydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FacultySalarydb` DEFAULT CHARACTER SET utf8 ;
USE `FacultySalarydb` ;

-- -----------------------------------------------------
-- Table `FacultySalarydb`.`GroupCodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FacultySalarydb`.`GroupCodes` (
  `idGroupCodes` INT NOT NULL AUTO_INCREMENT,
  `groupCode` VARCHAR(45) NOT NULL,
  `groupDescription` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGroupCodes`),
  UNIQUE INDEX `idGroupCodes_UNIQUE` (`idGroupCodes` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FacultySalarydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FacultySalarydb`.`Department` (
  `idDepartment` INT NOT NULL AUTO_INCREMENT,
  `nameDepartment` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`idDepartment`),
  UNIQUE INDEX `idDepartment_UNIQUE` (`idDepartment` ASC),
  UNIQUE INDEX `nameDepartment_UNIQUE` (`nameDepartment` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FacultySalarydb`.`JobTitles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FacultySalarydb`.`JobTitles` (
  `idJobTitles` INT NOT NULL AUTO_INCREMENT,
  `nameJobTitles` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`idJobTitles`),
  UNIQUE INDEX `idJobTitles_UNIQUE` (`idJobTitles` ASC),
  UNIQUE INDEX `nameJobTitles_UNIQUE` (`nameJobTitles` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FacultySalarydb`.`Faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FacultySalarydb`.`Faculty` (
  `idFaculty` INT NOT NULL AUTO_INCREMENT,
  `nameFaculty` VARCHAR(45) NOT NULL,
  `idGroup` INT NOT NULL,
  `idDepartment` INT NOT NULL,
  `idTitleFaculty` INT NOT NULL,
  `Salary` DOUBLE NOT NULL,
  `yearsWorked` INT NOT NULL,
  PRIMARY KEY (`idFaculty`),
  UNIQUE INDEX `idFaculty_UNIQUE` (`idFaculty` ASC),
  INDEX `idGroup_idx` (`idGroup` ASC),
  INDEX `idDepartment_idx` (`idDepartment` ASC),
  INDEX `idTitleFaculty_idx` (`idTitleFaculty` ASC),
  CONSTRAINT `idGroup`
    FOREIGN KEY (`idGroup`)
    REFERENCES `FacultySalarydb`.`GroupCodes` (`idGroupCodes`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `idDepartment`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `FacultySalarydb`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTitleFaculty`
    FOREIGN KEY (`idTitleFaculty`)
    REFERENCES `FacultySalarydb`.`JobTitles` (`idJobTitles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
