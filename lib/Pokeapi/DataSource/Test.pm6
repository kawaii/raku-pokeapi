use Pokeapi::Role::DataSource;

unit class Pokeapi::DataSource::Test does Pokeapi::Role::DataSource;

method get-forms(:$species) {
    my @forms = <default alolan mega altered>;
    return @forms;
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
