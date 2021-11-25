-- Crear las tablas con su llave primaria
CREATE TABLE alergia (
    id_alergias INTEGER NOT NULL,
    paciente_id_paciente INTEGER NOT NULL,
    medicamento_id_medicamento INTEGER NOT NULL,
    CONSTRAINT alergias_pk PRIMARY KEY (id_alergias)
);

CREATE TABLE cama (
    id_cama INTEGER NOT NULL,
    num_cama VARCHAR2(20) NOT NULL,
    estado_cama CHAR(1) NOT NULL,
    sala_uci_id_sala INTEGER NOT NULL,
    CONSTRAINT cama_pk PRIMARY KEY (id_cama)
);

CREATE TABLE examen (
    id_examen INTEGER NOT NULL,
    fecha_examen TIMESTAMP NOT NULL,
    nombre_examen VARCHAR2(150) NOT NULL,
    costo_examen NUMBER(10) NOT NULL,
    resultado_examen VARCHAR2(500) NOT NULL,
    paciente_id_paciente INTEGER NOT NULL,
    CONSTRAINT examen_pk PRIMARY KEY (id_examen)
);

CREATE TABLE ingreso_uci (
    id_ingreso INTEGER NOT NULL,
    motivo_ingreso VARCHAR2(500) NOT NULL,
    razon_ingreso VARCHAR2(100) NOT NULL,
    estado_gravedad VARCHAR2(500) NOT NULL,
    fecha_ingreso TIMESTAMP NOT NULL,
    nombre_contacto VARCHAR2(100),
    telefono_contacto VARCHAR2(10),
    paciente_id_paciente INTEGER NOT NULL,
    cama_id_cama INTEGER NOT NULL,
    CONSTRAINT ingreso_uci_pk PRIMARY KEY (id_ingreso)
);

CREATE TABLE medicamento (
    id_medicamento INTEGER NOT NULL,
    nombre_medicamento VARCHAR2(100) NOT NULL,
    codigo_medicamento VARCHAR2(20) NOT NULL,
    costo_medicamento NUMBER(10) NOT NULL,
    CONSTRAINT medicamento_pk PRIMARY KEY (id_medicamento)
);

CREATE TABLE medicamento_suministrado (
    id_med_suministrado INTEGER NOT NULL,
    cantidad_dosis NUMBER(38, 2) NOT NULL,
    medicamento_id_medicamento INTEGER NOT NULL,
    personal_medico_id_persona INTEGER NOT NULL,
    CONSTRAINT medicamento_suministrado_pk PRIMARY KEY (id_med_suministrado)
);

CREATE TABLE paciente (
    id_paciente INTEGER NOT NULL,
    tipo_documento CHAR(2) NOT NULL,
    num_documento VARCHAR2(15) NOT NULL,
    nombre_paciente VARCHAR2(100) NOT NULL,
    apellido_paciente VARCHAR2(100) NOT NULL,
    CONSTRAINT paciente_pk PRIMARY KEY (id_paciente)
);

CREATE TABLE personal_medico (
    id_persona INTEGER NOT NULL,
    tipo_documento CHAR(2) NOT NULL,
    num_documento VARCHAR2(15) NOT NULL,
    nombre_persona VARCHAR2(100) NOT NULL,
    apellido_persona VARCHAR2(100) NOT NULL,
    fecha_contrato DATE NOT NULL,
    genero_persona CHAR(1),
    fecha_nacimiento DATE NOT NULL,
    telefono_contacto NUMBER(10),
    salario_persona NUMBER(10) NOT NULL,
    titulo_persona VARCHAR2(30),
    anios_experiencia NUMBER(3),
    CONSTRAINT personal_medico_pk PRIMARY KEY (id_persona)
);

CREATE TABLE sala_asignada (
    id_sala_asignada INTEGER NOT NULL,
    personal_medico_id_persona INTEGER NOT NULL,
    sala_uci_id_sala INTEGER NOT NULL,
    CONSTRAINT sala_asignada_pk PRIMARY KEY (id_sala_asignada)
);

CREATE TABLE sala_uci (
    id_sala INTEGER NOT NULL,
    num_consecutivo NUMBER(10) NOT NULL,
    descripcion VARCHAR2(255),
    CONSTRAINT sala_uci_pk PRIMARY KEY (id_sala)
);

CREATE TABLE salida_uci (
    id_salida INTEGER NOT NULL,
    motivo_salida VARCHAR2(500) NOT NULL,
    fecha_salida TIMESTAMP NOT NULL,
    costo_total_estadia NUMBER(10) NOT NULL,
    paciente_id_paciente INTEGER NOT NULL,
    CONSTRAINT salida_uci_pk PRIMARY KEY (id_salida)
);

-- Crear las relaciones de las tablas con su llave foranea
ALTER TABLE alergia
    ADD CONSTRAINT alergia_medicamento_fk FOREIGN KEY (medicamento_id_medicamento)
    REFERENCES medicamento (id_medicamento);

ALTER TABLE alergia
    ADD CONSTRAINT alergia_paciente_fk FOREIGN KEY (paciente_id_paciente)
    REFERENCES paciente (id_paciente);

ALTER TABLE cama
    ADD CONSTRAINT cama_sala_uci_fk FOREIGN KEY (sala_uci_id_sala)
    REFERENCES sala_uci (id_sala);

ALTER TABLE examen
    ADD CONSTRAINT examen_paciente_fk FOREIGN KEY (paciente_id_paciente)
    REFERENCES paciente (id_paciente);

ALTER TABLE ingreso_uci
    ADD CONSTRAINT ingreso_uci_cama_fk FOREIGN KEY (cama_id_cama)
    REFERENCES cama (id_cama);
    
ALTER TABLE ingreso_uci
    ADD CONSTRAINT ingreso_uci_paciente_fk FOREIGN KEY (paciente_id_paciente)
    REFERENCES paciente (id_paciente);
        
ALTER TABLE medicamento_suministrado
    ADD CONSTRAINT medic_suministrado_medic_fk FOREIGN KEY (medicamento_id_medicamento)
    REFERENCES medicamento (id_medicamento);
 
ALTER TABLE medicamento_suministrado
    ADD CONSTRAINT medic_suministrado_persona_fk FOREIGN KEY (personal_medico_id_persona)
    REFERENCES personal_medico (id_persona);
    
ALTER TABLE sala_asignada
    ADD CONSTRAINT sala_asig_personal_medico_fk FOREIGN KEY (personal_medico_id_persona)
    REFERENCES personal_medico (id_persona);
    
ALTER TABLE sala_asignada
    ADD CONSTRAINT sala_asignada_sala_uci_fk FOREIGN KEY (sala_uci_id_sala)
    REFERENCES sala_uci (id_sala);

ALTER TABLE salida_uci
    ADD CONSTRAINT salida_uci_paciente_fk FOREIGN KEY (paciente_id_paciente)
    REFERENCES paciente (id_paciente);
