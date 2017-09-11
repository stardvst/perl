#!/usr/bin/perl -w
use strict;

my $s1 = 'good';
my $s2 = 'normal';
my $s3 = 'bad';

if(index($s2, 'l') != -1) {
    print "s2 contains \'l\'? true\n"; 
} else {
    print "s2 contains \'l\'? false\n";
}

if(index($s1, ' ') != -1) {
    print "s1 contains space? true\n"; 
} else {
    print "s1 contains space? false\n";
}

my $concat = $s1 . $s2 . $s3;
print 's1 . s2 . s3 = ', $concat, "\n";

if(index($concat, ' ') != -1) {
    print "s1 . s2 . s3 contains space? true\n";
} else {
    print "s1 . s2 . s3 contains space? false\n";    
}

print 's3 x 3 = ', $s3 x 3, "\n";

print length($concat), " symbols in s1 . s2 . s3\n";