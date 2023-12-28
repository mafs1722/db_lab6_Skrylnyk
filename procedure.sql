-- Процедура, яка додає в таблицю ProductionStudios новий рядок з аргументами
CREATE OR REPLACE PROCEDURE add_ProductionStudios(
    IN new_StudioID INT,
    IN new_StudioName VARCHAR(200),
    IN new_Country VARCHAR(200),
    IN new_YearFounded DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM ProductionStudios WHERE StudioName = new_StudioName) THEN
        IF EXISTS (SELECT 1 FROM ProductionStudios WHERE StudioID = new_StudioID) THEN
            RAISE NOTICE 'Студія з id % вже існує. Згенеровано новий доступний id.', new_StudioID;
            new_StudioID := (SELECT COALESCE(MAX(StudioID), 0) + 1 FROM ProductionStudios);
    	    END IF;

    	    INSERT INTO ProductionStudios (StudioID, StudioName, Country, YearFounded)
    	    VALUES (new_StudioID, new_StudioName, new_Country, new_YearFounded);
    ELSE
        RAISE NOTICE 'Студія з назвою % вже існує. Дані не були додані.', new_StudioName;
    END IF;
END;
$$;

CALL add_ProductionStudios(11, 'Anna Studio', 'Switzerland', '2002-12-22');
-- SELECT * FROM ProductionStudios;
-- delete from ProductionStudios
-- where StudioID = 11;