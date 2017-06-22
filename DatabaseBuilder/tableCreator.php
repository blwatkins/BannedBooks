<?php

    $db_filename = 'database/challenges.db.sqlite';
    $db = new SQLite3($db_filename);

    echo 'Connection Success!' . '<br>';

    function createAuthorsTable(SQLite3 $db) {
        $author_creation = 'CREATE TABLE IF NOT EXISTS Authors (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            first_name TEXT,
            middle_name TEXT,
            last_name TEXT NOT NULL)';
    
        if ($db->exec($author_creation)) {
            echo 'Authors table creation successful!' . '<br>';
        }
    }

    function createWorksTable(SQLite3 $db) {
        $work_creation = 'CREATE TABLE IF NOT EXISTS Works (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            title TEXT NOT NULL,
            isbn INTEGER UNIQUE,
            year_published INTEGER,
            local_cover_url TEXT UNIQUE,
            goodreads_url TEXT UNIQUE);';
    
        if ($db->exec($work_creation)) {
            echo 'Works table creation successful!' . '<br>';
        }
    }

    function createBooksTable(SQLite3 $db) {
    
        $book_creation = 'CREATE TABLE IF NOT EXISTS Books (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            work_id INTEGER NOT NULL,
            author_id INTEGER NOT NULL,
            FOREIGN KEY(work_id) REFERENCES Works(id),
            FOREIGN KEY(author_id) REFERENCES Authors(id))';
    
        if ($db->exec($book_creation)) {
            echo 'Books table creation successful!' . '<br>';
        }
    }

    function createStatesTable(SQLite3 $db) {
        $state_creation = 'CREATE TABLE IF NOT EXISTS States (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            name TEXT UNIQUE NOT NULL,
            abbreviation TEXT UNIQUE NOT NULL,
            local_flag_url TEXT UNIQUE)';
    
        if ($db->exec($state_creation)) {
            echo 'States table creation successful!' . '<br>';
        }
    }

    function createInstitutionTypesTable(SQLite3 $db) {
        $institution_type_creation = 'CREATE TABLE IF NOT EXISTS InstitutionTypes (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            type TEXT UNIQUE NOT NULL)';
    
        if ($db->exec($institution_type_creation)) {
            echo 'Institution Types table creation successful!' . '<br>';
        }
    }

    function createChallengesTable(SQLite3 $db) {
        $challenge_creation = 'CREATE TABLE IF NOT EXISTS Challenges (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            work_id INTEGER NOT NULL,
            year INTEGER,
            state_id INTEGER NOT NULL,
            institution_type_id INTEGER,
            local_source_url TEXT,
            web_source_url TEXT,
            FOREIGN KEY(work_id) REFERENCES Works(id),
            FOREIGN KEY(state_id) REFERENCES States(id),
            FOREIGN KEY(institution_type_id) REFERENCES InstitutionTypes(id))';

        if ($db->exec($challenge_creation)) {
            echo 'Challenges table creation successful!' . '<br>';
        }    
    }

    createAuthorsTable($db);
    createWorksTable($db);
    createBooksTable($db);
    createStatesTable($db);
    createInstitutionTypesTable($db);
    createChallengesTable($db);

    if ($db->close()) {
        echo 'Database closed. Script complete.';
    }
        
?>