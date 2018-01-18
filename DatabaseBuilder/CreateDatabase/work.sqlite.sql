-- Banned and Challenged Books
-- Works Table
-- Script for creating the work table
-- A work represents any literary entity that has been published at least once as a book or ebook
-- Works may be published any number of times by various publishing houses in various formats

CREATE TABLE Work (
    ISBN INT(13) PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    year_published INT(4),
    cover_url TEXT
);
