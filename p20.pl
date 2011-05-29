use warnings;
use strict;
use feature qw ( say );



my $digit = 1;
my $sum_of_digits = 0;
my $carries = [];
my $carries_priv = [];


while (1) {
  for my $turn (1 .. 100) {
    $digit *= $turn;
    $digit += $carries_priv->[$turn] if ($carries_priv->[$turn]);

    if ($digit >= 10){
      $carries->[$turn] = int $digit / 10;
      $digit %= 10;
    }
  }

  say "yes";

  $sum_of_digits += $digit;
  last unless (@$carries);
  $carries_priv = [@{$carries}];
  $digit = 0;
  $carries = [];
}

say $sum_of_digits;

