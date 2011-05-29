use warnings;
use strict;
use feature qw( say );
use List::MoreUtils qw( uniq );

my @reslist;



for my $deno (10 .. 99) {
  for my $nume (10 .. $deno-1) {
    my @deno = split //, $deno;
    my @nume = split //, $nume;

    if ($deno[0] == $nume[0]) {
      push @reslist, $deno.q{/}.$nume if ($deno[1] / ($nume[1]?$nume[1]:1000) == $deno / $nume);
    }
    if ($deno[0] == $nume[1]) {
      push @reslist, $deno.q{/}.$nume if ($deno[1] / ($nume[0]?$nume[0]:1000) == $deno / $nume);
    }
    if ($deno[1] == $nume[0]) {
      push @reslist, $deno.q{/}.$nume if ($deno[0] / ($nume[1]?$nume[1]:1000) == $deno / $nume);
    }
    if ($deno[1] == $nume[1]) {
      push @reslist, $deno.q{/}.$nume if ($deno[0] / ($nume[0]?$nume[0]:1000) == $deno / $nume);
    }
  }
}

say join qq{\n}, @reslist;


say 95*98*64*65;
    

4
2 5
5
2
