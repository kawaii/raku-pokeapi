use Pokeapi::Role::DataSource;

unit class Pokeapi::DataSource::DBI does Pokeapi::Role::DataSource;
use Pokeapi::Controller::Database;

use JSON::Fast;

method get-gender-ratios(:$species, :$form) {
    my $query = dbh.prepare(qq:to/STATEMENT/);
           SELECT "gender-ratio" FROM pokeapi_pokedex WHERE species = ?;
        STATEMENT

    $query.execute($species);

    my %gender-ratio = from-json($query.row);
    my %ratios = self.values-or-defaults(%gender-ratio, $form);

    return %ratios;
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
