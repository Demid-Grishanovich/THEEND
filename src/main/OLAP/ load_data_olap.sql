-- Dim_Users
INSERT INTO Dim_Users (User_Natural_Key, Name, Email, City, Tags, Rating, Effective_Date, Expiration_Date, Is_Current)
SELECT id, name, email, city, tags, rating, NOW(), '9999-12-31', TRUE
FROM users
    ON CONFLICT (User_Natural_Key, Is_Current) DO NOTHING;

-- Dim_Clubs
INSERT INTO Dim_Clubs (Club_Natural_Key, Name, Country, City, Address, Tags, Rating)
SELECT id, name, country, city, address, tags, rating
FROM clubs
    ON CONFLICT (Club_Natural_Key) DO NOTHING;

-- Dim_Computers
INSERT INTO Dim_Computers (Computer_Natural_Key, Club_Key, Name, Characteristics)
SELECT c.id, d.Club_Key, c.name, c.characteristics
FROM computers c
         JOIN Dim_Clubs d ON c.club_id = d.Club_Natural_Key
    ON CONFLICT (Computer_Natural_Key) DO NOTHING;

-- Dim_Date
INSERT INTO Dim_Date (Full_Date, Year, Quarter, Month, Day, Day_of_Week, Week_of_Year)
VALUES
    ('2024-06-01', 2024, 2, 6, 1, 7, 22),
    ('2024-06-02', 2024, 2, 6, 2, 1, 23),
    ('2024-06-03', 2024, 2, 6, 3, 2, 23),
    ('2024-06-04', 2024, 2, 6, 4, 3, 23),
    ('2024-06-05', 2024, 2, 6, 5, 4, 23),
    ('2024-06-06', 2024, 2, 6, 6, 5, 23),
    ('2024-06-07', 2024, 2, 6, 7, 6, 23),
    ('2024-06-08', 2024, 2, 6, 8, 7, 23),
    ('2024-06-09', 2024, 2, 6, 9, 1, 24),
    ('2024-06-10', 2024, 2, 6, 10, 2, 24),
    ('2024-06-11', 2024, 2, 6, 11, 3, 24),
    ('2024-06-12', 2024, 2, 6, 12, 4, 24),
    ('2024-06-13', 2024, 2, 6, 13, 5, 24),
    ('2024-06-14', 2024, 2, 6, 14, 6, 24),
    ('2024-06-15', 2024, 2, 6, 15, 7, 24),
    ('2024-06-16', 2024, 2, 6, 16, 1, 25),
    ('2024-06-17', 2024, 2, 6, 17, 2, 25),
    ('2024-06-18', 2024, 2, 6, 18, 3, 25),
    ('2024-06-19', 2024, 2, 6, 19, 4, 25),
    ('2024-06-20', 2024, 2, 6, 20, 5, 25),
    ('2024-06-21', 2024, 2, 6, 21, 6, 25),
    ('2024-06-22', 2024, 2, 6, 22, 7, 25),
    ('2024-06-23', 2024, 2, 6, 23, 1, 26),
    ('2024-06-24', 2024, 2, 6, 24, 2, 26),
    ('2024-06-25', 2024, 2, 6, 25, 3, 26),
    ('2024-06-26', 2024, 2, 6, 26, 4, 26),
    ('2024-06-27', 2024, 2, 6, 27, 5, 26),
    ('2024-06-28', 2024, 2, 6, 28, 6, 26),
    ('2024-06-29', 2024, 2, 6, 29, 7, 26),
    ('2024-06-30', 2024, 2, 6, 30, 1, 27)
    ON CONFLICT (Full_Date) DO NOTHING;

-- Загрузка данных в таблицы фактов

-- Fact_Bookings
INSERT INTO Fact_Bookings (User_Key, Computer_Key, Date_Key, Booking_Date, Status)
SELECT u.User_Surrogate_Key, c.Computer_Key, d.Date_Key, b.booking_date, b.status
FROM bookings b
         JOIN Dim_Users u ON b.user_id = u.User_Natural_Key
         JOIN Dim_Computers c ON b.computer_id = c.Computer_Natural_Key
         JOIN Dim_Date d ON DATE(b.booking_date) = d.Full_Date;

-- Fact_Reviews
INSERT INTO Fact_Reviews (User_Key, Club_Key, Date_Key, Rating, Comment)
SELECT u.User_Surrogate_Key, c.Club_Key, d.Date_Key, r.rating, r.comment
FROM reviews r
         JOIN Dim_Users u ON r.user_id = u.User_Natural_Key
         JOIN Dim_Clubs c ON r.club_id = c.Club_Natural_Key
         JOIN Dim_Date d ON DATE(r.created_at) = d.Full_Date;
