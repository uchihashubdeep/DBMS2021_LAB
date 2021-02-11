create database db212BITSScreen;
CREATE TABLE Movies (MovieID INT UNIQUE, MovieName VARCHAR(30) NOT NULL UNIQUE, ReleaseYear INT NOT NULL,Duration INT,Language VARCHAR(30), ReleasedDate DATE, ReleaseCountry VARCHAR(30),PRIMARY KEY(MovieID));
CREATE TABLE Critics (CriticID INT UNIQUE, Name VARCHAR(30) UNIQUE, PRIMARY KEY(CriticID));
CREATE TABLE Ratings (MovieID INT ,CriticID INT UNIQUE,Rating  DECIMAL(3,1) , NumOfRatings INT ,PRIMARY KEY(MovieID,CriticID));
alter table Ratings change NumOfRatings NumOfViews INTEGER;
alter table Critics  Modify Name VARCHAR(20) NOT NULL;

alter table Ratings  Modify Rating decimal(6,2);

INSERT INTO Movies VALUES (125,'Good Will Hunting',1997,126,'English','1998-06-03','UK');
INSERT INTO Movies VALUES (26, 'Back To The Future', 1985, 116, 'English', '1985-12-04', 'UK');
INSERT INTO Movies VALUES (127, 'Seven Samurai', 1954, 207, 'Japanese', '1954-04-26', 'JP');
INSERT INTO Movies VALUES (128, 'Jurassic Park', 1993, 128, 'English', '1993-06--09', 'US');
INSERT INTO Movies VALUES (129, 'Uri: The Surgical Strike', 2019, 138, 'Hindi', '2019-1-11', 'IND');

INSERT INTO Critics VALUES(500, 'Judith Crist');
INSERT INTO Critics VALUES(501, 'Roger Ebert');
INSERT INTO Critics VALUES(502, 'Andrew Sarris');
INSERT INTO Critics VALUES(503, 'Omar Qureshi');

INSERT INTO RATINGS VALUES(125, 502, 8.4, 26375);

INSERT INTO RATINGS VALUES(127, 500, 7.9, 202778);
INSERT INTO RATINGS VALUES(129, 501, 8.1, 13091);
INSERT INTO RATINGS VALUES(129, 503, 8.6, 81328);


Ans 6) SELECT ReleaseYear FROM MOVIES WHERE MovieName='Seven Samurai';

ANS 7) SELECT MovieName FROM MOVIES WHERE MovieID IN  (125,128,129);

Ans 8) SELECT MovieName FROM MOVIES WHERE ReleaseYear<1990;

Ans 9) SELECT DISTINCT ReleaseCountry from MOVIES;

Ans 10) SELECT MovieName from Movies, Ratings  WHERE Ratings.Rating >8 and Movies.MovieId=Ratings.MovieId;

Ans 11) UPDATE MOVIES SET Duration = Duration+60;

Ans 12) SELECT Name FROM CRITICS UNION ALL SELECT MovieName FROM MOVIES; //UNION ALL REMOVES  DUPLICATES. TO INCLUDE THAT USE UNION

Ans 13) SELECT MovieName,Duration*1.5 FROM MOVIES;

Ans 14) alter table Movies add column Age INTEGER DEFAULT 0; 

And 15) UPDATE MOVIES SET AGE = YEAR(CURDATE())-ReleaseYear;

Ans 16) SELECT
    SYSDATE(), SLEEP(10) AS '', SYSDATE(),
    NOW(), SLEEP(10) AS '', NOW();



