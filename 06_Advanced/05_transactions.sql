DELIMITER $$

CREATE PROCEDURE updateUser()
BEGIN
    DECLARE valid INT DEFAULT 0;

    START TRANSACTION;

    -- Insertar un usuario
    INSERT INTO users (name, email) VALUES ('John Doe', 'john@gmail.com');

    -- Actualizar el usuario insertado
    UPDATE users SET name = 'Jane Doe', email = 'jane@gmail.com' WHERE name = 'John Doe';

    -- Verificar si la actualización fue exitosa
    SELECT COUNT(*) INTO valid FROM users WHERE name = 'Jane Doe' AND email = 'jane@gmail.com';

    -- Decidir si se confirman los cambios o se revierten
    IF valid > 0 THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END $$

DELIMITER ;

CALL updateUser();
