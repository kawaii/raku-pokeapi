-- version 0.1 of the p6-pokeapi database schema
-- very much subject to change during development

CREATE TABLE IF NOT EXISTS pokeapi_pokedex (
    id serial,
    species text,
    category text,
    forms jsonb,
    types jsonb,
    "gender-ratio" jsonb,
    evolution jsonb,
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
