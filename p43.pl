#!/usr/bin/perl

use warnings;
use strict;
use feature qw(say);
use List::MoreUtils qw(any);

say 4106357289 + 4106357289 + 1460357289 + 1406357289 + 1430952867 + 4130952867;
say 357289 * 4 + 952867 * 2 + (1406 + 1460 + 4106 + 4160 + 1430 + 4130) * 1000000;

my @possible_numbers;

for my $f17 (1 .. 58) {
    for my $f13 (1 .. 76) {
        for my $f11 (1 .. 90) {
            for my $f7 (1 .. 142) {
                if (int(($f17 * 17) / 10) == ($f13 * 13) % 100
                    && int(($f13 * 13) / 10) == ($f11 * 11) % 100
                    && int(($f11 * 11) / 10) == ($f7 * 7) % 100) {
                    my @digits = split q{}, sprintf '%06s', $f7 * 7000 + $f17 * 17;
                    my %tmp;
                    next if (any {$tmp{$_}++} @digits);
                    next if ($digits[1] != 0 && $digits[1] != 5);
                    say @digits;
                }
            }
        }
    }
}


