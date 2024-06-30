-- Create a new database named bank
CREATE DATABASE bank;

-- Switch to the new database
USE bank;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Create accounts table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(15, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(15, 2),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Create branches table
CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    branch_address VARCHAR(100)
);

-- Create accounts_branches table for many-to-many relationship between accounts and branches
CREATE TABLE accounts_branches (
    account_id INT,
    branch_id INT,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id),
    PRIMARY KEY (account_id, branch_id)
);

-- Insert data into customers table
INSERT INTO customers (customer_id, first_name, last_name, email, phone) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678'),
(3, 'Robert', 'Johnson', 'robert.johnson@example.com', '555-8765');

-- Insert data into accounts table
INSERT INTO accounts (account_id, account_number, customer_id, account_type, balance) VALUES
(1, '1234567890', 1, 'Checking', 1000.00),
(2, '2345678901', 2, 'Savings', 1500.00),
(3, '3456789012', 3, 'Checking', 2000.00),
(4, '4567890123', 1, 'Savings', 3000.00);

-- Insert data into transactions table
INSERT INTO transactions (transaction_id, account_id, transaction_date, transaction_type, amount) VALUES
(1, 1, '2023-01-01', 'Deposit', 500.00),
(2, 1, '2023-01-15', 'Withdrawal', 200.00),
(3, 2, '2023-02-01', 'Deposit', 700.00),
(4, 3, '2023-02-15', 'Withdrawal', 300.00);

-- Insert data into branches table
INSERT INTO branches (branch_id, branch_name, branch_address) VALUES
(1, 'Main Branch', '123 Main St'),
(2, 'North Branch', '456 North St'),
(3, 'South Branch', '789 South St');

-- Insert data into accounts_branches table
INSERT INTO accounts_branches (account_id, branch_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3);

-- (1). Retrieve all customers and their accounts
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_id,
    a.account_number,
    a.account_type,
    a.balance
FROM 
    customers c
JOIN 
    accounts a ON c.customer_id = a.customer_id;

-- (2). Retrieve all transactions for a specific account
SELECT 
    t.transaction_id,
    t.account_id,
    t.transaction_date,
    t.transaction_type,
    t.amount
FROM 
    transactions t
WHERE 
    t.account_id = 1;

-- (3). Retrieve all branches and the accounts associated with them
SELECT 
    b.branch_id,
    b.branch_name,
    b.branch_address,
    a.account_id,
    a.account_number,
    a.account_type,
    a.balance
FROM 
    branches b
JOIN 
    accounts_branches ab ON b.branch_id = ab.branch_id
JOIN 
    accounts a ON ab.account_id = a.account_id;
-- (4). Retrieve the total balance for each customer    
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(a.balance) AS total_balance
FROM 
    customers c
JOIN 
    accounts a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name;

-- (5). Retrieve all customers with their corresponding branches
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    b.branch_id,
    b.branch_name,
    b.branch_address
FROM 
    customers c
JOIN 
    accounts a ON c.customer_id = a.customer_id
JOIN 
    accounts_branches ab ON a.account_id = ab.account_id
JOIN 
    branches b ON ab.branch_id = b.branch_id;

