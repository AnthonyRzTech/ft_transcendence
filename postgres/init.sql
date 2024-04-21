-- Create a new role
CREATE ROLE myapp_user WITH LOGIN PASSWORD 'secure_password';

-- Create a new database
CREATE DATABASE myapp_db OWNER myapp_user;

-- Grant all privileges on database
GRANT ALL PRIVILEGES ON DATABASE myapp_db TO myapp_user;

-- Connect to the database to run the following commands
\c myapp_db

-- Create a simple table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Insert initial data into the 'users' table
INSERT INTO users (username, email) VALUES
('admin', 'admin@example.com'),
('testuser', 'test@example.com');
