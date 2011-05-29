use warnings;
use strict;
use feature qw( say );
use List::Util qw( sum reduce );

my @list;

#say 4 ** 5 + 1 + 5 ** 5;
#say 4 ** 5 + 1 + 1+ 5 ** 5;
#say 5 ** 5 + 4 ** 5 + 7 ** 5 + 4 ** 5 + 8 ** 5;
#say 9 ** 5 + 2 ** 5 + 7 ** 5 + 2 ** 5 + 7 ** 5;
#say 9 ** 5 + 3 ** 5 + 8 ** 5 + 4 ** 5;

for my $target (2 .. 1_000_000) {
  push @list, $target if ($target == sum map {$_ ** 5} split //, $target);
}

#say join q{,}, @list;
say sum @list;
