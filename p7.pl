use warnings;
use strict;

my @list = (0) x 999;#,0,0,0,0,0,0,0,0,0);
$list[0] = 1;
$list[1] = 1;

my $c;

#print @list;


for (0..$#list-1) {
#  print "hi";
  next if ($list[$_]);
  my $prime = $_;
  for (1 .. int(999 / $prime)) {
    next if ($list[$prime * $_]);
    $list[$prime * $_] = 1;
  }
  $c++;
  print $prime if ($c == 10001);

}


print $c;
