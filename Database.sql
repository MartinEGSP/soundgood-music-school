-- Table: Person
CREATE TABLE Person (
    id SERIAL PRIMARY KEY,
    person_number VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL
);

-- Table: Student
CREATE TABLE Student (
    id SERIAL PRIMARY KEY,
    age NUMERIC(3) NOT NULL,
    person_id INT NOT NULL,
    enrollment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (person_id) REFERENCES Person(id) ON DELETE CASCADE
);

-- Table: Sibling (Self-Referencing Many-to-Many for Student)
CREATE TABLE Sibling (
    student_id INT NOT NULL,
    sibling_id INT NOT NULL,
    PRIMARY KEY (student_id, sibling_id),
    FOREIGN KEY (student_id) REFERENCES Student(id) ON DELETE CASCADE,
    FOREIGN KEY (sibling_id) REFERENCES Student(id) ON DELETE CASCADE,
    CHECK (student_id <> sibling_id)
);

-- Table: Instructor
CREATE TABLE Instructor (
    id SERIAL PRIMARY KEY,
    teacher_ensemble VARCHAR(3) NOT NULL,
    person_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(id) ON DELETE CASCADE
);

-- Table: Instrument_Type
CREATE TABLE Instrument_Type (
    id SERIAL PRIMARY KEY,
    category VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    rental_price NUMERIC(10, 2) NOT NULL
);

-- Table: Instructor_Instrument
CREATE TABLE Instructor_Instrument (
    instructor_id INT NOT NULL,
    instrument_type_id INT NOT NULL,
    PRIMARY KEY (instructor_id, instrument_type_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(id) ON DELETE CASCADE,
    FOREIGN KEY (instrument_type_id) REFERENCES Instrument_Type(id) ON DELETE CASCADE
);

-- Table: Rental
CREATE TABLE Rental (
    student_id INT NOT NULL,
    rent_period DATE NOT NULL,
    instrument_type_id INT NOT NULL,
    PRIMARY KEY (student_id, rent_period),
    FOREIGN KEY (student_id) REFERENCES Student(id) ON DELETE CASCADE,
    FOREIGN KEY (instrument_type_id) REFERENCES Instrument_Type(id)
);

-- Table: Skill_Level
CREATE TABLE Skill_Level (
    id SERIAL PRIMARY KEY,
    skill_level VARCHAR(100) NOT NULL -- Example: Beginner, Intermediate, Advanced
);

-- Table: Lesson_Price
CREATE TABLE Lesson_Price (
    id SERIAL PRIMARY KEY,
    skill_level_id INT NOT NULL,
    lesson_type VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (skill_level_id) REFERENCES Skill_Level(id) ON DELETE CASCADE
);

-- Table: Lesson
CREATE TABLE Lesson (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    time_start TIME NOT NULL,
    time_end TIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    id_student INT NOT NULL,
    lesson_price_id INT NOT NULL,
    FOREIGN KEY (id_student) REFERENCES Student(id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_price_id) REFERENCES Lesson_Price(id)
);

-- Table: Date_Availability
CREATE TABLE Date_Availability (
    instructor_id INT NOT NULL,
    date DATE NOT NULL,
    duration VARCHAR(100),
    PRIMARY KEY (instructor_id, date),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(id)
);

-- Table: Student_Payment
CREATE TABLE Student_Payment (
    student_id INT NOT NULL,
    discount NUMERIC(10, 2),
    amount NUMERIC(10, 2),
    payment_date DATE NOT NULL,
    PRIMARY KEY (student_id, payment_date),
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

-- Table: Contact_Person
CREATE TABLE Contact_Person (
    student_id INT NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100),
    PRIMARY KEY (student_id),
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

-- Table: Person_Email
CREATE TABLE Person_Email (
    person_id INT NOT NULL,
    email_id INT NOT NULL,
    PRIMARY KEY (person_id, email_id),
    FOREIGN KEY (person_id) REFERENCES Person(id),
    FOREIGN KEY (email_id) REFERENCES Email(id)
);

-- Table: Email
CREATE TABLE Email (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL
);

-- Table: Person_Phone
CREATE TABLE Person_Phone (
    person_id INT NOT NULL,
    phone_id INT NOT NULL,
    PRIMARY KEY (person_id, phone_id),
    FOREIGN KEY (person_id) REFERENCES Person(id),
    FOREIGN KEY (phone_id) REFERENCES Phone_Number(id)
);

-- Table: Phone_Number
CREATE TABLE Phone_Number (
    id SERIAL PRIMARY KEY,
    phone_number VARCHAR(15) NOT NULL
);
