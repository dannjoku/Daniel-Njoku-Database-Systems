/* Persons */ 
CREATE TABLE persons (
    pid             INTEGER     NOT NULL,
    firstName       VARCHAR(50) NOT NULL,
    lastName        VARCHAR(50) NOT NULL,
    dateOfBirth     DATE        NOT NULL,
    phonePrimary    CHAR(15)    NOT NULL,   
    streetAddress   VARCHAR(50) NOT NULL, 
    zipCode         INTEGER     NOT NULL	REFERENCES location(zipCode),
PRIMARY KEY(pid)
); 

INSERT INTO persons (pid,firstName,lastName,dateOfBirth,phonePrimary,streetAddress,zipCode)
VALUES (001, 'Dan', 'Smith', 19681208, 231323276, '22 Oak Street', 37379 ),
		(002, 'Will', 'Atkins', 19630830, 8996439355, '654 Glenwood Drive', 31021 ),
		(003, 'Bill', 'Cosby', 19520219, 8442851051, '252 13th Street', 09093 ),
		(004, 'Amy', 'Shummer', 19580919, 8110049929, '396 Grove Street', 12366 ),
		(005, 'Josh', 'Merrick', 19580919, 8554809490, '227 Devonshire Drive', 45431 ),
		(006, 'Randy', 'Queen', 19630702, 8993496951, '138 Devon Court', 99959 ),
		(007, 'Dante', 'Matthew', 19600529, 8553744253, '19 Water Street', 34234 ),
		(008, 'Harry', 'Johnson', 19580109, 8555815117, '125 Spring Street', 11533 ),
		(009, 'Marco', 'Birkshire', 19690702, 8339754754, '440 Canal Street', 11533 ),
		(010, 'Ruben', 'Hathaway', 19280919, 8990479981, '736 3rd Street North', 11533 ),
		(011, 'Mike', 'Forte', 19681208, 8446578110, '529 Laurel Street', 12601 ),
		(012, 'Cameron', 'Nero', 19681208, 8220221397, '595 Parker Street', 12601 ),
		(013, 'Katie', 'Carty', 19681208, 8557264814, '602 6th Street North', 12601 ),
		(014, 'Siobain', 'Rogers', 19681208, 8116286109, '315 Redwood Drive', 12601 ),
		(015, 'Scott', 'Botts', 19681208, 8226757964, '973 Lakeview Drive', 12601 ),
		(016, 'Sarah', 'Rogers', 19681208, 8334068368, '92 Beechwood Drive', 12601 ),
		(017, 'Annie', 'Dumpty', 19681208, 8442569423, '618 Madison Avenue', 12601 ),
		(018, 'Lee', 'Wee', 19681208, 8444814554, '618 Madison Avenue', 12601 ),
		(019, 'Will', 'Williams', 19681208, 8994765763, '944 George Street', 12601 ),
		(020, 'Amanda', 'Scott', 19681208, 8441270429, '644 Marshall Street', 12601 );



/* Location */
CREATE TABLE location (
    zipCode INTEGER     NOT NULL, 
    city    VARCHAR(50) NOT NULL,
    state   TEXT(2)     NOT NULL,
PRIMARY KEY(zipCode)
);

INSERT INTO location (zipCode,city,state)
VALUES 	(37379, 'Soddy Daisy', 'TN'),
		(31021, 'Dublin', 'GA'),
		(09093, 'Eugene', 'OR'),
		(12366, 'Smyra', 'CA'),
		(45431, 'Uniondale', 'NY'),
		(99959, 'Garden City', 'NY'),
		(34343, 'Buffalo', 'NY'),
		(34234, 'Jacksonville', 'FL'),
		(12433, 'Campbell', 'NC'),
		(11533, 'Soddy Daisy', 'TX'),
		(12601, 'Poughkeepsie', 'NY');

		


/* Guests */

CREATE TABLE guests (
    gid             INTEGER   NOT NULL REFERENCES persons(pid),
    memberStatus    TEXT      NOT NULL,
PRIMARY KEY(gid)
);


INSERT INTO guests (gid,memberStatus)
VALUES (001, 'Bronze'),
		(002, 'Bronze'),
		(003, 'Bronze'),
		(004, 'Bronze'),
		(005, 'Silver'),
		(006, 'Bronze'),
		(007, 'Bronze'),
		(008, 'Gold'),
		(009, 'Bronze'),
		(010, 'Platinum');





/* Room Calls */
CREATE TABLE roomCall (
    gid         INTEGER     NOT NULL REFERENCES guests(gid),
    roomNumber  VARCHAR(5)  NOT NULL REFERENCES rooms(roomNumber),
    callCode    INTEGER     NOT NULL REFERENCES roomCallCode(callCode),
    callTime    TIME   		NOT NULL,
    sid     	INTEGER     NOT NULL REFERENCES staff(sid),
PRIMARY KEY(callTime)
);

INSERT INTO roomCall (gid,roomNumber,callCode,callTime,sid)
VALUES 	(001, 101, 4, 20:19:19, 011),
		(001, 101, 4, 18:19:19, 011),
		(003, 103, 2, 19:20:19, 012);





/* Room Call Codes */

CREATE TABLE roomCallCode (
    callCode        integer     NOT NULL,
    title           VARCHAR(50) NOT NULL,
    description     TEXT        NOT NULL,
PRIMARY KEY(callCode)
);

INSERT INTO roomCallCode (callCode,title,description)
VALUES	(1, 'Maintainance', 'If its broke we fix it'),
		(2, 'Cleaning', 'New sheets? No problem'),
		(3, 'Room Service', 'You Hungry?'),
		(4, 'Help Desk', 'You have a question? Well we have answers');

    


	
	
/* Staff */ 
CREATE TABLE staff (
    sid             INTEGER     NOT NULL REFERENCES persons(pid),
    spid            INTEGER     NOT NULL REFERENCES staffsPosition(pid),
    shid            INTEGER     NOT NULL REFERENCES shifts(shid),
    hireDate        DATE        NOT NULL, 
    hourlyWageUSD   DECIMAL     NOT NULL,
PRIMARY KEY(sid)
);

INSERT INTO staff (sid,spid,shid,hireDate,hourlyWageUSD)
VALUES (011, 1, 3, 2015-02-11, 15.25),
		(012, 1, 3, 2015-09-15, 10.25),
		(013, 1, 2, 2015-04-13, 14.25),
		(014, 1, 2, 2015-08-12, 10.25),
		(015, 1, 0, 2015-11-12, 10.25),
		(016, 1, 2, 2015-02-13, 13.25),
		(017, 2, 0, 2015-02-11, 10.25),
		(018, 2, 1, 2015-12-17, 11.25),
		(019, 2, 2, 2015-12-11, 9.25),
		(020, 2, 3, 2015-02-11, 9.25);







/* Shifts */
CREATE TABLE shifts (
    shid        INTEGER     NOT NULL,
    startTime   TIME        NOT NULL,
    endTime     TIME        NOT NULL,
    title       TEXT,
PRIMARY KEY(shid)
);

INSERT INTO shifts (shid,startTime,endTime,title)
VALUES (0,00:00:00,06:00:00, 'Morning'),
		(1,06:00:00,12:00:00, 'Day'),
		(2,12:00:00,18:00:00, 'Evening'),
		(3,18:00:00,00:00:00, 'Night');





/* Shift Days */

CREATE TABLE shiftDays (
    shid        INTEGER      NOT NULL	 REFERENCES shifts(shid),
    shiftDay    VARCHAR      NOT NULL    CHECK
                (shiftDay IN ('Sunday', 'Monday','Tuesday', 'Wednesday', 'Thursday','Friday','Saturday')), 
PRIMARY KEY(shid, shiftDay)
);


INSERT INTO shiftDays (shid,shiftday)
VALUES (0, 'Monday'),
		(0, 'Tuesday'),
		(0, 'Wednesday'),
		(0, 'Thursday'),
		(0, 'Friday'),
		(0, 'Saturday'),
		(0, 'Sunday'),
		(1, 'Monday'),
		(1, 'Tuesday'),
		(1, 'Wednesday'),
		(1, 'Thursday'),
		(1, 'Friday'),
		(1, 'Saturday'),
		(1, 'Sunday'),
		(2, 'Monday'),
		(2, 'Tuesday'),
		(2, 'Wednesday'),
		(2, 'Thursday'),
		(2, 'Friday'),
		(2, 'Saturday'),
		(2, 'Sunday'),
		(3, 'Monday'),
		(3, 'Tuesday'),
		(3, 'Wednesday'),
		(3, 'Thursday'),
		(3, 'Friday'),
		(3, 'Saturday'),
		(3, 'Sunday');





/* Staff's Posistion */
CREATE TABLE staffsPosition (
    spid        INTEGER     NOT NULL,
    title       INTEGER     NOT NULL,
    deScription  VARCHAR,
PRIMARY KEY(spid)
);

INSERT INTO staffsPosition (spid,title,description)
VALUES (1, 'Administration', 'Managerial roll'),
		(2, 'Cleaner', 'Cleans the hotel room');




/* Rooms */
CREATE TABLE rooms (
    roomNumber  VARCHAR(5)  NOT NULL,
    rsid        INTEGER     NOT NULL,        
    priceUSD    DECIMAL     NOT NULL,
PRIMARY KEY(roomNumber),
FOREIGN KEY(rsid) REFERENCES style(rsid)
);

INSERT INTO rooms (roomNumber,rsid,priceUSD)
VALUES (101, 1, 200),
		(102, 2, 150),
		(103, 3, 120),
		(104, 4, 250),
		(105, 5, 200),
		(201, 1, 200),
		(202, 2, 150),
		(203, 3, 120),
		(204, 4, 250),
		(205, 8, 350);





/* Style */

CREATE TABLE style (
    rsid        INTEGER     NOT NULL,
    bedCount    CHAR(1)     NOT NULL,
    bedSize     TEXT        NOT NULL,
PRIMARY KEY(rsid)
);

INSERT INTO style (rsid,bedCount,bedSize)
VALUES ( 1, 1, 'King'),
		( 2, 1, 'Queen'),
		( 3, 1, 'Full'),
		( 4, 2, 'Queen'),
		( 5, 2, 'Full'),
		( 6, 2, 'Twin'),
		( 7, 2, 'King');






/* Guest Reservations */
CREATE TABLE guestReservationS (
    gid                 INTEGER     NOT NULL REFERENCES guest(gid),
    roomNumber          VARCHAR(5)  NOT NULL REFERENCES rooms(roomNumber),
    sid                 INTEGER     NOT NULL REFERENCES staff(sid),
    checkInDate         DATE        NOT NULL,
    checkOutDate        DATE        NOT NULL,
    discountPercentage  DECIMAL     NOT NULL,
PRIMARY KEY(gid,roomNumber,sid)
);

INSERT INTO guestReservationS (gid,roomNumber,sid,checkInDate,checkOutDate,discountPercentage)
VALUES	(001, 101, 013, 2016-4-21, 2016-4-23, 0),
(002, 102, 013, 2016-4-22, 2016-4-23, 0),
(003, 103, 013, 2016-4-23, 2016-4-24, 0),
(004, 104, 013, 2016-4-23, 2016-4-25, 0),
(005, 105, 013, 2016-4-20, 2016-4-23, 5),
(006, 201, 013, 2016-4-20, 2016-4-23, 0),
(007, 202, 013, 2016-4-21, 2016-4-23, 0),
(008, 203, 013, 2016-4-22, 2016-4-26, 10),
(009, 204, 013, 2016-4-21, 2016-4-23, 0),
(010, 205, 013, 2016-4-24, 2016-4-27, 12.5);





/* Room Cleaning */
CREATE TABLE roomCleaning (
    roomNumber  INTEGER     NOT NULL  REFERENCES rooms(roomNumber),
    timeOfEntry TIME        NOT NULL,
    sid         INTEGER     NOT NULL  REFERENCES staff(sid),
    timeOfExit  TIME        NOT NULL,
PRIMARY KEY(roomNumber) 
);

INSERT INTO roomCleaning (roomNumber,timeOfEntry,sid,timeOfExit)
VALUES (101, 12:00:00, 017, 12:30:00),
		(105, 14:00:00, 017, 14:30:00),
		(103, 15:00:00, 017, 15:30:00),
		(201, 16:00:00, 017, 16:30:00);