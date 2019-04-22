-- version 0.2 of the p6-pokeapi database schema
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
    color jsonb,
    "base-statistics" jsonb,
    abilities jsonb,
    "hidden-abilities" jsonb,
    "levelling-rate" text,
    "base-friendship" integer,
    "regional-dex" jsonb,
    "egg-groups" jsonb,
    "hatch-time" integer,
    PRIMARY KEY (id, species)
);

CREATE TABLE IF NOT EXISTS pokeapi_evolutions (
    species text,
    evolution text,
    criteria jsonb,
    FOREIGN KEY (species) REFERENCES pokeapi_pokedex(species),
    FOREIGN KEY (evolution) REFERENCES pokeapi_pokedex(species),
    PRIMARY KEY (species, evolution)
);

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
