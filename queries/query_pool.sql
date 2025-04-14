BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

with client AS (
  INSERT INTO cliente (nombre, apellido, email, telefono) 
  VALUES ('Pegdro', 'Vega', 'carolina.vega@example.com', '2930313233')
  RETURNING id
)

INSERT INTO entradas (cliente_id, evento_id, area_id, fila_id, asiento_id, precio, cantidad, estado)
SELECT id, 5, 1, 1, 222, 150.00, 1, 'reservada'
FROM client;

UPDATE asiento
SET disponible = FALSE
WHERE id = 222;


COMMIT;
-

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

with client AS (
  INSERT INTO cliente (nombre, apellido, email, telefono) 
  VALUES ('Pegdro', 'Vega', 'carolina.vega@example.com', '2930313233')
  RETURNING id
)

INSERT INTO entradas (cliente_id, evento_id, area_id, fila_id, asiento_id, precio, cantidad, estado)
SELECT id, 5, 1, 1, 223, 150.00, 1, 'reservada'
FROM client;

UPDATE asiento
SET disponible = FALSE
WHERE id = 223;


COMMIT;
-

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

with client AS (
  INSERT INTO cliente (nombre, apellido, email, telefono) 
  VALUES ('Pegdro', 'Vega', 'carolina.vega@example.com', '2930313233')
  RETURNING id
)

INSERT INTO entradas (cliente_id, evento_id, area_id, fila_id, asiento_id, precio, cantidad, estado)
SELECT id, 5, 1, 1, 225, 150.00, 1, 'reservada'
FROM client;

UPDATE asiento
SET disponible = FALSE
WHERE id = 225;


COMMIT;
-
