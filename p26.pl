use warnings;
use strict;
use feature qw ( say );
use List::Util qw ( max );
use List::MoreUtils qw ( first_index );

sub chain_num {
  my $arg = shift;
  my $digit = 0;
  my $target = 1;
  my @remainders;

  while (1) {
    $target *= 10;
    $digit++;

    next if ($arg > $target);
    
    $target = $target % $arg;
    return 0 if (!$target);

    last if ($remainders[$target]);
    $remainders[$target] = $digit;
  }
  
  return $digit - $remainders[$target];
}




my $max = 0;
my $m;


say ${map {chain_num($_) => $_} (1 .. 999)}{max map {chain_num($_)} (1 .. 999)};

=pod

say first_index {$_ == max map {chain_num($_)} (1 .. 999)} max map {chain_num($_)} (1 .. 999);

=pod

say ${[sort {$b->[1] <=> $a->[1]} map {[$_ => chain_num($_)]} (1 .. 999)]}[0][0];

=pod

for (1 .. 999) {
  $m = $max < chain_num($_) ? $_ : $m;
  $max = $max < chain_num($_) ? chain_num($_) : $max;
}

say $m;
