-- 1:1
CREATE TABLE dni(
	dni_id int AUTO_INCREMENT PRIMARY KEY,
    dni_number int NOT NULL,
    user_id int,
    UNIQUE(dni_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);

-- 1:N
CREATE TABLE companies(
	company_id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL
);

ALTER TABLE users
ADD company_id varchar(100);

ALTER TABLE users
ADD CONSTRAINT fk_companies
FOREIGN KEY(company_id) REFERENCES companies(company_id);

-- N:M
CREATE TABLE languages(
	language_id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL
);

CREATE TABLE users_languages(
	users_language_id int AUTO_INCREMENT PRIMARY KEY,
    user_id int,
    language_id int, 
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(language_id) REFERENCES languages(language_id),
    UNIQUE(user_id, language_id)
);

-- INSERT

-- 1:1 DATA

INSERT INTO dni(dni_number, user_id) VALUES (11111111, 1);
INSERT INTO dni(dni_number, user_id) VALUES (22222222, 2);
INSERT INTO dni(dni_number, user_id) VALUES (33333333, 3);
INSERT INTO dni(dni_number) VALUES (44444444);

-- 1:N DATA

INSERT INTO companies (name) VALUES ('MoureDev');
INSERT INTO companies (name) VALUES ('Apple');
INSERT INTO companies (name) VALUES ('Google');
INSERT INTO companies (company_id) VALUES (5); -- Este falla porque name es NOT NULL

UPDATE users SET company_id = 1 WHERE user_id = 1;
UPDATE users SET company_id = 2 WHERE user_id = 3;
UPDATE users SET company_id = 3 WHERE user_id = 4;
UPDATE users SET company_id = 1 WHERE user_id = 7;

-- N:M DATA

INSERT INTO languages (name) VALUES ('Swift');
INSERT INTO languages (name) VALUES ('Kotlin');
INSERT INTO languages (name) VALUES ('JavaScript');
INSERT INTO languages (name) VALUES ('Java');
INSERT INTO languages (name) VALUES ('Python');
INSERT INTO languages (name) VALUES ('C#');
INSERT INTO languages (name) VALUES ('COBOL');


INSERT INTO users_languages (user_id, language_id) VALUES (1, 1);
INSERT INTO users_languages (user_id, language_id) VALUES (1, 2);
INSERT INTO users_languages (user_id, language_id) VALUES (1, 5);
INSERT INTO users_languages (user_id, language_id) VALUES (2, 3);
INSERT INTO users_languages (user_id, language_id) VALUES (2, 5);
INSERT INTO users_languages (user_id, language_id) VALUES (1, 1); -- Este falla porque la combinación de user_id y language_id ya existe
INSERT INTO users_languages (user_id) VALUES (1); -- Este falla porque language_id es NOT NULL