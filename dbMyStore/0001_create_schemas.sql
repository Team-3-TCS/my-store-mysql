SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
    UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE,
    SQL_MODE = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbMyStore
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dbMyStore`;
-- -----------------------------------------------------
-- Schema dbMyStore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbMyStore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;