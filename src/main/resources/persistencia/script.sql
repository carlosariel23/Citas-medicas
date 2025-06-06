-- Crear base de datos
CREATE DATABASE IF NOT EXISTS CitasMedicas;
USE CitasMedicas;

-- Tabla de especialidades médicas
CREATE TABLE Especialidad (
    IDEspecialidad INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla de doctores
CREATE TABLE Doctor (
    IDDoctor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    IDEspecialidad INT,
    FOREIGN KEY (IDEspecialidad) REFERENCES Especialidad(IDEspecialidad)
);

-- Tabla de pacientes
CREATE TABLE Paciente (
    IDPaciente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    DNI VARCHAR(20) NOT NULL UNIQUE,
    FechaNacimiento DATE
);

-- Tabla de horarios disponibles
CREATE TABLE Horario (
    IDHorario INT AUTO_INCREMENT PRIMARY KEY,
    IDDoctor INT,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (IDDoctor) REFERENCES Doctor(IDDoctor)
);

-- Tabla de citas médicas
CREATE TABLE Cita (
    IDCita INT AUTO_INCREMENT PRIMARY KEY,
    IDPaciente INT,
    IDHorario INT,
    Motivo TEXT,
    Estado ENUM('Pendiente', 'Atendida', 'Cancelada') DEFAULT 'Pendiente',
    FOREIGN KEY (IDPaciente) REFERENCES Paciente(IDPaciente),
    FOREIGN KEY (IDHorario) REFERENCES Horario(IDHorario)
);
