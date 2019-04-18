CREATE TABLE IF NOT EXISTS pokeapi_pokedex (
    id serial,
    species text,
    category text,
    forms jsonb,
    types jsonb,
    "gender-ratio" jsonb,
    lineage jsonb,
    height jsonb,
    weight jsonb,
    "catch-rate" integer,
    color jsonb,
    "base-statistics" jsonb,
    abilities jsonb,
    "hidden-abilities" jsonb,
    "egg-groups" jsonb,
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
