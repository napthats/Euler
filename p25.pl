use warnings;
use strict;
use feature qw (say);

my @orcache;


my $count = 0;
sub fib {
  my $arg = shift;

  return 1 if ($arg == 1 || $arg == 2);
  $orcache[$arg-1] //= fib($arg-1);
  $orcache[$arg-2] //= fib($arg-2);

  if ($orcache[$arg-1] / 1_000_000_000_000 > 1 && $orcache[$arg-2] / 1_000_000_000_000 > 1) {
    $orcache[$arg-1] = int($orcache[$arg-1] / 1_000_000);
    $orcache[$arg-2] = int($orcache[$arg-2] / 1_000_000);
    $count++;
  }

  return ($orcache[$arg] = $orcache[$arg-1] + $orcache[$arg-2]);
}



for (1 .. 10000) {
  say fib($_);
  do{say $_; say "end"; die;} if ($count == 165 && fib($_) > 1_000_000_000);
}



