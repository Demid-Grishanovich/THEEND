-- Пример запросов для анализа данных

-- Количество бронирований по клубам
SELECT d.Name AS Club_Name, COUNT(f.Booking_Key) AS Booking_Count
FROM Fact_Bookings f
         JOIN Dim_Computers c ON f.Computer_Key = c.Computer_Key
         JOIN Dim_Clubs d ON c.Club_Key = d.Club_Key
GROUP BY d.Name
ORDER BY Booking_Count DESC;

-- Средний рейтинг клубов
SELECT d.Name AS Club_Name, AVG(r.Rating) AS Average_Rating
FROM Fact_Reviews r
         JOIN Dim_Clubs d ON r.Club_Key = d.Club_Key
GROUP BY d.Name
ORDER BY Average_Rating DESC;

-- Количество бронирований по пользователям
SELECT u.Name AS User_Name, COUNT(f.Booking_Key) AS Booking_Count
FROM Fact_Bookings f
         JOIN Dim_Users u ON f.User_Key = u.User_Surrogate_Key
GROUP BY u.Name
ORDER BY Booking_Count DESC;

-- Ежемесячные бронирования
SELECT d.Year, d.Month, COUNT(f.Booking_Key) AS Monthly_Bookings
FROM Fact_Bookings f
         JOIN Dim_Date d ON f.Date_Key = d.Date_Key
GROUP BY d.Year, d.Month
ORDER BY d.Year, d.Month;