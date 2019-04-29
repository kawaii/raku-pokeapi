use Pokeapi::Role::Pokemon;
unit class Pokeapi::Pokemon  does Pokeapi::Role::Pokemon;

method get-evolution-parameters(:$environment) {
    my %pokey-params = #self.Capture.Hash;
        species => $.species,
        form => $.form,
    ;

    my %all-params = |(%pokey-params), |(%$environment);
    return %all-params;
}
