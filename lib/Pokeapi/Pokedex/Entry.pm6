unit class Pokeapi::Pokedex::Entry;
use Pokeapi::Pokemon;

use JSON::Fast;

has $.id;
has $.species;
has %.regional-ids;
has @.forms;
has %.types;
has %.gender-ratio;
has %.base-statistics;
has %.abilities;
has %.hidden-abilities;
has $.catch-rate;
has %.height;
has %.weight;
has $.base-friendship;
has @.egg-groups;
has @.evolutions;

method to-json {
    to-json(self.Capture.Hash);
}

method generate-wild(%known-stats) returns Pokeapi::Pokemon {
    my $pokeyman = Pokeapi::Pokemon.new(|%known-stats, species => $.species);

    my $generator = Pokeapi::Pokemon::Generator2.new(:entry(self));
    $generator.fill-in($pokeyman);

    return $pokeyman;
}

method types-for-form(:$form) {
    %.types{$form}
}

# TODO ask @.evolutions
method minimum-level { 1 }

# TODO: magic number from the lore
method maximum-level { 100 }
