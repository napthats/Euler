use warnings;
use strict;
use feature qw(say);

sub num_days_inmonth {
  my $year = shift;
  my $month = shift;



  if ($month == 2) {
    return 29 if ($year % 4 == 0);#if (($year%4 == 0 && $year%100 != 0) || $year % 400 == 0);
    return 28;
  }

  return 30 if ($month == 4 || $month == 6 || $month == 9 || $month == 11);
  return 31;
}

my $sun_count = 0;
my $ord = 1;

for my $year (1900 .. 2000) {
  for my $month (1 .. 12) {
    do{say "hi", $sun_count++} if ($ord == 0 && $year != 1900);
    
    $ord += num_days_inmonth($year, $month);
    say num_days_inmonth($year, $month);
#    say $ord;
    $ord %= 7;
  }
  say $year;
}

print $sun_count;
