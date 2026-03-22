-- Department Database Table:

CREATE TABLE Department (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Description TEXT,
    CreatedDate TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Teacher Database Table:

CREATE TABLE Teacher (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    FullName TEXT NOT NULL,
    Email TEXT UNIQUE,
    Phone TEXT,
    DepartmentId INTEGER NOT NULL,
    HireDate TEXT,

    FOREIGN KEY (DepartmentId)
        REFERENCES Department(Id)
        ON DELETE CASCADE
);

-- Student Database Table: 

CREATE TABLE Student (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    FullName TEXT NOT NULL,
    Email TEXT UNIQUE,
    BirthDate TEXT,
    EnrollmentDate TEXT DEFAULT CURRENT_TIMESTAMP,
    DepartmentId INTEGER NOT NULL,

    FOREIGN KEY (DepartmentId)
        REFERENCES Department(Id)
        ON DELETE CASCADE
);

-- StudentProfile Database Table:

CREATE TABLE StudentProfile (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentId INTEGER UNIQUE,
    Address TEXT,
    Phone TEXT,
    Gender TEXT CHECK(Gender IN ('Male', 'Female')),
    EmergencyContact TEXT,

    FOREIGN KEY (StudentId)
        REFERENCES Student(Id)
        ON DELETE CASCADE
);

-- Course Database Table:

CREATE TABLE Course (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Description TEXT,
    Credit INTEGER CHECK(Credit BETWEEN 1 AND 10),
    TeacherId INTEGER NOT NULL,
    CreatedDate TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (TeacherId)
        REFERENCES Teacher(Id)
        ON DELETE SET NULL
);

-- StudentCourse Database Table:

CREATE TABLE StudentCourse (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentId INTEGER NOT NULL,
    CourseId INTEGER NOT NULL,
    EnrollmentDate TEXT DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (StudentId)
        REFERENCES Student(Id)
        ON DELETE CASCADE,

    FOREIGN KEY (CourseId)
        REFERENCES Course(Id)
        ON DELETE CASCADE,

    UNIQUE(StudentId, CourseId)
);

-- Exem Database Table:

CREATE TABLE Exam (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    CourseId INTEGER NOT NULL,
    ExamName TEXT NOT NULL,
    ExamDate TEXT,
    TotalMarks INTEGER DEFAULT 100,

    FOREIGN KEY (CourseId)
        REFERENCES Course(Id)
        ON DELETE CASCADE
);

-- Grade Database Table:

CREATE TABLE Grade (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    StudentId INTEGER NOT NULL,
    ExamId INTEGER NOT NULL,
    Score INTEGER CHECK(Score BETWEEN 0 AND 100),
    GradeLetter TEXT,

    FOREIGN KEY (StudentId)
        REFERENCES Student(Id)
        ON DELETE CASCADE,

    FOREIGN KEY (ExamId)
        REFERENCES Exam(Id)
        ON DELETE CASCADE,

    UNIQUE(StudentId, ExamId)
);

INSERT:

INSERT INTO Department (Name, Description)
VALUES 
('İnzibati', 'Təhsil müəsisəsinin əsas şöbəsidir və Kompüter laboratoriyaları var.'),
('Emalatxana No1', 'Sənaye avadanlıqları, dərs otaqları, müəllimlər və titurlar otağı mövcuddur.'),
('Emalatxana No2', 'Geniş sənaye avadanlıqları, dərs otaqları mövcuddur.');

-- ------------

INSERT INTO Teacher (FullName, Email, Phone, DepartmentId, HireDate)
VALUES
('Akif Zeynallı', 'akifzeynalli@bii.edu', '050 000 00 00', 1, '2010-09-01'),
('Eldar Hüseyn', 'eldar01@bii.edu', '051 000 00 00', 2, '2019-02-15'),
('Samir Abbasov', 'abbasovs@bii.edu', '055 000 00 00', 3, '2022-12-20'),
('Telman Abbaslı', 'telmanabbasli@bii.edu', '070 000 00 00', 1, '2022-10-05');

-- ----------------

INSERT INTO Student (FullName, Email, BirthDate, DepartmentId)
VALUES
('Murad Qəhrəmanov', 'gahramanov.murad@outlook.com', '2003-10-05', 1),
('Zeynəb Akifzadə', 'zeyneb.a@outlook.com', '2005-05-05', 1),
('Telman Əliyev', 'aliyevtelman@outlook.com', '2004-09-28', 3);

-- ---------------

INSERT INTO StudentProfile (StudentId, Address, Phone, Gender, EmergencyContact)
VALUES
(1, 'Masazır, Qurtuluş 93', '051 449 54 22', 'Male', 'Ana: 055 000 00 00'),
(2, 'Sumqayit', '055 000 00 00', 'Female', 'Ana: 050 000 00 00'),
(3, 'Yeniyasamal', '070 000 00 00', 'Male', 'Ata: 055 000 00 00');

-- --------------------

INSERT INTO Course (Name, Description, Credit, TeacherId)
VALUES
('SQL', 'SQL sorğu dili və verilənlər bazası dizaynı.', 10, 1),
('Qrafik Dizayn', 'Qrafik Dizayn, Photoshop, illustrator və inDesign proqramları.', 10, 4);

-- -------------------

INSERT INTO StudentCourse (StudentId, CourseId)
VALUES
(1, 1),
(2, 1),
(3, 2);

-- ---------------------

INSERT INTO Exam (CourseId, ExamName, ExamDate, TotalMarks)
VALUES
(1, 'SQL - Kollokvium No1', '2025-05-10', 50),
(1, 'SQL - Kollokvium No2', '2026-05-10', 50),
(2, 'Qrafik Dizayn - Kollokvium No1', '2025-06-20', 50),
(2, 'Qrafik Dizayn - Kollokvium No2', '2026-06-20', 50);

-- -------------

INSERT INTO Grade (StudentId, ExamId, Score, GradeLetter)
VALUES
(1, 1, 100, 'A'),
(2, 2, 82, 'B'),
(3, 3, 83, 'B');

-- -------------

-- OTHER QUERIES:

SELECT 
    Student.FullName,
    Course.Name AS CourseName
FROM StudentCourse
JOIN Student ON Student.Id = StudentCourse.StudentId
JOIN Course ON Course.Id = StudentCourse.CourseId;

-- -------------------

