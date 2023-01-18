-- Active: 1674043976035@@127.0.0.1@3306

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

SELECT * FROM users;


CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

SELECT * FROM phones;

INSERT INTO users (id, name, email, password)
VALUES
("u01", "Mariana", "usuario1.email1", "1234"),
("u02", "Joao", "usuario2.email2", "3456");

INSERT INTO phones (id, phone_number, user_id)
VALUES
("p001", "5587999999999", "u01"),
("p002", "5587888888888", "u01"),
("p003", "5587666666666", "u02");


SELECT users.id AS userId,
    users.name,
    users.name,
    users.password,
    phones.id AS phonesId,
    phones.phone_number,
    phones.user_id FROM users
INNER JOIN phones
ON phones.user_id = users.id;

--OU

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;

-----------------------------------

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL, 
    category TEXT NOT NULL
);

SELECT * FROM licenses;

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL, 
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

SELECT * FROM drivers;

INSERT INTO licenses (id, register_number, category)
VALUES
("l001", "1233", "car"),
("l002", "2133", "car");

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
("d01", "Joao", "joao.email", "1234", "l001"),
("d02", "Maria", "maria.email", "1234", "l002");

SELECT * FROM licenses
INNER JOIN drivers
ON licenses.id = drivers.license_id;

-----------------------------------

