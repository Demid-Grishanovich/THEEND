-- ETL процесс для обновления данных в таблицах измерений и фактов

-- Обновление Dim_Users (SCD Type 2)
WITH New_Data AS (
    SELECT id, name, email, city, tags, rating, NOW() AS Effective_Date, '9999-12-31'::TIMESTAMP AS Expiration_Date, TRUE AS Is_Current
    FROM users
),
     Expired_Data AS (
UPDATE Dim_Users
SET Expiration_Date = NOW(), Is_Current = FALSE
WHERE User_Natural_Key IN (SELECT id FROM New_Data)
  AND Is_Current = TRUE
    RETURNING *
)
INSERT INTO Dim_Users (User_Natural_Key, Name, Email, City, Tags, Rating, Effective_Date, Expiration_Date, Is_Current)
SELECT id, name, email, city, tags, rating, Effective_Date, Expiration_Date, Is_Current
FROM New_Data
    ON CONFLICT (User_Natural_Key, Is_Current) DO NOTHING;

-- Обновление Dim_Clubs
INSERT INTO Dim_Clubs (Club_Natural_Key, Name, Country, City, Address, Tags, Rating)
SELECT id, name, country, city, address, tags, rating
FROM clubs
    ON CONFLICT (Club_Natural_Key) DO NOTHING;

-- Обновление Dim_Computers
INSERT INTO Dim_Computers (Computer_Natural_Key, Club_Key, Name, Characteristics)
SELECT c.id, d.Club_Key, c.name, c.characteristics
FROM computers c
         JOIN Dim_Clubs d ON c.club_id = d.Club_Natural_Key
    ON CONFLICT (Computer_Natural_Key) DO NOTHING;

-- Обновление Dim_Date (пример)
INSERT INTO Dim_Date (Full_Date, Year, Quarter, Month, Day, Day_of_Week, Week_of_Year)
VALUES
    ('2024-06-01', 2024, 2, 6, 1, 7, 22),
    ('2024-06-02', 2024, 2, 6, 2, 1, 23),
    ('2024-06-03', 2024, 2, 6, 3, 2, 23)
    ON CONFLICT (Full_Date) DO NOTHING;

-- Обновление Fact_Bookings
INSERT INTO Fact_Bookings (User_Key, Computer_Key, Date_Key, Booking_Date, Status)
SELECT u.User_Surrogate_Key, c.Computer_Key, d.Date_Key, b.booking_date, b.status
FROM bookings b
         JOIN Dim_Users u ON b.user_id = u.User_Natural_Key
         JOIN Dim_Computers c ON b.computer_id = c.Computer_Natural_Key
         JOIN Dim_Date d ON DATE(b.booking_date) = d.Full_Date
ON CONFLICT DO NOTHING;

-- Обновление Fact_Reviews
INSERT INTO Fact_Reviews (User_Key, Club_Key, Date_Key, Rating, Comment)
SELECT u.User_Surrogate_Key, c.Club_Key, d.Date_Key, r.rating, r.comment
FROM reviews r
         JOIN Dim_Users u ON r.user_id = u.User_Natural_Key
         JOIN Dim_Clubs c ON r.club_id = c.Club_Natural_Key
         JOIN Dim_Date d ON DATE(r.created_at) = d.Full_Date
ON CONFLICT DO NOTHING;
