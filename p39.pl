use warnings;
use strict;
use feature qw(say);
use List::Util qw(max);
use Readonly;
use List::MoreUtils qw(first_index);

Readonly my $MAX_P => 1000;



my @solutions_of;

for my $a (1 .. $MAX_P) {
    for my $b (1 .. $a) {
        my $c = sqrt($a**2 + $b**2);
        next if ($c != int $c);
        next if ($a + $b + $c > $MAX_P);
        push @{$solutions_of[$a+$b+$c]}, [$a, $b, $c];
    }
}

my $max = max map {defined $_ ? 0+@{$_} : 0} @solutions_of;

#say $max;
#for (@{$solutions_of[840]}) {
#    say join q{,}, @{$_};
#}




#say first_index {$_ == $max} map {defined $_ ? 0+@{$_} : 0} @solutions_of;

=pod

my $max = 0;

for my $p (1 .. $MAX_P) {
    my $solutions_num = 0;

    for my $a (1 .. $p) {
        for my $b (1 .. $p - $a) {
            my $c = $p - $a - $b;
            my @list = sort $a, $b, $c;
            $solutions_num++ if ($list[0]**2 + $list[1]**2 == $list[2]**2);
        }
    }
    $max = $solutions_num > $max ? $solutions_num : $max;
}

say $max;
