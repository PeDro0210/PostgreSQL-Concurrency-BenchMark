BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

INSERT INTO entradas (cliente_id, evento_id, area_id, fila_id, asiento_id, precio, cantidad, estado)
VALUES (15, 5, 1, 1, 250, 150.00, 1, 'reservada');

UPDATE asiento
SET disponible = FALSE
WHERE id = 250;

COMMIT;
-
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

INSERT INTO entradas (cliente_id, evento_id, area_id, fila_id, asiento_id, precio, cantidad, estado)
VALUES (15, 5, 1, 1, 250, 150.00, 1, 'reservada');

UPDATE asiento
SET disponible = FALSE
WHERE id = 250;

COMMIT;
-


