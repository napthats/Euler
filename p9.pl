use feature (say);

for my $c (1 .. 1000) {
  for my $a (1 .. 1000 - $c) {
    my $b = 1000 - $a - $c;
    last if ($c**2 > $a**2 + $b**2);
    say join q{,}, ($a, $b, $c) if ($c**2 == $a**2 + $b**2);
  }
}


say 200*375*425;
