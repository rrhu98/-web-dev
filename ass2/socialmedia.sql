CREATE database socialmedia; 

CREATE  TABLE IF NOT EXISTS `UserInfo` (
`user_id` INT(20) NOT NULL AUTO_INCREMENT,
`Username` VARCHAR(40) NOT NULL,
`Password` VARCHAR(100) NOT NULL,
`Last Name` VARCHAR(40) NOT NULL,
`First Name` VARCHAR(40) NOT NULL,
`Email` VARCHAR(80) NOT NULL,
`Gender` ENUM('M', 'F'),
PRIMARY KEY(`user_id`))
ENGINE = InnoDB; 

CREATE TABLE `contact`(
`contacts_id` INT(20) NOT NULL,
`user_id` INT(20) NOT NULL,
`contact_username` VARCHAR(40) NOT NULL,
`Username` VARCHAR(40) NOT NULL,
PRIMARY KEY(`user_id`, `contacts_id`))
ENGINE = InnoDB;

CREATE TABLE `Messages` (
`message_id` Int(20) NOT NULL AUTO_INCREMENT,
`from_userid` Int(20) NOT NULL,
`to_userid` Int(20) NOT NULL,
`content` text NOT NULL,
PRIMARY KEY(`message_id`))
ENGINE = InnoDB;

CREATE TABLE `Likes` (
`Interest` VARCHAR(100) NOT NULL,
`like_id` Int(20) NOT NULL AUTO_INCREMENT,
PRIMARY KEY(`like_id`))
ENGINE = InnoDB;

INSERT INTO `UserInfo` (`user_id`,`Username`, `Password`, `Last Name`, `First Name`, `Email`, `Gender`) VALUES (1, 'rrhu98', 'mypassword', 'Hu', 'Ryan', 'rrhu98@gmail.com', 'M');
INSERT INTO `UserInfo` (`user_id`, `Username`, `Password`, `Last Name`, `First Name`, `Email`, `Gender`) VALUES (2, 'jeffyboy', 'jeff123', 'Bezos', 'Jeff', 'rjeffbezos@amazon.com', 'M');
INSERT INTO `UserInfo` (`user_id`,`Username`, `Password`, `Last Name`, `First Name`, `Email`, `Gender`) VALUES (3,'officialsl', 'slbestrapper', 'L', 'S', 'sl@ukgrime.com', 'M');
INSERT INTO `UserInfo` (`user_id`,`Username`, `Password`, `Last Name`, `First Name`, `Email`, `Gender`) VALUES (4,'msjorja', 'jorjasmith22', 'Smith', 'Jorja', 'jorjasmith@hotmail.com', 'F');
INSERT INTO `UserInfo` (`user_id`,`Username`, `Password`, `Last Name`, `First Name`, `Email`, `Gender`) VALUES (5,'champagnepapi', 'drakeguyovo', 'Graham', 'Aubrey', 'drake@ovo.ca', 'M');

INSERT INTO `contact` (`contacts_id`, `user_id`, `contact_username`, `Username`) VALUES (2, 1, 'jeffyboy', 'rrhu98');
INSERT INTO `contact` (`contacts_id`, `user_id`, `contact_username`, `Username`) VALUES (3, 1, 'officialsl', 'rrhu98');
INSERT INTO `contact` (`contacts_id`, `user_id`, `contact_username`, `Username`) VALUES (4, 1, 'msjorja', 'rrhu98');
INSERT INTO `contact` (`contacts_id`, `user_id`, `contact_username`, `Username`) VALUES (5, 1, 'champagnepapi', 'rrhu98');

INSERT INTO `Messages` (`from_userid`, `to_userid`, `content`) VALUES (1, 3, 'Hey man really like your music');
INSERT INTO `Messages` (`from_userid`, `to_userid`, `content`) VALUES (1, 2, 'Yo when is my package from Amazon coming in');
INSERT INTO `Messages` (`from_userid`, `to_userid`, `content`) VALUES (1, 5, 'Whens your album with future releasing');

INSERT INTO `Likes` (`Interest`) VALUES ('Basketball');
INSERT INTO `Likes` (`Interest`) VALUES ('Hip Hop');
INSERT INTO `Likes` (`Interest`) VALUES ('Programming');
INSERT INTO `Likes` (`Interest`) VALUES ('Drake');
INSERT INTO `Likes` (`Interest`) VALUES ('Call of Duty');
INSERT INTO `Likes` (`Interest`) VALUES ('Fortnite');
INSERT INTO `Likes` (`Interest`) VALUES ('CS:GO');
INSERT INTO `Likes` (`Interest`) VALUES ('Sneakers');
INSERT INTO `Likes` (`Interest`) VALUES ('Air Max');

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

flush privileges; 
