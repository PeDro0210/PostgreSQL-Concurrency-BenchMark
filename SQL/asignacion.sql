SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;

INSERT INTO entradas (cliente_id, evento_id, area_id, fila_id, asiento_id, precio, cantidad, estado)
VALUES (15, 5, 1, 1, 70, 150.00, 1, 'reservada');
UPDATE asiento
SET disponible = FALSE
WHERE id = 70;

COMMIT TRANSACTION;

