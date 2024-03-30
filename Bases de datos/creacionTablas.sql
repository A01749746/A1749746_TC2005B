CREATE DATABASE IF NOT EXISTS Pokemon;
USE Pokemon;

-- Jugador
CREATE TABLE Jugador (
    idJugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    contraseña VARCHAR(50) NOT NULL,
    nivel INT DEFAULT 1,
    descripcion TEXT,
    vestimenta VARCHAR(50),
    puntosExperiencia BIGINT DEFAULT 0
);

-- Carta
CREATE TABLE Carta (
    idCarta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    vida INT,
    daño INT,
    energia INT,
    tipo VARCHAR(50),
    evolucion VARCHAR(50),
    debilidad VARCHAR(50)
);

-- Mazo
CREATE TABLE Mazo (
    idMazo INT AUTO_INCREMENT PRIMARY KEY,
    idJugador INT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    numeroCartas INT DEFAULT 0,
    FOREIGN KEY (idJugador) REFERENCES Jugador(idJugador)
);

-- Inventario
CREATE TABLE Inventario (
    idInventario INT AUTO_INCREMENT PRIMARY KEY,
    idJugador INT,
    idMazo INT,
    idCarta INT,
    FOREIGN KEY (idJugador) REFERENCES Jugador(idJugador),
    FOREIGN KEY (idMazo) REFERENCES Mazo(idMazo),
    FOREIGN KEY (idCarta) REFERENCES Carta(idCarta)
);

-- Efectos
CREATE TABLE Efectos (
    idEfecto INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT,
    tipoEfecto VARCHAR(50),
    duracion INT
);

-- Trigger sin una g porque no permite
CREATE TABLE Triger (
    idTrigger INT AUTO_INCREMENT PRIMARY KEY,
    idEfecto INT,
    idCarta INT,
    condicion BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idEfecto) REFERENCES Efectos(idEfecto),
    FOREIGN KEY (idCarta) REFERENCES Carta(idCarta)
);


-- Partida
CREATE TABLE Partida (
    idPartida INT AUTO_INCREMENT PRIMARY KEY,
    idJugador1 INT,
    idJugador2 INT,
    fechaPartida DATETIME,
    duracion TIME,
    ganador INT,
    FOREIGN KEY (idJugador1) REFERENCES Jugador(idJugador),
    FOREIGN KEY (idJugador2) REFERENCES Jugador(idJugador)
);

-- Turno
CREATE TABLE Turno (
    idTurno INT AUTO_INCREMENT PRIMARY KEY,
    idPartida INT,
    numeroTurno INT,
    idJugador INT,
    energiaUsada INT,
    pokemonUsado VARCHAR(50),
    daño INT,
    evolucion VARCHAR(50),
    FOREIGN KEY (idJugador) REFERENCES Jugador(idJugador),
    FOREIGN KEY (idPartida) REFERENCES Partida(idPartida)
);

-- CartaJugada
CREATE TABLE CartaJugada (
    idCartaJugada INT AUTO_INCREMENT PRIMARY KEY,
    idPartida INT,
    idCarta INT,
    idTurno INT,
    acciones TEXT,
    FOREIGN KEY (idCarta) REFERENCES Carta(idCarta),
    FOREIGN KEY (idTurno) REFERENCES Turno(idTurno)
);


-- CartaEnMano
CREATE TABLE CartaEnMano (
    idCartaEnMano INT AUTO_INCREMENT PRIMARY KEY,
    idJugador INT,
    idMazo INT,
    energia INT,
    visibilidad BOOLEAN DEFAULT TRUE,
    tamaño INT,
    FOREIGN KEY (idJugador) REFERENCES Jugador(idJugador),
    FOREIGN KEY (idMazo) REFERENCES Mazo(idMazo)
);

-- CartaPremio
CREATE TABLE CartaPremio (
    idCartaPremio INT AUTO_INCREMENT PRIMARY KEY,
    idJugador INT,
    idPartida INT,
    idCarta INT,
    obtenida BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idJugador) REFERENCES Jugador(idJugador),
    FOREIGN KEY (idPartida) REFERENCES Partida(idPartida),
    FOREIGN KEY (idCarta) REFERENCES Carta(idCarta)
);
