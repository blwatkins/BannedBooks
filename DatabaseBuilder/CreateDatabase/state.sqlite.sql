-- Banned and Challenged Books
-- State table
-- Script for creating the state table

CREATE TABLE State (
    abbreviation CHAR(2) PRIMARY KEY NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    flag_url TEXT
);
