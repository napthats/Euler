use warnings;
use strict;
use feature qw(say);
use List::Util qw(reduce);
use Readonly;

Readonly my $PRIME_MAX => 1_000_000;


sub lotate {
  my $arg = shift;

  my @digits = split //, $arg;
  my @reslist;

  for (@digits) {
    push @reslist, reduce {$a . $b} @digits;
    my $tmp = $digits[0];
    for (0 .. $#digits-1) {
      $digits[$_] = $digits[$_ + 1];
    }
    $digits[-1] = $tmp;
  }

  return @reslist;
}


my @list = (0) x $PRIME_MAX;
$list[0] = 1;
$list[1] = 1;

my @l;

for (0..$#list-1) {
  next if ($list[$_]);
  my $prime = $_;
  push @l, $prime;
  for (2 .. int($PRIME_MAX / $prime)) {
    next if ($list[$prime * $_]);
    $list[$prime * $_] = 1;
  }
}

my @reslist;

NEXT_NUM:
for my $num (@l) {
#  say $list[$_];
  for (lotate($num)) {
    next NEXT_NUM if ($list[$_]);
  }
  push @reslist, $num;
}

say 0 + @reslist;
