DROP DATABASE IF EXISTS University_Sports_Park;
CREATE DATABASE University_Sports_Park;

USE University_Sports_Park;

CREATE TABLE Staff (
    STAFF_ID                INT UNSIGNED NOT NULL AUTO_INCREMENT,
    STAFF_FName             VARCHAR(255) NOT NULL,
    STAFF_LName             VARCHAR(255) NOT NULL,
    STAFF_DOB               DATE NOT NULL,
    STAFF_Email             VARCHAR(255) UNIQUE NOT NULL,
    STAFF_Gender            ENUM('M', 'F', 'O') NOT NULL,
    STAFF_Phone             VARCHAR(11) UNIQUE NOT NULL,
    STAFF_TeachingLevel     ENUM('1','2') NOT NULL,
    STAFF_Manages           INT UNSIGNED,
    PRIMARY KEY (STAFF_ID),
    FOREIGN KEY (STAFF_Manages) REFERENCES Staff(STAFF_ID)
);

CREATE TABLE Account (
	STAFF_ID                 INT UNSIGNED NOT NULL,
	ACC_Password             VARCHAR(255) NOT NULL,
	PRIMARY KEY (STAFF_ID),
	FOREIGN KEY (STAFF_ID) REFERENCES Staff(STAFF_ID)
);

CREATE TABLE Sessionss (
	SHESH_ID                  INT UNSIGNED NOT NULL AUTO_INCREMENT,
	STAFF_ID                 INT UNSIGNED NOT NULL,
	SHESH_Name               ENUM('Cardio', 'Weight', 'Misc') NOT NULL,
	SHESH_STime              DATETIME NOT NULL,
	SHESH_ETime              DATETIME NOT NULL,
	CHECK (SHESH_STime < SHESH_ETime),
	PRIMARY KEY (SHESH_ID),
	FOREIGN KEY (STAFF_ID) REFERENCES Staff(STAFF_ID)
);

CREATE TABLE Member (
    MEM_ID                  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    MEM_FName               VARCHAR(255) NOT NULL,
    MEM_LName               VARCHAR(255) NOT NULL,
    MEM_DOB                  DATE NOT NULL,
    MEM_Gender               ENUM('M', 'F', 'O') NOT NULL,
    MEM_Email                VARCHAR(255) UNIQUE NOT NULL,
    MEM_Phone                VARCHAR(11) UNIQUE NOT NULL,
    MEM_Address              VARCHAR(255) NOT NULL,
    PRIMARY KEY (MEM_ID)
);

CREATE TABLE Enrolment (
    EROL_ID                 INT UNSIGNED UNIQUE NOT NULL AUTO_INCREMENT,
    MEM_ID                  INT UNSIGNED NOT NULL,
    SHESH_ID                INT UNSIGNED NOT NULL,
    PRIMARY KEY (MEM_ID),
    FOREIGN KEY (MEM_ID) REFERENCES Member(MEM_ID),
    FOREIGN KEY (SHESH_ID) REFERENCES Sessionss(SHESH_ID)
);

CREATE TABLE Membership (
    MSHIP_ID                INT UNSIGNED NOT NULL AUTO_INCREMENT,
    MEM_ID                  INT UNSIGNED NOT NULL,
    MSHIP_Type              ENUM('Silver', 'Gold') NOT NULL,
    MSHIP_ExpiryDate        DATE NOT NULL,
    MSHIP_DateCreated       DATE NOT NULL,
    MSHIP_Cost              INT UNSIGNED NOT NULL,
    MSHIP_Status            ENUM('Valid', 'Invalid'),
    
    CHECK (MSHIP_DateCreated < MSHIP_ExpiryDate),
    PRIMARY KEY (MSHIP_ID),
    FOREIGN KEY (MEM_ID) REFERENCES Member(MEM_ID)
);

CREATE TABLE Payment (
    PAY_ID                  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    MSHIP_ID                INT UNSIGNED NOT NULL,
    PAY_Date                DATE NOT NULL,
    Pay_Amount              INT UNSIGNED NOT NULL,
    PRIMARY KEY (PAY_ID),
    FOREIGN KEY (MSHIP_ID) REFERENCES Membership(MSHIP_ID)
);

CREATE TABLE Gold ( 
    MSHIP_ID                INT UNSIGNED NOT NULL,
    GOLD_Price              INT UNSIGNED NOT NULL,
    PRIMARY KEY (MSHIP_ID),
    FOREIGN KEY (MSHIP_ID) REFERENCES Membership(MSHIP_ID)
);

CREATE TABLE Silver (
    MSHIP_ID                INT UNSIGNED NOT NULL,
    SILVER_Price            INT UNSIGNED NOT NULL,
    PRIMARY KEY (MSHIP_ID),
    FOREIGN KEY (MSHIP_ID) REFERENCES Membership(MSHIP_ID)

);

INSERT INTO Staff (STAFF_FName, STAFF_LName, STAFF_DOB, STAFF_Email, STAFF_Gender, STAFF_Phone, STAFF_TeachingLevel, STAFF_Manages) VALUES
	('Bipindra', 'Rai', '2003-02-26', 'Bipin@hotmail.com', 'M', '07111111111' ,2 ,NULL ),
	('Samuel','Ivuerah','2003-09-20','Sam@hotmail.com','M','07222222222',2 , NULL),
	('William','Daniel','2003-09-08','Will"hotmail.com','O','07333333333',1 ,2),
	('Molly','Carton','2003-01-02','Molly@Hotmail.com','F','07444444444', 2 , NULL),
	('Hannah','Baka','2003-03-20','Hannah@Hotmail.com','F','07555555555',2 ,NULL),
	('Pry','Magar','2003-06-14','Pry@hotmail.com','M','07666666666',1, 4),
	('Shaun','Dixon','2003-04-19','Shaun@hotmail.com','O','07777777777',2 ,NULL),
	('Claudia','Cleg','2003-05-23','Claudia@hotmail.com','F','07888888888',1 ,5),
	('Aidan','Smith','2004-11-03','Aidan@hotmail.com','O','07999999999',2 ,7 ),
	('Rachel','Cena','2003-04-20','Rachel@hotmail.com','f','07123456789',1 , 1 );

INSERT INTO Account (STAFF_ID, ACC_Password) VALUES
	(1, '1111'),
	(2, '1212'),
	(3, '1313'),
	(4, '1414'),
	(5, '1515'),
	(6, '1616'),
	(7, '1717'),
	(8, '1818'),
	(9, '1919'),
	(10, '2020');
	
INSERT INTO  Sessionss ( STAFF_ID, SHESH_Name, SHESH_STime, SHESH_ETime) VALUES
	(3,'Weight','2022-10-20 12:00:00','2022-10-20 13:00:00'),
	(4,'Weight','2022-10-21 12:00:0','2022-10-21 13:00:00'),
	(1,'Cardio','2022-10-22 12:00:0','2022-10-22 13:00:00'),
	(6,'Cardio','2022-10-23 12:00:0','2022-10-23 13:00:00'),
	(2,'Weight','2022-10-24 12:00:0','2022-10-24 13:00:00');
	
INSERT INTO Member ( MEM_FName, MEM_LName, MEM_DOB, MEM_Gender, MEM_Email, MEM_Phone, MEM_Address) VALUES
	('Lily','Young','2002-09-20','F','Lyoung@hotmail.com','07192837167','Manor Park'),
	('Jenny','Lee','2002-09-10','F','Jlee@hotmail.com','07283918276','Manor Park'),
	('Jordan','Kennedy','2003-06-02','F','Jkennedy@hotmail.com','07281928391','Manor Park'),
	('Barak','Obama','2003-08-01','M','BObama@hotmail.com','07392836252','Manor Park'),
	('John','Smith','2002-12-19','M','Jsmith@hotmail.com','07394615372','Stag Hill'),
	('Playboi','Carti','2002-12-10','M','Pcart@hotmail.com','07492846510','Stag Hill'),
	('Pradesh','Sunuwar','2002-01-01','M','Psnunuwar@hotmail.com','07203847189','Stag Hill'),
	('James','Black','2003-01-01','O','Jblack@hotmail.com','07665556789','Manor Park'),
	('Peter','Parker','2003-06-02','M','Pparker@hotmail.com','07989898989','Manor Park'),
	('Hallie','Maholland','2002-02-02','F','Haholland@hotmail.com','07152424241','Manor Park');
	
INSERT INTO Enrolment (MEM_ID, SHESH_ID) VALUES
	( 1, 1),
	( 2, 2),
	( 3, 3),
	( 4, 4);
	
INSERT INTO Membership (MEM_ID, MSHIP_Type, MSHIP_ExpiryDate, MSHIP_DateCreated, MSHIP_Cost, MSHIP_Status) VALUES
	(1, 'Gold', '2023-10-10', '2022-10-10', '300', 'Valid'),
	(2, 'Gold', '2023-10-10', '2022-10-10', '300', 'Valid'),
	(3, 'Gold', '2023-10-10', '2022-10-10', '300', 'Valid'),
	(4, 'Gold', '2023-10-10', '2022-10-10', '300', 'Valid'),
	(5, 'Gold', '2023-10-10', '2022-10-10', '300', 'Valid'),
	(6, 'Silver', '2023-10-10', '2022-10-10', '240', 'Valid'),
	(7, 'Silver', '2023-10-10', '2022-10-10', '240', 'Valid'),
	(8, 'Silver', '2023-10-10', '2022-10-10', '240', 'Valid'),
	(9, 'Silver', '2023-10-10', '2022-10-10', '240', 'Valid'),
	(10, 'Silver', '2023-10-10', '2022-10-10', '240', 'Valid');
	
INSERT INTO Payment (MSHIP_ID, PAY_Date, Pay_Amount) VALUES
	(1, '2022-10-10', '300'),
	(2, '2022-10-10', '300'),
	(3, '2022-10-10', '300'),
	(4, '2022-10-10', '300'),
	(5, '2022-10-10', '300'),
	(6, '2022-10-10', '240'),
	(7, '2022-10-10', '240'),
	(8, '2022-10-10', '240'),
	(9, '2022-10-10', '240'),
	(10, '2022-10-10', '240');
	
INSERT INTO Gold (MSHIP_ID, GOLD_Price) VALUES
	(1,'300'),
	(2,'300'),
	(3,'300'),
	(4,'300'),
	(5, '300');
	
INSERT INTO Silver (MSHIP_ID, SILVER_Price) VALUES
	(6,'240'),
	(7,'240'),
	(8,'240'),
	(9,'240'),
	(10,'240');

		

		
	
	
	


	
