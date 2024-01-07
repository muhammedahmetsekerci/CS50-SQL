CREATE DATABASE `linkedin`;
USE `linkedin`;


CREATE TABLE `Users`(
    `id` INT AUTO_INCREMENT,
    `first_lastname` VARCHAR(30) NOT NULL,
    `username` VARCHAR(25) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
     PRIMARY KEY(`id`)
);

CREATE TABLE `Schools`(
    `id` INT AUTO_INCREMENT,
    `school_name` VARCHAR(50) NOT NULL,
    `school_type` ENUM(`Primary`, `Secondary`, `Higher Education`) NOT NULL,
    'school_location' VARCHAR(30) NOT NULL,
    'school_year' DATE NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `Companies`(
    `id` INT AUTO_INCREMENT,
    `company_name` VARCHAR(30) NOT NULL,
    `company_industry` VARCHAR(20) NOT NULL,
    `company_location`VARCHAR(20) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `people_connections`(
    `id` INT AUTO_INCREMENT,
    'user_id' INT NOT NULL,
    `following_user_id` INT NOT NULL,
    `connection_date` DATE NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`following_user_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE `school_connections`(
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `school_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `degree_type` VARCHAR(10) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `Schools`(`id`)
);

CREATE TABLE `company_connections`(
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `Companies`(`id`)
);



