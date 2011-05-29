use warnings;
use strict;
use feature qw(say);
use List::Util qw(sum);


my $sum = 1;
my $priv_maxvalue = 1;

for (1 .. 500) {
  $sum += 4 * $priv_maxvalue + $_ * 20;
  $priv_maxvalue += 8 * $_;
}

say $sum;
