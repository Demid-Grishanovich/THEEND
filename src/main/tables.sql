CREATE DATABASE computer_club_db;
USE computer_club_db;


-- Создание таблицы Users
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(255),
                       email VARCHAR(255),
                       password VARCHAR(255),
                       city VARCHAR(255),
                       tags VARCHAR(255),
                       rating FLOAT,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создание таблицы Clubs
CREATE TABLE clubs (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(255),
                       country VARCHAR(255),
                       city VARCHAR(255),
                       address VARCHAR(255),
                       tags VARCHAR(255),
                       rating FLOAT,
                       default_admin VARCHAR(255),
                       working_hours VARCHAR(255),
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создание таблицы Computers
CREATE TABLE computers (
                           id SERIAL PRIMARY KEY,
                           club_id INT,
                           name VARCHAR(255),
                           characteristics VARCHAR(255),
                           created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           FOREIGN KEY (club_id) REFERENCES clubs(id)
);

-- Создание таблицы Games
CREATE TABLE games (
                       id SERIAL PRIMARY KEY,
                       computer_id INT,
                       name VARCHAR(255),
                       genre VARCHAR(255),
                       description VARCHAR(255),
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       FOREIGN KEY (computer_id) REFERENCES computers(id)
);

-- Создание таблицы Admin
CREATE TABLE admin (
                       id SERIAL PRIMARY KEY,
                       user_id INT,
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Создание таблицы Admin-Club Relationship
CREATE TABLE admin_club (
                            id SERIAL PRIMARY KEY,
                            master_id INT,
                            club_id INT,
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            FOREIGN KEY (master_id) REFERENCES admin(id),
                            FOREIGN KEY (club_id) REFERENCES clubs(id)
);

-- Создание таблицы Bookings
CREATE TABLE bookings (
                          id SERIAL PRIMARY KEY,
                          user_id INT,
                          computer_id INT,
                          booking_date TIMESTAMP,
                          status VARCHAR(255),
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (user_id) REFERENCES users(id),
                          FOREIGN KEY (computer_id) REFERENCES computers(id)
);

-- Создание таблицы Reviews
CREATE TABLE reviews (
                         id SERIAL PRIMARY KEY,
                         user_id INT,
                         club_id INT,
                         rating INT,
                         comment TEXT,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (user_id) REFERENCES users(id),
                         FOREIGN KEY (club_id) REFERENCES clubs(id)
);

-- Создание таблицы Event History
CREATE TABLE history (
                         id SERIAL PRIMARY KEY,
                         club_id INT,
                         admin_id INT NULL,
                         user_id INT,
                         description TEXT,
                         date_start TIMESTAMP,
                         date_end TIMESTAMP,
                         computer_id INT,
                         status VARCHAR(255),
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         FOREIGN KEY (club_id) REFERENCES clubs(id),
                         FOREIGN KEY (admin_id) REFERENCES admin(id),
                         FOREIGN KEY (user_id) REFERENCES users(id),
                         FOREIGN KEY (computer_id) REFERENCES computers(id)
);
