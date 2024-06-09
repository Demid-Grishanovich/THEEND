CREATE ROLE user_role;

CREATE ROLE admin_role;


-- Права на чтение данных
GRANT SELECT ON TABLE users TO user_role;
GRANT SELECT ON TABLE clubs TO user_role;
GRANT SELECT ON TABLE computers TO user_role;
GRANT SELECT ON TABLE games TO user_role;
GRANT SELECT ON TABLE reviews TO user_role;

-- Права на добавление и обновление данных
GRANT INSERT, UPDATE ON TABLE bookings TO user_role;
GRANT INSERT ON TABLE reviews TO user_role;

-- Права на выполнение функций и процедур
GRANT EXECUTE ON FUNCTION add_user(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, FLOAT) TO user_role;
GRANT EXECUTE ON FUNCTION book_computer(INT, INT, TIMESTAMP, VARCHAR) TO user_role;
GRANT EXECUTE ON FUNCTION add_review(INT, INT, INT, TEXT) TO user_role;

-- Ограничение прав на удаление данных
REVOKE DELETE ON ALL TABLES IN SCHEMA public FROM user_role;



-- Полные права на все таблицы
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_role;

-- Полные права на выполнение всех функций и процедур
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO admin_role;




-- Создание пользователя базы данных
CREATE USER normal_user WITH PASSWORD 'user_password';
CREATE USER admin_user WITH PASSWORD 'admin_password';

-- Назначение роли обычного пользователя
GRANT user_role TO normal_user;

-- Назначение роли администратора
GRANT admin_role TO admin_user;






-- Создание ролей
CREATE ROLE user_role;
CREATE ROLE admin_role;

-- Назначение прав на таблицы для роли пользователя
GRANT SELECT ON TABLE users TO user_role;
GRANT SELECT ON TABLE clubs TO user_role;
GRANT SELECT ON TABLE computers TO user_role;
GRANT SELECT ON TABLE games TO user_role;
GRANT SELECT ON TABLE reviews TO user_role;
GRANT INSERT, UPDATE ON TABLE bookings TO user_role;
GRANT INSERT ON TABLE reviews TO user_role;
GRANT EXECUTE ON FUNCTION add_user(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, FLOAT) TO user_role;
GRANT EXECUTE ON FUNCTION book_computer(INT, INT, TIMESTAMP, VARCHAR) TO user_role;
GRANT EXECUTE ON FUNCTION add_review(INT, INT, INT, TEXT) TO user_role;
REVOKE DELETE ON ALL TABLES IN SCHEMA public FROM user_role;

-- Назначение прав на таблицы для роли администратора
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_role;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO admin_role;

-- Создание пользователей базы данных и назначение им ролей
CREATE USER normal_user WITH PASSWORD 'user_password';
CREATE USER admin_user WITH PASSWORD 'admin_password';
GRANT user_role TO normal_user;
GRANT admin_role TO admin_user;
