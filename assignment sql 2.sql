create schema books;
use books;
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(150),
    price DECIMAL(10,2),
    publication_year INT,
    genre VARCHAR(100)
);
INSERT INTO Book (book_id, title, author, price, publication_year, genre)
VALUES
(1, 'The God of Small Things', 'Arundhathi Roy', 350.00, 1997, 'Fiction'),
(2, 'Future Dreams', 'Arundhathi Roy', 499.00, 2026, 'Fiction'),
(3, 'Modern Life', 'Arundhathi Roy', 550.00, 2027, 'Drama'),
(4, 'Unknown Tales', 'Someone Else', 300.00, 2026, 'Fiction'),
(5, 'New Era Stories', 'Arundhathi Roy', 600.00, 2025, 'Fiction');
SELECT title, price
FROM Book
WHERE author = 'Arundhathi Roy'
  AND publication_year > 2025;
SELECT *
FROM Book
WHERE (genre = 'Fiction' OR genre = 'Philosophy')
  AND price BETWEEN 300 AND 600;
  create schema sale;
  use sale;
  CREATE TABLE Sales (
    region VARCHAR(100),
    product VARCHAR(100),
    quatiity VARCHAR(50),  
    amount DECIMAL(10,2)
    );
DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    region VARCHAR(100),
    product VARCHAR(100),
    quantity VARCHAR(50),
    amount DECIMAL(10,2)
);
INSERT INTO Sales (region, product, quantity, amount)
VALUES
('North', 'smartphones', 10, 50000.00),
('North', 'Mouse', 25, 1250.00),
('South', 'monitor', 11, 45000.00),
('South', 'Laptop', 8, 40000.00),
('East', 'bluetoothspeaker', 12, 24000.00),
('East', 'Mouse', 20, 1000.00),
('West', 'Laptop', 5, 25000.00),
('West', 'Keyboard', 18, 54000.00);
SELECT region, SUM(quantity) AS total_quantity_sold
FROM Sales
GROUP BY region;
SELECT region, SUM(amount) AS total_sales_amount
FROM Sales
GROUP BY region
HAVING SUM(amount) > 50000;
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE results (
    student_id INT,
    subject VARCHAR(100),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
INSERT INTO student (student_id, name, department) VALUES
(1, 'Aiswarya', 'Computer Science'),
(2, 'Rahul', 'Mechanical'),
(3, 'Sneha', 'Electronics'),
(4, 'Arjun', 'Business'),
(5, 'Akash', 'Computer Science');
INSERT INTO results (student_id, subject, marks) VALUES
(1, 'Maths', 0),
(1, 'DBMS', 88),
(2, 'Mechanics', 74),
(3, 'Circuits', 81),
(4, 'Marketing', 67),
(5, 'Python', 95),
(5, 'DBMS', 0);
SELECT s.name, r.subject, r.marks
FROM student s
JOIN results r ON s.student_id = r.student_id;
SELECT 
    student.name,
    results.subject,
    results.marks
FROM 
    student
JOIN 
    results
ON 
    student.student_id = results.student_id;
    CREATE TABLE Dev_Team (
    dev_emp_id INT PRIMARY KEY,
    dev_emp_name VARCHAR(100),
    dev_project_name VARCHAR(100)
);
    CREATE TABLE QA_Team (
    qa_emp_id INT PRIMARY KEY,
    qa_emp_name VARCHAR(100),
    qa_project_name VARCHAR(100)
);
INSERT INTO Dev_Team (dev_emp_id, dev_emp_name, dev_project_name) VALUES
(1, 'Aiswarya', 'Inventory Management System'),
(2, 'Rahul', 'E-Commerce Platform'),
(3, 'Sanjay', 'Chat Application'),
(4, 'Akash', 'Banking Portal');
INSERT INTO QA_Team (qa_emp_id, qa_emp_name, qa_project_name) VALUES
(2, 'Rahul', 'E-Commerce Platform'),
(3, 'Sanjay', 'Chat Application'),
(5, 'Divya', 'Travel Booking System'),
(6, 'Kiran', 'Banking Portal');
SELECT 
    d.dev_emp_name,
    d.dev_project_name,
    q.qa_emp_name,
    q.qa_project_name
FROM Dev_Team d
LEFT JOIN QA_Team q 
    ON d.dev_emp_id = q.qa_emp_id

UNION

SELECT 
    d.dev_emp_name,
    d.dev_project_name,
    q.qa_emp_name,
    q.qa_project_name
FROM QA_Team q
LEFT JOIN Dev_Team d
    ON q.qa_emp_id = d.dev_emp_id;

