use Pokeapi::Pokemon::Generator;
use Pokeapi::DataSource::DBI;

my $data-source = Pokeapi::DataSource::DBI.new;
my $generator = Pokeapi::Pokemon::Generator.new(:$data-source);

for 0 .. 50 {
    say my $pokegender = $generator.select-gender(:species("Exeggutor"), :form("alolan"));
}
