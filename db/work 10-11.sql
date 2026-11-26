-- Практика 10. Приведение к 1НФ и 2НФ

-- Задание 1. 
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255)
);
CREATE TABLE ProjectMembers (
    project_id INT REFERENCES Projects(project_id),
    member_name VARCHAR(255),
    PRIMARY KEY (project_id, member_name)
);

-- Задание 2. 
CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    client_email VARCHAR(255)
);
CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255)
);
CREATE TABLE EquipmentRentals (
    client_id INT REFERENCES Clients(client_id),
    equipment_id INT REFERENCES Equipment(equipment_id),
    rental_date DATE,
    PRIMARY KEY (client_id, equipment_id)
);

-- Задание 3. 1НФ и 2НФ
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_professor VARCHAR(255)
);
CREATE TABLE Grades (
    student_id INT REFERENCES Students(student_id),
    course_id INT REFERENCES Courses(course_id),
    assignment_name VARCHAR(255),
    grade INT,
    PRIMARY KEY (student_id, course_id, assignment_name)
);

-- Практика 11. 3НФ и НФБК
-- Задание 1. 
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255),
    publisher_city VARCHAR(100)
);
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT REFERENCES Publishers(publisher_id)
);



-- Задание 2. 3
CREATE TABLE Cars (
    car_model VARCHAR(100) PRIMARY KEY,
    car_manufacturer VARCHAR(100)
);
CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    car_model VARCHAR(100) REFERENCES Cars(car_model),
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id)
);


-- Задание 3. 
CREATE TABLE EventTypes (
    event_type VARCHAR(50) PRIMARY KEY,
    room_name VARCHAR(100)
);
CREATE TABLE Events (
    event_name VARCHAR(255) PRIMARY KEY,
    event_type VARCHAR(50) REFERENCES EventTypes(event_type)
);
CREATE TABLE RoomBookings (
    booking_time DATETIME,
    event_name VARCHAR(255) REFERENCES Events(event_name),
    PRIMARY KEY (booking_time, event_name)
);

