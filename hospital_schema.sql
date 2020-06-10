Schema Name: hospital_db


#Create schema
CREATE SCHEMA `hospital_db` ;

#Gender table
CREATE TABLE `hospital_db`.`gender` (
  `gender_id` INT NOT NULL,
  `gender_name` VARCHAR(45) NOT NULL,
  `created_date` TIMESTAMP NOT NULL,
  `updated_date` TIMESTAMP NULL,
  PRIMARY KEY (`gender_id`, `gender_name`),
  UNIQUE INDEX `gender_id_UNIQUE` (`gender_id` ASC) VISIBLE,
  UNIQUE INDEX `gender_name_UNIQUE` (`gender_name` ASC) VISIBLE);

#Hospital type table
CREATE TABLE `hospital_db`.`hospital_type` (
  `hospital_type_id` INT NOT NULL,
  `hospital_type_name` VARCHAR(56) NOT NULL,
  `created_date` TIMESTAMP NOT NULL,
  `updated_date` TIMESTAMP NULL,
  PRIMARY KEY (`hospital_type_id`, `hospital_type_name`),
  UNIQUE INDEX `hospital_type_id_UNIQUE` (`hospital_type_id` ASC) VISIBLE,
  UNIQUE INDEX `hospital_type_name_UNIQUE` (`hospital_type_name` ASC) VISIBLE);

#Appointment Status type table

CREATE TABLE `hospital_db`.`appointment_status` (
  `appointment_status_id` INT NOT NULL,
  `appointment_status_name` VARCHAR(56) NOT NULL,
  `created_date` TIMESTAMP NOT NULL,
  `updated_date` TIMESTAMP NULL,
  UNIQUE INDEX `appointment_status_id_UNIQUE` (`appointment_status_id` ASC, `appointment_status_name` ASC) VISIBLE,
  UNIQUE INDEX `appointment_status_name_UNIQUE` (`appointment_status_name` ASC) VISIBLE);

#Payment Status type table
CREATE TABLE `hospital_db`.`payment_status` (
  `payment_status_id` INT NOT NULL,
  `payment_status_name` VARCHAR(56) NOT NULL,
  `created_date` TIMESTAMP NOT NULL,
  `updated_date` TIMESTAMP NULL,
  UNIQUE INDEX `payment_status_id_UNIQUE` (`payment_status_id` ASC, `payment_status_name` ASC) VISIBLE,
  UNIQUE INDEX `payment_status_name_UNIQUE` (`payment_status_name` ASC) VISIBLE);

#User Status table
CREATE TABLE `hospital_db`.`user_status` (
  `user_status_id` INT NOT NULL,
  `user_status_name` VARCHAR(64) NOT NULL,
  `created_date` TIMESTAMP NOT NULL,
  `updated_date` TIMESTAMP NULL,
  PRIMARY KEY (`user_status_id`, `user_status_name`));

#Users table
CREATE TABLE `hospital_db`.`users` (
  `user_pk` BIGINT(11) NOT NULL,
  `user_id` VARCHAR(56) NOT NULL,
  `source` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NULL,
  `gender` INT NOT NULL,
  `primary_contact_no` VARCHAR(20) NOT NULL,
  `secondary_contact_no` VARCHAR(20) NULL,
  `email` VARCHAR(128) NOT NULL,
  `status` INT NOT NULL,
  `created_on` TIMESTAMP NOT NULL,
  `updated_on` TIMESTAMP NULL,
  PRIMARY KEY (`user_pk`, `user_id`, `primary_contact_no`, `email`),
  INDEX `gender_fk_idx` (`gender` ASC) VISIBLE,
  INDEX `user_status_fk_idx` (`status` ASC) VISIBLE,
  CONSTRAINT `gender_fk`
    FOREIGN KEY (`gender`)
    REFERENCES `hospital_db`.`gender` (`gender_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_status_fk`
    FOREIGN KEY (`status`)
    REFERENCES `hospital_db`.`user_status` (`user_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

#User address Status table

CREATE TABLE `hospital_db`.`user_address_status` (
  `user_address_status_id` INT NOT NULL,
  `user_address_status_name` VARCHAR(64) NOT NULL,
  `created_date` TIMESTAMP NOT NULL,
  `updated_date` TIMESTAMP NULL,
  PRIMARY KEY (`user_address_status_id`, `user_address_status_name`));

#User address table
CREATE TABLE `hospital_db`.`user_address` (
  `user_address_pk` BIGINT(11) NOT NULL,
  `user_address_id` VARCHAR(64) NOT NULL,
  `user_id` BIGINT(11) NOT NULL,
  `latitude` DECIMAL(10,8) NULL,
  `longitude` DECIMAL(10,8) NULL,
  `address1` VARCHAR(100) NOT NULL,
  `address2` VARCHAR(100) NULL,
  `landmark` VARCHAR(100) NULL,
  `area` VARCHAR(64) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(64) NOT NULL,
  `pincode` VARCHAR(20) NULL,
  `country` VARCHAR(64) NOT NULL,
  `status` INT NOT NULL,
  `created_on` TIMESTAMP NOT NULL,
  `updated_on` TIMESTAMP NULL,
  PRIMARY KEY (`user_address_pk`, `user_address_id`),
  INDEX `user_fk_idx` (`user_id` ASC) VISIBLE,
  INDEX `user_address_status_fk_idx` (`status` ASC) VISIBLE,
  CONSTRAINT `user_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `hospital_db`.`users` (`user_pk`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_address_status_fk`
    FOREIGN KEY (`status`)
    REFERENCES `hospital_db`.`user_address_status` (`user_address_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



 
