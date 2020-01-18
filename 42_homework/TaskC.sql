CREATE TABLE people(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name varchar(50) NOT NULL UNIQUE,
	birtdate date NOT NULL
);

CREATE TABLE countries(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	code int UNIQUE NOT NULL,
	name varchar(50) NOT NULL UNIQUE,
	population int NOT NULL,
	president int REFERENCES people(id) NOT NULL
);

CREATE TABLE cities(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name varchar(50) NOT NULL,	
	population int NOT NULL,
	country_id int REFERENCES countries(id) NOT NULL,
	mayor int REFERENCES people(id) NOT NULL
);

insert into people (name, birtdate) values
	('Гурбангулы Бердымухамедов', '1957-05-29'),
	('Владимир Путин', '1952-02-07'),
	('Джонни Депп', '1974-11-11'),
	('Брэд Питт', '1963-12-18'),
	('Том Круз', '1962-07-02'),
	('Николас Кейдж', '1964-01-07'),
	('Роберт де Ниро', '1943-08-17'),
	('Джек Николсон', '1937-07-07'),
	('Кевин Костнер', '1955-01-18'),
	('Том Хэнкс', '1956-07-09');

insert into cities (name, population, country_id, mayor) values
	('Moscow', 12506468, 1, 8), 
	('Ashgabat', 1031992, 2, 5), 
	('Saint Petersburg', 5351935, 1, 7),		
	('Türkmenbaşy', 73000, 2, 9);

insert into countries (code, name, population, president) values
	(1, 'Russia', 146801931, 3), (2, 'Turkmenistan' ,5850901, 1);

select  
	ct.name as country, ci.name as city
from countries ct
	join cities ci on ct.id = ci.country_id
where ct.name like 'T%' and ci.name like 'T%';

select ct.name as country_name, sum(ci.population) as population
from cities ci
	join countries ct on ct.id = ci.country_id
group by ct.name;