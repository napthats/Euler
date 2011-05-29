my $sum;
my $first = 1;
my $second = 2;
my $tmp;

while ($second <= 4000000){
  $sum += $second if ($second % 2 == 0);
#  $tmp = $second;
#  $second = $first + $second;
#  $first = $tmp;
  ($first, $second) = ($second, $first + $second);
}

print $sum;

