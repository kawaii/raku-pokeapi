unit class Pokeapi::Pokemon;

has $.uuid;
has $.species;
has $.form;
has $.level;
has %.ivs;
has $.gender;
has $.ability;
has $.hidden-ability;
has $.height;
has $.weight;
has $.friendship;
has $.affection;

has $.pokedex-entry;

method get-evolution-parameters(:$environment) {
    my %pokey-params = #self.Capture.Hash;
        species => $.species,
        form => $.form,
    ;

    my %all-params = |(%pokey-params), |(%$environment);
    return %all-params;
}

method types {
    $.pokedex-entry.types-for-form(form => self.form);
}
