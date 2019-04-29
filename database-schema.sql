-- version 0.5 of the p6-pokeapi database schema
-- very much subject to change during development

CREATE TABLE IF NOT EXISTS pokeapi_pokedex (
    id serial,
    species text UNIQUE,
    category text,
    forms jsonb,
    types jsonb,
    "gender-ratio" jsonb,
    height jsonb,
    weight jsonb,
    "mega-stone" jsonb,
    "catch-rate" integer,
    "pokedex-colours" jsonb,
    "base-statistics" jsonb,
    abilities jsonb,
    "hidden-abilities" jsonb,
    "levelling-rate" text,
    "base-friendship" integer,
    "regional-ids" jsonb,
    "egg-groups" jsonb,
    "hatch-time" int4range,
    PRIMARY KEY (id, species)
);

CREATE TABLE IF NOT EXISTS pokeapi_evolutions (
    species text,
    evolution text,
    form text DEFAULT NULL,
    condition jsonb,
    FOREIGN KEY (species) REFERENCES pokeapi_pokedex(species),
    FOREIGN KEY (evolution) REFERENCES pokeapi_pokedex(species),
    PRIMARY KEY (species, evolution, form)
);

CREATE TABLE IF NOT EXISTS pokeapi_natures (
    nature text,
    "increased-stat" text,
    "decreased-stat" text,
    "favorite-flavor" text,
    "disliked-flavor" text,
    PRIMARY KEY (nature)
);

INSERT INTO pokeapi_natures (nature, "increased-stat", "decreased-stat", "favorite-flavor", "disliked-flavor")
VALUES ('Hardy', NULL, NULL, NULL, NULL),
       ('Lonely', 'attack', 'defence', 'Spicy', 'Sour'),
       ('Brave', 'attack', 'speed', 'Spicy', 'Sweet'),
       ('Adamant', 'attack', 'special-attack', 'Spicy', 'Dry'),
       ('Naughty', 'attack', 'special-defence', 'Spicy', 'Bitter'),
       ('Bold', 'defence', 'attack', 'Sour', 'Spicy'),
       ('Docile', NULL, NULL, NULL, NULL),
       ('Relaxed', 'defence', 'speed', 'Sour', 'Sweet'),
       ('Impish', 'defence', 'special-attack', 'Sour', 'Dry'),
       ('Lax', 'defence', 'special-defence', 'Sour', 'Bitter'),
       ('Timid', 'speed', 'attack', 'Sweet', 'Spicy'),
       ('Hasty', 'speed', 'defence', 'Sweet', 'Sour'),
       ('Serious', NULL, NULL, NULL, NULL),
       ('Jolly', 'speed', 'special-attack', 'Sweet', 'Dry'),
       ('Naive', 'speed', 'special-defence', 'Sweet', 'Bitter'),
       ('Modest', 'special-attack', 'attack', 'Dry', 'Spicy'),
       ('Mild', 'special-attack', 'defence', 'Dry', 'Sour'),
       ('Quiet', 'special-attack', 'speed', 'Dry', 'Sweet'),
       ('Bashful', NULL, NULL, NULL, NULL),
       ('Rash', 'special-attack', 'special-defence', 'Dry', 'Bitter'),
       ('Calm', 'special-defence', 'attack', 'Bitter', 'Spicy'),
       ('Gentle', 'special-defence', 'defence', 'Bitter', 'Sour'),
       ('Sassy', 'special-defence', 'speed', 'Bitter', 'Sweet'),
       ('Careful', 'special-defence', 'special-attack', 'Bitter', 'Dry'),
       ('Quirky', NULL, NULL, NULL, NULL);

CREATE TABLE IF NOT EXISTS pokeapi_moves (
    id serial,
    name text,
    description text,
    type text,
    category text,
    contest text,
    parameters jsonb,
    "power-points" integer,
    power integer,
    accuracy integer,
    priority integer,
    PRIMARY KEY (id, name)
);
