use Pokeapi::Pokemon::Generator;
use Pokeapi::DataSource::DBI;

my $data-source = Pokeapi::DataSource::DBI.new;
my $generator = Pokeapi::Pokemon::Generator.new(:$data-source);

say my $forms = $generator.select-form(:species("Exeggutor"));
