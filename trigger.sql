-- Тригер, який придодаванні, оновлені або видаленні рядка з таблиці ProductionStudios
-- виводить повідомлення з інформацією про зміни.
CREATE OR REPLACE FUNCTION ProductionStudios_changes()
RETURNS TRIGGER AS
$$
BEGIN
    RAISE NOTICE 'Був модифікований запис в таблиці ProductionStudios. Попереднє ім''я: %, Нове ім''я: %', OLD.StudioName, NEW.StudioName;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- DROP TRIGGER IF EXISTS ProductionStudios_changes ON ProductionStudios;

CREATE TRIGGER ProductionStudios_changes
AFTER INSERT OR UPDATE OR DELETE
ON ProductionStudios
FOR EACH ROW
EXECUTE FUNCTION ProductionStudios_changes();

-- Перевірка роботи тригера
INSERT INTO ProductionStudios (StudioID, StudioName, Country, YearFounded) VALUES (12, 'Studio Anna', 'Switzerland', '2002-12-22');
SELECT * FROM ProductionStudios;
delete from ProductionStudios
where StudioID = 12;