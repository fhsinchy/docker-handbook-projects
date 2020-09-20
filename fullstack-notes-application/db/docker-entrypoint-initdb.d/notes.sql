CREATE TABLE IF NOT EXISTS notes (
    id serial PRIMARY KEY,
    title varchar(255) NOT NULL,
    content text NOT NULL
);