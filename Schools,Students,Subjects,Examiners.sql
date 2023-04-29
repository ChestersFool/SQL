create database if not exists LAB7;
use LAB7;

drop tables if exists Students, Subjects, Schools, Examiners;

create table if not exists Schools (
	ID int auto_increment primary key,
	School_number int not null,
	Address int unique not null,
	Director_last_name varchar(20),
	Director_name varchar(20),
	Director_surname varchar(20),

	constraint School_Address_fk
		foreign key (Address) references Addresses (ID) on update cascade on delete cascade
);

create table if not exists Students (
	ID int auto_increment primary key,
	School int not null,
	Date_of_birth date,
	Place_of_residence int not null,
	Last_name varchar(20),
	Student_name varchar(20),
	Surname varchar(20),
	Certificate_number varchar(10),

	constraint Student_Place_of_residence_fk
		foreign key (Place_of_residence) references Addresses (ID) on update cascade on delete cascade,

	constraint Student_School_fk
		foreign key (School) references Schools (ID) on update cascade on delete cascade
); 

create table if not exists Subjects (
	Subject_name varchar(40) primary key,
	Event_date date
);

create table if not exists Examiners (
	ID int auto_increment primary key,
	Last_name varchar(20),
	Eximiner_name varchar(20),
	Surname varchar(20),
	Workplace int not null,
	Place_of_residence int,
	Is_senior bool,
	Subject_name varchar(40) not null,

	constraint Examiner_Workplace_fk
		foreign key (Workplace) references Schools (ID) on update cascade on delete cascade,

	constraint Examiner_Place_of_residence_fk
		foreign key (Place_of_residence) references Addresses (ID) on update cascade on delete cascade,

	constraint Examiner_Subject_name_fk
		foreign key (Subject_name) references Subjects (Subject_name) on update cascade on delete cascade
);

