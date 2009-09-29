CREATE TABLE user (
       name VARCHAR(255) PRIMARY KEY,
       image_url VARCHAR(255) NOT NULL,
       updated_on DATETIME NOT NULL
);

CREATE TABLE tweet (
       id INTEGER PRIMARY KEY,
       body TEXT NOT NULL,
       user_name VARCHAR(255) NOT NULL,
       created_on DATETIME NOT NULL
);

CREATE TABLE food (
       tweet_id INTEGER PRIMARY KEY,
       name  VARCHAR(255) NOT NULL
);
