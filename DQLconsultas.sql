-- Consulta 1: Alias en campos, CONCAT y JOIN
-- Objetivo: Listar el nombre completo de los dueños y el nombre de sus respectivas mascotas.
-- Conceptos: CONCAT, JOIN, Alias de campo.
SELECT
    CONCAT(d.nombres, ' ', d.apellidos) AS nombre_dueño,
    m.nombre AS nombre_mascota
FROM dueño d
JOIN mascota m ON d.cedula = m.cedula_dueño
ORDER BY nombre_dueño;

-- Consulta 2: Funciones de agregación (COUNT) y Alias en función
-- Objetivo: Contar el número total de mascotas registradas en la veterinaria.
-- Conceptos: COUNT, Alias de función.
SELECT COUNT(*) AS total_mascotas FROM mascota;

-- Consulta 3: Funciones de agregación (AVG) y ROUND
-- Objetivo: Calcular el precio promedio de los servicios de la veterinaria.
-- Conceptos: AVG, ROUND.
SELECT ROUND(AVG(precio_base), 2) AS precio_promedio_servicios FROM servicio;

-- Consulta 4: IF en campos
-- Objetivo: Mostrar el nombre de las mascotas y si están vacunadas o no, usando texto.
-- Conceptos: IF, Alias de campo.
SELECT
    nombre,
    IF(vacunada = 1, 'Sí, está vacunado/a', 'No, necesita vacunas') AS estado_vacunacion
FROM mascota;

-- Consulta 5: UPPER y LOWER
-- Objetivo: Mostrar el nombre de los servicios en mayúsculas y su descripción en minúsculas.
-- Conceptos: UPPER, LOWER.
SELECT
    UPPER(nombre_servicio) AS servicio_mayusculas,
    LOWER(descripcion) AS descripcion_minusculas
FROM servicio;

-- Consulta 6: LENGTH
-- Objetivo: Listar los nombres de los dueños y la longitud de sus nombres completos.
-- Conceptos: LENGTH, CONCAT.
SELECT
    nombres,
    apellidos,
    LENGTH(CONCAT(nombres, ' ', apellidos)) AS longitud_nombre_completo
FROM dueño;

-- Consulta 7: SUBSTRING
-- Objetivo: Crear un código de servicio a partir de las 3 primeras letras del nombre y su ID.
-- Conceptos: SUBSTRING, CONCAT.
SELECT
    nombre_servicio,
    CONCAT(SUBSTRING(nombre_servicio, 1, 3), id_servicio) AS codigo_servicio
FROM servicio;

-- Consulta 8: Creación de tabla a partir de consulta
-- Objetivo: Crear una tabla nueva llamada `mascotas_no_vacunadas` con los datos de las mascotas que no están vacunadas.
-- Conceptos: CREATE TABLE AS SELECT.
CREATE TABLE mascotas_no_vacunadas AS
SELECT id_mascota, nombre, edad, sexo, id_raza, cedula_dueño
FROM mascota
WHERE vacunada = 0;

-- (Puedes verificar la creación con: SELECT * FROM mascotas_no_vacunadas;)

-- Consulta 9: Alias en subconsultas
-- Objetivo: Encontrar las mascotas cuya edad es superior a la edad promedio de todas las mascotas.
-- Conceptos: Subconsulta, Alias de subconsulta.
SELECT nombre, edad
FROM mascota
WHERE edad > (SELECT AVG(edad) FROM mascota);

-- Consulta 10: Funciones de agregación (MAX y MIN)
-- Objetivo: Encontrar el servicio más caro y el más barato.
-- Conceptos: MAX, MIN, Subconsultas.
SELECT
    (SELECT nombre_servicio FROM servicio WHERE precio_base = (SELECT MAX(precio_base) FROM servicio)) AS servicio_mas_caro,
    (SELECT nombre_servicio FROM servicio WHERE precio_base = (SELECT MIN(precio_base) FROM servicio)) AS servicio_mas_barato;

-- ------------------------------------------------------------------------------------
-- CONSULTAS ADICIONALES (JOIN, GROUP BY, ORDER BY, etc.)
-- ------------------------------------------------------------------------------------

-- Consulta 11: Historial de visitas de una mascota (JOIN múltiple)
-- Objetivo: Mostrar la fecha, el servicio y el precio de todas las visitas de "Thor".
-- Conceptos: JOIN, WHERE.
SELECT
    v.fecha_visita,
    s.nombre_servicio,
    dv.precio_cobrado
FROM visita v
JOIN detalle_visita dv ON v.id_visita = dv.id_visita
JOIN servicio s ON dv.id_servicio = s.id_servicio
JOIN mascota m ON v.id_mascota = m.id_mascota
WHERE m.nombre = 'Thor';

-- Consulta 12: GROUP BY y HAVING
-- Objetivo: Mostrar los dueños que tienen más de una mascota.
-- Conceptos: GROUP BY, COUNT, HAVING, JOIN.
SELECT
    CONCAT(d.nombres, ' ', d.apellidos) AS nombre_dueño,
    COUNT(m.id_mascota) AS numero_de_mascotas
FROM dueño d
JOIN mascota m ON d.cedula = m.cedula_dueño
GROUP BY d.cedula
HAVING numero_de_mascotas > 1;

-- Consulta 13: LEFT JOIN para encontrar registros sin relación
-- Objetivo: Encontrar las especies que no tienen ninguna raza registrada.
-- Conceptos: LEFT JOIN, WHERE IS NULL.
SELECT e.nombre_especie
FROM especie e
LEFT JOIN raza r ON e.id_especie = r.id_especie
WHERE r.id_raza IS NULL;

-- Consulta 14: Reporte completo de tratamientos
-- Objetivo: Listar los tratamientos, indicando a qué mascota se le recetó, en qué fecha y por qué dueño.
-- Conceptos: JOIN múltiple.
SELECT
    t.nombre_tratamiento,
    t.observaciones,
    v.fecha_visita,
    m.nombre AS nombre_mascota,
    CONCAT(d.nombres, ' ', d.apellidos) AS nombre_dueño
FROM tratamiento t
JOIN visita v ON t.id_visita = v.id_visita
JOIN mascota m ON v.id_mascota = m.id_mascota
JOIN dueño d ON m.cedula_dueño = d.cedula;

-- Consulta 15: Suma de ingresos por servicio
-- Objetivo: Calcular cuánto dinero ha generado cada servicio.
-- Conceptos: GROUP BY, SUM, ORDER BY, JOIN.
SELECT
    s.nombre_servicio,
    SUM(dv.precio_cobrado) AS total_generado
FROM servicio s
JOIN detalle_visita dv ON s.id_servicio = dv.id_servicio
GROUP BY s.nombre_servicio
ORDER BY total_generado DESC;

-- Consulta 16: TRIM (Ejemplo conceptual)
-- Objetivo: Demostrar cómo limpiar espacios en blanco al inicio y final de un texto.
-- Conceptos: TRIM.
SELECT TRIM('   Hola Mundo   ') AS texto_limpio;

-- Consulta 17: Mascotas por especie
-- Objetivo: Contar cuántas mascotas hay de cada especie.
-- Conceptos: JOIN, GROUP BY, COUNT.
SELECT
    e.nombre_especie,
    COUNT(m.id_mascota) AS cantidad_mascotas
FROM especie e
JOIN raza r ON e.id_especie = r.id_especie
JOIN mascota m ON r.id_raza = m.id_raza
GROUP BY e.nombre_especie;

-- Consulta 18: Total gastado por dueño
-- Objetivo: Calcular el monto total que ha gastado cada dueño en la veterinaria.
-- Conceptos: JOIN múltiple, GROUP BY, SUM.
SELECT
    CONCAT(d.nombres, ' ', d.apellidos) AS nombre_dueño,
    SUM(dv.precio_cobrado) AS total_gastado
FROM dueño d
JOIN mascota m ON d.cedula = m.cedula_dueño
JOIN visita v ON m.id_mascota = v.id_mascota
JOIN detalle_visita dv ON v.id_visita = dv.id_visita
GROUP BY d.cedula
ORDER BY total_gastado DESC;