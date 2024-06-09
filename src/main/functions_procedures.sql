CREATE OR REPLACE FUNCTION add_user(
    p_name VARCHAR,
    p_email VARCHAR,
    p_password VARCHAR,
    p_city VARCHAR,
    p_tags VARCHAR,
    p_rating FLOAT
) RETURNS VOID AS $$
BEGIN
INSERT INTO users (name, email, password, city, tags, rating, created_at)
VALUES (p_name, p_email, p_password, p_city, p_tags, p_rating, NOW());
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE update_user(
    p_id INT,
    p_name VARCHAR,
    p_city VARCHAR,
    p_rating FLOAT
) LANGUAGE plpgsql AS $$
BEGIN
UPDATE users
SET name = p_name, city = p_city, rating = p_rating
WHERE id = p_id;
END;
$$;



CREATE OR REPLACE PROCEDURE delete_user(p_id INT) LANGUAGE plpgsql AS $$
BEGIN
DELETE FROM users
WHERE id = p_id;
END;
$$;



CREATE OR REPLACE FUNCTION add_club(
    p_name VARCHAR,
    p_country VARCHAR,
    p_city VARCHAR,
    p_address VARCHAR,
    p_tags VARCHAR,
    p_rating FLOAT,
    p_default_admin VARCHAR,
    p_working_hours VARCHAR
) RETURNS VOID AS $$
BEGIN
INSERT INTO clubs (name, country, city, address, tags, rating, default_admin, working_hours, created_at)
VALUES (p_name, p_country, p_city, p_address, p_tags, p_rating, p_default_admin, p_working_hours, NOW());
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE PROCEDURE update_club(
    p_id INT,
    p_address VARCHAR,
    p_rating FLOAT
) LANGUAGE plpgsql AS $$
BEGIN
UPDATE clubs
SET address = p_address, rating = p_rating
WHERE id = p_id;
END;
$$;



CREATE OR REPLACE PROCEDURE delete_club(p_id INT) LANGUAGE plpgsql AS $$
BEGIN
DELETE FROM clubs
WHERE id = p_id;
END;
$$;



CREATE OR REPLACE FUNCTION add_computer(
    p_club_id INT,
    p_name VARCHAR,
    p_characteristics VARCHAR
) RETURNS VOID AS $$
BEGIN
INSERT INTO computers (club_id, name, characteristics, created_at)
VALUES (p_club_id, p_name, p_characteristics, NOW());
END;
$$ LANGUAGE plpgsql;




CREATE OR REPLACE PROCEDURE update_computer(
    p_id INT,
    p_characteristics VARCHAR
) LANGUAGE plpgsql AS $$
BEGIN
UPDATE computers
SET characteristics = p_characteristics
WHERE id = p_id;
END;
$$;




CREATE OR REPLACE PROCEDURE delete_computer(p_id INT) LANGUAGE plpgsql AS $$
BEGIN
DELETE FROM computers
WHERE id = p_id;
END;
$$;




CREATE OR REPLACE FUNCTION book_computer(
    p_user_id INT,
    p_computer_id INT,
    p_booking_date TIMESTAMP,
    p_status VARCHAR
) RETURNS VOID AS $$
BEGIN
INSERT INTO bookings (user_id, computer_id, booking_date, status, created_at)
VALUES (p_user_id, p_computer_id, p_booking_date, p_status, NOW());
END;
$$ LANGUAGE plpgsql;






CREATE OR REPLACE PROCEDURE update_booking_status(
    p_id INT,
    p_status VARCHAR
) LANGUAGE plpgsql AS $$
BEGIN
UPDATE bookings
SET status = p_status
WHERE id = p_id;
END;
$$;





CREATE OR REPLACE PROCEDURE delete_booking(p_id INT) LANGUAGE plpgsql AS $$
BEGIN
DELETE FROM bookings
WHERE id = p_id;
END;
$$;




CREATE OR REPLACE FUNCTION add_review(
    p_user_id INT,
    p_club_id INT,
    p_rating INT,
    p_comment TEXT
) RETURNS VOID AS $$
BEGIN
INSERT INTO reviews (user_id, club_id, rating, comment, created_at)
VALUES (p_user_id, p_club_id, p_rating, p_comment, NOW());
END;
$$ LANGUAGE plpgsql;





CREATE OR REPLACE PROCEDURE update_review(
    p_id INT,
    p_rating INT,
    p_comment TEXT
) LANGUAGE plpgsql AS $$
BEGIN
UPDATE reviews
SET rating = p_rating, comment = p_comment
WHERE id = p_id;
END;
$$;





CREATE OR REPLACE PROCEDURE delete_review(p_id INT) LANGUAGE plpgsql AS $$
BEGIN
DELETE FROM reviews
WHERE id = p_id;
END;
$$;




