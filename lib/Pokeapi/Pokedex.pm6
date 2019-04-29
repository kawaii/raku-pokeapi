unit class Pokeapi::Pokedex;
use Pokeapi::Pokemon;
use Pokeapi::Pokedex::Entry;

has $.data-source;

method find-entry(:$species) returns Pokeapi::Pokedex::Entry {
    my %pokemon = $.data-source.get-pokemon(:$species);

    %pokemon .= grep: { .value.defined };

    Pokeapi::Pokedex::Entry.new(|%pokemon);
}

method find-evolutions(Pokeapi::Pokemon :$pokemon) returns Pokeapi::Pokemon {
    my %params = $pokemon.get-evolution-parameters({});

    my @evolutions = $.data-source.get-evolutions(:species($pokemon.species));

    @evolutions .= grep(-> %candidate {
        my %relevant = %params{ %candidate.keys }:kv;

        %relevant ~~ %candidate;
    });

    if not @evolutions {
        die "No evolutions!"
    }

    if @evolutions.elems > 1 {
        die "Too many evolutions!";
    }

    return @evolutions[0];
}