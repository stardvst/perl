#!/usr/bin/perl -w
use strict;

#############################################
# 30
sub circleOfNumbers {
	my ($n, $firstNumber) = @_;
    return ($n / 2 + $firstNumber) % $n;
}

#############################################
# 31
sub depositProfit {
    my ($deposit, $rate, $threshold) = @_;

    my $i = 0;
    while($deposit < $threshold) {
        $deposit += $rate / 100 * $deposit;
        ++$i;
    }
    return $i;
}

#############################################
# 32
sub absoluteValuesSumMinimization {
	my ($a) = @_;

    my $min_sum = 10000000;
    my $result;

    foreach my $current (@{$a}) {
        my $sum = 0;
        foreach(@{$a}) {
            $sum += abs($_ - $current);
        }
        if($sum < $min_sum) {
            $min_sum = $sum;
            $result = $current;
        }
    }

    return $result;
}

#############################################
# 34
sub extractEachKth {
	my ($inputArray, $k) = @_;

    my @result = ();
    my $time = 1;
    for(0..@{$inputArray} - 1) {
        if($_ != $time * $k - 1) {
            push(@result, $inputArray->[$_]);
        } else {
            ++$time;
        }
    }

    return @result;
}

#############################################
# 35
sub firstDigit {
	my ($inputString) = @_;

    $inputString =~ m/.*(\d).*/;
    return $1;
}

#############################################
# 36
sub differentSymbolsNaive {
	my ($s) = @_;

    my %hash;
    foreach(split('', $s)) {
        $hash{$_} = 1;
    }

    return scalar(keys(%hash));
}

#############################################
# 37
sub arrayMaxConsecutiveSum {
	my ($inputArray, $k) = @_;

    my $sum = 0;
    foreach(0..$k - 1) {
        $sum += $inputArray->[$_];
    }

    my $max = $sum;
    my $prev = $sum;
    
    foreach($k..@{$inputArray} - 1) {
        $sum = $prev - $inputArray->[$_ - $k] + $inputArray->[$_];

        if($sum > $max) {
            $max = $sum;
        }

        $prev = $sum;
    }
    
    return $max;
}


#############################################
# tests

#############################################
# 30
print "30\n";
print 'circleOfNumbers(10, 2): ', &circleOfNumbers(10, 2), "\n";
print 'circleOfNumbers(10, 7): ', &circleOfNumbers(10, 7), "\n";
print 'circleOfNumbers(4, 1): ', &circleOfNumbers(4, 1), "\n\n";

#############################################
# 31
print "31\n";
print 'depositProfit(100, 20, 170): ', &depositProfit(100, 20, 170), "\n";
print 'depositProfit(100, 1, 101): ', &depositProfit(100, 1, 101), "\n";
print 'depositProfit(1, 100, 64): ', &depositProfit(1, 100, 64), "\n\n";

#############################################
# 32
print "32\n";
print 'absoluteValuesSumMinimization([2, 4, 7]): ', &absoluteValuesSumMinimization([2, 4, 7]), "\n";
print 'absoluteValuesSumMinimization([1, 1, 3, 4]): ', &absoluteValuesSumMinimization([1, 1, 3, 4]), "\n";
print 'absoluteValuesSumMinimization([23]): ', &absoluteValuesSumMinimization([23]), "\n\n";

#############################################
# 34
print "34\n";
print 'extractEachKth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3): ';
my @arr = &extractEachKth([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3);
foreach(@arr) {
    print $_, ' ';
}
print "\n";

print 'extractEachKth([1, 1, 1, 1, 1], 1): ';
@arr = &extractEachKth([1, 1, 1, 1, 1], 1);
foreach(@arr) {
    print $_, ' ';
} 
print "\n";

print 'extractEachKth([1, 2, 1, 2, 1, 2, 1, 2], 2): ';
@arr = &extractEachKth([1, 2, 1, 2, 1, 2, 1, 2], 2);
foreach(@arr) {
    print $_, ' ';
} 
print "\n\n";

#############################################
# 35
print "35\n";
print 'firstDigit("var_1__Int"): ', &firstDigit("var_1__Int"), "\n";
print 'firstDigit("q2q-q"): ', &firstDigit("q2q-q"), "\n";
print 'firstDigit("0ss"): ', &firstDigit("0ss"), "\n\n";

#############################################
# 36
print "36\n";
print 'differentSymbolsNaive("cabca"): ', &differentSymbolsNaive("cabca"), "\n";
print 'differentSymbolsNaive("aba"): ', &differentSymbolsNaive("aba"), "\n";
print 'differentSymbolsNaive("abcde"): ', &differentSymbolsNaive("abcde"), "\n\n";

#############################################
# 37
print "37\n";
print 'arrayMaxConsecutiveSum([2, 3, 5, 1, 6], 2): ', &arrayMaxConsecutiveSum([2, 3, 5, 1, 6], 2), "\n";
print 'arrayMaxConsecutiveSum([2, 4, 10, 1], 2): ', &arrayMaxConsecutiveSum([2, 4, 10, 1], 2), "\n";
print 'arrayMaxConsecutiveSum([1, 3, 2, 4], 3): ', &arrayMaxConsecutiveSum([1, 3, 2, 4], 3), "\n";
