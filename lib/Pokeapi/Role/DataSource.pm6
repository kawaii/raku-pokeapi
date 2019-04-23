unit role Pokeapi::Role::DataSource;

# Defines the methods we need to generate Pokemon.

#| Returns a hash containing arbitrary keys (usually Male and Female) and their respective ratios.
#| The implementation must return default values if possible. Returning an undefined value is acceptable.
method get-forms(:$species) returns Array { ... }

method get-gender-ratios(:$species, :$form) returns Hash { ... }

method get-height(:$species, :$form) returns Hash { ... }

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
