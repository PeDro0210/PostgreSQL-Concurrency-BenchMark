CREATE TYPE TIPO_EVENTO AS ENUM('futbol', 'baloncesto', 'concierto', 'teatro', 'festival');
CREATE TYPE SECCION AS ENUM('Norte', 'Sur', 'Este', 'Oeste', 'VIP');
CREATE TYPE ESTADO AS ENUM('reservada', 'pagada', 'cancelada', 'revendida');

CREATE TABLE cliente(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE evento_general(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    tipo_evento TIPO_EVENTO NOT NULL,
    descripcion TEXT
);

CREATE TABLE estadio(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    capacidad INT NOT NULL,
    ciudad VARCHAR(255) NOT NULL,
    pais VARCHAR(255) NOT NULL
);

CREATE TABLE parqueo(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    capacidad INT NOT NULL,
    precio NUMERIC(10, 2) NOT NULL,
    estadio_id INT REFERENCES estadio(id) ON DELETE CASCADE
);

CREATE TABLE evento (
    id SERIAL PRIMARY KEY,
    evento_general_id INT REFERENCES evento_general(id) ON DELETE CASCADE,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME,
    estadio_id INT REFERENCES estadio(id) ON DELETE CASCADE,
    reglas_entrada TEXT
);

CREATE TABLE area(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio_area NUMERIC(10, 2) NOT NULL,
    seccion SECCION NOT NULL,
    estadio_id INT REFERENCES estadio(id) ON DELETE CASCADE
);


CREATE TABLE fila(
    id SERIAL PRIMARY KEY,
    numero INT NOT NULL,
    area_id INT REFERENCES area(id) ON DELETE CASCADE
);

CREATE TABLE asiento(
    id SERIAL PRIMARY KEY,
    numero INT NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE,
    fila_id INT REFERENCES fila(id) ON DELETE CASCADE
);

CREATE TABLE entradas(
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    evento_id INT NOT NULL,
    area_id INT NOT NULL,
    fila_id INT NOT NULL,
    asiento_id INT NOT NULL,
    precio NUMERIC(10, 2) NOT NULL,
    cantidad INT NOT NULL,
    estado ESTADO NOT NULL DEFAULT 'reservada'
);

CREATE TABLE ticket_parqueo(
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES cliente(id) ON DELETE CASCADE,
    parqueo_id INT REFERENCES parqueo(id) ON DELETE CASCADE,
    evento_id INT REFERENCES evento(id) ON DELETE CASCADE,
    fecha DATE NOT NULL,
    hora_entrada TIME NOT NULL,
    hora_salida TIME,
    precio NUMERIC(10, 2) NOT NULL
);

