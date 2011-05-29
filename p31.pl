use warnings;
use strict;
use feature qw( say );

my $c;

for my $e1 (0 .. 2) {
  for my $p50 (0 .. 4) {
    for my $p20 (0 .. 10) {
      for my $p10 (0 .. 20) {
        for my $p5 (0 .. 40) {
          for my $p2 (0 .. 100) {
            $c++ if ($p2*2 + $p5*5 + $p10*10 + $p20*20 + $p50*50 + $e1*100 <= 200);
	  }
	}
      }
    }
  }
}

say $c;
