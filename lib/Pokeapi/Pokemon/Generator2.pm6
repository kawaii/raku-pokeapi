unit class Pokeapi::Pokemon::Generator;
use Pokeapi::Pokedex::Entry;

has Pokeapi::Pokedex::Entry $.entry is required;

method fill-in(Pokeapi::Pokemon $pokemon) returns Pokeapi::Pokemon {
    for $pokemon.undefined-attrs -> $attr {
        # Rely on this method skipping defined attrs, in case we define it in passing.
        self.fill-in($pokemon, $attr);
    }

    return $pokemon;
}

method fill-in(Pokeapi::Pokemon $pokemon, $attr) {
    $pokemon.set-attr($attr, self.generate-value($pokemon, $attr))
        unless $pokemon."$attr"().defined;

    return $pokemon."$attr"();
}
# Figure out how to generate a value for $stat based on $.entry
method generate-value(Pokeapi::Pokemon $pokemon, $attr) {
    given $attr {
        when 'form' {
            return self.select-form
        }
        when 'gender' {
            return self.select-gender(form => self.fill-in($pokemon, 'form'));
        }
        when 'height' {
            return self.select-height(form => self.fill-in($pokemon, 'form'));
        }
    }
}

method select-level {
    ($.entry.minimum-level..$.entry.maximum-level).pick
}

method select-form {
    $.entry.forms.pick;
}

method get-base-stats(:$species, :$form = 'default') returns Hash {
    my %base-stats = $.data-source.get-base-stats(:$species, :$form);
    return %base-stats;
}

method generate-ivs returns Hash {
    my %ivs = hp => (0..31).rand.Int,
              attack => (0..31).rand.Int,
              defence => (0..31).rand.Int,
              special-attack => (0..31).rand.Int,
              special-defence => (0..31).rand.Int,
              speed => (0..31).rand.Int,
    ;

    return %ivs;
}

method generate-statistics(:$species, :$form = 'default', :$nature) returns Hash {
    my %stats = self.get-base-stats(:$species, :$form);
    %stats »+=« self.generate-ivs;

    my $inc = $nature.value<increased-stat>;
    my $dec = $nature.value<decreased-stat>;

    %stats{$inc} = (%stats{$inc} * 1.1).round with $inc;
    %stats{$dec} = (%stats{$dec} * 0.9).round with $dec;

    return %stats;
}

method shiny-check {
    my $check = (0..8191).rand.Int;
    my $shiny = $check == 0;

    return $shiny;
}
