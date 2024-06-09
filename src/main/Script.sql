-- Создание временной таблицы для загрузки данных из CSV
CREATE TEMP TABLE temp_users (
    id INT,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    city VARCHAR(255),
    tags VARCHAR(255),
    rating FLOAT,
    created_at TIMESTAMP
);

-- Загрузка данных из CSV в временную таблицу
COPY temp_users(id, name, email, password, city, tags, rating, created_at)
    FROM '/path/to/your/csv/users.csv'
    DELIMITER ','
    CSV HEADER;

-- Вставка новых записей из временной таблицы в основную таблицу
INSERT INTO users (id, name, email, password, city, tags, rating, created_at)
SELECT id, name, email, password, city, tags, rating, created_at
FROM temp_users
    ON CONFLICT (id) DO NOTHING;

-- Удаление временной таблицы
DROP TABLE temp_users;

-- Повторить для каждой таблицы

-- Создание временной таблицы для загрузки данных из CSV для clubs
CREATE TEMP TABLE temp_clubs (
    id INT,
    name VARCHAR(255),
    country VARCHAR(255),
    city VARCHAR(255),
    address VARCHAR(255),
    tags VARCHAR(255),
    rating FLOAT,
    default_admin VARCHAR(255),
    working_hours VARCHAR(255),
    created_at TIMESTAMP
);

-- Загрузка данных из CSV в временную таблицу для clubs
COPY temp_clubs(id, name, country, city, address, tags, rating, default_admin, working_hours, created_at)
    FROM '/path/to/your/csv/clubs.csv'
    DELIMITER ','
    CSV HEADER;

-- Вставка новых записей из временной таблицы в основную таблицу clubs
INSERT INTO clubs (id, name, country, city, address, tags, rating, default_admin, working_hours, created_at)
SELECT id, name, country, city, address, tags, rating, default_admin, working_hours, created_at
FROM temp_clubs
    ON CONFLICT (id) DO NOTHING;

-- Удаление временной таблицы
DROP TABLE temp_clubs;

-- Создание временной таблицы для загрузки данных из CSV для computers
CREATE TEMP TABLE temp_computers (
    id INT,
    club_id INT,
    name VARCHAR(255),
    characteristics VARCHAR(255),
    created_at TIMESTAMP
);

-- Загрузка данных из CSV в временную таблицу для computers
COPY temp_computers(id, club_id, name, characteristics, created_at)
    FROM '/path/to/your/csv/computers.csv'
    DELIMITER ','
    CSV HEADER;

-- Вставка новых записей из временной таблицы в основную таблицу computers
INSERT INTO computers (id, club_id, name, characteristics, created_at)
SELECT id, club_id, name, characteristics, created_at
FROM temp_computers
    ON CONFLICT (id) DO NOTHING;

-- Удаление временной таблицы
DROP TABLE temp_computers;

-- Создание временной таблицы для загрузки данных из CSV для games
CREATE TEMP TABLE temp_games (
    id INT,
    computer_id INT,
    name VARCHAR(255),
    genre VARCHAR(255),
    description VARCHAR(255),
    created_at TIMESTAMP
);

-- Загрузка данных из CSV в временную таблицу для games
COPY temp_games(id, computer_id, name, genre, description, created_at)
    FROM '/path/to/your/csv/games.csv'
    DELIMITER ','
    CSV HEADER;

-- Вставка новых записей из временной таблицы в основную таблицу games
INSERT INTO games (id, computer_id, name, genre, description, created_at)
SELECT id, computer_id, name, genre, description, created_at
FROM temp_games
    ON CONFLICT (id) DO NOTHING;

-- Удаление временной таблицы
DROP TABLE temp_games;

-- Создание временной таблицы для загрузки данных из CSV для admin
CREATE TEMP TABLE temp_admin (
    id INT,
    user_id INT,
    created_at TIMESTAMP
);

-- Загрузка данных из CSV в временную таблицу для admin
COPY temp_admin(id, user_id, created_at)
    FROM '/path/to/your/csv/admin.csv'
    DELIMITER ','
    CSV HEADER;

-- Вставка новых записей из временной таблицы в основную таблицу admin
INSERT INTO admin (id, user_id, created_at)
SELECT id, user_id, created_at
FROM temp_admin
    ON CONFLICT (id) DO NOTHING;

-- Удаление временной таблицы
DROP TABLE temp_admin;

-- Создание временной таблицы для загрузки данных из CSV для admin_club
CREATE TEMP TABLE temp_admin_club (
    id INT,
    master_id INT,
    club_id INT,
    created_at TIMESTAMP
);

-- Загрузка данных из CSV в временную таблицу для admin_club
COPY temp_admin_club(id, master_id, club_id, created_at)
    FROM '/path/to/your/csv/admin_club.csv'
    DELIMITER ','
    CSV HEADER;

-- Вставка новых записей из временной таблицы в основную таблицу admin_club
INSERT INTO admin_club (id, master_id, club_id, created_at)
SELECT id, master_id, club_id, created_at
FROM temp_admin_club
    ON CONFLICT (id) DO NOTHING;

-- Удаление временной таблицы
DROP TABLE temp_admin_club;

-- Создание временной таблицы для загрузки данных из CSV для bookings
CREATE TEMP TABLE temp_bookings (
    id INT,
    user_id INT,
    computer_id INT,
    booking_date TIMESTAMP,
    status VARCHAR(255),
    created_at TIMESTAMP
);

-- Загрузка данных из CSV в временную таблицу для bookings
COPY temp_bookings(id, user_id, computer_id, booking_date, status, created_at)
    FROM '/path/to/your/csv/bookings.csv'
    DELIMITER ','
    CSV HEADER;

-- Вставка новых записей из временной таблицы в основную таблицу bookings
INSERT INTO bookings (id, user_id, computer_id, booking_date, status, created_at)
SELECT id, user_id, computer_id, booking_date, status, created_at
FROM temp_bookings
    ON CONFLICT (id) DO NOTHING;

-- Удаление временной таблицы
DROP TABLE temp_bookings;

-- Создание временной таблицы для загрузки данных из CSV для reviews
CREATE TEMP TABLE temp_reviews (
    id INT,
    user_id INT,
    club_id INT,
    rating INT,
    comment TEXT,
    created_at TIMESTAMP
);

-- Загрузка данных из CSV в временную таблицу для reviews
COPY temp_reviews(id, user_id, club_id, rating, comment, created_at)
    FROM '/path/to/your/csv/reviews.csv'
    DELIMITER ','
    CSV HEADER;

-- Вставка новых записей из временной таблицы в основную таблицу reviews
INSERT INTO reviews (id, user_id, club_id, rating, comment, created_at)
SELECT id, user_id, club_id, rating, comment, created_at
FROM temp_reviews
    ON CONFLICT (id) DO NOTHING;

-- Удаление временной таблицы
DROP TABLE temp_reviews;

-- Создание временной таблицы для загрузки данных из CSV для history
CREATE TEMP TABLE temp_history (
    id INT,
    club_id INT,
    admin_id INT,
    user_id INT,
    description TEXT,
    date_start TIMESTAMP,
    date_end TIMESTAMP,
    computer_id INT,
    status VARCHAR(255),
    created_at TIMESTAMP
);

-- Загрузка данных из CSV в временную таблицу для history
COPY temp_history(id, club_id, admin_id, user_id, description, date_start, date_end, computer_id, status, created_at)
    FROM '/path/to/your/csv/history.csv'
    DELIMITER ','
    CSV HEADER;

-- Вставка новых записей из временной таблицы в основную таблицу history
INSERT INTO history (id, club_id, admin_id, user_id, description, date_start, date_end, computer_id, status, created_at)
SELECT id, club_id, admin_id, user_id, description, date_start, date_end, computer_id, status, created_at
FROM temp_history
    ON CONFLICT (id) DO NOTHING;

-- Удаление временной таблицы
DROP TABLE temp_history;
