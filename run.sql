-- Виклик функції
SELECT delete_film_duration() AS film_with_duration_less_150;
SELECT * FROM Movies;
SELECT * FROM Actor;
SELECT * FROM Director;

-- Виклик процедури
CALL add_ProductionStudios(11, 'Anna Studio', 'Switzerland', '2002-12-22');
SELECT * FROM ProductionStudios;
delete from ProductionStudios
where StudioID = 11;

-- Перевірка роботи тригера
INSERT INTO ProductionStudios (StudioID, StudioName, Country, YearFounded) VALUES (12, 'Studio Anna', 'Switzerland', '2002-12-22');
SELECT * FROM ProductionStudios;
delete from ProductionStudios
where StudioID = 12;