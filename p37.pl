#!/usr/bin/perl

use warnings;
use strict;
use feature qw(say);

use Math::Prime::XS qw(primes);
use List::MoreUtils qw(all);


sub make_truncats {
    my $arg = shift;
    my @digits = split //, $arg;
    
    #前を削る
    push my @result, join q{}, @digits;
    for (1 .. $#digits) {
        shift @digits;
        push @result, join q{}, @digits;
    }

    #後ろを削る
    @digits = split //, $arg;
    for (1 .. $#digits) {
        pop @digits;
        push @result, join q{}, @digits;
    }

    return @result;
}


my @primes = primes(1_000_000);
my %primes = map {$_ => 1} @primes;
my $sum = 0;


for my $prime (@primes) {
    next if ($prime < 10);
    do{say $prime; $sum += $prime} if (all {$primes{$_}} make_truncats($prime));
}

say $sum;
