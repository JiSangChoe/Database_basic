CREATE DATABASE product;

USE product;

CREATE TABLE product (
	product_id VARCHAR(255) PRIMARY KEY,
	product_name VARCHAR(20),
    product_price INT,
    product_stock INT
);