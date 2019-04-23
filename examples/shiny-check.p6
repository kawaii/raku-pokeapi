use Pokeapi::Pokemon::Generator;
use Pokeapi::DataSource::DBI;

my $data-source = Pokeapi::DataSource::DBI.new;
my $generator = Pokeapi::Pokemon::Generator.new(:$data-source);

for 0 .. * -> $i {
    last if my $shiny = $generator.shiny-check();
    say "Shiny check $i... $shiny";

    LAST {
        say "Shiny check $i... $shiny";
    }
}
