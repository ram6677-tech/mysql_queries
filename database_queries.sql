CREATE DATABASE learning_db;
USE learning_db;
CREATE TABLE students (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
age INT,
city VARCHAR(50)
);
INSERT INTO students (name, age, city) values
('Ravi', 19, 'Hyderabad'),
('Anitha', 21, 'Bangalore'),
('Kiran', 22, 'Chennai'),
('Sita', 18, 'Vijayawada'),
('Arjun', 25, 'Pune');

select * from students where age > 20;

CREATE TABLE products (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
price DECIMAL(10, 2),
quantity int
);

UPDATE products SET price = price * 1.10;

DELETE FROM products WHERE quantity = 0;

SELECT * FROM products WHERE price between 500 AND 2000;

SELECT * FROM PRODUCTS WHERE price >= 500 AND price <= 2000;


