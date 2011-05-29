use warnings;
use strict;
use feature qw( say );
use Readonly;
use List::Util qw(sum);

Readonly my $MAX => factorial(9) * 7;


sub factorial {
  my $arg = shift;
  my $res = 1;
  for (1 .. $arg) {
    $res *= $_;
  }
  return $res;
}


my @factorials;

for (0 ..9) {
  push @factorials, factorial($_);
}


my @reslist;

for my $num (3 .. $MAX) {

  push @reslist, $num if ($num == sum map {$factorials[$_]} split //, $num);
}

say sum @reslist;
#say join q{,}, @reslist;
