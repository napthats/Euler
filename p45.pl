#!/usr/bin/perl

use warnings;
use strict;
use feature qw(say);

use Readonly;


Readonly my $MAX => 100000;

my @t_nums = map {$_ * ($_ + 1) / 2} (1 .. $MAX);
my @p_nums = map {$_ * (3 * $_ - 1) / 2} (1 .. $MAX);
my @h_nums = map {$_ * (2 * $_ - 1)} (1 .. $MAX);

my %p = map {$_ => 1} @p_nums;
my %h = map {$_ => 1} @h_nums;



for (@t_nums) {
    next if !$p{$_} || !$h{$_};
    say;
}


