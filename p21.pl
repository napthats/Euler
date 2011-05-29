use warnings;
use strict;

use List::Util qw(sum);
use feature qw(say);


my @list = (0) x 200;#,0,0,0,0,0,0,0,0,0);
$list[0] = 1;
$list[1] = 1;


my @primes;

for (0..$#list-1) {
  next if ($list[$_]);
  my $prime = $_;
  for (1 .. int(200 / $prime)) {
    next if ($list[$prime * $_]);
    $list[$prime * $_] = 1;
  }
  push @primes, $prime;
}



my @d = (0);

for my $ord (1 .. 28123) {
  my $tmpord = $ord;

  my @p_list;
  for (@primes) {
    if ($ord % $_ == 0) {
      $ord /= $_;
      $p_list[$_]++;
      redo;
    }
  }

  $p_list[$ord] = 1 if ($ord > 1);

  my $sum;
  my @divisors_list = (1);
  for my $prime (0 .. $#p_list) {
    next unless $p_list[$prime];


    my @tmp = @divisors_list;
    for my $divisor (@tmp) {
    for my $prime_num ($p_list[$prime]) {
      for (1 .. $prime_num) {
      push @divisors_list, ($divisor * ($prime ** $_));
    }
    }
  }
  }

  
  say join q{,}, @divisors_list;

  push @d, ((sum @divisors_list) - $tmpord);
#  say (join q{,}, @divisors_list);# if ($ord == 220);
#  say (join q{,}, @p_list);# if ($ord == 220);

}

my @abundant_list;

for (1 .. $#d) {
  push @abundant_list, $_ if ($_ < $d[$_]);
}




#say join qq{\n}, @abundant_list;
#say join qq{\n}, @d;

my $is = 0;
my $sum = 0;
my $number;

NEXT_NUMBER:
for $number (1 .. 28123) {
  $is = 0;
 
    AB1:
    for my $ab1 (@abundant_list) {
    next NEXT_NUMBER if ($ab1 > $number);
    
    my $lower = 0;
    my $upper = $#abundant_list;



    while (1) {
      my $count = $lower + int(($upper - $lower) / 2);
      my $ab2 = $abundant_list[$count];

      if ($number == $ab1 + $ab2) {
        $is = 1;
        next NEXT_NUMBER;
      }
      if ($number > $ab1 + $ab2) {
        $lower = $count + 1;
        next AB1 if ($lower > $upper);
      } else {
        $upper = $count - 1;
        next AB1 if ($lower > $upper);
      }
    }
  }
} continue {
#  say $number unless ($is);
  $sum += $number unless ($is);
}

say $sum;

=pod



my @check;
my $sum = 0;
for my $ord (1 .. $#d) {
  next if ($check[$ord]);
  next if ($ord != $d[$d[$ord]] || $ord == $d[$ord]);
  say $ord;
  say $d[$ord];
  $check[$ord]++;
  $check[$d[$ord]]++;
  
  $sum += $ord + $d[$ord];
}

say $sum;
