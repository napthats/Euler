use warnings;
use strict;
use feature qw ( say );


my $max_chain_num = 0;

for my $number (1 .. 1_000_000) {
  my $tmp = $number;
  my $chain_num = 1;

  until ($number == 1) {
    $chain_num++;
    $number = ($number % 2 == 0) ? $number / 2 : $number * 3 + 1;
  }
  $max_chain_num = ($chain_num > $max_chain_num) ? $chain_num : $max_chain_num;
  say $tmp . q{,} . $chain_num if ($chain_num > 500);
}

print $max_chain_num;
