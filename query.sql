-- query for task 1
CREATE DATABASE week11_task1;

USE week11_task1;

CREATE TABLE tbl_products (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL, 
    price INT NOT NULL, 
    description TEXT, 
    stock INT NOT NULL, 
    PRIMARY KEY(id)
);

INSERT INTO tbl_products (name, price, description, stock) VALUES 
    ('Americano', 20000, 'Espresso with water', 50), 
    ('Vintage Iced Coffee', 27000, 'Balanced mix of espresso, fresh milk, and palm sugar', 30), 
    ('Hazelnut Latte', 33000, 'Espresso with steamed milk and topped with hazelnut', 25),
    ('Vanilla Latte', 33000, 'Espresso with steamed milk and topped with vanilla', 25), 
    ('V60', 25000, 'Light to medium roast coffee brewed by dipping method', 30), 
    ('Tubruk', 15000, 'Indonesian style dark roast coffee', 20), 
    ('Vietnam Drip', 20000, 'Light to dark roast coffee brewed by gravitation method, served with sweetened condensed milk', 20), 
    ('Green Tea Macchiato', 30000, 'Green tea with foamed milk', 25), 
    ('Taro Macchiato', 30000, 'Taro with foamed milk', 25), 
    ('Red Velvet Macchiato', 30000, 'Red velvet with foamed milk', 25);

-- read data
SELECT * FROM tbl_products;
SELECT name FROM tbl_products;

-- delete data
DELETE FROM tbl_products WHERE id=10;

-- search data
SELECT * FROM tbl_products WHERE desciption LIKE '%espresso%';

-- sort data
SELECT * FROM tbl_products Order BY id asc;

-- limit & offset data
SELECT * FROM tbl_products LIMIT 5;
SELECT * FROM tbl_products LIMIT 5 OFFSET 3;


-- query for task 2
CREATE DATABASE week11_task2;

USE week11_task2;

CREATE TABLE products(
    id INT auto_increment not null, 
    invoice varchar(50), 
    date varchar(50), 
    total int not null, 
    product_name varchar(50) not null, 
    price int not null, 
    qty int not null, 
    category varchar(50) not null, primary key(id)
);

-- insert data to table products
INSERT INTO products

CREATE TABLE items(
    id int auto_increment, 
    name_category varchar(50), 
    primary key(id)
);

INSERT INTO items (name_category) VALUES ('mie instan'), ('soda'), ('air mineral');

UPDATE products SET category=1 WHERE id IN (1,4,5,9);
UPDATE products SET category=2 WHERE id IN (2,6,7);
UPDATE products SET category=3 WHERE id IN (3,8);

ALTER TABLE items add column price int;

UPDATE products SET price=2500 WHERE id=1;
UPDATE products SET price=5000 WHERE id=2;
UPDATE products SET price=5000 WHERE id=3;

ALTER TABLE products rename column category TO id_category;

ALTER TABLE products modify id_category int not null;

ALTER TABLE products add foreign key (id_category) REFERENCES items(id) ON UPDATE CASCADE;

CREATE TABLE transaction(
    invoice varchar(50), 
    date varchar(50), 
    total int,
);

INSERT INTO transaction(invoice, date, total) VALUES ('INV-001', '01/01/21', 120000), ('INV-002', '02/01/21', 50000), ('INV-003', '02/01/21', 10000), ('INV-004', '03/01/21', 15000);

ALTER TABLE transaction add column id int auto_increment primary key;

ALTER TABLE products change column invoice id_invoice int;

UPDATE products SET invoice=1 WHERE id IN (1,2,3);
UPDATE products SET invoice=2 WHERE id IN (4,5);
UPDATE products SET invoice=3 WHERE id IN (6,7);
UPDATE products SET invoice=4 WHERE id IN (8,9);

ALTER TABLE products change column invoice id_invoice int;

ALTER TABLE products add foreign key(id_invoice) references transaction(id) on update cascade;

-- join
SELECT * from products LEFT JOIN transaction ON products.id_category = transaction.id;



-- query for task 3
CREATE DATABASE week11_task3;

USE week11_task3;

CREATE TABLE person_details (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50),
    phone_number INT,
    PRIMARY KEY (id)
);

CREATE TABLE transaction (
    id INT AUTO_INCREMENT NOT NULL,
    person VARCHAR(50),
    amount INT,
    date VARCHAR(50),
    notes TEXT,
    id_person INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_person) REFERENCES person_details(id) ON UPDATE CASCADE
);

CREATE TABLE register (
    id INT AUTO_INCREMENT NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    pin INT,
    id_user INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_user) REFERENCES transaction (id) ON UPDATE CASCADE
);