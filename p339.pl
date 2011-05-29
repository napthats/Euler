use warnings;
use strict;
use feature qw(say);
use List::Util qw(max);


my @orcache;
my @orcache_zero;


#for (0 .. 10) {
#  say num_of_expected_nozero($_, 10 - $_);
#}

say num_of_expected(5, 5, 1);



sub num_of_expected {
  my $white = shift;
  my $black = shift;
  my $mul = shift;

  return 0 if ($mul < 1 / 1_000_000);
  return $black if ($white == 0);
  return 0 if ($black == 0);

  my $maxvalue = num_of_expected_nozero($white, $black, $mul); #removeすると決めた場合
  my $dw = $white / ($white + $black);

  my $remove_value = ($dw) * num_of_expected($white - 1, $black + 1, $mul * $dw) + (1 - $dw) * num_of_expected($white + 1, $black - 1, $mul * (1 - $dw));
  $maxvalue = $remove_value > $maxvalue ? $remove_value : $maxvalue;
}


sub num_of_expected_nozero {
  my $white = shift;
  my $black = shift;
  my $mul = shift;

  return $orcache[$white][$black] if ($orcache[$white][$black]);
  return $black if ($white == 0);
  return 0 if ($black == 0);


  my $maxvalue = 0;
  my $maxremove;

  for my $remove (1 .. $white) {
    my $expected;
    if ($remove == $white) {
      $expected = $black;
#    } elsif ($black == 0) {
#      $expected = num_of_expected2($white - $remove - 1, 1);
    } else {
      my $dw = ($white - $remove) / ($white - $remove + $black);
      $expected = ($dw) * num_of_expected($white - $remove - 1, $black + 1, $mul * $dw) + (1 - $dw) * num_of_expected($white - $remove + 1, $black - 1, $mul * (1 - $dw));
    }
    if ($expected > $maxvalue) {
      $maxvalue = $expected;
      $maxremove = $remove;
    }
  }
#  say "$white $black $maxvalue";
  $orcache[$white][$black] = $maxvalue;
  return $maxvalue;
}




sub num_of_expected_sim {
  my $white = shift;
  my $black = shift;

  return $black if ($white == 0);

  my $maxvalue = 0;
  my $maxremove;

  for my $remove (0 .. $white) {
    my $expected;
    if ($remove == $white) {
      $expected = $black;
    } elsif ($black == 0) {
      $expected = num_of_expected_sim($white - $remove - 1, $black + 1);
    } else {
      my $dw = ($white - $remove) / ($white - $remove + $black);
      if (rand($white + $black - $remove) < $black) {
        $expected = num_of_expected_sim($white - $remove + 1, $black - 1);
      } else {
        $expected = num_of_expected_sim($white - $remove - 1, $black + 1);
      }
    }
    if ($expected > $maxvalue) {
      $maxvalue = $expected;
      $maxremove = $remove;
    }
  }
  return $maxvalue;
}







=pod
sub num_of_expected {
  my $white = shift;
  my $black = shift;
  my $priv_dw = shift;

  return $orcache[$white][$black] if ($orcache[$white][$black]);
  return $black if ($white == 0);
#  return 0 if ($black == 0);
  return 0 if ($priv_dw < 1 / 1_000_000_000_000);

  my $maxvalue = 0;
  my $maxremove;

  for my $remove (0 .. $white) {
    my $expected;
    if ($remove == $white) {
      $expected = $black;
    } elsif ($black == 0) {
      $expected = num_of_expected($white - $remove - 1, 1, $priv_dw);
    } else {
      my $dw = ($white - $remove) / ($white - $remove + $black);
      $expected = ($dw) * num_of_expected($white - $remove - 1, $black + 1, $priv_dw * $dw) + (1 - $dw) * num_of_expected($white - $remove + 1, $black - 1, $priv_dw * (1 - $dw));
    }
    if ($expected > $maxvalue) {
      $maxvalue = $expected;
      $maxremove = $remove;
    }
  }
  
#  say "$white $black $maxvalue";
  $orcache[$white][$black] = $maxvalue;
  return $maxvalue;
}
