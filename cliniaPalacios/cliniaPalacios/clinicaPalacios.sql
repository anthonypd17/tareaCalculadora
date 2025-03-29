Create database clinicaPalacios
use clinicaPalacios
go 
CREATE TABLE Medicos (
    id_medico INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad varchar(100),

);
INSERT INTO Medicos(especialidad)
VALUES
    ('Cardiología'),   
    ('Pediatría'),    
    ('Dermatología');  
CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    edad AS DATEDIFF(YEAR, fecha_nacimiento, GETDATE()),
    telefono VARCHAR(18) NOT NULL,
);

CREATE TABLE Consultas (
    id_consulta INT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    fecha_atencion DATE NOT NULL,
    hora_atencion TIME NOT NULL,
    consultorio INT CHECK (consultorio BETWEEN 1 AND 5),
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);