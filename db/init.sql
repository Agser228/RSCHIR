CREATE DATABASE IF NOT EXISTS appDB;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON appDB.* TO 'user'@'%';
FLUSH PRIVILEGES;
USE appDB;

CREATE TABLE IF NOT EXISTS users (
    ID INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) CHARACTER SET ascii NOT NULL,
    password VARCHAR(45) CHARACTER SET ascii NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS valuables (
    ID INT(10) NOT NULL AUTO_INCREMENT,
    title VARCHAR(32) NOT NULL,
    description VARCHAR(256) NOT NULL,
    cost INT(6) NOT NULL,
    PRIMARY KEY (ID)
);

-- htpasswd -bns admin admin
INSERT INTO users (name, password)
SELECT * FROM (SELECT 'admin', '{SHA}0DPiKuNIrrVmD8IUCuw1hQxNqZc=') AS temp
WHERE NOT EXISTS (
    SELECT name FROM users WHERE name = 'admin' AND password = '{SHA}0DPiKuNIrrVmD8IUCuw1hQxNqZc='
) LIMIT 1;

INSERT INTO valuables (title, description, cost)
SELECT * FROM (SELECT 'NVidia 3080', 'Видеокарта MSI GeForce RTX 3080 VENTUS 3X PLUS 10G OC LHR', 63600) AS temp
WHERE NOT EXISTS (
    SELECT title FROM valuables WHERE title = 'NVidia 3080' AND description = 'Видеокарта MSI GeForce RTX 3080 VENTUS 3X PLUS 10G OC LHR' AND cost = 63600
) LIMIT 1;

INSERT INTO valuables (title, description, cost)
SELECT * FROM (SELECT 'Intel core i9', 'Процессор Intel Core i9-12900K LGA1700, 16 x 3200 МГц, OEM', 49620) AS temp
WHERE NOT EXISTS (
    SELECT title FROM valuables WHERE title = 'Intel core i9' AND description = 'Процессор Intel Core i9-12900K LGA1700, 16 x 3200 МГц, OEM' AND cost = 49620
) LIMIT 1;
