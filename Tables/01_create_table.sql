CREATE TABLE people (
	id int,
    name varchar(100),
    age int,
    email varchar(50),
    created date
);

CREATE TABLE people2 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created date
);

CREATE TABLE people3 (
	id int NOT NULL,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    UNIQUE(id)
);

CREATE TABLE people4 (
	id int,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    PRIMARY KEY(id)
);

CREATE TABLE people5 (
	id int,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime,
    PRIMARY KEY(id),
    CHECK(age >= 18)
);