#!/usr/bin/perl

use warnings;
use strict;
use feature qw ( say );

my $sum;
for (1..999) {
  $sum += $_ if ($_ % 3 == 0 || $_ % 5 == 0);
}

say $sum;


