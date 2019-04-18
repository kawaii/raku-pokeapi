use Pokeapi::Role::DataSource;

unit class Pokeapi::DataSource::Test does Pokeapi::Role::DataSource;

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
        invalid => {
            Male => 0.6,
        },
        test => {
            Female => 0.6,
        }
    ;

    my %ratios = self.values-or-defaults(%test-ratios, $form);

    return %ratios;
}
