my $target = 600851475143;

while (!is_prime($target)) {


my $smallest_prime;

print $target.qq{\n};

for ($_ = 2; $_ <= $target; $_++) {
  if ($target % $_ == 0) {
    $smallest_prime = $_;
    last;
  }
}


$target /= $smallest_prime;

}


sub is_prime {
  my $arg = shift;
  for ($_ = 2; $_ < $arg; $_++) {
    return 0 if ($arg % $_ == 0);
  }
  return 1;
}

print $target;
