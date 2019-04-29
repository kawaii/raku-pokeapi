use Pokeapi::Role::Pokemon;
unit class Pokeapi::Pokedex::Entry does Pokeapi::Role::Pokemon;

use JSON::Fast;

method to-json {
    to-json(self.Capture.Hash);
}
