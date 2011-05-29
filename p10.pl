use warnings;
use strict;

my @list = (0) x 2000001;#,0,0,0,0,0,0,0,0,0);
$list[0] = 1;
$list[1] = 1;

#my $c;

#print @list;
my $sum_of_prime;

for (0..$#list-1) {
#  print "hi";
  next if ($list[$_]);
  my $prime = $_;
  for (1 .. int(2_000_000 / $prime)) {
    next if ($list[$prime * $_]);
    $list[$prime * $_] = 1;
  }
#  $c++;
  $sum_of_prime += $prime;
}

print $sum_of_prime;
