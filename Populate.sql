-- Populate Person
INSERT INTO Person (person_number, name, address) 
VALUES 
('19991212-1234', 'Alice Johnson', '123 Music St'),
('20001010-5678', 'Bob Smith', '456 Jazz Ave');

-- Populate Email
INSERT INTO Email (email)
VALUES 
('alice.johnson@example.com'),
('bob.smith@example.com');

-- Populate Person_Email
INSERT INTO Person_Email (person_id, email_id)
VALUES 
(1, 1),
(2, 2);

-- Populate Phone_Number
INSERT INTO Phone_Number (phone_number)
VALUES 
('123456789'),
('987654321');

-- Populate Person_Phone
INSERT INTO Person_Phone (person_id, phone_id)
VALUES 
(1, 1),
(2, 2);

-- Populate Student
INSERT INTO Student (age, person_id)
VALUES 
(20, 1),
(22, 2);

-- Populate Sibling
INSERT INTO Sibling (student_id, sibling_id, siblings)
VALUES 
(1, 2, 'Sibling');

-- Populate Skill_Level
INSERT INTO Skill_Level (skill_level)
VALUES 
('Beginner'),
('Intermediate'),
('Advanced');

-- Populate Student_Skill
INSERT INTO Student_Skill (student_id, skill_id)
VALUES 
(1, 1),
(2, 2);

-- Populate Instrument
INSERT INTO Instrument (instrument_id, brand, category)
VALUES 
('GUITAR01', 'Yamaha', 'String'),
('PIANO01', 'Casio', 'Keyboard');

-- Populate Instructor
INSERT INTO Instructor (teacher_ensemble, person_id)
VALUES 
('Yes', 1),
('No', 2);

-- Populate Lesson
INSERT INTO Lesson (date, time_start, time_end, location, id_student)
VALUES 
('2024-01-15', '10:00:00', '11:00:00', 'Room A', 1),
('2024-01-16', '12:00:00', '13:00:00', 'Room B', 2);

-- Populate Student_Payment
INSERT INTO Student_Payment (student_id, discount, amount, payment_date)
VALUES 
(1, '10%', 100.00, '2024-01-20'),
(2, '5%', 150.00, '2024-01-21');

-- Populate Rental
INSERT INTO Rental (student_id, rent_period, price)
VALUES 
(1, '2024-02-01', 50.00),
(2, '2024-02-01', 75.00);
