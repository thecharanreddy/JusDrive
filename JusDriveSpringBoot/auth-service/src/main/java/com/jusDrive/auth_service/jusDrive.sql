-- Create the database
CREATE DATABASE JUSDRIVE;

-- Optional: Drop the database (be cautious with this)
DROP DATABASE JUSDRIVE;

-- Use the database
USE JUSDRIVE;

-- Create owner table
-- CREATE TABLE owner (
--     owner_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL,
--     email VARCHAR(100) NOT NULL UNIQUE,
--     password VARCHAR(255) NOT NULL,
--     phone VARCHAR(15),
--     address TEXT,
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--     modified_at DATETIME DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE owner (
--     owner_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- Matches Long type in Java
--     name VARCHAR(100) NOT NULL, -- Matches @Size(max = 100) and @NotBlank
--     email VARCHAR(100) NOT NULL UNIQUE, -- Matches @Email and @Column(unique = true)
--     password VARCHAR(255) NOT NULL, -- Matches @NotBlank and @Size(min = 8)
--     phone VARCHAR(15) NOT NULL, -- Matches @Size(max = 15) and @NotBlank
--     address TEXT NOT NULL, -- Matches @NotBlank
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Matches @CreatedDate
--     modified_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Matches @LastModifiedDate
-- );

CREATE TABLE owner (
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- Inherited from User
    name VARCHAR(100) NOT NULL,           -- Inherited from User
    email VARCHAR(100) NOT NULL UNIQUE,   -- Inherited from User
    password VARCHAR(255) NOT NULL,       -- Inherited from User
    phone VARCHAR(15) NOT NULL,           -- Inherited from User
    address TEXT NOT NULL,                -- Inherited from User
    role VARCHAR(50) NOT NULL DEFAULT 'OWNER', -- Differentiates role
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Inherited from User
    modified_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Inherited from User
);

-- Create customer table
-- CREATE TABLE customer (
--     customer_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL,
--     email VARCHAR(100) NOT NULL UNIQUE,
--     password VARCHAR(255) NOT NULL,
--     phone VARCHAR(15),
--     address TEXT,
--     is_active BOOLEAN DEFAULT TRUE,
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--     modified_at DATETIME DEFAULT CURRENT_TIMESTAMP
-- );

-- CREATE TABLE customer (
--     customer_id BIGINT AUTO_INCREMENT PRIMARY KEY, -- Matches Long type in Java
--     name VARCHAR(100) NOT NULL, -- Matches @Size(max = 100) and @NotBlank
--     email VARCHAR(100) NOT NULL UNIQUE, -- Matches @Email and @Column(unique = true)
--     password VARCHAR(255) NOT NULL, -- Matches @NotBlank and @Size(min = 8)
--     phone VARCHAR(15) NOT NULL, -- Matches @Size(max = 15) and @NotBlank
--     address TEXT NOT NULL, -- Matches @NotBlank
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Matches @CreatedDate
--     modified_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Matches @LastModifiedDate
-- );

CREATE TABLE customer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- Inherited from User
    name VARCHAR(100) NOT NULL,           -- Inherited from User
    email VARCHAR(100) NOT NULL UNIQUE,   -- Inherited from User
    password VARCHAR(255) NOT NULL,       -- Inherited from User
    phone VARCHAR(15) NOT NULL,           -- Inherited from User
    address TEXT NOT NULL,                -- Inherited from User
    role VARCHAR(50) NOT NULL DEFAULT 'CUSTOMER', -- Differentiates role
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Inherited from User
    modified_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Inherited from User
);

drop table customer;
-- Create car table
CREATE TABLE car (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id BIGINT NOT NULL,
    brand VARCHAR(100),
    model VARCHAR(100),
    registration_number VARCHAR(50) UNIQUE,
    year INT,
    color VARCHAR(50),
    car_type VARCHAR(50),
    seating_capacity INT,
    price_per_day DECIMAL(10,2),
    status ENUM('available', 'booked', 'inactive') DEFAULT 'available',
    image_url TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES owner(id)
);

-- Create enquiry table
CREATE TABLE enquiry (
    enquiry_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    car_id INT NOT NULL,
    message TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'replied') DEFAULT 'pending',
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);

-- Create enquiry_response table
CREATE TABLE enquiry_response (
    response_id INT AUTO_INCREMENT PRIMARY KEY,
    enquiry_id INT NOT NULL UNIQUE,
    owner_id BIGINT NOT NULL,
    response TEXT NOT NULL,
    responded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (enquiry_id) REFERENCES enquiry(enquiry_id),
    FOREIGN KEY (owner_id) REFERENCES owner(id)
);


select * from customer;