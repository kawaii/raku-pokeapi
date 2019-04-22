INSERT INTO pokeapi_pokedex VALUES (102, 'Exeggcute', 'Egg Pokémon','[ "default" ]',
$$
{
    "default": [ "Grass", "Psychic" ]
}
$$,
$$
{
    "default": {
        "Male": 0.50, "Female": 0.50
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
        "HP": 60,
        "ATTACK": 40,
        "DEFENCE": 80,
        "SPECIAL ATTACK": 60,
        "SPECIAL DEFENCE": 45,
        "SPEED": 40
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
5268
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
        "Male": 0.50, "Female": 0.50
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
        "HP": 95,
        "ATTACK": 95,
        "DEFENCE": 85,
        "SPECIAL ATTACK": 125,
        "SPECIAL DEFENCE": 75,
        "SPEED": 55
    },
    "alolan": {
        "HP": 95,
        "ATTACK": 105,
        "DEFENCE": 85,
        "SPECIAL ATTACK": 125,
        "SPECIAL DEFENCE": 75,
        "SPEED": 45
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
5268
);

INSERT INTO pokeapi_evolutions VALUES ('Exeggcute', 'Exeggutor', '{"stone": "Leaf Stone"}');
