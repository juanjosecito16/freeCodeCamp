CREATE DATABASE universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  galaxy_type TEXT NOT NULL,
  has_black_hole BOOLEAN NOT NULL,
  age_in_millions_of_years INT,
  size INT
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  star_type TEXT NOT NULL,
  mass NUMERIC (10,2) NOT NULL,
  visible BOOLEAN NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id)
);


CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  has_life BOOLEAN NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  diameter_km INT,
  orbital_period NUMERIC (6, 2),
  star_id INT REFERENCES star(star_id)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR (100) NOT NULL UNIQUE,
  radius INT,
  is_rocky BOOLEAN NOT NULL,
  planet_id INT REFERENCES planet(planet_id)
);

CREATE TABLE exploration_mission (
  exploration_mission_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  duration_in_days INT NOT NULL,
  is_manned BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, galaxy_type, has_black_hole, age_in_millions_of_years, size) 
VALUES  ('Vía Láctea', 'Espiral', TRUE, 13600, 100000),
        ('Andrómeda', 'Espiral', TRUE, 14000, 110000),
        ('Triángulo', 'Espiral', FALSE, 12000, 60000), 
        ('Sombrero', 'Lenticular', TRUE, 10000, 50000),
        ('Messier 87', 'Elíptica', TRUE, 13000, 130000),
        ('Canis Major', 'Irregular', FALSE, 9000, 40000);

INSERT INTO star (name, star_type, mass, visible, galaxy_id) 
VALUES  ('Sol', 'Enana amarilla', 1.00, TRUE, 1),
        ('Sirius', 'Secuencia principal', 2.02, TRUE, 1),
        ('Betelgeuse', 'Supergigante roja', 20.0, TRUE, 1),
        ('Proxima Centauri', 'Enana roja', 0.12, FALSE, 1),
        ('Vega', 'Blanca azulada', 2.1, TRUE, 2),
        ('Rigel', 'Supergigante azul', 21.0, TRUE, 2);

INSERT INTO planet (name, has_life, is_spherical, diameter_km, orbital_period, star_id)
VALUES  ('Tierra', TRUE, TRUE, 12742, 3.1, 1),
        ('Marte', FALSE, TRUE, 6779, 6.0, 1),
        ('Júpiter', FALSE, TRUE, 139820, 4.1, 1),
        ('Saturno', FALSE, TRUE, 116460, 1.1, 1),
        ('Mercurio', FALSE, TRUE, 4879, 1.1, 1),
        ('Venus', FALSE, TRUE, 12104, 1.1, 1),
        ('Kepler-22b', FALSE, TRUE, 24000, 6.0, 2),
        ('Gliese 581g', FALSE, TRUE, 14000, 3.0, 4),
        ('HD 209458b', FALSE, TRUE, 143000, 3.5, 2),
        ('Tau Ceti f', FALSE, TRUE, 16000, 5.0, 2),
        ('LHS 1140b', FALSE, TRUE, 15000, 2.7, 3),
        ('TRAPPIST-1d', FALSE, TRUE, 12000, 4.05, 3);

INSERT INTO moon (name, radius, is_rocky, planet_id) 
VALUES  ('Luna', 1737, TRUE, 1),
        ('Fobos', 11, TRUE, 2),
        ('Deimos', 6, TRUE, 2),
        ('Ío', 1821, TRUE, 3),
        ('Europa', 1561, TRUE, 3),
        ('Ganimedes', 2634, TRUE, 3),
        ('Calisto', 2410, TRUE, 3),
        ('Titán', 2575, TRUE, 4),
        ('Encélado', 252, TRUE, 4),
        ('Rhea', 764, TRUE, 4),
        ('Mimas', 198, TRUE, 4),
        ('Dione', 561, TRUE, 4),
        ('Tethys', 531, TRUE, 4),
        ('Iapetus', 734, TRUE, 4),
        ('Miranda', 235, TRUE, 5),
        ('Tritón', 1353, TRUE, 5),
        ('Charon', 606, TRUE, 5),
        ('Ariel', 578, TRUE, 5),
        ('Umbriel', 584, TRUE, 5),
        ('Oberón', 761, TRUE, 5);

INSERT INTO exploration_mission (name, description, duration_in_days, is_manned) 
VALUES  ('Apollo 11', 'Primera misión tripulada a la Luna', 8, TRUE),
        ('Voyager 1', 'Misión no tripulada de exploración interestelar', 10000, FALSE),
        ('Curiosity', 'Exploración de Marte con rover', 3000, FALSE);
