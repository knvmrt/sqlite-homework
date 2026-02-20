CREATE TABLE "Students" (
    "uuid" TEXT PRIMARY KEY DEFAULT (hex(randomblob(5))),
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "phone" TEXT NOT NULL,
    "dateBirth" DATE NOT NULL
);

INSERT INTO Students ("firstName", "lastName", "email", "phone", "dateBirth") 
VALUES ('Murad', 'Gahramanov', 'gahramanov.murad@outlook.com', '0514495422', '2003-10-05');

SELECT * FROM "Students";