-- ==========================================================
-- Creación de la Base de Datos
drop database if exists colegio;
CREATE DATABASE IF NOT EXISTS colegio;
-- ==========================================================


-- ==========================================================
-- Seleccionar la Base de Datos
use colegio;
-- ==========================================================


-- ==========================================================
-- Crear las Tablas: cargo
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    contra VARCHAR(100) NOT NULL
);

CREATE TABLE estudiante (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    dni INT(8),
    edad INT,
    grado VARCHAR(20),
    responsable VARCHAR(100)
);
CREATE TABLE docente (
    id_docente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido varchar(50),
    dni int(8)
);

CREATE TABLE salon (
    id_salon INT AUTO_INCREMENT PRIMARY KEY,
    numero INT,
    capacidad INT,
    ubicacion VARCHAR(100)
);

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    anio INT,
    horas int
);

CREATE TABLE horario (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    id_salon int,
    id_docente int,
    dia_semana VARCHAR(10),
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (id_salon) REFERENCES salon(id_salon),
    FOREIGN KEY (id_docente) REFERENCES docente(id_docente)
);

CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_horario int,
    id_estudiante INT,
    id_usuario INT,
    fecha_matricula DATE,
    otra_informacion TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    FOREIGN KEY (id_horario) REFERENCES horario(id_horario)
);
-- ==========================================================


-- ==========================================================
insert into usuario (nombre,correo,contra) values ('Jorge','jorge@gmail.com','1234');
insert into usuario (nombre,correo,contra) values ('Victor','victor@gmail.com','1234');
insert into usuario (nombre,correo,contra) values ('Edgar','edgar@gmail.com','1234');
insert into usuario (nombre,correo,contra) values ('Alex','alex@gmail.com','1234');
insert into usuario (nombre,correo,contra) values ('Xiomara','xiomara@gmail.com','1234');


insert into curso (nombre,anio,horas) values ('Matematica','1','1');