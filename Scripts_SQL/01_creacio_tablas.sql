-- 1. Tabla carrera
CREATE TABLE carrera (
    carrera_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    codigo_carrera VARCHAR(10) UNIQUE NOT NULL,
    nombre_carrera VARCHAR(150) NOT NULL
);

-- 2. Tabla ciclos_academicos
CREATE TABLE ciclos_academicos (
    ciclo_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    codigo_ciclo VARCHAR(10) UNIQUE NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(15) NOT NULL
);

-- 3. Tabla docentes
CREATE TABLE docentes (
    docente_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    codigo_docente VARCHAR(15) UNIQUE NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL
);

-- 4. Tabla estudiantes

CREATE TABLE estudiantes (
    estudiante_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    carnet VARCHAR(15) UNIQUE NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    carrera_id INT,
    estado_academico VARCHAR(20) NOT NULL,
    CONSTRAINT fk_estudiante_carrera FOREIGN KEY (carrera_id) REFERENCES carrera(carrera_id)
);

-- 5. Tabla asignaturas
CREATE TABLE asignaturas (
    asignatura_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    codigo_materia VARCHAR(10) UNIQUE NOT NULL,
    nombre_materia VARCHAR(150) NOT NULL,
    unidades_valorativas INT NOT NULL,
    prerrequisito_id INT,
    CONSTRAINT fk_asignatura_prerrequisito FOREIGN KEY (prerrequisito_id) REFERENCES asignaturas(asignatura_id)
);

-- 6. Tabla grupos
CREATE TABLE grupos (
    grupo_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    asignatura_id INT,
    docente_id INT,
    ciclo_id INT,
    numero_grupo INT NOT NULL,
    CONSTRAINT fk_grupo_asignatura FOREIGN KEY (asignatura_id) REFERENCES asignaturas(asignatura_id),
    CONSTRAINT fk_grupo_docente FOREIGN KEY (docente_id) REFERENCES docentes(docente_id),
    CONSTRAINT fk_grupo_ciclo FOREIGN KEY (ciclo_id) REFERENCES ciclos_academicos(ciclo_id)
);

-- 7. Tabla inscripciones
CREATE TABLE inscripciones (
    inscripcion_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    estudiante_id INT,
    grupo_id INT,
    nota_final NUMERIC(4,2),
    estado_materia VARCHAR(20) DEFAULT 'En Cursado',
    CONSTRAINT fk_inscripcion_estudiante FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id),
    CONSTRAINT fk_inscripcion_grupo FOREIGN KEY (grupo_id) REFERENCES grupos(grupo_id)
);

-- 8. Tabla evaluaciones
CREATE TABLE evaluaciones (
    evaluacion_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    grupo_id INT,
    nombre_evaluacion VARCHAR(100) NOT NULL,
    porcentaje NUMERIC(5,2) NOT NULL,
    fecha_evaluacion DATE NOT NULL,
    CONSTRAINT fk_evaluacion_grupo FOREIGN KEY (grupo_id) REFERENCES grupos(grupo_id)
);

-- 9. Tabla calificaciones
CREATE TABLE calificaciones (
    calificacion_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    inscripcion_id INT,
    evaluacion_id INT,
    nota NUMERIC(4,2) NOT NULL,
    CONSTRAINT fk_calificacion_inscripcion FOREIGN KEY (inscripcion_id) REFERENCES inscripciones(inscripcion_id),
    CONSTRAINT fk_calificacion_evaluacion FOREIGN KEY (evaluacion_id) REFERENCES evaluaciones(evaluacion_id)
);