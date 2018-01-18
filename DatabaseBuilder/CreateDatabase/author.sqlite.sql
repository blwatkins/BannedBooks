-- Banned and Challenged Books
-- Author Table
-- Script for creating the author table

CREATE TABLE Author (
    firstName VARCHAR(40),
    middleName VARCHAR(40),
    lastName VARCHAR(40) NOT NULL,
    birthYear INT(4),
    photo_url TEXT,
    PRIMARY KEY (firstName, middleName, lastName)
);
