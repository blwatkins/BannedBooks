-- Banned and Challenged Books
-- Create Tables
-- Script for creating all the tables needed for the Banned and Challenged Books database

PRAGMA foreign_keys = ON;
.mode col
.headers on

.read author.sqlite.sql
.read work.sqlite.sql
.read work_written.sqlite.sql
