
INSERT INTO cliente (nombre, apellido, email, telefono) VALUES
('Juan', 'Perez', 'juan.perez@example.com', '1234567890'),
('Maria', 'Lopez', 'maria.lopez@example.com', '0987654321'),
('Carlos', 'Gomez', 'carlos.gomez@example.com', '1122334455'),
('Ana', 'Martinez', 'ana.martinez@example.com', '2233445566'),
('Luis', 'Hernandez', 'luis.hernandez@example.com', '3344556677'),
('Sofia', 'Garcia', 'sofia.garcia@example.com', '4455667788'),
('Miguel', 'Rodriguez', 'miguel.rodriguez@example.com', '5566778899'),
('Laura', 'Fernandez', 'laura.fernandez@example.com', '6677889900'),
('Jorge', 'Diaz', 'jorge.diaz@example.com', '7788990011'),
('Elena', 'Morales', 'elena.morales@example.com', '8899001122'),
('Ricardo', 'Vargas', 'ricardo.vargas@example.com', '9900112233'),
('Gabriela', 'Castro', 'gabriela.castro@example.com', '1011121314'),
('Fernando', 'Ramos', 'fernando.ramos@example.com', '1213141516'),
('Isabel', 'Ortiz', 'isabel.ortiz@example.com', '1314151617'),
('Diego', 'Mendoza', 'diego.mendoza@example.com', '1415161718'),
('Valeria', 'Ruiz', 'valeria.ruiz@example.com', '1516171819'),
('Oscar', 'Chavez', 'oscar.chavez@example.com', '1617181920'),
('Camila', 'Silva', 'camila.silva@example.com', '1718192021'),
('Andres', 'Torres', 'andres.torres@example.com', '1819202122'),
('Paula', 'Flores', 'paula.flores@example.com', '1920212223'),
('Hector', 'Sanchez', 'hector.sanchez@example.com', '2021222324'),
('Diana', 'Rojas', 'diana.rojas@example.com', '2122232425'),
('Sebastian', 'Guerrero', 'sebastian.guerrero@example.com', '2223242526'),
('Claudia', 'Cruz', 'claudia.cruz@example.com', '2324252627'),
('Eduardo', 'Pena', 'eduardo.pena@example.com', '2425262728'),
('Monica', 'Salazar', 'monica.salazar@example.com', '2526272829'),
('Pablo', 'Navarro', 'pablo.navarro@example.com', '2627282930'),
('Lucia', 'Mejia', 'lucia.mejia@example.com', '2728293031'),
('Rafael', 'Campos', 'rafael.campos@example.com', '2829303132'),
('Carolina', 'Vega', 'carolina.vega@example.com', '2930313233');

INSERT INTO evento_general (nombre, tipo_evento, descripcion) VALUES
('Post Malone', 'concierto', 'Un gran concierto de Post Malon Hip-Hop/Rap.'),
('Miami Dolphins vs Buffalo Bills', 'futbol', 'Un emocionante partido de futbol entre dos grandes equipos.'),
('Jazz Festival', 'festival', 'Un festival de jazz con artistas reconocidos.'),
('Ghost of the opera', 'teatro', 'Una obra de teatro aclamada por la crítica.'),
('Mayhem Ball Tour', 'concierto', 'Un concierto de pop con artistas famosos.'),
('Partido de Baloncesto', 'baloncesto', 'Un emocionante partido de baloncesto entre dos grandes equipos.'),
('CinemaCon 2024', 'festival', 'Un festival de cine con proyecciones y charlas.');

INSERT INTO estadio (nombre, direccion, capacidad, ciudad, pais) VALUES
('Wembley Stadium', 'Wembley, London HA9 0WS', 90000, 'London', 'United Kingdom'),
('Camp Nou', 'C. d''Arístides Maillol, 12, 08028', 99354, 'Barcelona', 'Spain'),
('MetLife Stadium', '1 MetLife Stadium Dr, East Rutherford, NJ 07073', 82500, 'East Rutherford', 'United States'),
('Maracanã', 'Av. Pres. Castelo Branco, Portão 3 - Maracanã', 78838, 'Rio de Janeiro', 'Brazil'),
('Allianz Arena', 'Werner-Heisenberg-Allee 25, 80939', 75000, 'Munich', 'Germany'),
('Estadio Azteca', 'Calz. de Tlalpan 3465, Sta. Úrsula Coapa', 87000, 'Mexico City', 'Mexico'),
('Hard Rock Stadium', '347 Don Shula Dr, Miami Gardens, FL 33056', 65326, 'Miami', 'United States'),
('Lusail Iconic Stadium', 'Lusail City', 88966, 'Lusail', 'Qatar'),
('Rose Bowl', '1001 Rose Bowl Dr, Pasadena, CA 91103', 92542, 'Pasadena', 'United States'),
('Parc des Princes', '24 Rue du Commandant Guilbaud, 75016', 47929, 'Paris', 'France');

INSERT INTO parqueo (nombre, direccion, capacidad, precio, estadio_id) VALUES
('Wembley Parking', 'Wembley, London HA9 0WS', 5000, 15.00, 1),
('Camp Nou Parking', 'C. d''Arístides Maillol, 12, 08028', 6000, 12.50, 2),
('MetLife Parking', '1 MetLife Stadium Dr, East Rutherford, NJ 07073', 7000, 20.00, 3),
('Maracanã Parking', 'Av. Pres. Castelo Branco, Portão 3 - Maracanã', 4500, 10.00, 4),
('Allianz Arena Parking', 'Werner-Heisenberg-Allee 25, 80939', 5500, 18.00, 5),
('Estadio Azteca Parking', 'Calz. de Tlalpan 3465, Sta. Úrsula Coapa', 8000, 8.00, 6),
('Hard Rock Parking', '347 Don Shula Dr, Miami Gardens, FL 33056', 4000, 25.00, 7),
('Lusail Parking', 'Lusail City', 6000, 30.00, 8),
('Rose Bowl Parking', '1001 Rose Bowl Dr, Pasadena, CA 91103', 5000, 22.00, 9),
('Parc des Princes Parking', '24 Rue du Commandant Guilbaud, 75016', 3000, 14.00, 10);


INSERT INTO evento (evento_general_id, fecha, hora_inicio, hora_fin, estadio_id, reglas_entrada) VALUES
(1, '2023-12-15', '19:00:00', '22:00:00', 1, 'No se permite el ingreso con bebidas alcohólicas.'),
(2, '2023-12-20', '18:30:00', '21:00:00', 3, 'Prohibido el ingreso con objetos punzocortantes.'),
(3, '2024-01-10', '17:00:00', '23:00:00', 5, 'Se permite el ingreso con cámaras fotográficas.'),
(4, '2024-01-25', '20:00:00', '22:30:00', 4, 'No se permite el ingreso con alimentos.'),
(5, '2024-02-05', '19:30:00', '22:00:00', 6, 'Prohibido el ingreso con mascotas.'),
(6, '2024-02-15', '18:00:00', '20:30:00', 2, 'Se permite el ingreso con banderas sin astas.'),
(7, '2024-03-01', '16:00:00', '21:00:00', 7, 'No se permite el ingreso con paraguas.'),
(1, '2024-03-10', '19:00:00', '22:00:00', 8, 'Prohibido el ingreso con mochilas grandes.'),
(3, '2024-03-20', '17:30:00', '23:00:00', 9, 'Se permite el ingreso con sombreros.'),
(4, '2024-04-05', '20:00:00', '22:30:00', 10, 'No se permite el ingreso con cámaras profesionales.'),
(5, '2024-04-15', '19:30:00', '22:00:00', 1, 'Prohibido el ingreso con bebidas embotelladas.'),
(6, '2024-04-25', '18:00:00', '20:30:00', 3, 'Se permite el ingreso con pancartas pequeñas.');


INSERT INTO area (nombre, precio_area, seccion, estadio_id) VALUES
-- Wembley Stadium
('Club Wembley', 150.00, 'VIP', 1),
('North Stand', 50.00, 'Norte', 1),
('South Stand', 50.00, 'Sur', 1),
('East Stand', 75.00, 'Este', 1),
('West Stand', 75.00, 'Oeste', 1),

-- Camp Nou
('Tribuna VIP', 200.00, 'VIP', 2),
('Gol Nord', 60.00, 'Norte', 2),
('Gol Sud', 60.00, 'Sur', 2),
('Lateral Este', 80.00, 'Este', 2),
('Lateral Oeste', 80.00, 'Oeste', 2),

-- MetLife Stadium
('MetLife Suites', 250.00, 'VIP', 3),
('Upper North', 40.00, 'Norte', 3),
('Upper South', 40.00, 'Sur', 3),
('Lower East', 90.00, 'Este', 3),
('Lower West', 90.00, 'Oeste', 3),

-- Maracanã
('Camarote VIP', 180.00, 'VIP', 4),
('Arquibancada Norte', 55.00, 'Norte', 4),
('Arquibancada Sul', 55.00, 'Sur', 4),
('Lado Leste', 70.00, 'Este', 4),
('Lado Oeste', 70.00, 'Oeste', 4),

-- Allianz Arena
('Allianz Lounge', 220.00, 'VIP', 5),
('Curva Norte', 65.00, 'Norte', 5),
('Curva Sur', 65.00, 'Sur', 5),
('Tribuna Este', 85.00, 'Este', 5),
('Tribuna Oeste', 85.00, 'Oeste', 5),

-- Estadio Azteca
('Palco Presidencial', 300.00, 'VIP', 6),
('Cabecera Norte', 50.00, 'Norte', 6),
('Cabecera Sur', 50.00, 'Sur', 6),
('Preferente Este', 70.00, 'Este', 6),
('Preferente Oeste', 70.00, 'Oeste', 6),

-- Hard Rock Stadium
('Hard Rock VIP', 240.00, 'VIP', 7),
('North Terrace', 45.00, 'Norte', 7),
('South Terrace', 45.00, 'Sur', 7),
('East Club', 100.00, 'Este', 7),
('West Club', 100.00, 'Oeste', 7),

-- Lusail Iconic Stadium
('Royal Box', 350.00, 'VIP', 8),
('North Gallery', 70.00, 'Norte', 8),
('South Gallery', 70.00, 'Sur', 8),
('East Pavilion', 120.00, 'Este', 8),
('West Pavilion', 120.00, 'Oeste', 8),

-- Rose Bowl
('Rose VIP', 260.00, 'VIP', 9),
('North Bowl', 55.00, 'Norte', 9),
('South Bowl', 55.00, 'Sur', 9),
('East Grandstand', 95.00, 'Este', 9),
('West Grandstand', 95.00, 'Oeste', 9),

-- Parc des Princes
('Prince Lounge', 210.00, 'VIP', 10),
('Virage Auteuil', 60.00, 'Norte', 10),
('Virage Boulogne', 60.00, 'Sur', 10),
('Tribune Paris', 85.00, 'Este', 10),
('Tribune Boulogne', 85.00, 'Oeste', 10);

INSERT INTO fila (numero, area_id) VALUES
-- Wembley Stadium
(1, 1), (2, 1), (3, 1),
(1, 2), (2, 2), (3, 2),
(1, 3), (2, 3), (3, 3),
(1, 4), (2, 4), (3, 4),
(1, 5), (2, 5), (3, 5),

-- Camp Nou
(1, 6), (2, 6), (3, 6),
(1, 7), (2, 7), (3, 7),
(1, 8), (2, 8), (3, 8),
(1, 9), (2, 9), (3, 9),
(1, 10), (2, 10), (3, 10),

-- MetLife Stadium
(1, 11), (2, 11), (3, 11),
(1, 12), (2, 12), (3, 12),
(1, 13), (2, 13), (3, 13),
(1, 14), (2, 14), (3, 14),
(1, 15), (2, 15), (3, 15),

-- Maracanã
(1, 16), (2, 16), (3, 16),
(1, 17), (2, 17), (3, 17),
(1, 18), (2, 18), (3, 18),
(1, 19), (2, 19), (3, 19),
(1, 20), (2, 20), (3, 20),

-- Allianz Arena
(1, 21), (2, 21), (3, 21),
(1, 22), (2, 22), (3, 22),
(1, 23), (2, 23), (3, 23),
(1, 24), (2, 24), (3, 24),
(1, 25), (2, 25), (3, 25),

-- Estadio Azteca
(1, 26), (2, 26), (3, 26),
(1, 27), (2, 27), (3, 27),
(1, 28), (2, 28), (3, 28),
(1, 29), (2, 29), (3, 29),
(1, 30), (2, 30), (3, 30),

-- Hard Rock Stadium
(1, 31), (2, 31), (3, 31),
(1, 32), (2, 32), (3, 32),
(1, 33), (2, 33), (3, 33),
(1, 34), (2, 34), (3, 34),
(1, 35), (2, 35), (3, 35),

-- Lusail Iconic Stadium
(1, 36), (2, 36), (3, 36),
(1, 37), (2, 37), (3, 37),
(1, 38), (2, 38), (3, 38),
(1, 39), (2, 39), (3, 39),
(1, 40), (2, 40), (3, 40),

-- Rose Bowl
(1, 41), (2, 41), (3, 41),
(1, 42), (2, 42), (3, 42),
(1, 43), (2, 43), (3, 43),
(1, 44), (2, 44), (3, 44),
(1, 45), (2, 45), (3, 45),

-- Parc des Princes
(1, 46), (2, 46), (3, 46),
(1, 47), (2, 47), (3, 47),
(1, 48), (2, 48), (3, 48),
(1, 49), (2, 49), (3, 49),
(1, 50), (2, 50), (3, 50);

INSERT INTO asiento (numero, fila_id) VALUES
-- Wembley Stadium
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2),
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3),
(1, 4), (2, 4), (3, 4), (4, 4), (5, 4),
(1, 5), (2, 5), (3, 5), (4, 5), (5, 5),

-- Camp Nou
(1, 6), (2, 6), (3, 6), (4, 6), (5, 6),
(1, 7), (2, 7), (3, 7), (4, 7), (5, 7),
(1, 8), (2, 8), (3, 8), (4, 8), (5, 8),
(1, 9), (2, 9), (3, 9), (4, 9), (5, 9),
(1, 10), (2, 10), (3, 10), (4, 10), (5, 10),

-- MetLife Stadium
(1, 11), (2, 11), (3, 11), (4, 11), (5, 11),
(1, 12), (2, 12), (3, 12), (4, 12), (5, 12),
(1, 13), (2, 13), (3, 13), (4, 13), (5, 13),
(1, 14), (2, 14), (3, 14), (4, 14), (5, 14),
(1, 15), (2, 15), (3, 15), (4, 15), (5, 15),

-- Maracanã
(1, 16), (2, 16), (3, 16), (4, 16), (5, 16),
(1, 17), (2, 17), (3, 17), (4, 17), (5, 17),
(1, 18), (2, 18), (3, 18), (4, 18), (5, 18),
(1, 19), (2, 19), (3, 19), (4, 19), (5, 19),
(1, 20), (2, 20), (3, 20), (4, 20), (5, 20),

-- Allianz Arena
(1, 21), (2, 21), (3, 21), (4, 21), (5, 21),
(1, 22), (2, 22), (3, 22), (4, 22), (5, 22),
(1, 23), (2, 23), (3, 23), (4, 23), (5, 23),
(1, 24), (2, 24), (3, 24), (4, 24), (5, 24),
(1, 25), (2, 25), (3, 25), (4, 25), (5, 25),

-- Estadio Azteca
(1, 26), (2, 26), (3, 26), (4, 26), (5, 26),
(1, 27), (2, 27), (3, 27), (4, 27), (5, 27),
(1, 28), (2, 28), (3, 28), (4, 28), (5, 28),
(1, 29), (2, 29), (3, 29), (4, 29), (5, 29),
(1, 30), (2, 30), (3, 30), (4, 30), (5, 30),

-- Hard Rock Stadium
(1, 31), (2, 31), (3, 31), (4, 31), (5, 31),
(1, 32), (2, 32), (3, 32), (4, 32), (5, 32),
(1, 33), (2, 33), (3, 33), (4, 33), (5, 33),
(1, 34), (2, 34), (3, 34), (4, 34), (5, 34),
(1, 35), (2, 35), (3, 35), (4, 35), (5, 35),

-- Lusail Iconic Stadium
(1, 36), (2, 36), (3, 36), (4, 36), (5, 36),
(1, 37), (2, 37), (3, 37), (4, 37), (5, 37),
(1, 38), (2, 38), (3, 38), (4, 38), (5, 38),
(1, 39), (2, 39), (3, 39), (4, 39), (5, 39),
(1, 40), (2, 40), (3, 40), (4, 40), (5, 40),

-- Rose Bowl
(1, 41), (2, 41), (3, 41), (4, 41), (5, 41),
(1, 42), (2, 42), (3, 42), (4, 42), (5, 42),
(1, 43), (2, 43), (3, 43), (4, 43), (5, 43),
(1, 44), (2, 44), (3, 44), (4, 44), (5, 44),
(1, 45), (2, 45), (3, 45), (4, 45), (5, 45),

-- Parc des Princes
(1, 46), (2, 46), (3, 46), (4, 46), (5, 46),
(1, 47), (2, 47), (3, 47), (4, 47), (5, 47),
(1, 48), (2, 48), (3, 48), (4, 48), (5, 48),
(1, 49), (2, 49), (3, 49), (4, 49), (5, 49),
(1, 50), (2, 50), (3, 50), (4, 50), (5, 50);


INSERT INTO entradas (cliente_id, evento_id, area_id, fila_id, asiento_id, precio, cantidad, estado) VALUES
(1, 1, 1, 1, 1, 150.00, 1, 'reservada'),
(2, 2, 2, 2, 2, 50.00, 1, 'pagada'),
(3, 3, 3, 3, 3, 75.00, 1, 'cancelada'),
(4, 4, 4, 1, 4, 75.00, 1, 'revendida'),
(5, 5, 5, 2, 5, 150.00, 1, 'reservada'),
(6, 6, 6, 3, 6, 200.00, 1, 'pagada'),
(7, 7, 7, 1, 7, 60.00, 1, 'cancelada'),
(8, 1, 8, 2, 8, 60.00, 1, 'revendida'),
(9, 2, 9, 3, 9, 80.00, 1, 'reservada'),
(10, 3, 10, 1, 10, 80.00, 1, 'pagada'),
(11, 4, 11, 2, 11, 250.00, 1, 'cancelada'),
(12, 5, 12, 3, 12, 40.00, 1, 'revendida'),
(13, 6, 13, 1, 13, 40.00, 1, 'reservada'),
(14, 7, 14, 2, 14, 90.00, 1, 'pagada'),
(15, 1, 15, 3, 15, 90.00, 1, 'cancelada'),
(16, 2, 16, 1, 16, 180.00, 1, 'revendida'),
(17, 3, 17, 2, 17, 55.00, 1, 'reservada'),
(18, 4, 18, 3, 18, 55.00, 1, 'pagada'),
(19, 5, 19, 1, 19, 70.00, 1, 'cancelada'),
(20, 6, 20, 2, 20, 70.00, 1, 'revendida'),
(21, 7, 21, 3, 21, 220.00, 1, 'reservada'),
(22, 1, 22, 1, 22, 65.00, 1, 'pagada'),
(23, 2, 23, 2, 23, 65.00, 1, 'cancelada'),
(24, 3, 24, 3, 24, 85.00, 1, 'revendida'),
(25, 4, 25, 1, 25, 85.00, 1, 'reservada'),
(26, 5, 26, 2, 26, 300.00, 1, 'pagada'),
(27, 6, 27, 3, 27, 50.00, 1, 'cancelada'),
(28, 7, 28, 1, 28, 50.00, 1, 'revendida'),
(29, 1, 29, 2, 29, 70.00, 1, 'reservada'),
(30, 2, 30, 3, 30, 70.00, 1, 'pagada'),
(1, 3, 31, 1, 31, 240.00, 1, 'cancelada'),
(2, 4, 32, 2, 32, 45.00, 1, 'revendida'),
(3, 5, 33, 3, 33, 45.00, 1, 'reservada'),
(4, 6, 34, 1, 34, 100.00, 1, 'pagada'),
(5, 7, 35, 2, 35, 100.00, 1, 'cancelada'),
(6, 1, 36, 3, 36, 350.00, 1, 'revendida'),
(7, 2, 37, 1, 37, 70.00, 1, 'reservada'),
(8, 3, 38, 2, 38, 70.00, 1, 'pagada'),
(9, 4, 39, 3, 39, 120.00, 1, 'cancelada'),
(10, 5, 40, 1, 40, 120.00, 1, 'revendida');


INSERT INTO ticket_parqueo (cliente_id, parqueo_id, evento_id, fecha, hora_entrada, hora_salida, precio) VALUES
(1, 1, 1, '2023-12-15', '18:00:00', '22:30:00', 15.00),
(2, 2, 2, '2023-12-20', '17:30:00', '21:30:00', 12.50),
(3, 3, 3, '2024-01-10', '16:00:00', '23:30:00', 20.00),
(4, 4, 4, '2024-01-25', '19:00:00', '23:00:00', 10.00),
(5, 5, 5, '2024-02-05', '18:30:00', '22:30:00', 18.00),
(6, 6, 6, '2024-02-15', '17:00:00', '21:00:00', 8.00),
(7, 7, 7, '2024-03-01', '15:00:00', '21:30:00', 25.00),
(8, 8, 1, '2024-03-10', '18:00:00', '22:30:00', 30.00),
(9, 9, 3, '2024-03-20', '16:30:00', '23:30:00', 22.00),
(10, 10, 4, '2024-04-05', '19:00:00', '23:00:00', 14.00),
(11, 1, 5, '2024-04-15', '18:30:00', '22:30:00', 15.00),
(12, 2, 6, '2024-04-25', '17:00:00', '21:00:00', 12.50),
(13, 3, 1, '2023-12-15', '18:00:00', '22:30:00', 20.00),
(14, 4, 2, '2023-12-20', '17:30:00', '21:30:00', 10.00),
(15, 5, 3, '2024-01-10', '16:00:00', '23:30:00', 18.00),
(16, 6, 4, '2024-01-25', '19:00:00', '23:00:00', 8.00),
(17, 7, 5, '2024-02-05', '18:30:00', '22:30:00', 25.00),
(18, 8, 6, '2024-02-15', '17:00:00', '21:00:00', 30.00),
(19, 9, 7, '2024-03-01', '15:00:00', '21:30:00', 22.00),
(20, 10, 1, '2024-03-10', '18:00:00', '22:30:00', 14.00);



