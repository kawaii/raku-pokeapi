unit class Pokeapi::Pokemon::Generator;
use Pokeapi::Controller::Database;
use Pokeapi::Role::DataSource;

has Pokeapi::Role::DataSource $.data-source is required;

method select-species {
    my @species = $.data-source.get-species;
    return @species.pick;
}

method select-form(:$species) returns Str {
    my @forms = $.data-source.get-forms(:$species);
    return @forms.pick;
}

method select-nature returns Pair {
    my %natures = $.data-source.get-natures;
    return %natures.pairs.pick;
}

method select-gender(:$species, :$form = 'default') {
    my %ratios = $.data-source.get-gender-ratios(:$species, :$form);
    return %ratios.Mix.roll;
}

method select-height(:$species, :$form = 'default') {
    my $height = $.data-source.get-height(:$species, :$form);
    return $height * (0.9..1.1).rand;
}

method select-weight(:$species, :$form = 'default') {
    my $weight = $.data-source.get-weight(:$species, :$form);
    return $weight * (0.9..1.1).rand;
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
