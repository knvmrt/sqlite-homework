CREATE TABLE IF NOT EXISTS students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name TEXT NOT NULL,
    score1 INTEGER,
    score2 INTEGER,
    score3 INTEGER,
    score4 INTEGER,
    score5 INTEGER
);

INSERT INTO students (
    student_name,
    score1,
    score2,
    score3,
    score4,
    score5
) VALUES
('Murad', 68, 70, 78, 90, 91),
('Arif', 55, 83, 62, 75, 87),
('Hesen', 70, 65, 52, 75, 80);

SELECT 
    student_name,
    (score1 + score2 + score3 + score4 + score5) / 5.0 AS student_average
FROM students;

SELECT * FROM students();

SELECT 
    AVG(
        (score1 + score2 + score3 + score4 + score5) / 5.0
    ) AS class_average
FROM students;