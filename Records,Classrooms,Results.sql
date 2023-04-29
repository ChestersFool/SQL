create database if not exists LAB7;
use LAB7;

drop tables if exists Classrooms, Records, Results;

create table if not exists Classrooms (
	ID int auto_increment primary key,
	Classroom_number int not null,
	School int not null,

	constraint Classrooms_School_fk
		foreign key (School) references Schools (ID) on update cascade on delete cascade
);

create table if not exists Records (
	ID int auto_increment primary key,
    Student int not null,
    Subject_name varchar(40) not null,
    Classroom int not null,
    Senior_examiner int not null,
    Junior_examiner int not null,
    Form_number int not null,
    Seat int,
    
    constraint Records_Student_fk
		foreign key (Student) references Students (ID) on update cascade on delete cascade,
        
	constraint Records_Subject_name_fk
		foreign key (Subject_name) references Subjects (Subject_name) on update cascade on delete cascade,
        
	constraint Records_Classroom_fk
		foreign key (Classroom) references Classrooms (ID) on update cascade on delete cascade,
	
    constraint Records_Senior_examiner_fk
		foreign key (Senior_examiner) references Examiners (ID) on update cascade on delete cascade,
        
	constraint Records_Junior_examiner_fk
		foreign key (Junior_examiner) references Examiners (ID) on update cascade on delete cascade
);

create table if not exists Results (
	ID int auto_increment primary key,
    ID_Record int not null unique,
    Checked_by int not null,
    Result int not null check((Result >= 100 AND Result <= 200) OR Result = 0),
    
	constraint Results_ID_Record_fk
		foreign key (ID_Record) references Records (ID) on update cascade on delete cascade,
        
	constraint Results_Checked_by_fk
		foreign key (Checked_by) references Examiners (ID) on update cascade on delete cascade
);