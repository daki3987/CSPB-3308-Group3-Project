DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS facts;
DROP TABLE IF EXISTS continents;

CREATE TABLE continents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL,
    lat REAL NOT NULL,
    lng REAL NOT NULL,
    label TEXT NOT NULL
);

CREATE TABLE facts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    continent_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    imageUrl TEXT,
    description TEXT NOT NULL,
    rating REAL,
    FOREIGN KEY (continent_id) REFERENCES continents(id)
);

CREATE TABLE comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fact_id INTEGER NOT NULL,
    username TEXT NOT NULL,
    commentText TEXT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (fact_id) REFERENCES facts(id)
);
