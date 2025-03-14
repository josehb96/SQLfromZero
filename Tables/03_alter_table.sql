CREATE TABLE people8 (
	id int NOT NULL AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    age int,
    email varchar(50),
    created datetime DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY(id),
    CHECK(age >= 18)
);

ALTER TABLE people8 
ADD surname varchar(150);

ALTER TABLE people8
RENAME COLUMN surname TO description;

ALTER TABLE people8
MODIFY COLUMN description varchar(250);