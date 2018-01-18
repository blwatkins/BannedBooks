-- Banned and Challenged Books
-- WorkWritten Table
-- Script for creating the work_written table

CREATE TABLE WorkWritten (
    work_ISBN INT(13) NOT NULL,
    author_firstName VARCHAR(40),
    author_middleName VARCHAR(40),
    author_lastName VARCHAR(40) NOT NULL,
    PRIMARY KEY (work_ISBN, author_firstName, author_middleName, author_lastName),
    FOREIGN KEY (work_ISBN) REFERENCES Work(ISBN),
    FOREIGN KEY (author_firstName, author_middleName, author_lastName)
    	REFERENCES Author(firstName, middleName, lastName)
);
