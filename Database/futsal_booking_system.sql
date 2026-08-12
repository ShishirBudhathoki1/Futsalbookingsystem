CREATE DATABASE futsal_booking_system;
USE futsal_booking_system;

-- 1. USER TABLE
CREATE TABLE USER (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password VARCHAR(255) NOT NULL
);

-- 2. ADMIN TABLE
CREATE TABLE ADMIN (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- 3. VENUE TABLE
CREATE TABLE VENUE (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    admin_id INT NOT NULL,
    venue_name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    city VARCHAR(50),
    contact_number VARCHAR(20),
    opening_time TIME,
    closing_time TIME,

    FOREIGN KEY (admin_id) REFERENCES ADMIN(admin_id)
);

-- 4. COURT TABLE
CREATE TABLE COURT (
    court_id INT PRIMARY KEY AUTO_INCREMENT,
    venue_id INT NOT NULL,
    court_name VARCHAR(100) NOT NULL,
    court_type VARCHAR(50),
    hourly_rate DECIMAL(10,2),
    status VARCHAR(20),

    FOREIGN KEY (venue_id) REFERENCES VENUE(venue_id)
);

-- 5. SLOT TABLE
CREATE TABLE SLOT (
    slot_id INT PRIMARY KEY AUTO_INCREMENT,
    court_id INT NOT NULL,
    slot_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    availability_status VARCHAR(20),

    FOREIGN KEY (court_id) REFERENCES COURT(court_id)
);

-- 6. BOOKING TABLE
CREATE TABLE BOOKING (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    slot_id INT NOT NULL,
    booking_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    booking_status VARCHAR(20),
    notes VARCHAR(255),

    FOREIGN KEY (user_id) REFERENCES USER(user_id),
    FOREIGN KEY (slot_id) REFERENCES SLOT(slot_id)
);

-- 7. PAYMENT TABLE
CREATE TABLE PAYMENT (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(50),
    transaction_id VARCHAR(100),
    payment_status VARCHAR(20),

    FOREIGN KEY (booking_id) REFERENCES BOOKING(booking_id)
);
