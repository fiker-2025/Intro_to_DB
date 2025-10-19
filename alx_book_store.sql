-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert sample authors
INSERT INTO Authors (author_name) 
VALUES ('FKR AMENU'), ('ABEBA DESALEGNE'), ('HIWOT KASA');

-- Insert sample books
INSERT INTO Books (title, author_id, price, publication_date)
VALUES
('LETS GO TO SCHOOL', 1, 15, '1995-06-07'),
('MY LIFE MY STORY', 2, 22, '2000-01-02'),
('THE JOURNEY', 3, 23, '2010-05-06');

-- Insert sample customers with address
INSERT INTO Customers (customer_name, email, address)
VALUES
('HELINA TESFAYE', 'hlinatesfaye@gmail.com', 'Addis Ababa'),
('SAMUEL BEKELE', 'samiiii09@gmail.com', 'Adama'),
('ABEBA DAWIT', 'abebayedawit00@gmail.com', 'Bahir Dar');

-- Insert sample orders
INSERT INTO Orders (customer_id, order_date)
VALUES 
(1, '2025-05-15'),
(2, '2025-05-16'),
(3, '2025-05-17');

-- Insert sample order details
INSERT INTO Order_Details (order_id, book_id, quantity)
VALUES
(1, 1, 2),
(1, 2, 2),
(2, 1, 1);