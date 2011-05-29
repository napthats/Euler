my $path_num;

my $r_count;
my $u_count;

print calc_path(20, 20);

my $orcache;

sub calc_path {
  my $r = shift;
  my $u = shift;

  my $r_num;
  my $u_num;

  return 1 if ($r == 0 && $u == 0);

  if ($r == 0) {
    $r_num = 0;
  } else {
    $orcache->[$r-1][$u] = $r_num = $orcache->[$r-1][$u] // calc_path($r-1, $u);
  }

  if ($u == 0) {
    $u_num = 0;
  } else {
    $orcache->[$r][$u-1] = $u_num = $orcache->[$r][$u-1] // calc_path($r, $u-1);
  }

  return $r_num + $u_num;
}
