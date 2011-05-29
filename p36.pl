#!/usr/bin/perl

use warnings;
use strict;
use feature qw(say);

sub dec_to_bit {
    my $dec = shift;
    return sprintf("%b", $dec);
}

sub is_palindromic {
    my $arg = shift;
    return 1 if ($arg =~ m/^.$/);
    return 1 if ($arg =~ m/^(\w+)\w?(??{reverse $1})$/);
    return 0;
}


my $sum;

for my $target (1 .. 1_000_000) {
    $sum += $target if (is_palindromic($target) && is_palindromic(dec_to_bit($target)));
}



say $sum;


