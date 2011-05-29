use warnings;
use strict;
use feature qw(say);
use List::Util qw(sum);


my @a1to9 = (3, 3, 5, 4, 4, 3, 5, 5, 4);

my @a10to19 = (3, 6, 6, 8, 8, 7, 7, 9, 8, 8);

my @a20to90 = (6, 6, 5, 5, 5, 7, 6, 6);


my $count = 0;

#1to99
$count += 9 * sum @a1to9;
$count += sum @a10to19;
$count += 10 * sum @a20to90;



#*100-1000
$count *= 10;

#and
$count += 891 * 3;

#hundred
$count += 900 * 7;

#one thousand
$count += 3 + 8;

#100-999
$count += 100 * sum @a1to9;

print $count;
