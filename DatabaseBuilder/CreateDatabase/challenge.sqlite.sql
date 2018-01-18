-- Banned and Challenged Books
-- Challenge table
-- Script for creating the challenge table

CREATE TABLE Challenge (
    work_ISBN INT(13) NOT NULL,
    state CHAR(2) NOT NULL,
    institution VARCHAR(40) NOT NULL,
    year INT(4) NOT NULL,
    count INT NOT NULL,
    source_url TEXT,
    PRIMARY KEY (work_ISBN, state, institution, year),
    FOREIGN KEY (work_ISBN) REFERENCES Work(ISBN),
    FOREIGN KEY (state) REFERENCES State(abbreviation),
    FOREIGN KEY (institution) REFERENCES Institution(type)
);
