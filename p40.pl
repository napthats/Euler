#!/usr/bin/perl

use warnings;
use strict;
use feature qw(say);


my $digit_counter = 0;
my @target_th = (1, 10, 100, 1000, 10000, 100000, 1000000);

my $product = 1;

for my $num (1 .. 1_000_000) {
    my @splited_num = split //, $num;
    if ($digit_counter + $#splited_num + 1 >= $target_th[0]) {
        my $target_th = shift @target_th;
        $product *= $splited_num[$target_th - $digit_counter - 1];
    }
    $digit_counter += $#splited_num + 1;
    last if (!@target_th);
}

say $product;
