use Pokeapi::Pokemon::Generator;
use Pokeapi::DataSource::Test;

my $data-source = Pokeapi::DataSource::Test.new;
my $generator = Pokeapi::Pokemon::Generator.new(:$data-source);

my $species = $generator.select-species;
say "Chosen species is {$species}!";

my $stats = $generator.generate-statistics(:$species);
