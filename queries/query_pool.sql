BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

INSERT INTO entradas (cliente_id, evento_id, area_id, fila_id, asiento_id, precio, cantidad, estado)
VALUES (15, 5, 1, 1, 4, 150.00, 1, 'reservada');

UPDATE asiento
SET disponible = FALSE
WHERE id = 4;

COMMIT;

-
