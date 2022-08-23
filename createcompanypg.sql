-- Postgres script for Company database from
-- Elmasri and Navathe's textbook
create table Employee (
FName varchar(20) not null,
MInit char,
LName varchar(20) not null,
SSN int not null,
BDate date not null,
Address varchar(30) not null,
Sex char not null,
Salary int not null,
SuperSSN int,
DNo int not null,
primary key (SSN),
foreign key (SuperSSN) references Employee);

create table Department (
DName varchar(20) not null,
DNumber int not null,
MgrSSN int not null,
MgrStartDate date not null,
primary key (DNumber),
unique(MgrSSN), -- Employee manages Department is 1:1, according to text
foreign key (MgrSSN) references Employee);


create table Project (
PName varchar(20) not null,
PNumber int not null,
PLocation varchar(20) not null,
DNum int not null,
primary key (PNumber),
foreign key (DNum) references Department);

create table Works_On (
ESSN int not null,
PNo int not null,
Hours real,
primary key(ESSN, PNo),
foreign key (ESSN) references Employee,
foreign key (PNo) references Project);

create table Dependent (
ESSN int not null,
Dependent_Name varchar(20) not null,
Sex char not null,
BDate date not null,
Relationship varchar(20) not null,
primary key(ESSN, Dependent_Name),
foreign key (ESSN) references Employee);

-- taken from "CREATE script" option in pgAdmin III
create table dept_locations
(
  dnum integer NOT NULL,
  dlocation character varying(20) NOT NULL,
  CONSTRAINT dept_locations_pkey PRIMARY KEY (dnum, dlocation),
  CONSTRAINT dept_locations_dnum_fkey FOREIGN KEY (dnum)
      REFERENCES department (dnumber) 
);

insert into Employee values ('James', 'E', 'Borg', 888665555, '1927-11-10', '450 Stone, Houston, TX', 'M', 55000, Null, 1 );
insert into Employee values ('Franklin', 'T', 'Wong', 333445555, '1945-12-08', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5 );
insert into Employee values ('Jennifer', 'S', 'Wallace', 987654321, '1931-06-20', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4 );
insert into Employee values ('John', 'B', 'Smith', 123456789, '1955-01-09', '731 Fondren, Houston, TX', 'M',  30000, 333445555, 5);
insert into Employee values ('Alicia', 'J', 'Zelaya', 999887777, '1958-07-19', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4 );
insert into Employee values ('Ramesh', 'K', 'Narayan', 666884444, '1952-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5 );
insert into Employee values ('Joyce', 'A', 'English', 453453453, '1962-07-31', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5 );
insert into Employee values ('Ahmad', 'V', 'Jabbar', 987987987, '1959-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4 );

insert into Department values ('Research', 5, 333445555, '1978-05-22' );
insert into Department values ('Administration', 4, 987654321, '1985-01-01' );
insert into Department values ('Headquarters', 1, 888665555, '1971-06-19');

alter table Employee add constraint ValidDept foreign key (DNo) references Department;

insert into Project values ('ProductX', 1,  'Bellaire', 5 );
insert into Project values ('ProductY', 2,  'Sugarland', 5 );
insert into Project values ('ProductZ', 3,  'Houston', 5 );
insert into Project values ('Computerization', 10,  'Stafford', 4 );
insert into Project values ('Reorganization', 20,  'Houston', 1 );
insert into Project values ('Newbenefits', 30,  'Stafford', 4);

insert into Works_On values (123456789, 1, 32.5 );
insert into Works_On values (123456789, 2, 7.5 );
insert into Works_On values (666884444, 3, 40.0 );
insert into Works_On values (453453453, 1, 20.0 );
insert into Works_On values (453453453, 2, 20.0 );
insert into Works_On values (333445555, 2, 10.0 );
insert into Works_On values (333445555, 3, 10.0 );
insert into Works_On values (333445555, 10, 10.0 );
insert into Works_On values (333445555, 20, 10.0 );
insert into Works_On values (999887777, 30, 30.0 );
insert into Works_On values (999887777, 10, 10.0 );
insert into Works_On values (987987987, 10, 35.0 );
insert into Works_On values (987987987, 30, 5.0 );
insert into Works_On values (987654321, 30, 20.0 );
insert into Works_On values (987654321, 20, 15.0 );
insert into Works_On values (888665555, 20, null );

insert into Dependent values (333445555, 'Alice', 'F', '1976-04-05', 'DAUGHTER');
insert into Dependent values (333445555, 'Theodore', 'M', '1973-10-25', 'SON');
insert into Dependent values (333445555, 'Joy', 'F', '1948-05-03', 'SPOUSE');
insert into Dependent values (987654321, 'Abner', 'M', '1932-02-29', 'SPOUSE');
insert into Dependent values (123456789, 'Michael', 'M', '1978-01-01', 'SON');
insert into Dependent values (123456789, 'Alice', 'F', '1978-12-31', 'DAUGHTER');
insert into Dependent values (123456789, 'Elizabeth', 'F', '1957-05-05', 'SPOUSE');

-- taken from pgAdmin III Backup of dept_locations, data only, using Insert commands
INSERT INTO dept_locations VALUES (1, 'Houston');
INSERT INTO dept_locations VALUES (4, 'Stafford');
INSERT INTO dept_locations VALUES (5, 'Bellaire');
INSERT INTO dept_locations VALUES (5, 'Houston');
INSERT INTO dept_locations VALUES (5, 'Sugarland');
