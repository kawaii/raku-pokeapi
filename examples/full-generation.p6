use Pokeapi::Pokemon::Generator;
use Pokeapi::DataSource::DBI;

my $data-source = Pokeapi::DataSource::DBI.new;
my $generator = Pokeapi::Pokemon::Generator.new(:$data-source);

say my $species = $generator.select-species;
say my $nature = $generator.select-nature;
say my $stats = $generator.generate-statistics(:$species, :$nature);
