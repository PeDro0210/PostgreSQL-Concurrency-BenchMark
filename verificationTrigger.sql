CREATE OR REPLACE FUNCTION check_asiento_disponible() RETURNS TRIGGER AS 
$$
BEGIN
    -- Verificar si el asiento está disponible
    IF EXISTS (
        SELECT 1
        FROM asiento
        WHERE id = NEW.asiento_id AND disponible = FALSE
    ) THEN
        RAISE EXCEPTION 'El asiento % no está disponible', NEW.asiento_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_asiento_disponible
BEFORE INSERT ON entradas
FOR EACH ROW
EXECUTE PROCEDURE check_asiento_disponible();