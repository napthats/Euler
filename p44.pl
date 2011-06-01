#!/usr/bin/perl

use warnings;
use strict;
use feature qw(say);

my @pentagonals = map {$_ * (3 * $_ - 1) / 2} (1 .. 10000);
my %pentagonals = map {$_ => 1} @pentagonals;

my @kj;
for my $pk (@pentagonals) {
    for my $pj (@pentagonals) {
        next if ($pj > $pk);
        if ($pentagonals{$pk + $pj} && $pentagonals{$pk - $pj}) {
            push @kj, [$pk, $pj];
        }
    }
}

@kj = sort {$_[1] - $_[0]} @kj;

say ($kj[0][0] - $kj[0][1]);


