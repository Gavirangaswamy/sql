create database Movies;
show databases;
use Movies;
CREATE TABLE movies (
  `movie_id` int ,
  `year` year NOT NULL,
  `movie_name` varchar(50) NOT NULL UNIQUE,
  `director_name` varchar(50) NOT NULL,
  `language` varchar(30) NOT NULL,
  `platform` varchar(30) NOT NULL DEFAULT 'theatre',
  `budget` double(20,2),
  `collection` double(20,2),
  `rating` float CHECK (rating>0.0 AND rating<10.0),
  PRIMARY KEY (`movie_id`)
);
show tables;
INSERT INTO `movies` VALUES (101,2021,'pushpa','sukumar','telugu','theatre',524569752,5849631485,8.9);
INSERT INTO `movies` VALUES (102,2022,'RRR','rajmouli','telugu','theatre',7569800000,584963148500,9.2);
INSERT INTO `movies` VALUES (103,2021,'GGVV','raj b shetty','kannada','theatre',69800000,963148500,8.2);
INSERT INTO `movies` VALUES (111,2021,'tenet','xyz','english','netflix',679800000,9653148500,9.8);
INSERT INTO `movies`(`movie_id`,`year`,`movie_name`,`director_name`,`language`,`rating`) 
VALUES (112,2002,'Sangliyana','shankranag','kannada',9.5);
INSERT INTO `movies` VALUES 
(105,2022,'salaar','prashanth neel','kannada','theatre',469800000,9963148500,9.3),
(106,2021,'Ratnanparpancha','rohit','kannada','OTT',49800000,563148500,8.3),
(107,2005,'Chatrpathi','rajamouli','telugu','theatre',49800000,663148500,8.4),
(108,2019,'KGF-1','Prashanthneel','kannada','theatre',49800000,66663148500,9.8);
INSERT INTO `movies`(`movie_id`,`year`,`movie_name`,`director_name`,`language`,`budget`,`collection`,`rating`)
 VALUES (109,2021,'Shyam sing roy','unknown','telugu',69800000,953148500,9.3),
		(110,2011,'Mungarumale','batru','kannada',19800000,63148500,9.3);

DESC movies;
select * from movies;
-- select * from movies where rating >= 9.8 and platform ='netflix';
/*select * from movies where language= 'telugu';*/
# select * from movies where language= 'kannada' or platform= 'OTT';
select * from movies where language= 'kannada' or language= 'english';
select * from movies where language in ('kannada','english');
select * from movies where language in ('kannada','english','marati');
select * from movies where year between 2005 and 2019;
select director_name,movie_name from movies where year between 2005 and 2019;
select distinct director_name from movies;
select distinct director_name,movie_namecollection from movies;
select * from movies order by `year` asc ; -- asc is not compulsory.
select * from movies order by `rating` desc ;
select * from movies where budget is null ;
select director_name from movies where collection is null ;
select director_name from movies where budget is not null ;
update movies set `budget` = 5012545 where `director_name` = 'shankranag';
update movies set `collection` = 95212545 where `director_name` = 'shankranag';
select * from movies;
desc movies;
alter table movies modify column budget double(30,2) not null;
alter table movies modify column collection double(30,2);
-- alter table movies drop column collection;
-- delete from movies where rating<8.3;
-- delete from movies;
-- truncate table movies;
# drop table movies;
-- drop database movies;
-- 1st highest collection
select * from movies where collection =( select max(collection) from movies where language = 'kannada'); -- 102	2022	RRR	rajmouli	telugu	theatre	7569800000.00	584963148500.00	9.2
-- 2nd highest collection
select * from movies where language = 'kannada';
select * from movies where collection = (select max(collection) as second_highest_collection from movies where 
collection <( select max(collection) from movies where language = 'kannada') and language = 'kannada'); -- 108	2019	KGF-1	Prashanthneel	kannada	theatre	49800000.00	66663148500.00	9.8
select * from movies where collection =( select min(collection) from movies where language = 'kannada'); 
select * from movies where collection =( select max(collection) from movies where language = 'kannada')or collection =( select min(collection) from movies where language = 'kannada');
select * from movies where collection in (( select max(collection) from movies where language = 'kannada'),( select min(collection) from movies where language = 'kannada')); 
 select max(collection),director_name from movies group by director_name;
  select * from movies where collection in (select max(collection)from movies group by director_name having max(collection)>9700000000);
 select * from movies where collection in (select max(collection)from movies group by director_name) and collection >9700000000 ;

CREATE TABLE movies_duplicate (
  `movie_id` int ,
  `year` year NOT NULL,
  `movie_name` varchar(50) NOT NULL UNIQUE,
  `director_name` varchar(50) NOT NULL,
  `language` varchar(30) NOT NULL,
  `platform` varchar(30) NOT NULL DEFAULT 'theatre',
  `budget` double(20,2),
  `collection` double(20,2),
  `rating` float CHECK (rating>0.0 AND rating<10.0),
  PRIMARY KEY (`movie_id`)
);

insert into movies_duplicate select * from movies;
select * from movies_duplicate;

create table movies_2 as select * from movies; 
select * from movies_2;

-- create table movies_3 as select movie_id,year,movie_name,director_name from movies; 
-- select * from movies_3;