use Pokeapi::Pokemon::Generator;
use Pokeapi::DataSource::DBI;

my $data-source = Pokeapi::DataSource::DBI.new;
my $generator = Pokeapi::Pokemon::Generator.new(:$data-source);

say my $height = $generator.select-height(:species("Exeggutor"), :form("default"));
say my $weight = $generator.select-weight(:species("Exeggutor"), :form("alolan"));
