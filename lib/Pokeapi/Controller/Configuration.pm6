unit module Pokeapi::Controller::Configuration;

my %defaults = database-hostname => %*ENV<POKEAPI_DATABASE_HOST> || 'localhost',
        database-port => %*ENV<POKEAPI_DATABASE_PORT> || 5432,
        database-name => %*ENV<POKEAPI_DATABASE_NAME> || 'pokeapi',
        database-user => %*ENV<POKEAPI_DATABASE_USER> || 'pokeapi',
        database-password => %*ENV<POKEAPI_DATABASE_PASSWORD> || 'password',
        redis-hostname => %*ENV<POKEAPI_REDIS_HOST> || 'localhost',
        redis-port => %*ENV<POKEAPI_REDIS_PORT> || 6379,
        redis-password => %*ENV<POKEAPI_REDIS_PASSWORD> || '',
        ;

sub config-with-defaults(%config=%()) is export {
    return %(
            |%defaults,
                    |%config
            );
}
