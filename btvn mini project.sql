CREATE DATABASE OnlineLearningDB;
USE OnlineLearningDB;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    BirthDate DATE,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    Description TEXT,
    TotalSessions INT CHECK (TotalSessions > 0),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollDate DATE,
    UNIQUE (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Result (
    ResultID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    MidScore FLOAT CHECK (MidScore BETWEEN 0 AND 10),
    FinalScore FLOAT CHECK (FinalScore BETWEEN 0 AND 10),
    UNIQUE (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);