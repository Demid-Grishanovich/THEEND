-- Загрузка данных в таблицу users
COPY users(id, name, email, password, city, tags, rating, created_at)
    FROM 'E:\Univer\Curs3\BD\THEEND\THEEND\src\main\Files_CSV\users.csv'
    DELIMITER ','
    CSV HEADER;

-- Загрузка данных в таблицу clubs
COPY clubs(id, name, country, city, address, tags, rating, default_admin, working_hours, created_at)
    FROM '/path/to/your/csv/clubs.csv'
    DELIMITER ','
    CSV HEADER;

-- Загрузка данных в таблицу computers
COPY computers(id, club_id, name, characteristics, created_at)
    FROM '/path/to/your/csv/computers.csv'
    DELIMITER ','
    CSV HEADER;

-- Загрузка данных в таблицу games
COPY games(id, computer_id, name, genre, description, created_at)
    FROM '/path/to/your/csv/games.csv'
    DELIMITER ','
    CSV HEADER;

-- Загрузка данных в таблицу admin
COPY admin(id, user_id, created_at)
    FROM '/path/to/your/csv/admin.csv'
    DELIMITER ','
    CSV HEADER;

-- Загрузка данных в таблицу admin_club
COPY admin_club(id, master_id, club_id, created_at)
    FROM '/path/to/your/csv/admin_club.csv'
    DELIMITER ','
    CSV HEADER;

-- Загрузка данных в таблицу bookings
COPY bookings(id, user_id, computer_id, booking_date, status, created_at)
    FROM '/path/to/your/csv/bookings.csv'
    DELIMITER ','
    CSV HEADER;

-- Загрузка данных в таблицу reviews
COPY reviews(id, user_id, club_id, rating, comment, created_at)
    FROM '/path/to/your/csv/reviews.csv'
    DELIMITER ','
    CSV HEADER;

-- Загрузка данных в таблицу history
COPY history(id, club_id, admin_id, user_id, description, date_start, date_end, computer_id, status, created_at)
    FROM '/path/to/your/csv/history.csv'
    DELIMITER ','
    CSV HEADER;
