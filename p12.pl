use warnings;
use strict;

use List::Util qw(sum);
use feature qw(say);


my @list = (0) x 1_00_00;#,0,0,0,0,0,0,0,0,0);
$list[0] = 1;
$list[1] = 1;


my @primes;

for (0..$#list-1) {
  next if ($list[$_]);
  my $prime = $_;
  for (1 .. int(1_000_000 / $prime)) {
    next if ($list[$prime * $_]);
    $list[$prime * $_] = 1;
  }
  push @primes, $prime;
}





for my $ord (1 .. 1_000_000) {
  my $tri_number = sum (1 .. $ord);
#  say divisors_num($tri_number);

  my $ord_prime = 0;
  my @p_list;
  for (@primes) {
    if ($tri_number % $_ == 0) {
      $tri_number /= $_;
      $p_list[$ord_prime]++;
      redo;
    }
    $ord_prime++;
  }

  push @p_list, 1 if ($tri_number > 1);
  
  my $prime_num = 1;
  for (@p_list) {
    next unless $_;
    $prime_num *= ($_ + 1);
  }

  say sum(1 .. $ord). q{,} . $prime_num if ($prime_num > 500);

}


