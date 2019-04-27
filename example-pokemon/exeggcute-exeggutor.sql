INSERT INTO pokeapi_pokedex VALUES (102, 'Exeggcute', 'Egg Pokémon','[ "default" ]',
$$
{
    "default": [ "Grass", "Psychic" ]
}
$$,
$$
{
    "default": {
        "male": 0.50, "female": 0.50
   }
}
$$,
$$
{
    "default": 0.4
}
$$,
$$
{
    "default": 2.5
}
$$,
NULL,
90,
$$
{
    "default": [ "Pink" ]
}
$$,
$$
{
    "default": {
        "hp": 60,
        "attack": 40,
        "defence": 80,
        "special-attack": 60,
        "special-defence": 45,
        "speed": 40
    }
}
$$,
$$
{
    "default": [ "Chlorophyll" ]
}
$$,
$$
{
    "default": [ "Harvest" ]
}
$$,
'Slow',
70,
$$
{
    "Kanto": 102, "Johto": 105, "Coastal Kalos": 136, "Alola": 269
}
$$,
'[ "Grass" ]',
'[5140, 5396]'
);

INSERT INTO pokeapi_pokedex VALUES (103, 'Exeggutor', 'Coconut Pokémon','[ "default", "alolan" ]',
$$
{
    "default": [ "Grass", "Psychic" ],
    "alolan": ["Grass", "Dragon"]
}
$$,
$$
{
    "default": {
        "male": 0.50, "female": 0.50
   }
}
$$,
$$
{
    "default": 2.0,
    "alolan": 10.9
}
$$,
$$
{
    "default": 120.0,
    "alolan": 415.6
}
$$,
NULL,
45,
$$
{
    "default": [ "Yellow" ]
}
$$,
$$
{
   "default": {
        "hp": 95,
        "attack": 95,
        "defence": 85,
        "special-attack": 125,
        "special-defence": 75,
        "speed": 55
    },
    "alolan": {
        "hp": 95,
        "attack": 105,
        "defence": 85,
        "special-attack": 125,
        "special-defence": 75,
        "speed": 45
    }
}
$$,
$$
{
    "default": [ "Chlorophyll" ],
    "alolan": [ "Frisk" ]
}
$$,
$$
{
    "default": [ "Harvest" ]
}
$$,
'Slow',
70,
$$
{
    "Kanto": 103, "Johto": 106, "Coastal Kalos": 137, "Alola": 270
}
$$,
'[ "Grass" ]',
'[5140, 5396]'
);

INSERT INTO pokeapi_evolutions VALUES ('Exeggcute', 'Exeggutor', 'default', '{"stone": "Leaf Stone"}');
INSERT INTO pokeapi_evolutions VALUES ('Exeggcute', 'Exeggutor', 'alolan', '{"stone": "Leaf Stone", "region": "Alola"}');