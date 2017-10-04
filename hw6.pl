#!/usr/bin/perl -w
use strict;

use List::Util qw[min max];

sub allLongestStrings {
	my @inputArray = @_;

    my @list = ();
    my $max_length = 0;
    foreach my $word (@inputArray) {
        my $length = length($word);
        if($length > $max_length) {
            @list = ();
            push(@list, $word);
            $max_length = $length;
        } elsif($length == $max_length) {
            push(@list, $word);
        }
    }

    return @list;
}

# Given two strings, find the number of common characters between them
sub commonCharacterCount {
	my ($s1, $s2) = @_;

    my $ascii_code_of_a = ord('a');

    my @s1_chars = split('', $s1);
    my @s1_occ = ();
    foreach my $char (@s1_chars) {
        ++$s1_occ[ord($char) - $ascii_code_of_a];
    }

    my @s2_chars = split('', $s2);
    my @s2_occ = ();
    foreach my $char (@s2_chars) {
        ++$s2_occ[ord($char) - $ascii_code_of_a];
    }

    my $common_chars = 0;
    for(my $i = 0; $i < 26; ++$i) {
        if(defined($s1_occ[$i]) && defined($s2_occ[$i])) {
            $common_chars += min($s1_occ[$i], $s2_occ[$i]);
        }
    }

    return $common_chars;
}

# Ticket numbers usually consist of an even number of digits. 
# A ticket number is considered lucky if the sum of the first half
# of the digits is equal to the sum of the second half.
# Given a ticket number n, determine if it's lucky or not.
sub isLucky {
    my ($n) = @_;
    
    my @digits = split('', $n);

    my $sum_first_half = 0;
    my $sum_second_half = 0;
    my $length = scalar @digits;
    for(my $i = 0; $i < $length / 2; ++$i) {
        $sum_first_half += $digits[$i];
        $sum_second_half += $digits[$length - 1 - $i];
    }
    
    return $sum_first_half == $sum_second_half ? "true" : "false";
}

# Some people are standing in a row in a park. There are trees between them
# which cannot be moved. Your task is to rearrange the people by their
# heights in a non-descending order without moving the trees.
# If a[i] = -1, then the ith position is occupied by a tree. Otherwise
# a[i] is the height of a person standing in the ith position.
sub sortByHeight {
    my @numbers;
    foreach(@_) {
        if($_ != -1) {
            push(@numbers, $_);
        }
    }

    @numbers = sort { $a <=> $b } @numbers;

    my @result = ();
    foreach(@_) {
        if($_ == -1) {
            push(@result, -1);
        } else {
            push(@result, shift(@numbers));
        }
    }
    
    return @result;
}

#
# tests
#
my @list = allLongestStrings("aba", "aa", "ad", "vcd", "aba");
print "allLongestStrings(\"aba\", \"aa\", \"ad\", \"vcd\", \"aba\")";
foreach my $word (@list) {
    print $word, " ";
}

print 'commonCharacterCount(\'aabcc\', \'adcaa\'): ', commonCharacterCount('aabcc', 'adcaa'), "\n";

print 'isLucky(1230): ', isLucky(1230), "\n";
print 'isLucky(239017): ', isLucky(239017), "\n";

print 'sortByHeight(-1, 150, 190, 170, -1, -1, 160, 180): ';
my @result = sortByHeight(-1, 150, 190, 170, -1, -1, 160, 180);
foreach(@result) {
    print $_, ' ';
}
print "\n";

print 'sortByHeight(4, 2, 9, 11, 2, 16): ';
my @result = sortByHeight(4, 2, 9, 11, 2, 16);
foreach(@result) {
    print $_, ' ';
}
print "\n";
