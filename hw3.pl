#!/usr/bin/perl -w
use strict;

my $s = 'abcdefgh';

my @letters = split('', $s);

print $letters[index($s, 'a')], "\n";
print $letters[index($s, 'c')], "\n";
print $letters[index($s, 'h')], "\n";
print $letters[index($s, 'f')], "\n";