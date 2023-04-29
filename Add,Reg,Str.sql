create database if not exists LAB7;
use LAB7;

drop tables if exists Regions, Streets, Addresses, Classrooms, Records, Results, Students, Subjects, Schools, Examiners;

create table if not exists Regions (
	ID  int primary key,
	Region_name varchar(50) not null unique
);

create table if not exists Streets (
	ID int auto_increment primary key,
	Street_name varchar(50) not null unique
);

create table if not exists Addresses (
	ID  int auto_increment primary key,
	Region int not null,
	Street int not null, 
	House_number varchar(10) not null,
	Apartment int,

	constraint Addresses_Region_fk
		foreign key (Region) references Regions (ID) on update cascade on delete cascade,

	constraint Addresses_Street_fk
		foreign key (Street) references Streets (ID) on update cascade on delete cascade
);