use warnings;
use strict;
use feature qw( say );

my @res;

for $a (2 .. 100) {
  for $b (2 .. 100) {
    push @res, $a ** $b;
  }
}

my %tmp;
@res = grep(!$tmp{$_}++, @res);
say 0+@res;
