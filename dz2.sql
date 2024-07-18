DELIMITER //

CREATE FUNCTION get_even_numbers(start INT, end INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255) DEFAULT '';
    DECLARE i INT;

    SET i = start;
    WHILE i <= end DO
        IF i % 2 = 0 THEN
            SET result = CONCAT(result, i, ',');
        END IF;
        SET i = i + 1;
    END WHILE;
    
-- Удаление запятой в конеце
    IF RIGHT(result, 1) = ',' THEN
        SET result = LEFT(result, LENGTH(result) - 1);
    END IF;

    RETURN result;
END //

DELIMITER ;

SELECT get_even_numbers(1, 10) AS even_numbers;
