use Pokeapi::Pokedex;
use Pokeapi::DataSource::DBI;

my $data-source = Pokeapi::DataSource::DBI.new;
my $pokedex = Pokeapi::Pokedex.new(:$data-source);

say my $entry = $pokedex.find-entry(species => 'Giratina').to-json;
