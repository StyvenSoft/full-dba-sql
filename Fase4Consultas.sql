SELECT * FROM paciente;

-- Dado un número de cama, conocer los datos del paciente que se encuentra ACTUALMENTE all�.  
SELECT * FROM cama JOIN ingreso_uci ON (cama.id_cama = ingreso_uci.cama_id_cama)
WHERE cama.id_cama = 1;

-- Dado una identificación de un paciente, conocer sus motivos de ingreso a la UCI.  
SELECT paciente.nombre_paciente, paciente.num_documento, motivo_ingreso 
FROM ingreso_uci JOIN paciente ON (ingreso_uci.id_ingreso = paciente.id_paciente)
WHERE paciente.num_documento = 10755223;

-- Dado una identificación de un paciente, conocer los ex�menes realizados. 
SELECT * FROM paciente, examen
WHERE paciente.num_documento = 10755223;

-- Dada una sala, conocer el médico que la dirige 
SELECT personal_medico.* FROM personal_medico
INNER JOIN sala_asignada
ON personal_medico.id_persona = sala_asignada.sala_uci_id_sala
WHERE sala_asignada.id_sala_asignada = 2;

-- Dado el nombre de un medicamente, conocer su costo 
SELECT costo_medicamento FROM medicamento
WHERE nombre_medicamento = 'Omeprazol';

-- Conocer el número de pacientes que se encuentran en UCI y en cada sala
SELECT COUNT(*) AS catidad_pacientes
FROM paciente;

-- Conocer el total de ingresos de un mes dado 
SELECT COUNT(*) AS total_ingresos_mes FROM ingreso_uci
WHERE SUBSTR(to_char(fecha_ingreso),4,2) = 10;

--- Dado una identificación de un médico, conocer sus datos personales y salario
SELECT * FROM personal_medico
WHERE num_documento = 10553322;

--- Dado una identificación de una enfermera, conocer sus datos personales y salario. 
SELECT * FROM personal_medico
WHERE num_documento = 1136585;

SELECT COUNT(*) AS cantidad_camas
FROM cama
WHERE cama.estado_cama = 1;

/** Dada una sala, conocer cuántas camas están disponibles / ocupada
 estado_cama = 0 (disponble) estado_cama = 1 (Ocupada) */
SELECT COUNT(*) AS camas_disponibles FROM cama 
JOIN sala_uci 
ON (cama.id_cama = sala_uci.id_sala)
WHERE cama.estado_cama = 0 
AND cama.sala_uci_id_sala = 2;







