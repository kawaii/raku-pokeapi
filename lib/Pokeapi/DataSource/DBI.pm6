use Pokeapi::Role::DataSource;

unit class Pokeapi::DataSource::DBI does Pokeapi::Role::DataSource;
use Pokeapi::Controller::Database;

use JSON::Fast;

method get-pokemon(:$species) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT * FROM pokeapi_pokedex WHERE "species" = ?;
        STATEMENT

    $query.execute($species);

    my %pokemon = $query.row(:hash);
    for %pokemon<forms types gender-ratio height weight mega-stone pokedex-colours base-statistics abilities hidden-abilities regional-ids egg-groups>:v
        -> $v is rw { $v = from-json($v) if $v   }

    return %pokemon;
}

method get-species {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT "species" FROM pokeapi_pokedex;
        STATEMENT

    $query.execute;

    my @species = $query.allrows.flat;
    return @species;
}

method get-forms(:$species) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT "forms" FROM pokeapi_pokedex WHERE species = ?;
        STATEMENT

    $query.execute($species);

    my @forms = from-json($query.row).list;
    return @forms;
}

method get-natures {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT * FROM pokeapi_natures;
        STATEMENT

    $query.execute;

    my @natures = $query.allrows(:array-of-hash);
    my %natures = @natures.map: { $_<nature> => $_ };
    return %natures;
}

method get-gender-ratios(:$species, :$form) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT "gender-ratio" FROM pokeapi_pokedex WHERE species = ?;
        STATEMENT

    $query.execute($species);

    my %gender-ratio = from-json($query.row);
    my %ratios = self.values-or-defaults(%gender-ratio, $form);

    return %ratios;
}

method get-base-stats(:$species, :$form) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
               SELECT "base-statistics" FROM pokeapi_pokedex WHERE species = ?;
        STATEMENT

    $query.execute($species);

    my %base-stats = from-json($query.row);
    %base-stats = self.values-or-defaults(%base-stats, $form);

    return %base-stats;
}

method get-abilities(:$species, :$form) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT abilities FROM pokeapi_pokedex WHERE species = ?;
        STATEMENT

    $query.execute($species);

    my %abilities = from-json($query.row);
    %abilities = self.values-or-defaults(%abilities, $form);

    return %abilities;
}

method get-hidden-abilities(:$species, :$form) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT "hidden-abilities" FROM pokeapi_pokedex WHERE species = ?;
        STATEMENT

    $query.execute($species);

    my %hidden-abilities = from-json($query.row);
    %hidden-abilities = self.values-or-defaults(%hidden-abilities, $form);

    return %hidden-abilities;
}

method get-height(:$species, :$form) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT height FROM pokeapi_pokedex WHERE species = ?;
        STATEMENT

    $query.execute($species);

    my %heights = from-json($query.row);
    my $height = self.values-or-defaults(%heights, $form);

    return $height;
}

method get-weight(:$species, :$form) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT weight FROM pokeapi_pokedex WHERE species = ?;
        STATEMENT

    $query.execute($species);

    my %weights = from-json($query.row);
    my $weight = self.values-or-defaults(%weights, $form);

    return $weight;
}

method get-catch-rate(:$species) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT "catch-rate" FROM pokeapi_pokedex WHERE species = ?;
        STATEMENT

    $query.execute($species);

    my $catch-rate = $query.row;
    return $catch-rate;
}