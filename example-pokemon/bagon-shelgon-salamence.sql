INSERT INTO pokeapi_pokedex VALUES (371, 'Bagon', 'Rock Head Pokémon','[ "default" ]',
$$
{
    "default": [ "Dragon" ]
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
    "default": 0.6
}
$$,
$$
{
    "default": 42.1
}
$$,
NULL,
45,
$$
{
    "default": [ "Blue" ]
}
$$,
$$
{
    "default": {
        "hp": 45,
        "attack": 75,
        "defence": 60,
        "special-attack": 40,
        "special-defence": 30,
        "speed": 50
    }
}
$$,
$$
{
    "default": [ "Rock Head" ]
}
$$,
$$
{
    "default": [ "Sheer Force" ]
}
$$,
'Slow',
35,
$$
{
    "Hoenn": 196, "Coastal Kalos": 14, "Alola": 117
}
$$,
'[ "Dragon" ]',
10408
);

INSERT INTO pokeapi_pokedex VALUES (372, 'Shelgon', 'Endurance Pokémon','[ "default" ]',
$$
{
    "default": [ "Dragon" ]
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
    "default": 1.1
}
$$,
$$
{
    "default": 110.5
}
$$,
NULL,
45,
$$
{
    "default": [ "White" ]
}
$$,
$$
{
    "default": {
        "hp": 65,
        "attack": 95,
        "defence": 100,
        "special-attack": 60,
        "special-defence": 50,
        "speed": 50
    }
}
$$,
$$
{
    "default": [ "Rock Head" ]
}
$$,
$$
{
    "default": [ "Overcoat" ]
}
$$,
'Slow',
35,
$$
{
    "Hoenn": 197, "Coastal Kalos": 15, "Alola": 118
}
$$,
'[ "Dragon" ]',
10408
);

INSERT INTO pokeapi_pokedex VALUES (373, 'Salamence', 'Dragon Pokémon','[ "default", "mega" ]',
$$
{
    "default": [ "Dragon", "Flying" ]
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
    "default": 1.5,
    "mega": 1.8
}
$$,
$$
{
    "default": 102.6,
    "mega": 112.6
}
$$,
$$
{
    "mega": "Salamencite"
}
$$,
45,
$$
{
    "default": [ "Blue" ]
}
$$,
$$
{
    "default": {
        "hp": 95,
        "attack": 135,
        "defence": 80,
        "special-attack": 110,
        "special-defence": 80,
        "speed": 100
    },
    "mega": {
        "hp": 95,
        "attack": 145,
        "defence": 130,
        "special-attack": 120,
        "special-defence": 90,
        "speed": 120
    }
}
$$,
$$
{
    "default": [ "Intimidate" ]
}
$$,
$$
{
    "default": [ "Moxie" ],
    "mega": ["Aerilate"]
}
$$,
'Slow',
35,
$$
{
    "Hoenn": 198, "Coastal Kalos": 16, "Alola": 119
}
$$,
'[ "Dragon" ]',
10408
);

INSERT INTO pokeapi_evolutions VALUES ('Bagon', 'Shelgon', 'default', '{"level": 30}');
INSERT INTO pokeapi_evolutions VALUES ('Shelgon', 'Salamence', 'default', '{"level": 50}');
