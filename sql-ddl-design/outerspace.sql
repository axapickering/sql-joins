CREATE TABLE stars (
    name TEXT PRIMARY KEY,
    temp TEXT --Specify unit in name don't force unit. Use Float
        CHECK (temp LIKE '%K')
);

CREATE TABLE planets (
    name TEXT PRIMARY KEY,
    orbit_period FLOAT NOT NULL,
    star TEXT NOT NULL REFERENCES stars
);

CREATE TABLE moons (
    name TEXT PRIMARY KEY,
    planet TEXT REFERENCES planets --NOT NULL
);

INSERT INTO stars (name, temp) VALUES
    ('The Sun', '5800°K'),
    ('Proxima Centauri','3042°K'),
    ('Gliese 876','3192°K');

INSERT INTO planets (name, orbit_period, star) VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b',0.236, 'Gliese 876');

INSERT INTO moons (name, planet) VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');

SELECT planets.name, star, COUNT(moons)
FROM planets JOIN stars ON planets.star = stars.name
LEFT JOIN moons ON moons.planet = planets.name
GROUP BY planets.name
ORDER BY planets.name;