unit role Pokeapi::Role::DataSource;

# Defines the methods we need to generate Pokemon.
# Each implementation must return default values if possible. Returning an undefined value is sometimes acceptable.

#| Returns the entire data set as a hash. Doesn't return related data such as evolutions.
method get-pokemon(:$species, :$form = 'default') returns Hash { ... }

#| Returns an array containing the names of all the species of Pokemon contained in the Pokedex.
method get-species returns Array { ... }

#| Returns an array of all the available forms of the requested Pokemon.
method get-forms(:$species) returns Array { ... }

#| Returns the natures table, keyed by name, with stat increases/decreases and favorite/disliked flavors.
method get-natures returns Hash { ... }

#| Returns the base statistics of the specified form of a requested Pokemon.
method get-base-stats(:$species, :$form) returns Hash { ... }

#| Returns a hash containing arbitrary keys (usually Male and Female) and their respective ratios.
method get-gender-ratios(:$species, :$form) returns Hash { ... }

#| Returns the height of the specified form of a requested Pokemon.
method get-height(:$species, :$form) returns Hash { ... }

#| Returns the weight of the specified form of a requested Pokemon.
method get-weight(:$species, :$form) returns Hash { ... }

#| Given a hash and a key, merges the hash under that key (if any) with the default key (if any) and returns the result.
#| If $key is 'default' and there is no default in the hash, an exception is thrown.
#| An empty hash or an undefined hash is considered valid, however - this will simply return the same lack of hash.
method values-or-defaults(%hash, $key) {
    return %hash if not %hash;

    multi merge(%a, %b) {
        return %(|(%a), |(%b))
    }
    multi merge ($a, $b) {
        return $b // $a
    }
    my $output = %hash<default>;

    if %hash{$key} -> $val {
        $output = merge($output, $val);
    }

    if not $output {
        # throw exception
    }
    return $output;
}
