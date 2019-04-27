unit class Pokeapi::Pokedex;
use Pokeapi::Pokemon;
use Pokeapi::Pokemon::Generator;

has $.data-source;

method generate-random-pokemon returns Pokeapi::Pokemon {
    my $g = Pokeapi::Pokemon::Generator.new(data-source => $.data-source);
    my $species = $g.select-species;
    my $form = $g.select-form(:$species);

    my $entry = self.find-entry(:$species, :$form);
    $entry.generate-random-pokemon;
}

method find-entry(:$species) returns Pokeapi::Pokedex::Entry {
    my %pokemon = $.data-source.get-pokemon(:$species);
    Pokeapi::Pokedex::Entry.new(|%pokemon);
}

method evolve(Pokeapi::Pokemon :$pokemon) returns Pokeapi::Pokemon {
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