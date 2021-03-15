-- log in
mysql -u root

-- show all databases
show databases;

-- create databases
create database swimming;

-- switch database
use swimming;

-- show all tables
show tables;

-- create table
-- not null means compulsory
-- unsigned means only positive number
-- auto increment auto selects next available id to insert
create table Parents(
    parent_id int unsigned auto_increment primary key,
    surname varchar(50) not null,
    given_name varchar(50) not null,
    email varchar(350) not null
)engine=innodb;

create table Certificates(
    certificate_id int unsigned auto_increment primary key,
    title_1 varchar(200) not null
)engine=innodb;

-- tinyint max is 255(limits int range for optimisation)

insert into Certificates(title_1)
    values  ('Basic Swimming'),
            ('Basic Lifesaving'),
            ('Advanced Lifesaving');

create table Venues(
    venue_id int unsigned auto_increment primary key,
    address varchar(500) not null
)engine=innodb;

-- name is a reserved word in mysql
-- if really required, use `name`

insert into Venues(address)
    values('Ang Mo Kio'),
          ('Yio Chu Kang');

insert into Parents(surname, given_name, email)
    values ('Phua','Chu Kang','chukang@gemail.com');

-- see all rows in a table
select * from Parents;

-- add many rows
insert into Parents (surname, given_name, email)
    values ('Tan','Ah Kow','woofwoof@sg.com'),
           ('Sue','Mary','marysue@fake.com.sg');


-- creating foreign keys
create table Students (
    student_id int unsigned auto_increment primary key,
    surname varchar(100) not null,
    given_name varchar(100) not null,
    date_of_birth date not null,
    parent_id int unsigned not null,
    foreign key(parent_id) references Parents(parent_id)

)engine=innodb;

-- insert student sponsored by a parent
insert into Students(surname,given_name,date_of_birth,parent_id)
    values('Phua','Anthony','1990-06-21', 1);

create table Sessions(
    session_id int unsigned auto_increment primary key,
    session_date datetime not null,
    venue_id int unsigned not null,
    foreign key(venue_id) references Venues(venue_id)
)engine=innodb;

-- on delete cascade deletes parent child
-- on delete restrict
-- on delete set null only works for keys without 'not null'

insert into Sessions(session_date,venue_id)
    values('2021-03-30',1); 
    -- HOW TO INSERT DATETIME????

-- see details of table
describe Sessions;

create table CerticateStudents(
    certificate_student_id int unsigned auto_increment primary key,
    student_id int unsigned,
    certificate_id int unsigned,
    award_date date not null,
    foreign key (student_id) references Students(student_id),
    foreign key (certificate_id) references Certificates(certificate_id)
)engine=innodb;

insert into CerticateStudents(student_id,certificate_id,award_date)
    values(1,1,'2021-03-15')

-- add new column to existing table
alter table Students add gender varchar(1) not null;

-- rename column
alter table Students rename column surname to last_name;
alter table Students rename column given_name to first_name;

-- modify definition of column
-- changes NULL to YES
alter table Students modify gender varchar(1);

-- delete table(only works if table has no foreign keys)
drop table Fake;