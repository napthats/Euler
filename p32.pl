use warnings;
use strict;
use feature qw( say );
use List::Util qw( sum );

my @reslist;

NEXT_TARGET:
for my $target (1000 .. 9999) {
  say $target if ($target % 100 == 0);

  NEXT_MUL:
  for my $mul1 (1 .. 99) {
    next NEXT_MUL if ($target % $mul1 != 0);
    my $mul2 = $target / $mul1;
    next NEXT_MUL if (($mul1 < 10 && $mul2 < 1000) || ($mul1 >= 10 && $mul2 < 100));

    my @t = (split(//, $target), split(//, $mul1), split(//, $mul2));
    my @digits;
    for (@t) {
      next NEXT_MUL if ($digits[$_]);
      $digits[$_]++;
    }
    next NEXT_MUL if ($digits[0]);
    
    say join q{,}, $target, $mul1, $mul2;
    push @reslist, $target;
    next NEXT_TARGET;
  }
}

say sum @reslist;
