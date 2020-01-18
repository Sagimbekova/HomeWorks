CREATE TABLE students(
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL,
	birtdate date not null,
	group_id int references groups(id)
);

insert into students (name, birtdate, group_id) values
	('Гурбангулы Бердымухамедов', '1957-05-29', 1),
	('Владимир Путин', '1952-02-07', 2),
	('Джонни Депп', '1974-11-11', 3),
	('Брэд Питт', '1963-12-18', 2),
	('Том Круз', '1962-07-02', 1);

CREATE TABLE groups(
	id serial PRIMARY KEY,
	code varchar(50) not null unique,
	faculty_id int references faculties(id)
);


insert into groups (code, faculty_id) values ('IIT-1', 2), ('ET-1', 1), ('GI-1', 4) 

CREATE TABLE faculties(
	id serial PRIMARY KEY,
	name varchar(50) not null unique,
	university_id int references university(id)
);

insert into faculties (name, university_id) values ('Econom', 1), ('FIT', 1), ('International relationships', 2), ('Gum', 2)

CREATE TABLE university(
	id serial PRIMARY KEY,
	name varchar(50) not null unique
);

alter table university add column student_id int references students(id);
update university set student_id = 5 where name = 'KGTU';
insert into university (name) values ('KEU'), ('KRAO'), ('KNU');

CREATE TABLE subjects(
	id serial PRIMARY KEY,
	name varchar(50) not null unique
);

insert into subjects (name) values ('Database'), ('Mat analysis'), ('Networks'), ('Web');

CREATE TABLE evaluations(
	id serial PRIMARY KEY,
	student_id int references students(id),
	subject_id int references subjects(id),
	evaluation int not null
);

insert into evaluations (student_id, subject_id, evaluation) values (1, 3, 5),(2, 3, 3),(3, 3, 4),(4, 3, 5),(5, 3, 4);

select 
	s.name as student, 
	g.code as group, 
	u.name as univetsity, 
	f.name as faculty, 
	avg(evaluation) as avgMark
from evaluations e
	join students s on e.student_id = s.id
	join groups g on g.id = s.group_id
	join university u on u.student_id = s.id
	join faculties f on f.university_id = u.id
group by s.name, g.code, u.name, f.name;
