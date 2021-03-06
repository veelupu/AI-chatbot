-- Copyright (c) 2021 Veera Lupunen

BEGIN;

CREATE SCHEMA aicb;
SET search_path = aicb, public;


CREATE TABLE IF NOT EXISTS question (
	id SERIAL PRIMARY KEY,
	word TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS answer (
	id SERIAL PRIMARY KEY,
	content TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS question_answer (
	q_id INTEGER REFERENCES question(id) ON UPDATE CASCADE ON DELETE CASCADE,
	a_id INTEGER REFERENCES answer(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS admin (
	id SERIAL PRIMARY KEY,
	username VARCHAR(255) UNIQUE NOT NULL, 
	password TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS code (
	id CHAR(4) PRIMARY KEY,
	human BOOLEAN NOT NULL DEFAULT false
);

COMMIT;