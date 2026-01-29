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

CREATE TABLE employees (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
salary DECIMAL(10, 2),
join_date date
);

INSERT INTO employees (name, salary, join_date) VALUES
('Arun', 45000, '2022-03-15'),
('Anitha', 52000, '2021-07-10'),
('Ramesh', 60000, '2025-01-15'),
('Rahul', 48000, '2023-02-05'),
('Sita', 55000, '2019-11-30');

SELECT * FROM employees WHERE name LIKE 'A%';

SELECT * FROM employees WHERE name LIKE 'R%';

SELECT AVG(salary) AS average_salary FROM employees;

SELECT name, DATE_FORMAT(join_date, '%d-%m-%y') AS formatted_date FROM employees;
SELECT name, DATE_FORMAT(join_date, '%m-%d-%y') AS formatted_date FROM employees;
SELECT name, DATE_FORMAT(join_date, '%y-%m-%d') AS formatted_date FROM employees;
