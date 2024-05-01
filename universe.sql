CREATE DATABASE universe;

\connect universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    size INT NOT NULL,
    has_black_hole BOOLEAN NOT NULL,
    type VARCHAR(50) NOT NULL,
    age_in_years INT NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    galaxy_id INT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id),
    brightness NUMERIC NOT NULL,
    temperature INT NOT NULL,
    is_main_sequence BOOLEAN NOT NULL,
    type VARCHAR(50) NOT NULL,
    age_in_years INT NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    star_id INT,
    FOREIGN KEY (star_id) REFERENCES star(star_id),
    radius_km INT NOT NULL,
    distance_from_star_km NUMERIC NOT NULL,
    has_atmosphere BOOLEAN NOT NULL,
    type VARCHAR(50) NOT NULL,
    age_in_years INT NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    planet_id INT,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id),
    radius_km INT NOT NULL,
    distance_from_planet_km NUMERIC NOT NULL,
    is_inhabited BOOLEAN NOT NULL,
    type VARCHAR(50) NOT NULL,
    age_in_years INT NOT NULL
);

CREATE TABLE description (
    description_id SERIAL PRIMARY KEY,
    galaxy_id INT,
    star_id INT,
    planet_id INT,
    moon_id INT,
    description_text TEXT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id),
    FOREIGN KEY (star_id) REFERENCES star(star_id),
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id),
    FOREIGN KEY (moon_id) REFERENCES moon(moon_id),
    importance VARCHAR(50) NOT NULL UNIQUE,
    extra_importance VARCHAR(50) NOT NULL
);

-- Insertando datos en la tabla galaxy
INSERT INTO galaxy (name, size, has_black_hole, type, age_in_years)
VALUES 
    ('Andromeda', 10, true, 'Spiral', 13),
    ('Milky Way', 20, false, 'Barred Spiral', 13),
    ('Messier 87', 15, true, 'Elliptical', 14),
    ('Triangulum', 70, false, 'Spiral', 12),
    ('Centaurus A', 80, true, 'Elliptical', 15),
    ('Whirlpool', 90, false, 'Spiral', 12);

-- Insertando datos en la tabla star
INSERT INTO star (name, galaxy_id, brightness, temperature, is_main_sequence, type, age_in_years)
VALUES 
    ('Sun', 2, 1.0, 5778, true, 'G-type', 46),
    ('Proxima Centauri', 2, 0.17, 3050, true, 'Red dwarf', 47),
    ('Alpha Centauri A', 2, 1.52, 5790, true, 'G-type', 60),
    ('Alpha Centauri B', 2, 0.45, 5260, true, 'K-type', 60),
    ('Betelgeuse', 1, 5000, 3500, false, 'Red supergiant', 80),
    ('Sirius', 2, 25.4, 9940, true, 'A-type', 23);

-- Insertando datos en la tabla planet
INSERT INTO planet (name, star_id, radius_km, distance_from_star_km, has_atmosphere, type, age_in_years)
VALUES 
    ('Mercury', 1, 2439.7, 57, false, 'Terrestrial', 46),
    ('Venus', 1, 6051.8, 10, true, 'Terrestrial', 46),
    ('Earth', 1, 6371.0, 14, true, 'Terrestrial', 46),
    ('Mars', 1, 3389.5, 22, false, 'Terrestrial', 46),
    ('Jupiter', 1, 6911, 77, true, 'Gas giant', 46),
    ('Saturn', 1, 5832, 14, true, 'Gas giant', 46),
    ('Uranus', 1, 25362, 28, true, 'Ice giant', 46),
    ('Neptune', 1, 24622, 44, true, 'Ice giant', 46),
    ('Pluto', 1, 1188.3, 59, false, 'Dwarf planet', 46),
    ('Kepler-22b', 2, 2000, 21, true, 'Exoplanet', 46),
    ('HD 209458 b', 2, 15500, 64781, true, 'Exoplanet', 46),
    ('WASP-12b', 2, 15000, 3079, true, 'Exoplanet', 46);

-- Insertando datos en la tabla moon
INSERT INTO moon (name, planet_id, radius_km, distance_from_planet_km, is_inhabited, type, age_in_years)
VALUES 
    ('Luna', 3, 1737.5, 38440, false, 'Terrestrial', 46),
    ('Phobos', 4, 11.267, 9377, false, 'Terrestrial', 46),
    ('Deimos', 4, 6.2, 2343.2, false, 'Terrestrial', 46),
    ('Europa', 5, 1560.8, 67134, false, 'Terrestrial', 46),
    ('Ganymede', 5, 2634.1, 10412, false, 'Terrestrial', 46),
    ('Callisto', 5, 2410.3, 12702, false, 'Terrestrial', 46),
    ('Titan', 6, 2575, 12870, false, 'Terrestrial', 46),
    ('Io', 5, 11.6, 4700, false, 'Terrestrial', 46),
    ('Enceladus', 6, 252.1, 8037, false, 'Terrestrial', 46),
    ('Triton', 8, 1353.4, 3759, false, 'Terrestrial', 46),
    ('Charon', 9, 603.6, 191, false, 'Terrestrial', 46),
    ('Phoebe', 7, 106.6, 12000, false, 'Terrestrial', 46),
    ('Europa2', 5, 1560.8, 634, false, 'Terrestrial', 46),
    ('Ganymede2', 5, 2634.1, 1412, false, 'Terrestrial', 46),
    ('Callisto2', 5, 2410.3, 18822, false, 'Terrestrial', 46),
    ('Titan2', 6, 2575, 1870, false, 'Terrestrial', 46),
    ('Io2', 5, 1821.6, 400, false, 'Terrestrial', 46),
    ('Enceladus2', 6, 252.1, 2337, false, 'Terrestrial', 46),
    ('Triton2', 8, 1353.4, 3759, false, 'Terrestrial', 46),
    ('Charon2', 9, 603.6, 191, false, 'Terrestrial', 46),
    ('Phoebe2', 7, 106.6, 12900, false, 'Terrestrial', 46),
    ('Dione2', 6, 561.4, 396, false, 'Terrestrial', 46),
    ('Rhea2', 6, 763.8, 108, false, 'Terrestrial', 46);

INSERT INTO description (galaxy_id, star_id, planet_id, moon_id, description_text, importance, extra_importance)
VALUES 
    (5, 5, 10, 35, 'The Andromeda galaxy is the closest spiral galaxy to the Milky Way.', 'High', 'Research interest'),
    (2, 2, 11, 35, 'The Sun is the star at the center of the Solar System.', 'Medium', 'Observation point'),
    (3, 1, 4, 35, 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury.', 'Low', 'Exploration target');
