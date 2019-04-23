unit class Pokeapi::Pokemon::Generator;
use Pokeapi::Controller::Database;
use Pokeapi::Role::DataSource;

has Pokeapi::Role::DataSource $.data-source is required;

method select-nature {
    enum NATURE ( <Hardy Lonely Brave Adamant Naughty Bold Docile Relaxed Impish Lax Timid Hasty Serious
                   Jolly Naive Modest Mild Quiet Bashful Rash Calm Gentle Sassy Careful Quirky> );

    return NATURE.pick;
}

method select-form(:$species) {
    my @forms = $.data-source.get-forms(:$species);
    return @forms;
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

method generate-ivs {
    my %ivs = hp => (0..31).rand.Int,
              attack => (0..31).rand.Int,
              defense => (0..31).rand.Int,
              special-attack => (0..31).rand.Int,
              special-defense => (0..31).rand.Int,
              speed => (0..31).rand.Int,
    ;

    return %ivs;
}

method shiny-check {
    my $check = (0..8191).rand.Int;
    my $shiny = $check == 0;

    return $shiny;
}
