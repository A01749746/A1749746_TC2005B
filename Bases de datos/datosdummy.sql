USE Pokemon;

SELECT * FROM CartaPremio;

INSERT INTO Jugador (nombre, contraseña, nivel, descripcion, vestimenta, puntosExperiencia) VALUES
('beto', 'pikachu123', 5, 'Estudiante listo para ganar', 'Casual', 1500),
('fran', 'pokemon', 7, 'Experto en Pokémon', 'Gym Leader', 2200),
('gabriel', 'tarea', 8, 'gymbro', 'Breeder', 2400),
('isac', 'hola', 10, 'el mejor', 'Researcher', 3000),
('eduardo', 'notengo', 4, 'Un coordinador Pokémon', 'Contest', 1200),
('mike', 'contraseña', 6, 'best pokemon player', 'Performer', 1800),
('aldo', 'loco', 7, 'Un líder con un ingenio para inventar.', 'Inventor', 2100),
('brenda', 'buenasnoches', 3, 'Una amiga', 'School', 900),
('limon', 'comida', 6, 'Un bailarín del fuego ', 'Dancer', 1800),
('henry', 'henrrrry', 5, 'big tonka t', 'Chef', 1500);

-- datos sacados de internet
INSERT INTO Carta (nombre, descripcion, vida, daño, energia, tipo, evolucion, debilidad) VALUES
('Pikachu', 'Un Pokémon ratón eléctrico', 60, 20, 1, 'Eléctrico', 'Raichu', 'Tierra'),
('Bulbasaur', 'Un Pokémon semilla', 50, 15, 1, 'Planta', 'Ivysaur', 'Fuego'),
('Charmander', 'Un Pokémon lagartija', 50, 20, 1, 'Fuego', 'Charmeleon', 'Agua'),
('Squirtle', 'Un Pokémon tortuga', 50, 15, 1, 'Agua', 'Wartortle', 'Planta'),
('Eevee', 'Un Pokémon evolución', 40, 10, 1, 'Normal', 'Vaporeon/Jolteon/Flareon', 'Lucha'),
('Jigglypuff', 'Un Pokémon globo', 60, 20, 1, 'Normal', 'Wigglytuff', 'Acero'),
('Gengar', 'Un Pokémon sombra', 70, 30, 2, 'Fantasma', 'Ninguna', 'Siniestro'),
('Machamp', 'Un Pokémon superpoder', 90, 40, 3, 'Lucha', 'Ninguna', 'Psíquico'),
('Alakazam', 'Un Pokémon psíquico', 70, 30, 2, 'Psíquico', 'Ninguna', 'Bicho'),
('Magikarp', 'Un Pokémon pez', 30, 5, 1, 'Agua', 'Gyarados', 'Eléctrico');

-- datos sacados de internet
INSERT INTO Mazo (idJugador, nombre, descripcion, numeroCartas) VALUES
(1, 'Eléctricos de Ash', 'Un mazo centrado en Pokémon eléctricos', 10),
(2, 'Aguas Profundas', 'Un mazo centrado en Pokémon de tipo agua', 10),
(3, 'Rocas Sólidas', 'Un mazo centrado en Pokémon de tipo roca', 10),
(4, 'Eevee Evoluciones', 'Un mazo centrado en Eevee y sus evoluciones', 10),
(5, 'Brillo del Amanecer', 'Un mazo con una mezcla equilibrada de tipos', 10),
(6, 'Fuego y Pasión', 'Un mazo centrado en Pokémon de tipo fuego', 10),
(7, 'Inventos Eléctricos', 'Un mazo que incluye dispositivos ingeniosos', 10),
(8, 'Luz de Alola', 'Un mazo inspirado en Pokémon de la región de Alola', 10),
(9, 'Danza del Fuego', 'Un mazo con Pokémon de tipo fuego de Alola', 10),
(10, 'Sabores de Alola', 'Un mazo que representa la diversidad de Alola', 10);

INSERT INTO Inventario (idJugador, idMazo, idCarta) VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 8),
(4, 4, 5),
(5, 5, 2),
(6, 6, 7),
(7, 7, 1),
(8, 8, 9),
(9, 9, 7),
(10, 10, 10);

INSERT INTO Efectos (descripcion, tipoEfecto, duracion) VALUES
('Recuperación de Energía', 'Curación', 0),
('Doble Daño', 'Ataque', 1),
('Parálisis', 'Estado', 1),
('Dormir', 'Estado', 2),
('Intercambio', 'Estrategia', 0),
('Refuerzo', 'Defensa', 1),
('Evasión', 'Estrategia', 1),
('Veneno', 'Estado', 3),
('Quemadura', 'Estado', 2),
('Congelación', 'Estado', 2);

INSERT INTO Triger (idEfecto, idCarta, condicion) VALUES
(1, 1, TRUE),
(2, 3, FALSE),
(3, 4, TRUE),
(4, 5, FALSE),
(5, 2, TRUE),
(6, 6, FALSE),
(7, 7, TRUE),
(8, 8, FALSE),
(9, 9, TRUE),
(10, 10, FALSE);

INSERT INTO Partida (idJugador1, idJugador2, fechaPartida, duracion, ganador) VALUES
(1, 2, '2023-01-01 14:00:00', '00:30:00', 1),
(2, 3, '2023-01-02 16:00:00', '00:25:00', 2),
(3, 4, '2023-01-03 15:30:00', '00:45:00', 3),
(4, 5, '2023-01-04 17:00:00', '00:20:00', 4),
(5, 6, '2023-01-05 14:30:00', '00:35:00', 5),
(6, 7, '2023-01-06 18:00:00', '00:30:00', 6),
(7, 8, '2023-01-07 19:00:00', '00:40:00', 7),
(8, 9, '2023-01-08 20:00:00', '00:50:00', 8),
(9, 10, '2023-01-09 21:00:00', '00:55:00', 9),
(10, 1, '2023-01-10 22:00:00', '01:00:00', 10);


INSERT INTO Turno (idPartida, numeroTurno, idJugador, energiaUsada, pokemonUsado, daño, evolucion) VALUES
(1, 1, 1, 2, 'Pikachu', 20, ''),
(1, 2, 2, 2, 'Squirtle', 15, ''),
(2, 1, 3, 3, 'Machamp', 40, ''),
(2, 2, 4, 1, 'Eevee', 10, 'Vaporeon'),
(3, 1, 5, 2, 'Bulbasaur', 15, ''),
(3, 2, 6, 2, 'Gengar', 30, ''),
(4, 1, 7, 1, 'Pikachu', 20, ''),
(4, 2, 8, 2, 'Alakazam', 30, ''),
(5, 1, 9, 3, 'Magikarp', 5, 'Gyarados'),
(5, 2, 10, 2, 'Jigglypuff', 20, '');


INSERT INTO CartaJugada (idPartida, idCarta, idTurno, acciones) VALUES
(1, 1, 11, 'Ataque eléctrico'),
(1, 4, 12, 'Chorro de agua'),
(2, 8, 13, 'Golpe karate'),
(2, 5, 14, 'Evolución a Vaporeon'),
(3, 2, 15, 'Látigo cepa'),
(3, 7, 16, 'Hipnosis'),
(4, 1, 17, 'Impactrueno'),
(4, 9, 18, 'Psíquico'),
(5, 10, 19, 'Salpicadura'),
(5, 6, 20, 'Canto');

INSERT INTO CartaEnMano (idJugador, idMazo, energia, visibilidad, tamaño) VALUES
(1, 1, 3, TRUE, 5),
(2, 2, 2, TRUE, 5),
(3, 3, 4, TRUE, 5),
(4, 4, 1, TRUE, 5),
(5, 5, 3, TRUE, 5),
(6, 6, 2, TRUE, 5),
(7, 7, 3, TRUE, 5),
(8, 8, 4, TRUE, 5),
(9, 9, 2, TRUE, 5),
(10, 10, 1, TRUE, 5);

INSERT INTO CartaPremio (idJugador, idPartida, idCarta, obtenida) VALUES
(1, 1, 1, FALSE),
(2, 1, 4, FALSE),
(3, 2, 8, FALSE),
(4, 2, 5, FALSE),
(5, 3, 2, FALSE),
(6, 3, 7, FALSE),
(7, 4, 1, FALSE),
(8, 4, 9, FALSE),
(9, 5, 10, FALSE),
(10, 5, 6, FALSE);
