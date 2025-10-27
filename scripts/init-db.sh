#!/bin/bash

# Initialize database
DATABASE_NAME="my_database"
USER_NAME="my_user"
PASSWORD="my_password"

# Create database
echo "Creating database $DATABASE_NAME..."
mysql -u $USER_NAME -p$PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

# Use the new database
echo "Using database $DATABASE_NAME..."
mysql -u $USER_NAME -p$PASSWORD -e "USE $DATABASE_NAME;"

# Create tables
echo "Creating tables..."
mysql -u $USER_NAME -p$PASSWORD $DATABASE_NAME <<EOF
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);
EOF

# Insert sample data
echo "Inserting sample data..."
mysql -u $USER_NAME -p$PASSWORD $DATABASE_NAME <<EOF
INSERT INTO users (name, email) VALUES
('John Doe', 'john@example.com'),
('Jane Smith', 'jane@example.com');

INSERT INTO products (name, price) VALUES
('Product 1', 19.99),
('Product 2', 29.99);
EOF

echo "Database initialization complete."