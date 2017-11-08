#!/usr/bin/perl -w
use strict;

#############################################
# 52
sub longestWord {
	my ($text) = @_;
    
    my @text = split(/[^\w]+/, $text);
    
    my $result;
    my $tmp;
    foreach(@text) {
        if(length($_) > length($result)) {
            $result = $_;
        }
        $tmp = "";
    }
    
    if(length($result) == 0) {
        return $tmp;
    }
    
    return $result;
}

#############################################
# 53
sub validTime {
	my ($time) = @_;
    
    if(($time =~ /[01][0-9]:.*/ || $time =~ /2[0-3]:.*/) && $time =~ /.*:[0-5][0-9]/ && $time ne "24:00") {
        return 'true';
    }

    return 'false';
}

#############################################
# 54
sub sumUpNumbers {
	my ($inputString) = @_;
    
    my @num_array = split(/[^\d]+/, $inputString);
    
    my $sum = 0;
    foreach(@num_array) {
        $sum += $_;
    }
    
    return $sum;
}

#############################################
# 55
sub differentSquares {
	my ($matrix) = @_;
    
    my %hash;
    for $row (0..$#$matrix - 1) {
        for $col (0..@{$matrix->[$row]} - 2) {
            $hash{$matrix->[$row][$col] . $matrix->[$row][$col + 1] . $matrix->[$row + 1][$col].$matrix->[$row + 1][$col + 1]} = ();
        }
    }
    
    return scalar(keys(%hash);
}

#############################################
# 56
sub digitsProduct {
	my ($product) = @_;
    
    if($product == 0) {
        return 10;
    }
    
    if($product == 1) {
        return 1;
    }
    
    my $result;
    for(my $i = 9; $i >= 2; ) { 
        if(int($product / $i) == $product / $i) {
            $product = $product / $i;
            $result .= $i;
        } else {
            --$i;
        }
    }
    
    if(length($result) == 0 || $product % 11 == 0) {
        return -1;
    }
    
    my @number;
    foreach(split('', $result)) {
        unshift(@number, $_);
    }
    
    return int(join('', @number));
}

#############################################
# 57
sub fileNaming {
	my ($names) = @_;
    
    my @result;

	my %hash;
	foreach my $name (@{$names}) {
		if(!exists($hash{$name})) {
			$hash{$name} = 1;
			push(@result, $name);
		} else {
			my $i = 1;
			while(exists($hash{$name . '(' . $i . ')'})) {
				++$i;
            }

			my $str = $name . '(' . $i . ')';
			$hash{$str} = 1;
            push(@result, $str);
		}
	}

	return \@result;
}

#############################################
# 58
sub get_decimal {
    my ($byte) = @_;
    
    my $factor = 1;
    my $number = 0;

    while ($byte != 0) {
        $number += ($byte % 10) * $factor;
        $byte /= 10;
        $factor *= 2;
    }

    return $number;
}

sub messageFromBinaryCode {
	my ($code) = @_;
    
    my $result;
    for(my $i = 0; $i < length($code); $i += 8) {
        my $ascii_code = get_decimal(substr($code, $i, 8));
        $result .= chr($ascii_code);
    }
    
    return $result;
}
