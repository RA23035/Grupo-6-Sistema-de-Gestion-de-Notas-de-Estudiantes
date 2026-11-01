
-- 1. Tabla carrera
INSERT INTO carrera (codigo_carrera, nombre_carrera) VALUES 
('I501', 'Ingeniería en Desarrollo de Software'),
('I502', 'Ingeniería de Sistemas Informáticos'),
('I503', 'Ingeniería Industrial'),
('I504', 'Ingeniería Eléctrica'),
('I505', 'Ingeniería Mecánica'),
('I506', 'Ingeniería Civil'),
('I507', 'Arquitectura'),
('L501', 'Licenciatura en Letras'),
('L502', 'Licenciatura en Matemáticas'),
('L503', 'Licenciatura en Física');

-- 2. Tabla ciclos_academicos
INSERT INTO ciclos_academicos (codigo_ciclo, fecha_inicio, fecha_fin, estado) VALUES
('01-2022', '2022-02-15', '2022-06-30', 'Finalizado'),
('02-2022', '2022-08-10', '2022-12-15', 'Finalizado'),
('01-2023', '2023-02-15', '2023-06-30', 'Finalizado'),
('02-2023', '2023-08-10', '2023-12-15', 'Finalizado'),
('01-2024', '2024-02-15', '2024-06-30', 'Finalizado'),
('02-2024', '2024-08-10', '2024-12-15', 'Finalizado'),
('01-2025', '2025-02-15', '2025-06-30', 'Finalizado'),
('02-2025', '2025-08-10', '2025-12-15', 'Finalizado'),
('01-2026', '2026-02-15', '2026-06-30', 'Finalizado'),
('02-2026', '2026-08-10', '2026-12-15', 'Activo');

-- 3. Tabla docentes
INSERT INTO docentes (codigo_docente, nombres, apellidos, correo) VALUES
('DOC001', 'Carlos Alberto', 'Gómez Ruiz', 'carlos.gomez@universidad.edu'),
('DOC002', 'María Elena', 'López Martínez', 'maria.lopez@universidad.edu'),
('DOC003', 'Jorge Eduardo', 'Hernández Paz', 'jorge.hernandez@universidad.edu'),
('DOC004', 'Ana Patricia', 'Ramírez Solís', 'ana.ramirez@universidad.edu'),
('DOC005', 'Roberto Carlos', 'Díaz Morales', 'roberto.diaz@universidad.edu'),
('DOC006', 'Sofia Isabel', 'Torres Vega', 'sofia.torres@universidad.edu'),
('DOC007', 'Fernando José', 'Castillo Flores', 'fernando.castillo@universidad.edu'),
('DOC008', 'Claudia Beatriz', 'Navarro Cruz', 'claudia.navarro@universidad.edu'),
('DOC009', 'Ricardo Antonio', 'Mendoza Delgado', 'ricardo.mendoza@universidad.edu'),
('DOC010', 'Lucía Fernanda', 'Aguilar Rivas', 'lucia.aguilar@universidad.edu');

-- 4. Tabla estudiantes
INSERT INTO estudiantes (carnet, nombres, apellidos, correo, carrera_id, estado_academico) VALUES
('20230001', 'Juan Pedro', 'Pérez Alvarado', 'juan.perez@estudiantil.edu', 1, 'Activo'),
('20230002', 'Karla Patricia', 'Vásquez Gómez', 'karla.vasquez@estudiantil.edu', 1, 'Activo'),
('20230003', 'Luis Alberto', 'Martínez Orellana', 'luis.martinez@estudiantil.edu', 2, 'Activo'),
('20230004', 'Andrea Maria', 'Ríos Lemus', 'andrea.rios@estudiantil.edu', 2, 'Inactivo'),
('20230005', 'Diego José', 'Sánchez Fuentes', 'diego.sanchez@estudiantil.edu', 3, 'Activo'),
('20230006', 'Valeria Sofia', 'Castro Amaya', 'valeria.castro@estudiantil.edu', 4, 'Activo'),
('20230007', 'Gabriel Antonio', 'Ortiz Meléndez', 'gabriel.ortiz@estudiantil.edu', 5, 'Activo'),
('20230008', 'Camila Beatriz', 'Guardado Ramos', 'camila.guardado@estudiantil.edu', 6, 'Egresado'),
('20230009', 'Mateo Alexander', 'Mejía Campos', 'mateo.mejia@estudiantil.edu', 7, 'Activo'),
('20230010', 'Daniela Alejandra', 'Zelaya Romero', 'daniela.zelaya@estudiantil.edu', 8, 'Activo');

-- 5. Tabla asignaturas
INSERT INTO asignaturas (codigo_materia, nombre_materia, unidades_valorativas, prerrequisito_id) VALUES
('MAT101', 'Matemática I', 4, NULL),
('MAT102', 'Matemática II', 4, 1),
('PRG101', 'Programación I', 4, NULL),
('PRG102', 'Programación II', 4, 3),
('BDD101', 'Bases de Datos I', 4, 3),
('BDD102', 'Bases de Datos II', 4, 5),
('FIS101', 'Física I', 4, NULL),
('FIS102', 'Física II', 4, 7),
('RED101', 'Redes de Computadoras I', 3, NULL),
('ING101', 'Inglés Técnico', 3, NULL);

-- 6. Tabla grupos
INSERT INTO grupos (asignatura_id, docente_id, ciclo_id, numero_grupo) VALUES
(1, 1, 10, 1),
(2, 1, 10, 2),
(3, 2, 10, 1),
(4, 2, 10, 2),
(5, 3, 10, 1),
(6, 3, 10, 2),
(7, 4, 10, 1),
(8, 5, 10, 1),
(9, 6, 10, 1),
(10, 7, 10, 1);

-- 7. Tabla inscripciones
INSERT INTO inscripciones (estudiante_id, grupo_id, nota_final, estado_materia) VALUES
(1, 1, 8.50, 'Aprobado'),
(2, 1, 7.00, 'Aprobado'),
(3, 3, 9.20, 'Aprobado'),
(4, 3, 4.50, 'Reprobado'),
(5, 5, 8.00, 'Aprobado'),
(6, 5, 6.80, 'En Cursado'),
(7, 7, 9.50, 'Aprobado'),
(8, 8, 7.50, 'Aprobado'),
(9, 9, 8.80, 'Aprobado'),
(10, 10, 10.00, 'Aprobado');

-- 8. Tabla evaluaciones
INSERT INTO evaluaciones (grupo_id, nombre_evaluacion, porcentaje, fecha_evaluacion) VALUES
(1, 'Parcial 1', 25.00, '2026-03-15'),
(1, 'Parcial 2', 25.00, '2026-04-20'),
(1, 'Laboratorio 1', 20.00, '2026-03-30'),
(1, 'Proyecto Final', 30.00, '2026-06-10'),
(3, 'Parcial 1', 30.00, '2026-03-18'),
(3, 'Parcial 2', 30.00, '2026-04-22'),
(3, 'Laboratorio 1', 40.00, '2026-06-05'),
(5, 'Evaluación Teórica', 50.00, '2026-04-10'),
(5, 'Evaluación Práctica', 50.00, '2026-06-01'),
(7, 'Examen General', 100.00, '2026-06-15');

-- 9. Tabla calificaciones
INSERT INTO calificaciones (inscripcion_id, evaluacion_id, nota) VALUES
(1, 1, 8.00),
(1, 2, 8.50),
(1, 3, 9.00),
(1, 4, 8.80),
(2, 1, 7.00),
(2, 2, 6.50),
(3, 5, 9.50),
(3, 6, 9.00),
(4, 5, 4.00),
(5, 8, 8.00);