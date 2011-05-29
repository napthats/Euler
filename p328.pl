use warnings;
use strict;
use feature qw ( say );
use List::Util qw ( max sum );

my @orcache;

sub cost {
  my $lower = shift;
  my $upper = shift;
  
  return 0 if ($lower >= $upper);

  my $sum_of_all = sum ($lower .. $upper);
  my $sum = 0;
  for ($lower .. $upper) {
    $sum += $_;
    if ($sum > $sum_of_all / 2) {
      say "$lower $upper";

      $_-- if ($upper - $_ == 4 || $upper - $_ == 2);

      $orcache[$lower][$_-1] //= cost($lower, $_-1);
      $orcache[$_+1][$upper] //= cost($_+1, $upper);
#      say "::";

      return $_ + max($orcache[$lower][$_-1], $orcache[$_+1][$upper]);
    }
  }
}

say cost(1, 100);
