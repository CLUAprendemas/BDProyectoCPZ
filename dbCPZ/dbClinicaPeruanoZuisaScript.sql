CREATE DATABASE ClinicaPeruanoSuiza;
USE ClinicaPeruanoSuiza;

-- Tabla Especialidades
CREATE TABLE Especialidades (
    idEspecialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombreEspecialidad VARCHAR(255) NOT NULL
);

-- Tabla Médicos
CREATE TABLE Medicos (
    idMedico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    DNI VARCHAR(8) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    idEspecialidad INT,
    FOREIGN KEY (idEspecialidad) REFERENCES Especialidades(idEspecialidad)
);

-- Tabla Pacientes
CREATE TABLE Pacientes (
    idPaciente INT AUTO_INCREMENT PRIMARY KEY,
    nombrePaciente VARCHAR(255) NOT NULL,
    apellidoPaciente VARCHAR(255) NOT NULL,
    DNI VARCHAR(8) NOT NULL UNIQUE,
    Edad INT NOT NULL,
    correoElectronico VARCHAR(255) NOT NULL,
    Seguro BOOLEAN NOT NULL
);

-- Tabla Horarios
CREATE TABLE Horarios (
    idHorario INT AUTO_INCREMENT PRIMARY KEY,
    hora TIME NOT NULL,
    idEspecialidad INT,
    idMedico INT,
    FOREIGN KEY (idEspecialidad) REFERENCES Especialidades(idEspecialidad),
    FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico)
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(255) NOT NULL,
    apellidoUsuario VARCHAR(255) NOT NULL,
    DNI VARCHAR(8) NOT NULL UNIQUE,
    nivelUsuario VARCHAR(50) NOT NULL,
    correoUsuario VARCHAR(255) NOT NULL UNIQUE,
    contraseña VARBINARY(8) NOT NULL
);

-- Tabla Citas
CREATE TABLE Citas (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT,
    idMedico INT,
    idEspecialidad INT,
    idHorario INT,
    fecha DATE NOT NULL,
    FOREIGN KEY (idPaciente) REFERENCES Pacientes(idPaciente),
    FOREIGN KEY (idMedico) REFERENCES Medicos(idMedico),
    FOREIGN KEY (idEspecialidad) REFERENCES Especialidades(idEspecialidad),
    FOREIGN KEY (idHorario) REFERENCES Horarios(idHorario)
);

