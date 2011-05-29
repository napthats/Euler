use warnings;
use strict;
use feature qw ( say );

my $number9 = 9*8*7*6*5*4*3*2;
my $number8 = 8*7*6*5*4*3*2;


sub kai {
  my $arg = shift;
  my $result = 1;
  for (1 .. $arg) {
    $result *= $_;
  }
  return $result;
}

print 999_999 - 2 * kai(9) - 6 * kai(8) - 6 * kai(7) - 2 * kai(6) - 5 * kai(5)
      - 1 * kai(4) - 2 * kai(3) - 1 * kai(2) - 1 * kai(1);



