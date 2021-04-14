use happyhouse;
select * from dongcode;
select * from baseaddress;
select * from guguncode;
select * from houseinfo;
select * from sidocode;
select * from users;


CREATE TABLE `users` (
  `NUM` int NOT NULL AUTO_INCREMENT,
  `USERID` varchar(20) NOT NULL,
  `PASS` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `EMAIL` varchar(20) NOT NULL,
  `ADDRESS` varchar(20) NOT NULL,
  PRIMARY KEY (`NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci