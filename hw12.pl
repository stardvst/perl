#!/usr/bin/perl -w
use strict;

use List::Util qw/max/;

#############################################
# 38
sub growingPlant {
	my ($upSpeed, $downSpeed, $desiredHeight) = @_;
    
    for(my $days = 1, my $height = 0; 1; ++$days) {
        if($height + $upSpeed >= $desiredHeight) {
            return $days;
        }
        
        $height += $upSpeed - $downSpeed;
    }
}

#############################################
# 39
sub knapsackLight {
	my ($value1, $weight1, $value2, $weight2, $maxW) = @_;
    
    return $weight1 + $weight2 <= $maxW
            ? $value1 + $value2
            : $weight1 <= $maxW && $weight2 <= $maxW
                ? max($value1, $value2)
                : $weight1 <= $maxW && $weight2 > $maxW
                    ? $value1
                    : $weight2 <= $maxW && $weight1 > $maxW
                        ? $value2
                        : 0; 
}


#############################################
# 40
sub longestDigitsPrefix {
	my ($inputString) = @_;
    
    $inputString =~ m/^(\d*).*/;
    return $1;
}

#############################################
# 41
sub digitDegree {
	my ($n) = @_;
    
    my $times = 0;
    while($n > 9) {
        my $number = $n;
        $n = 0;
        while($number) {
            $n += $number % 10;
            $number /= 10;
        }
        ++$times;
    }
    return $times;
}

#############################################
# 42
sub bishopAndPawn {
	my ($bishop, $pawn) = @_;

    return 
        abs(ord(substr($bishop, 0, 1)) - ord(substr($pawn, 0, 1))) == 
        abs(ord(substr($bishop, 1)) - ord(substr($pawn, 1))) ? 'true' : 'false'; 
}

#############################################
# 43
sub isBeautifulString {
	my ($inputString) = @_;
    
    my @counts = ();
    for(0..25) {
        push(@counts, 0);
    }
    
    my @str = split('', $inputString);
    
    my $ascii_code_of_a = ord('a');
    
    foreach(0..$#str) {
        ++$counts[ord($str[$_]) - $ascii_code_of_a];
    }
    
    foreach(0..$#counts - 1) {
        if($counts[$_ + 1] > $counts[$_]) {
            return 'false';
        }
    }
    
    return 'true';
}

#############################################
# 44
sub findEmailDomain {
	my ($address) = @_;
    
    return substr($address, rindex($address, '@') + 1);
}

#############################################
# 45
sub is_palindrome {
    my ($str) = @_;
    return $str eq reverse($str);
}

sub buildPalindrome {
	my ($st) = @_;
    
    my $s1 = $st;
    my $tmp;
    
    my @st = split('', $st);
    
    while($#st && !is_palindrome(join('', @st))) {
        $tmp .= $st[0];
        shift(@st);
    }
    
    if(defined($tmp)) {
        $tmp = reverse($tmp);
        return $s1 . $tmp;
    }
    
    return $s1;
}

##########################################################################################
# tests

#############################################
# 38
print "38\n";
print 'growingPlant(100, 10, 910): ', growingPlant(100, 10, 910), "\n";
print 'growingPlant(10, 9, 4): ', growingPlant(10, 9, 4), "\n\n";

#############################################
# 39
print "39\n";
print 'knapsackLight(10, 5, 6, 4, 8): ', knapsackLight(10, 5, 6, 4, 8), "\n";
print 'knapsackLight(10, 5, 6, 4, 9): ', knapsackLight(10, 5, 6, 4, 9), "\n";
print 'knapsackLight(5, 3, 7, 4, 6): ', knapsackLight(5, 3, 7, 4, 6), "\n\n";

#############################################
# 40
print "40\n";
print 'longestDigitsPrefix("123aa1"): ', longestDigitsPrefix("123aa1"), "\n";
print 'longestDigitsPrefix("0123456789"): ', longestDigitsPrefix("0123456789"), "\n";
print 'longestDigitsPrefix("  3) always check for whitespaces"): ', longestDigitsPrefix("  3) always check for whitespaces"), "\n";
print 'longestDigitsPrefix("12abc34"): ', longestDigitsPrefix("12abc34"), "\n";
print 'longestDigitsPrefix("the output is 42"): ', longestDigitsPrefix("the output is 42"), "\n\n";

#############################################
# 41
print "41\n";
print 'digitDegree(5): ', digitDegree(5), "\n";
print 'digitDegree(100): ', digitDegree(100), "\n";
print 'digitDegree(91): ', digitDegree(91), "\n";
print 'digitDegree(99): ', digitDegree(99), "\n\n";

#############################################
# 42
print "42\n";
print 'bishopAndPawn("a1", "c3"): ', bishopAndPawn("a1", "c3"), "\n";
print 'bishopAndPawn("h1", "h3"): ', bishopAndPawn("h1", "h3"), "\n";
print 'bishopAndPawn("a5", "c3"): ', bishopAndPawn("a5", "c3"), "\n";
print 'bishopAndPawn("e7", "d6"): ', bishopAndPawn("e7", "d6"), "\n";
print 'bishopAndPawn("e3", "a7"): ', bishopAndPawn("e3", "a7"), "\n";
print 'bishopAndPawn("h1", "a8"): ', bishopAndPawn("h1", "a8"), "\n";
print 'bishopAndPawn("g1", "f3"): ', bishopAndPawn("g1", "f3"), "\n\n";

#############################################
# 43
print "43\n";
print 'isBeautifulString("bbbaacdafe"): ', isBeautifulString("bbbaacdafe"), "\n";
print 'isBeautifulString("aabbb"): ', isBeautifulString("aabbb"), "\n";
print 'isBeautifulString("bbc"): ', isBeautifulString("bbc"), "\n";
print 'isBeautifulString("bbbaa"): ', isBeautifulString("bbbaa"), "\n";
print 'isBeautifulString("abcdefghijklmnopqrstuvwxyzz"): ', isBeautifulString("abcdefghijklmnopqrstuvwxyzz"), "\n";
print 'isBeautifulString("abcdefghijklmnopqrstuvwxyzbbbaa"): ', isBeautifulString("abcdefghijklmnopqrstuvwxyz"), "\n";
print 'isBeautifulString("abcdefghijklmnopqrstuvwxyzqwertuiopasdfghjklxcvbnm"): ', isBeautifulString("abcdefghijklmnopqrstuvwxyzqwertuiopasdfghjklxcvbnm"), "\n";
print 'isBeautifulString("fyudhrygiuhdfeis"): ', isBeautifulString("fyudhrygiuhdfeis"), "\n\n";

#############################################
# 44
print "44\n";
print 'findEmailDomain("prettyandsimple@example.com"): ', findEmailDomain('prettyandsimple@example.com'), "\n";
print 'findEmailDomain("<>[]:,;@\"!#$%&*+-/=?^_{}| ~.a\"@example.org"): ', findEmailDomain('<>[]:,;@\"!#$%&*+-/=?^_{}| ~.a\"@example.org'), "\n";
print 'findEmailDomain("someaddress@yandex.ru"): ', findEmailDomain("someaddress\@yandex.ru"), "\n";
print 'findEmailDomain("\" \"@xample.org"): ', findEmailDomain("\" \"\@xample.org"), "\n\n";

#############################################
# 45
print "45\n";
print 'buildPalindrome("abcdc"): ', buildPalindrome("abcdc"), "\n";
print 'buildPalindrome("ababab"): ', buildPalindrome("ababab"), "\n";
print 'buildPalindrome("abba"): ', buildPalindrome("abba"), "\n";
print 'buildPalindrome("abaa"): ', buildPalindrome("abaa"), "\n";
