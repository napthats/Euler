


my $palindrome;
for (1..999) {
  my $can = 1000 - $_;
  $palindrome = $can . ((reverse $can));# % 100);
  
  print $palindrome . qq{\n};

  my $upper = int(sqrt($palindrome));
  print $upper . qq{\n};
  for ($upper .. $palindrome/100) {
#    print $_ . qq{\n};
    next if ($palindrome % $_ != 0);
    if ($_ < 1000 && $palindrome / $_ < 1000) {
      print $_ . q{, } . ($palindrome / $_);
      die;
    }
  }
}
