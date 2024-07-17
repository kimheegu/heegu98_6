-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema muselabdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema muselabdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `muselabdb` DEFAULT CHARACTER SET utf8mb3 ;
USE `muselabdb` ;

-- -----------------------------------------------------
-- Table `muselabdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`user` (
  `user_id` VARCHAR(20) NOT NULL,
  `user_pwd` VARCHAR(20) NOT NULL,
  `user_phone` VARCHAR(20) NOT NULL,
  `user_email` VARCHAR(40) NOT NULL,
  `user_nickname` VARCHAR(30) NOT NULL,
  `user_profile` VARCHAR(200) NULL DEFAULT NULL,
  `user_info` VARCHAR(500) NULL DEFAULT NULL,
  `user_address` VARCHAR(50) NULL DEFAULT NULL,
  `user_grade` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_phone_UNIQUE` (`user_phone` ASC) VISIBLE,
  UNIQUE INDEX `user_nickname_UNIQUE` (`user_nickname` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3
COMMENT = '	';


-- -----------------------------------------------------
-- Table `muselabdb`.`community`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`community` (
  `community_id` INT NOT NULL AUTO_INCREMENT,
  `community_category` VARCHAR(20) NOT NULL,
  `community_title` VARCHAR(45) NOT NULL,
  `community_content` VARCHAR(10000) NOT NULL,
  `community_date` TIMESTAMP NOT NULL,
  `community_image1` VARCHAR(200) NULL DEFAULT NULL,
  `community_image2` VARCHAR(200) NULL DEFAULT NULL,
  `community_image3` VARCHAR(200) NULL DEFAULT NULL,
  `community_image4` VARCHAR(200) NULL DEFAULT NULL,
  `community_image5` VARCHAR(200) NULL DEFAULT NULL,
  `community_user` VARCHAR(20) NOT NULL,
  `community_views` INT NOT NULL,
  `community_like` INT NOT NULL,
  PRIMARY KEY (`community_id`, `community_user`),
  INDEX `fk_community_user1_idx` (`community_user` ASC) VISIBLE,
  CONSTRAINT `fk_community_user1`
    FOREIGN KEY (`community_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`comm_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`comm_comment` (
  `comm_comment_id` INT NOT NULL AUTO_INCREMENT,
  `comm_comment_content` VARCHAR(10000) NOT NULL,
  `comm_comment_date` TIMESTAMP NOT NULL,
  `comm_comment_comm` INT NOT NULL,
  `comm_comment_user` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`comm_comment_id`, `comm_comment_comm`, `comm_comment_user`),
  INDEX `fk_comment_community1_idx` (`comm_comment_comm` ASC) VISIBLE,
  INDEX `fk_comment_user1_idx` (`comm_comment_user` ASC) VISIBLE,
  CONSTRAINT `fk_comment_community1`
    FOREIGN KEY (`comm_comment_comm`)
    REFERENCES `muselabdb`.`community` (`community_id`),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`comm_comment_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`comm_like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`comm_like` (
  `comm_like_id` INT NOT NULL AUTO_INCREMENT,
  `comm_like_user` VARCHAR(20) NOT NULL,
  `comm_like_post` INT NOT NULL,
  PRIMARY KEY (`comm_like_id`, `comm_like_user`, `comm_like_post`),
  INDEX `fk_comm_like_user1_idx` (`comm_like_user` ASC) VISIBLE,
  INDEX `fk_comm_like_community1_idx` (`comm_like_post` ASC) VISIBLE,
  CONSTRAINT `fk_comm_like_community1`
    FOREIGN KEY (`comm_like_post`)
    REFERENCES `muselabdb`.`community` (`community_id`),
  CONSTRAINT `fk_comm_like_user1`
    FOREIGN KEY (`comm_like_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`market`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`market` (
  `market_id` INT NOT NULL AUTO_INCREMENT,
  `market_title` VARCHAR(50) NOT NULL,
  `market_content` VARCHAR(500) NOT NULL,
  `market_image1` VARCHAR(200) NULL DEFAULT NULL,
  `market_image2` VARCHAR(200) NULL DEFAULT NULL,
  `market_image3` VARCHAR(200) NULL DEFAULT NULL,
  `market_image4` VARCHAR(200) NULL DEFAULT NULL,
  `market_image5` VARCHAR(200) NULL DEFAULT NULL,
  `market_price` INT NOT NULL,
  `market_condition` VARCHAR(20) NULL DEFAULT NULL,
  `market_category` VARCHAR(20) NOT NULL,
  `market_user` VARCHAR(20) NOT NULL,
  `market_views` INT NOT NULL,
  `market_like` INT NOT NULL,
  PRIMARY KEY (`market_id`, `market_user`),
  INDEX `fk_market_user_idx` (`market_user` ASC) VISIBLE,
  CONSTRAINT `fk_market_user`
    FOREIGN KEY (`market_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`mk_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`mk_comment` (
  `mk_comment_id` INT NOT NULL AUTO_INCREMENT,
  `mk_comment_content` VARCHAR(10000) NOT NULL,
  `mk_comment_date` TIMESTAMP NOT NULL,
  `mk_comment_market` INT NOT NULL,
  `mk_comment_user` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`mk_comment_id`, `mk_comment_market`, `mk_comment_user`),
  INDEX `fk_mk_comment_market1_idx` (`mk_comment_market` ASC) VISIBLE,
  INDEX `fk_mk_comment_user1_idx` (`mk_comment_user` ASC) VISIBLE,
  CONSTRAINT `fk_mk_comment_market1`
    FOREIGN KEY (`mk_comment_market`)
    REFERENCES `muselabdb`.`market` (`market_id`),
  CONSTRAINT `fk_mk_comment_user1`
    FOREIGN KEY (`mk_comment_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`mk_like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`mk_like` (
  `mk_like_id` INT NOT NULL AUTO_INCREMENT,
  `mk_like_mk` INT NOT NULL,
  `mk_like_user` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`mk_like_id`, `mk_like_mk`, `mk_like_user`),
  INDEX `fk_mk_like_market1_idx` (`mk_like_mk` ASC) VISIBLE,
  INDEX `fk_mk_like_user1_idx` (`mk_like_user` ASC) VISIBLE,
  CONSTRAINT `fk_mk_like_market1`
    FOREIGN KEY (`mk_like_mk`)
    REFERENCES `muselabdb`.`market` (`market_id`),
  CONSTRAINT `fk_mk_like_user1`
    FOREIGN KEY (`mk_like_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`music`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`music` (
  `music_id` INT NOT NULL AUTO_INCREMENT,
  `music_title` VARCHAR(45) NOT NULL,
  `music_info` VARCHAR(200) NOT NULL,
  `music_genre` VARCHAR(40) NOT NULL,
  `music_album` VARCHAR(45) NULL DEFAULT NULL,
  `music_date` TIMESTAMP NOT NULL,
  `music_image` VARCHAR(200) NULL DEFAULT NULL,
  `music_user` VARCHAR(20) NOT NULL,
  `music_views` INT NOT NULL,
  `music_like` INT NOT NULL,
  PRIMARY KEY (`music_id`, `music_user`),
  INDEX `fk_music_user1_idx` (`music_user` ASC) VISIBLE,
  CONSTRAINT `fk_music_user1`
    FOREIGN KEY (`music_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`music_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`music_comment` (
  `music_comment_id` INT NOT NULL AUTO_INCREMENT,
  `music_comment_content` VARCHAR(10000) NOT NULL,
  `music_comment_date` TIMESTAMP NOT NULL,
  `music_comment_music` INT NOT NULL,
  `music_comment_user` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`music_comment_id`, `music_comment_music`, `music_comment_user`),
  INDEX `fk_music_comment_music1_idx` (`music_comment_music` ASC) VISIBLE,
  INDEX `fk_music_comment_user1_idx` (`music_comment_user` ASC) VISIBLE,
  CONSTRAINT `fk_music_comment_music1`
    FOREIGN KEY (`music_comment_music`)
    REFERENCES `muselabdb`.`music` (`music_id`),
  CONSTRAINT `fk_music_comment_user1`
    FOREIGN KEY (`music_comment_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`music_like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`music_like` (
  `music_like_id` INT NOT NULL AUTO_INCREMENT,
  `music_like_user` VARCHAR(20) NOT NULL,
  `music_like_music` INT NOT NULL,
  PRIMARY KEY (`music_like_id`, `music_like_user`, `music_like_music`),
  INDEX `fk_music_like_user1_idx` (`music_like_user` ASC) VISIBLE,
  INDEX `fk_music_like_music1_idx` (`music_like_music` ASC) VISIBLE,
  CONSTRAINT `fk_music_like_music1`
    FOREIGN KEY (`music_like_music`)
    REFERENCES `muselabdb`.`music` (`music_id`),
  CONSTRAINT `fk_music_like_user1`
    FOREIGN KEY (`music_like_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`notice` (
  `notice_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`notice_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`operation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`operation` (
  `operation_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`operation_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `playlist_folder` VARCHAR(20) NOT NULL,
  `playlist_user` VARCHAR(20) NOT NULL,
  `playlist_music` INT NOT NULL,
  PRIMARY KEY (`playlist_id`, `playlist_user`, `playlist_music`),
  INDEX `fk_playlist_user1_idx` (`playlist_user` ASC) VISIBLE,
  INDEX `fk_playlist_music1_idx` (`playlist_music` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_music1`
    FOREIGN KEY (`playlist_music`)
    REFERENCES `muselabdb`.`music` (`music_id`),
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`playlist_user`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`user_msg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`user_msg` (
  `user_msg_id` INT NOT NULL AUTO_INCREMENT,
  `user_msg_title` VARCHAR(45) NOT NULL,
  `user_msg_content` VARCHAR(200) NOT NULL,
  `user_msg_date` TIMESTAMP NOT NULL,
  `user_msg_sender` VARCHAR(20) NOT NULL,
  `user_msg_receiver` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`user_msg_id`, `user_msg_sender`, `user_msg_receiver`),
  INDEX `fk_user_msg_user1_idx` (`user_msg_sender` ASC) VISIBLE,
  INDEX `fk_user_msg_user2_idx` (`user_msg_receiver` ASC) VISIBLE,
  CONSTRAINT `fk_user_msg_user1`
    FOREIGN KEY (`user_msg_sender`)
    REFERENCES `muselabdb`.`user` (`user_id`),
  CONSTRAINT `fk_user_msg_user2`
    FOREIGN KEY (`user_msg_receiver`)
    REFERENCES `muselabdb`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `muselabdb`.`official_market`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`official_market` (
  `official_market_id` INT NOT NULL AUTO_INCREMENT,
  `official_market_title` VARCHAR(50) NOT NULL,
  `official_market_content` VARCHAR(500) NULL,
  `official_market_image1` VARCHAR(200) NULL,
  `official_market_image2` VARCHAR(200) NULL,
  `official_market_image3` VARCHAR(200) NULL,
  `official_market_image4` VARCHAR(200) NULL,
  `official_market_image5` VARCHAR(200) NULL,
  `official_market_price` INT NOT NULL,
  `official_market_views` INT NOT NULL,
  `official_market_like` INT NOT NULL,
  `official_market_stock` INT NOT NULL,
  PRIMARY KEY (`official_market_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muselabdb`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `cart_count` INT NOT NULL,
  `cart_product_id` INT NOT NULL,
  `cart_user` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cart_id`, `cart_product_id`, `cart_user`),
  INDEX `fk_official_market_cart_official_market1_idx` (`cart_product_id` ASC) VISIBLE,
  INDEX `fk_official_market_cart_user1_idx` (`cart_user` ASC) VISIBLE,
  CONSTRAINT `fk_official_market_cart_official_market1`
    FOREIGN KEY (`cart_product_id`)
    REFERENCES `muselabdb`.`official_market` (`official_market_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_official_market_cart_user1`
    FOREIGN KEY (`cart_user`)
    REFERENCES `muselabdb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muselabdb`.`buy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`buy` (
  `buy_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` VARCHAR(20) NOT NULL,
  `buy_count` INT NOT NULL,
  `buy_status` VARCHAR(45) NOT NULL,
  `buy_package_com` VARCHAR(45) NULL,
  `buy_package_num` VARCHAR(45) NULL,
  `buy_product_id` INT NOT NULL,
  `buy_user_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`buy_id`, `buy_product_id`, `buy_user_id`),
  INDEX `fk_buy_official_market1_idx` (`buy_product_id` ASC) VISIBLE,
  INDEX `fk_buy_user1_idx` (`buy_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_buy_official_market1`
    FOREIGN KEY (`buy_product_id`)
    REFERENCES `muselabdb`.`official_market` (`official_market_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_buy_user1`
    FOREIGN KEY (`buy_user_id`)
    REFERENCES `muselabdb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `muselabdb`.`ad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `muselabdb`.`ad` (
  `ad_id` INT NOT NULL AUTO_INCREMENT,
  `ad_title` VARCHAR(45) NOT NULL,
  `ad_start` TIMESTAMP NOT NULL,
  `ad_end` TIMESTAMP NOT NULL,
  `ad_image` VARCHAR(200) NOT NULL,
  `ad_memo` VARCHAR(200) NULL,
  PRIMARY KEY (`ad_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
