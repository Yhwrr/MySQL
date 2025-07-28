INSERT INTO dueño (cedula, nombres, apellidos, telefono, direccion) VALUES
('1098765432', 'Ana María', 'García Pérez', '3115678901', 'Calle 45 #23-12, Apto 101'),
('78901234', 'Carlos Alberto', 'Rodríguez Gómez', '3209876543', 'Avenida Siempre Viva 742'),
('54321678', 'Lucía', 'Martínez Díaz', '3152345678', 'Carrera 15 #88-34'),
('98765432', 'Javier Andrés', 'López Hernández', '3108765432', 'Transversal 5 #10-50'),
('123456789', 'Sofía', 'Ramírez Torres', '3187654321', 'Calle 100 #19-51');

-- -----------------------------------------------------
-- Inserción en la tabla: especie (5 registros)
-- -----------------------------------------------------
INSERT INTO especie (nombre_especie) VALUES
('Perro'),
('Gato'),
('Hámster'),
('Ave'),
('Conejo'); -- Registro añadido para cumplir el mínimo de 5

-- -----------------------------------------------------
-- Inserción en la tabla: raza (7 registros)
-- -----------------------------------------------------
-- Razas de Perro (id_especie = 1)
INSERT INTO raza (nombre_raza, id_especie) VALUES
('Labrador Retriever', 1),
('Bulldog Francés', 1),
('Golden Retriever', 1),
('Criollo (Perro)', 1);
-- Razas de Gato (id_especie = 2)
INSERT INTO raza (nombre_raza, id_especie) VALUES
('Siamés', 2),
('Persa', 2),
('Criollo (Gato)', 2);

-- -----------------------------------------------------
-- Inserción en la tabla: mascota (10 registros)
-- -----------------------------------------------------
INSERT INTO mascota (nombre, edad, sexo, vacunada, id_raza, cedula_dueño) VALUES
('Thor', 3, 'Macho', true, 1, '1098765432'),  -- Labrador de Ana
('Luna', 5, 'Hembra', true, 5, '78901234'),   -- Siamés de Carlos
('Rocky', 2, 'Macho', false, 2, '54321678'),  -- Bulldog de Lucía
('Nala', 1, 'Hembra', true, 6, '98765432'),   -- Persa de Javier
('Max', 4, 'Macho', true, 3, '123456789'),  -- Golden de Sofía
('Milo', 6, 'Macho', false, 4, '1098765432'), -- Criollo (Perro) de Ana
('Frida', 2, 'Hembra', true, 7, '78901234'),  -- Criollo (Gato) de Carlos
('Bruno', 1, 'Macho', true, 1, '98765432'),   -- Labrador de Javier
('Kiara', 7, 'Hembra', true, 4, '123456789'), -- Criollo (Perro) de Sofía
('Simba', 3, 'Macho', false, 5, '54321678');  -- Siamés de Lucía

-- -----------------------------------------------------
-- Inserción en la tabla: servicio (5 registros)
-- -----------------------------------------------------
INSERT INTO servicio (nombre_servicio, descripcion, precio_base) VALUES
('Consulta Médica General', 'Revisión completa del estado de salud de la mascota.', 50000.00),
('Vacunación Anual', 'Aplicación de la vacuna polivalente y rabia.', 85000.00),
('Baño y Peluquería', 'Baño medicado, corte de pelo y limpieza de oídos.', 45000.00),
('Desparasitación Interna', 'Administración de medicamento para parásitos internos.', 30000.00),
('Corte de Uñas', 'Corte e higiene de las uñas de la mascota.', 15000.00);

-- -----------------------------------------------------
-- Inserción en la tabla: visita (10 registros)
-- -----------------------------------------------------
INSERT INTO visita (fecha_visita, id_mascota) VALUES
('2024-10-01 10:00:00', 1), -- Thor
('2024-10-02 11:30:00', 2), -- Luna
('2024-10-05 15:00:00', 3), -- Rocky
('2024-10-10 09:00:00', 4), -- Nala
('2024-10-12 16:45:00', 5), -- Max
('2024-10-15 14:00:00', 1), -- Thor (segunda visita)
('2024-10-18 10:30:00', 6), -- Milo
('2024-10-20 12:00:00', 7), -- Frida
('2024-10-22 17:00:00', 8), -- Bruno
('2024-10-25 08:15:00', 2); -- Luna (segunda visita)

-- -----------------------------------------------------
-- Inserción en la tabla: detalle_visita (11 registros)
-- -----------------------------------------------------
INSERT INTO detalle_visita (id_visita, id_servicio, precio_cobrado) VALUES
(1, 1, 50000.00),  -- Visita 1 (Thor): Consulta Médica
(2, 2, 85000.00),  -- Visita 2 (Luna): Vacunación
(3, 3, 45000.00),  -- Visita 3 (Rocky): Baño y Peluquería
(3, 5, 15000.00),  -- Visita 3 (Rocky): También Corte de Uñas
(4, 1, 55000.00),  -- Visita 4 (Nala): Consulta (precio especial)
(5, 4, 30000.00),  -- Visita 5 (Max): Desparasitación
(6, 3, 50000.00),  -- Visita 6 (Thor): Baño y Peluquería
(7, 1, 50000.00),  -- Visita 7 (Milo): Consulta Médica
(8, 2, 85000.00),  -- Visita 8 (Frida): Vacunación
(9, 3, 45000.00),  -- Visita 9 (Bruno): Baño y Peluquería
(10, 5, 15000.00); -- Visita 10 (Luna): Corte de Uñas

-- -----------------------------------------------------
-- Inserción en la tabla: tratamiento (5 registros)
-- -----------------------------------------------------
INSERT INTO tratamiento (nombre_tratamiento, observaciones, id_visita) VALUES
('Antibiótico Amoxicilina', 'Dar una pastilla cada 12 horas por 7 días.', 1), -- Recetado a Thor
('Gotas para los Ojos', 'Aplicar 2 gotas en cada ojo cada 8 horas.', 4),    -- Recetado a Nala
('Jarabe para la Tos', 'Dar 5ml del jarabe cada 24 horas por 5 días.', 7),   -- Recetado a Milo
('Crema Dermatológica', 'Aplicar en la zona afectada 2 veces al día.', 1),    -- Otro tratamiento para Thor
('Suplemento Vitamínico', 'Una pastilla diaria con la comida.', 2);          -- Recetado a Luna en su vacunación