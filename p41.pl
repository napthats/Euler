#!/usr/bin/perl

use warnings;
use strict;
use feature qw(say);
use Math::Prime::XS qw(primes);
use Readonly;
use Carp;
use List::MoreUtils qw(any);

Readonly my $MAX_PRIME => 100_000_000;
Readonly my $MIN_PRIME => 800_000_000;
Readonly my $MAX_PANDIGIT => 9;


#say join qq{\n}, primes($MIN_PRIME, $MAX_PRIME);
my @primes = reverse primes($MAX_PRIME);



for my $prime (@primes) {
    next if (!is_pandigital($prime));
    say $prime;
    die;
}


sub is_pandigital {
    my $target = shift;
    my $num_of_digits = shift;

    my @digits = split //xsm, $target;
    $num_of_digits //= $#digits + 1;

    return 0 if ($num_of_digits > $MAX_PANDIGIT);

    my @tmp;
    @tmp[0, $num_of_digits + 1] = (1, 1);

    return 0 if (any {$tmp[$_]++} @digits);
    return 0 if (any {!$_} @tmp);
    return 1;
}


sub test_is_pandigital {
    croak if (!is_pandigital(178569432, 9));
    croak if (is_pandigital(178569422, 9));
    croak if (is_pandigital(17856423, 9));
    croak if (is_pandigital(178569422, 8));
}

#test_is_pandigital();
