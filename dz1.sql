DELIMITER //

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    
    SET days = FLOOR(seconds / 86400);
    SET seconds = seconds % 86400;
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET secs = seconds % 60;
    
    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');
END //

DELIMITER ;

SELECT format_seconds(123456) AS formatted_time;

