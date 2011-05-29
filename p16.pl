use warnings;
use strict;
use feature qw ( say );



my $digit = 1;
my $sum_of_digits = 0;
my $carries = [];
my $carries_priv = [];

while (1) {
  for my $turn (1 .. 1000) {
#    say q{:}.$turn;
    $digit *= 2;
    $digit += 1 if ($carries_priv->[$turn]);

    if ($digit >= 10){
#      say "hi";
      $carries->[$turn]++;
      $digit %= 10;
    }
  }


  $sum_of_digits += $digit;
#  say $sum_of_digits;
#  say @$carries;
  last unless (@$carries);
  $carries_priv = [@{$carries}];
  $digit = 0;
  $carries = [];
}

say $sum_of_digits;



=pod
my $orcache;

print sum_of_twiced_digits(1, 7);

sub sum_of_twiced_digits {
  my $arg = shift;
  my $twice_count = shift;
  return 0 if ($arg == 0);
  return $arg if ($twice_count == 0);
  say join q{,}, $arg, $twice_count;
  $arg *= 2;


  return ($orcache->[int($arg/10)][$twice_count-1] //= sum_of_twiced_digits(int($arg/10), $twice_count-1))
         + ($orcache->[$arg%10][$twice_count-1] //= sum_of_twiced_digits($arg%10, $twice_count-1));
}
