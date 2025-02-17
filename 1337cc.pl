#!/usr/bin/perl
use strict;
use warnings;

my $vowel = qr/[aeiou]/;
my $cons = qr/[bcdfghjklmnpqrstwxz]/;

while (<>) {
  # Step 1: Get stupid macros out of the way (substitutions)
  s/\|-\|/h/g;
  s/\|3/b/g;
  s/\|</k/g;
  s/vv/w/g;

  # Step 3: Perform substitutions on the rest of the line
  s/0/o/g;
  s/5/s/g;
  s/7/t/g;
  s/4/a/g;
  s/v/u/g;
  s/3/e/g;

  # We guess wether its an "i" or an "l" based on common english patterns
  if (/\b1($cons)/) {
    s/1/i/;
  }

  if (/11/) {
    s/11/ll/;
  }

  if (/($cons)1($vowel)/) {
    s/1/l/;
  }

  s/1/i/g;

  # Print the modified line
  print $_;
}
