#!/usr/bin/perl

use warnings;
use strict;
use feature qw(say);

my @pentagonals = map {$_ * (3 * $_ - 1) / 2} (1 .. 1000);

my @kj = 
