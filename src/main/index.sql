-- Индексы для таблицы users
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_city ON users(city);
CREATE INDEX idx_users_rating ON users(rating);

-- Индексы для таблицы clubs
CREATE INDEX idx_clubs_country ON clubs(country);
CREATE INDEX idx_clubs_city ON clubs(city);
CREATE INDEX idx_clubs_rating ON clubs(rating);

-- Индексы для таблицы computers
CREATE INDEX idx_computers_club_id ON computers(club_id);
CREATE INDEX idx_computers_name ON computers(name);

-- Индексы для таблицы games
CREATE INDEX idx_games_computer_id ON games(computer_id);
CREATE INDEX idx_games_name ON games(name);
CREATE INDEX idx_games_genre ON games(genre);

-- Индексы для таблицы admin
CREATE INDEX idx_admin_user_id ON admin(user_id);

-- Индексы для таблицы admin_club
CREATE INDEX idx_admin_club_master_id ON admin_club(master_id);
CREATE INDEX idx_admin_club_club_id ON admin_club(club_id);

-- Индексы для таблицы bookings
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_computer_id ON bookings(computer_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Индексы для таблицы reviews
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_reviews_club_id ON reviews(club_id);
CREATE INDEX idx_reviews_rating ON reviews(rating);

-- Индексы для таблицы history
CREATE INDEX idx_history_club_id ON history(club_id);
CREATE INDEX idx_history_admin_id ON history(admin_id);
CREATE INDEX idx_history_user_id ON history(user_id);
CREATE INDEX idx_history_computer_id ON history(computer_id);
CREATE INDEX idx_history_date_start ON history(date_start);
CREATE INDEX idx_history_date_end ON history(date_end);
CREATE INDEX idx_history_status ON history(status);
