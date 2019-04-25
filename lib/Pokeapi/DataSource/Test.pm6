use Pokeapi::Role::DataSource;

unit class Pokeapi::DataSource::Test does Pokeapi::Role::DataSource;

method get-species {
    my @species = <Bulbasaur Charmander Squirtle Pikachu>;
    return @species;
}

method get-forms(:$species) {
    my @forms = <default alolan mega altered>;
    return @forms;
}

method get-natures {
    # Everything is either all null or all populated so 2 examples suffices.
    my %natures =
        Hardy => {
            increased-stat  => Nil,
            decreased-stat  => Nil,
            favorite-flavor => Nil,
            disliked-flavor => Nil,
        },
        Lonely => {
            increased-stat  => 'attack',
            decreased-stat  => 'defence',
            favorite-flavor => 'Spicy',
            disliked-flavor => 'Sour',
        };

    return %natures;
}


method get-base-stats(:$species, :$form) {
    my %base-stats = hp => 50,
            attack => 50,
            defence => 50,
            special-attack => 50,
            special-defence => 50,
            speed => 50,
    ;

    return %base-stats;
}

method get-gender-ratios(:$species, :$form) {
    my %test-ratios =
        default => {
            Male => 0.5,
            Female => 0.5
        },
        alolan => {
            Male => 0.25,
            Female => 0.75
        },
        mega => {
            Male => 0.6,
        },
        test => {
            Female => 0.6,
        }
    ;

    my %ratios = self.values-or-defaults(%test-ratios, $form);

    return %ratios;
}

method get-height(:$species, :$form) {
    my %heights =
            default => 1,
            alolan => 2,
            mega => 3,
            test => 4,
    ;

    my $height = self.values-or-defaults(%heights, $form);
    return $height;
}

method get-weight(:$species, :$form) {
    my %weights =
            default => 1,
            alolan => 2,
            mega => 3,
            test => 4,
    ;

    my $weight = self.values-or-defaults(%weights, $form);
    return $weight;
}
