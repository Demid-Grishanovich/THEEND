INSERT INTO users (name, email, password, city, tags, rating, created_at)
VALUES ('John Doe', 'john@example.com', 'password123', 'New York', 'tag1,tag2', 4.5, NOW());

UPDATE users
SET name = 'Jane Doe', city = 'Los Angeles', rating = 5.0
WHERE id = 1;


DELETE FROM users
WHERE id = 1;


SELECT * FROM users;


INSERT INTO clubs (name, country, city, address, tags, rating, default_admin, working_hours, created_at)
VALUES ('Cyber Club', 'USA', 'San Francisco', '123 Main St', 'cyber,gaming', 4.8, 'admin123', '10:00-22:00', NOW());


UPDATE clubs
SET address = '456 New Address', rating = 4.9
WHERE id = 1;


DELETE FROM clubs
WHERE id = 1;


SELECT * FROM clubs;


INSERT INTO computers (club_id, name, characteristics, created_at)
VALUES (1, 'Gaming PC 1', 'Intel i9, 32GB RAM, RTX 3080', NOW());


UPDATE computers
SET characteristics = 'Intel i9, 64GB RAM, RTX 3090'
WHERE id = 1;


DELETE FROM computers
WHERE id = 1;


SELECT * FROM computers
WHERE club_id = 1;


INSERT INTO bookings (user_id, computer_id, booking_date, status, created_at)
VALUES (1, 1, '2024-06-10 14:00:00', 'active', NOW());


UPDATE bookings
SET status = 'completed'
WHERE id = 1;


DELETE FROM bookings
WHERE id = 1;


SELECT * FROM bookings
WHERE user_id = 1;


INSERT INTO games (computer_id, name, genre, description, created_at)
VALUES (1, 'Cyberpunk 2077', 'RPG', 'Open-world RPG set in a dystopian future', NOW());


UPDATE games
SET description = 'Open-world RPG set in a dystopian future, with Keanu Reeves'
WHERE id = 1;


DELETE FROM games
WHERE id = 1;


SELECT * FROM games
WHERE computer_id = 1;


INSERT INTO reviews (user_id, club_id, rating, created_at)
VALUES (1, 1, 5, NOW());



UPDATE reviews
SET rating = 4
WHERE id = 1;


DELETE FROM reviews
WHERE id = 1;


SELECT * FROM reviews
WHERE user_id = 1;


INSERT INTO admin (user_id, created_at)
VALUES (1, NOW());


DELETE FROM admin
WHERE id = 1;


SELECT * FROM admin
WHERE user_id = 1;



INSERT INTO admin_club (master_id, club_id, created_at)
VALUES (1, 1, NOW());


DELETE FROM admin_club
WHERE id = 1;


SELECT * FROM admin_club
WHERE master_id = 1;


INSERT INTO history (club_id, admin_id, user_id, computer_id, date_start, date_end, status, created_at)
VALUES (1, 1, 1, 1, '2024-06-10 14:00:00', '2024-06-10 16:00:00', 'active', NOW());



UPDATE history
SET status = 'completed'
WHERE id = 1;


DELETE FROM history
WHERE id = 1;


SELECT * FROM history
WHERE club_id = 1;
