unit class Pokeapi::Pokemon;

has $.species;
has $.form;

method get-evolution-parameters(:$environment) {
    my %pokey-params = #self.Capture.Hash;
        species => $.species,
        form => $.form,
    ;

    my %all-params = |(%pokey-params), |(%$environment);
    return %all-params;
}
