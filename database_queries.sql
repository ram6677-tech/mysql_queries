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

CREATE DATABASE school;
USE school;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (name) VALUES
('Ravi'),
('Anita'),
('Kiran'),
('Sita');

INSERT INTO courses (course_name) VALUES
('Java'),
('Python'),
('MySQL');

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);

SELECT s.name AS student_name, c.course_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;

SELECT s.name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150),
    author VARCHAR(100),
    category VARCHAR(50)
);
CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE borrowed_books (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE DATABASE online_store;
USE online_store;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers (name, email, city) VALUES
('Ravi', 'ravi@gmail.com', 'Hyderabad'),
('Anita', 'anita@gmail.com', 'Bangalore'),
('Kiran', 'kiran@gmail.com', 'Chennai');
INSERT INTO products (product_name, price, category) VALUES
('Laptop', 60000, 'Electronics'),
('Mobile', 30000, 'Electronics'),
('Headphones', 2000, 'Accessories'),
('Keyboard', 1500, 'Accessories');
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-01-10'),
(2, '2024-01-12'),
(1, '2024-01-15');
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1);
SELECT * FROM products
WHERE price > 5000;
SELECT * FROM products
WHERE category = 'Electronics' AND price < 50000;
SELECT * FROM products
ORDER BY price DESC;
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT AVG(price) AS average_price
FROM products;
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;
SELECT c.name, o.order_id, o.order_date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
SELECT o.order_id, p.product_name, oi.quantity
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id;
SELECT o.order_id,
       SUM(p.price * oi.quantity) AS total_amount
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id;
SELECT o.order_id,
       SUM(p.price * oi.quantity) AS total_amount
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING total_amount > 10000;

