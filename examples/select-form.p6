use Pokeapi::Pokemon::Generator;
use Pokeapi::DataSource::DBI;

my $data-source = Pokeapi::DataSource::DBI.new;
my $generator = Pokeapi::Pokemon::Generator.new(:$data-source);

say my $form = $generator.select-form(:species("Exeggutor"));
