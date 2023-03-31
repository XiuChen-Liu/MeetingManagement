DROP DATABASE IF EXISTS `dbsa`;
CREATE DATABASE `dbsa` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE `dbsa`;
/*員工檔*/
CREATE TABLE `users`(
     users_staffId VARCHAR(8) NOT NULL,
     users_name VARCHAR(10),
     users_position VARCHAR(10), 
     users_Password VARCHAR(10) ,
     users_Email VARCHAR(50),
     PRIMARY KEY(users_staffId)
);

INSERT INTO users (users_staffId,users_name,users_position,users_Password,
				users_Email) values 
                ('10615099','張九九','業務部部員','zhangnine','zhangnine@walsincloud.com.xx'),
                ('10413001','陳乙己','財務部經理','chenyiji','chenyiji@walsincloud.com.xx'),
                ('10413007','陳七七','財務部主管','chenseven','chenseven@walsincloud.com.xx'),
                ('10611001','王二','會計部主任','wangtwo','wangtwo@walsincloud.com.xx'),
                ('10312023','王三','人事部主任','wangthree','wangthree@walsincloud.com.xx'),
                ('10413002','陳丙己','財務部部員','chenbingji','chenbingji@walsincloud.com.xx'),
                ('10516006','林六六','資訊部部員','linsix','linsix@walsincloud.com.xx'),
                ('10616049','林戚戚','資訊部部員','lingseven','lingseven@walsincloud.com.xx'),
                ('10616033','林三三','資訊部經理','lingthree','lingthree@walsincloud.com.xx'),
                ('09912002','王大','人事部經理','wangone','wangone@walsincloud.com.xx');

/*新空間檔*/
CREATE TABLE `confrooms`(
	cfr_Id INT not null auto_increment,
    cfr_Name VARCHAR(20),
    cfr_location varchar(50),
    cfr_managerid varchar(8),
    cfr_accommodate int,
    cfr_price int,
    cfr_isExist boolean,
    primary key(cfr_Id)
);

INSERT INTO confrooms(cfr_Name,cfr_location,cfr_managerid,cfr_accommodate,cfr_price,cfr_isExist) VALUE ('第一會議室','臺北市信義區松智路1號25樓011室','10611001','50','500',true);
INSERT INTO confrooms(cfr_Name,cfr_location,cfr_managerid,cfr_accommodate,cfr_price,cfr_isExist) VALUE ('第二會議室','臺北市信義區松智路1號25樓022室','10413002','30','300',true);
INSERT INTO confrooms(cfr_Name,cfr_location,cfr_managerid,cfr_accommodate,cfr_price,cfr_isExist)VALUE ('第三會議室','臺北市信義區松智路1號25樓033室','10616033','35','350',true);
INSERT INTO confrooms(cfr_Name,cfr_location,cfr_managerid,cfr_accommodate,cfr_price,cfr_isExist) VALUE ('第四會議室','臺北市信義區松智路1號25樓044室','10616049','40','400',true);
INSERT INTO confrooms(cfr_Name,cfr_location,cfr_managerid,cfr_accommodate,cfr_price,cfr_isExist) VALUE ('第五會議室','臺北市信義區松智路1號25樓055室','10616049','55','550',true);

/*會議主檔*/
CREATE TABLE `confs`(
	confs_Id INT not null auto_increment,
    confs_Name VARCHAR(50) not null,
    organizerId VARCHAR(8) not null, /*承辦人ID*/
    startTime VARCHAR(18) not null,
    endTime VARCHAR(18) not null,
    topic VARCHAR(30) not null,  
    charId VARCHAR(30) not null, /*主持人的ID*/
    roomID VARCHAR(20) not null,
    isChairSign VARCHAR(3),/*待確認,核准,駁回*/
	isRoomSign VARCHAR(3),/*待確認,核准,駁回*/
    cost INT,
    PRIMARY KEY(confs_Id)
);




/*會議記錄檔*/
CREATE TABLE `minutes`(
	confs_Id INT,
    staffId VARCHAR(8),
    senderStaffId VARCHAR(8),
    filepath VARCHAR(50),
    filename VARCHAR(20),
    sendtime datetime
);


/*參與人員檔*/
CREATE TABLE `attendees`(
	confs_Id INT,
    staffId VARCHAR(8),
    attendType VARCHAR(2), /*出席、列席*/
    attendMode VARCHAR(3) /*待確認、在場、線上、離線*/
    
);

SET SQL_SAFE_UPDATES=0;
