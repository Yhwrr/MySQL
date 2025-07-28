CREATE DATABASE IF NOT EXISTS veterinaria_YHWRR;

USE veterinaria_YHWRR;

-- dueño :)
CREATE TABLE IF NOT EXISTS dueño (
  cedula VARCHAR(20) NOT NULL,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  direccion VARCHAR(255),
  PRIMARY KEY (cedula)
);


-- Tabla: especieee

CREATE TABLE IF NOT EXISTS especie (
  id_especie INT NOT NULL AUTO_INCREMENT,
  nombre_especie VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_especie)
);


-- racismo

CREATE TABLE IF NOT EXISTS raza (
  id_raza INT NOT NULL AUTO_INCREMENT,
  nombre_raza VARCHAR(50) NOT NULL,
  id_especie INT NOT NULL,
  PRIMARY KEY (id_raza),
  FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
);

-- Tala: bmascota

CREATE TABLE IF NOT EXISTS mascota (
  id_mascota INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  edad INT,
  sexo VARCHAR(10) NOT NULL,
  vacunada BOOLEAN NOT NULL,
  id_raza INT NOT NULL,
  cedula_dueño VARCHAR(20) NOT NULL,
  PRIMARY KEY (id_mascota),
  FOREIGN KEY (id_raza) REFERENCES raza(id_raza),
  FOREIGN KEY (cedula_dueño) REFERENCES dueño(cedula)
);


- Tabla servicio

CREATE TABLE IF NOT EXISTS servicio (
  id_servicio INT NOT NULL AUTO_INCREMENT,
  nombre_servicio VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio_base DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (id_servicio)
);

-- viisita

CREATE TABLE IF NOT EXISTS visita (
  id_visita INT NOT NULL AUTO_INCREMENT,
  fecha_visita DATETIME NOT NULL,
  id_mascota INT NOT NULL,
  PRIMARY KEY (id_visita),
  FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota)
);


-- detalle-visita

CREATE TABLE IF NOT EXISTS detalle_visita (
  id_detalle INT NOT NULL AUTO_INCREMENT,
  id_visita INT NOT NULL,
  id_servicio INT NOT NULL,
  precio_cobrado DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (id_detalle),
  FOREIGN KEY (id_visita) REFERENCES visita(id_visita),
  FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);

-- Tabla: tratamiento

CREATE TABLE IF NOT EXISTS tratamiento (
  id_tratamiento INT NOT NULL AUTO_INCREMENT,
  nombre_tratamiento VARCHAR(100) NOT NULL,
  observaciones TEXT,
  id_visita INT NOT NULL,
  PRIMARY KEY (id_tratamiento),
  FOREIGN KEY (id_visita) REFERENCES visita(id_visita)
);