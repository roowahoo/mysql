

create table Departments(
    department_id int unsigned auto_increment primary key,
    `name` varchar(100) not null
)engine=innodb;

create table Taskforces(
    taskforce_id int unsigned auto_increment primary key,
    `name` varchar(100) not null

)engine=innodb;

insert into Departments(`name`)
    values('Marketing'),
          ('HR');

insert into Taskforces(`name`)
    values('Project government spies'),
          ('Project Mosquito');

create table Employees(

    employee_id int unsigned auto_increment primary key,
    surname varchar(100) not null,
    given_name varchar(100) not null,
    date_of_employment datetime not null,
    department_id int unsigned not null,
    foreign key(department_id) references Departments(department_id)
)engine=innodb;

insert into Employees(surname,given_name,date_of_employment,department_id)
    values('Tan','John','2020-03-15',2);

insert into Employees(surname,given_name,date_of_employment,department_id)
    values('Lim','Mary','2020-03-15',1);

create table Addresses (
    address_id int unsigned auto_increment primary key,
    blk_number varchar(100) not null,
    street varchar(100) not null,
    unit_code varchar(100) not null,
    postal_code varchar(100) not null,
    employee_id int unsigned not null,
    foreign key(employee_id) references Employees(employee_id)
)engine=innodb;

insert into Addresses(blk_number,street,unit_code,postal_code,employee_id)
    values('411','Yishun Ring Road','09-11','760411',2),
          ('935','Aljunied Crescent','08-22','111935',1);

create table Employee_Taskforce(
    employee_taskforce_id int unsigned auto_increment primary key,
    role varchar(100) not null,
    employee_id int unsigned not null,
    taskforce_id int unsigned not null,
    foreign key(employee_id) references Employees(employee_id),
    foreign key(taskforce_id) references Taskforces(taskforce_id)

)engine=innodb;

insert into Employee_Taskforce(role,employee_id,taskforce_id)
    values ('spy',1,1);

insert into Employee_Taskforce(role,employee_id,taskforce_id)
    values ('breeder',2,2);

create table Employee_Supervisor(
    employee_supervisor_id int unsigned auto_increment primary key,
    employee_id int unsigned not null,
    supervisor_id int unsigned not null

)engine=innodb;