my $sum_of_sq;
my $sq_of_sum;


for (1..100) {
  $sq_of_sum += $_;
}
$sq_of_sum *= $sq_of_sum;

#print $sq_of_sum;

for (1..100) {
  $sum_of_sq += $_**2;
}

print $sum_of_sq - $sq_of_sum;
