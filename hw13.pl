#!/usr/bin/perl -w
use strict;

use List::Util qw/max/;

#############################################
# 46
sub electionsWinners {
	my ($votes, $k) = @_;

    my $max = 0;
    foreach(@$votes) {
        if($_ > $max) {
            $max = $_;
        }
    }
    
    my $count = 0;
    foreach(@$votes) {
        if($_+ $k > $max) {
            ++$count;
        }
    }
    
    if($count == 0) {
        foreach(@$votes) {
            if($_+ $k == $max) {
                ++$count;
            }
        }
            
        if($count > 1) {
            $count = 0;
        }
    }
        
    return $count;
}


#############################################
# 47
sub isMAC48Address {
	my ($inputString) = @_;
    if($inputString =~ /^(?:[0-9A-F]{2}-){5}[0-9A-F]{2}$/) {
        return 'true';
    }
    return 'false';
}

#############################################
# 48
sub isDigit {
	my ($symbol) = @_;
    if($symbol =~ /\d/) {
        return 'true';
    }
    return 'false'; 
}

#############################################
# 49
sub lineEncoding {
	my ($s) = @_;
    
    my $result;
    for(my $i = 0; $i < length($s); ) {
        my $times = 1;
        my $letter = substr($s, $i, 1);

        ++$i;
        if($i < length($s)) {
            while((my $current = substr($s, $i, 1)) eq $letter) {
                ++$times;
                ++$i;
            }
        }

        $result .= ($times != 1) ? $times : "";
        $result .= $letter;
    }

    return $result;
}

#############################################
# 50
sub chessKnight {
	my ($cell) = @_;
    
    my $col = substr($cell, 0, 1);
    my $row = substr($cell, 1);
        
    my $col_ah = $col eq 'a' || $col eq 'h';
    my $col_bg = $col eq 'b' || $col eq 'g';

    my $count = 0;
    if($row == 1 || $row == 8) {
        $count = $col_ah ? 2 : $col_bg ? 3 : 4;
    } elsif($row == 2 || $row == 7) {
        $count = $col_ah ? 3 : $col_bg ? 4 : 6;
    } else {
        $count = $col_ah ? 4 : $col_bg ? 6 : 8;
    }

    return $count;
}

#############################################
# 51
sub delete_ith_digit {
    my ($n, $index) = @_;

    my $result = 0;
    my $mult = 1;

    for(my $count = 1; $n; ++$count, $n = int($n / 10)) {
        if($count != $index) {
            $result += $mult * ($n % 10);
            $mult *= 10;
        }
    }

    return $result;
}

#############################################
# 52
sub deleteDigit {
	my ($n) = @_;
    
    my $max = 0;
    my $num = $n;
    for(my $i = 1; $n > 0; ++$i, $n = int($n / 10)) {
        my $new_n = &delete_ith_digit($num, $i);
        if($new_n > $max) {
            $max = $new_n;
        }
    }

    return $max;
}

##########################################################################################
# tests

#############################################
# 46
print "46\n";
print 'electionsWinners("[2, 3, 5, 2], 3"): ', electionsWinners([2, 3, 5, 2], 3), "\n";
print 'electionsWinners([1, 3, 3, 1, 1], 0): ', electionsWinners([1, 3, 3, 1, 1], 0), "\n";
print 'electionsWinners([5, 1, 3, 4, 1], 0): ', electionsWinners([5, 1, 3, 4, 1], 0), "\n";
print 'electionsWinners([1, 1, 1, 1], 1): ', electionsWinners([1, 1, 1, 1], 1), "\n\n";

#############################################
# 47
print "47\n";
print 'isMAC48Address("00-1B-63-84-45-E6"): ', isMAC48Address("00-1B-63-84-45-E6"), "\n";
print 'isMAC48Address("Z1-1B-63-84-45-E6"): ', isMAC48Address("Z1-1B-63-84-45-E6"), "\n";
print 'isMAC48Address("not a MAC-48 address"): ', isMAC48Address("not a MAC-48 address"), "\n";
print 'isMAC48Address("FF-FF-FF-FF-FF-FF"): ', isMAC48Address("FF-FF-FF-FF-FF-FF"), "\n";
print 'isMAC48Address("00-00-00-00-00-00"): ', isMAC48Address("00-00-00-00-00-00"), "\n";
print 'isMAC48Address("02-03-04-05-06-07-"): ', isMAC48Address("02-03-04-05-06-07-"), "\n\n";

#############################################
# 48
print "48\n";
print 'isDigit("0"): ', isDigit("0"), "\n";
print 'isDigit("-"): ', isDigit("-"), "\n";
print 'isDigit("O"): ', isDigit("O"), "\n";
print 'isDigit("1"): ', isDigit("1"), "\n";
print 'isDigit("2"): ', isDigit("2"), "\n";
print 'isDigit("!"): ', isDigit("!"), "\n\n";

#############################################
# 49
print "49\n";
print 'lineEncoding("aabbbc"): ', lineEncoding("aabbbc"), "\n";
print 'lineEncoding("abbcabb"): ', lineEncoding("abbcabb"), "\n";
print 'lineEncoding("abcd"): ', lineEncoding("abcd"), "\n\n";

#############################################
# 50
print "50\n";
print 'chessKnight("a1"): ', chessKnight("a1", "c3"), "\n";
print 'chessKnight("c2"): ', chessKnight("c2"), "\n";
print 'chessKnight("d4"): ', chessKnight("d4"), "\n";
print 'chessKnight("g6"): ', chessKnight("g6"), "\n\n";

#############################################
# 51
print "51\n";
print 'deleteDigit(152): ', deleteDigit(152), "\n";
print 'deleteDigit(1001): ', deleteDigit(1001), "\n";
print 'deleteDigit(10): ', deleteDigit(10), "\n";
print 'deleteDigit(222219): ', deleteDigit(222219), "\n";
