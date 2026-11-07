
-- Índice para búsqueda rápida de estudiantes por carnet
CREATE INDEX IF NOT EXISTS idx_estudiantes_carnet 
ON estudiantes(carnet);

-- Índices en claves foráneas de tablas transaccionales masivas
CREATE INDEX IF NOT EXISTS idx_inscripciones_estudiante 
ON inscripciones(estudiante_id);

CREATE INDEX IF NOT EXISTS idx_inscripciones_grupo 
ON inscripciones(grupo_id);

CREATE INDEX IF NOT EXISTS idx_calificaciones_inscripcion 
ON calificaciones(inscripcion_id);

CREATE INDEX IF NOT EXISTS idx_calificaciones_evaluacion 
ON calificaciones(evaluacion_id);

-- Índice para agilizar la búsqueda de evaluaciones por grupo
CREATE INDEX IF NOT EXISTS idx_evaluaciones_grupo 
ON evaluaciones(grupo_id);


-- 2. CREACIÓN DE TABLA DE BITÁCORAS (LOGS DE AUDITORÍA)
-- Sirve para registrar las acciones críticas o modificaciones de notas en el sistema

CREATE TABLE IF NOT EXISTS bitacora_sistema (
    bitacora_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario_bd VARCHAR(50) NOT NULL,
    tabla_afectada VARCHAR(50) NOT NULL,
    operacion VARCHAR(20) NOT NULL, -- INSERT, UPDATE, DELETE
    detalles TEXT,
    fecha_movimiento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Índice para consultar rápidamente las bitácoras por fecha o tabla
CREATE INDEX IF NOT EXISTS idx_bitacora_fecha 
ON bitacora_sistema(fecha_movimiento);


-- 3. EJEMPLO DE FUNCIÓN Y TRIGGER PARA AUDITAR CAMBIOS EN CALIFICACIONES
-- Esto automatiza el registro en la bitácora cada vez que se modifique una nota

CREATE OR REPLACE FUNCTION registrar_cambio_calificacion() 
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
        INSERT INTO bitacora_sistema (usuario_bd, tabla_afectada, operacion, detalles)
        VALUES (
            current_user, 
            'calificaciones', 
            'UPDATE', 
            CONCAT('Calificacion_id: ', OLD.calificacion_id, ' | Nota anterior: ', OLD.nota, ' | Nota nueva: ', NEW.nota)
        );
        RETURN NEW;
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO bitacora_sistema (usuario_bd, tabla_afectada, operacion, detalles)
        VALUES (
            current_user, 
            'calificaciones', 
            'DELETE', 
            CONCAT('Calificacion_id: ', OLD.calificacion_id, ' eliminada con nota: ', OLD.nota)
        );
        RETURN OLD;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Asociación del Trigger a la tabla calificaciones
DROP TRIGGER IF EXISTS trigger_auditoria_calificaciones ON calificaciones;
CREATE TRIGGER trigger_auditoria_calificaciones
AFTER UPDATE OR DELETE ON calificaciones
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio_calificacion();