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

  # Find and mark an octal
  s/\b0([0-7]+)\b/__OCT[$1]OCT__/g;

  # Convert it to binary
  s/__OCT\[(.*)\]OCT__/"__BIN[" . sprintf("%b", oct($1)) . "]BIN__"/eg;

  tr/0574v3/ostaue/;

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

  if (/__BIN\[(.*?)\]BIN__/) {
    tr/li/1/;
    tr/o/0/;
  }

  s/__BIN\[([01]+)\]BIN__/0b$1/g;

  s/1/i/g;

  open my $cmd, "|-", "gcc -E -" or die "Failed: $!";
  print $cmd $_;
  close $cmd;
}
