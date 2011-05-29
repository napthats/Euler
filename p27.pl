use warnings;
use strict;
use feature qw(say);
use List::Util qw(max);

my @list = (0) x 1_002_000;#,0,0,0,0,0,0,0,0,0);
$list[0] = 1;
$list[1] = 1;

my $c;

#print @list;

my @prime_list;

for (0..$#list-1) {
#  print "hi";
  next if ($list[$_]);
  my $prime = $_;
  for (2 .. int(1_002_000 / $prime)) {
    $list[$prime * $_] = 1;
  }
  push @prime_list, $prime;
}





my @reverse_prime_list;

for (@prime_list) {
  last if ($_ > 999);
  unshift @reverse_prime_list, $_;
}

say join q{,}, @reverse_prime_list;


@reverse_prime_list = map {$_, -$_} @reverse_prime_list;


my $max_chain = [0, 0, 0];

for my $prime (@reverse_prime_list) {
say join q{,}, @$max_chain;
  say $prime;
  last if (abs $max_chain->[2] > abs $prime);
  for my $a (-999 .. 999) {
#    say $a;
    my $nn;
    for my $n (0 .. abs $prime) {
#      say $n;
      $nn = $n;
      my $ord = $n ** 2 + $a * $n + $prime;
#say "o:".$ord;
      last if ($list[abs $ord]);
    }
    $max_chain = $nn > $max_chain->[2] ? [$a, $prime, $nn] : $max_chain;
  }
}

say join q{,}, @$max_chain;

say $max_chain->[0] * $max_chain->[1];
