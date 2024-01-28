CREATE TABLE `licenses` (
    `name` VARCHAR(60) NOT NULL,
    `label` VARCHAR(60) NOT NULL,
    PRIMARY KEY (`name`)
) ENGINE=InnoDB;

ALTER TABLE `users` ADD COLUMN `licenses` LONGTEXT NULL;