-- Database: Credit_Card_Transactions

-- DROP DATABASE "Credit_Card_Transactions";

CREATE DATABASE "Credit_Card_Transactions"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "Credit_Card_Transactions"
    IS 'SQL Homework - Credit Card Transactions';