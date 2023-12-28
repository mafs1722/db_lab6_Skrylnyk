-- Видалити всі фільми в яких довжина більша за 150
DROP FUNCTION IF EXISTS delete_film_duration();
CREATE OR REPLACE FUNCTION delete_film_duration()
RETURNS VOID AS
$$
BEGIN
	DELETE FROM Actor
	WHERE MovieID_ IN (SELECT MovieID_ FROM Movies WHERE Duration >= 150);

    DELETE FROM Director
	WHERE MovieID_ IN (SELECT MovieID_ FROM Movies WHERE Duration >= 150);

    DELETE FROM Movies
    WHERE Duration >= 150;
END;
$$
LANGUAGE plpgsql;

-- Перевірка роботи функції
-- SELECT delete_film_duration() AS film_with_duration_less_150;
-- SELECT * FROM Movies;
-- SELECT * FROM Actor;
-- SELECT * FROM Director;