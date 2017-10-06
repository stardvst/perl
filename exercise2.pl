#!/usr/bin/perl -w
use strict;

# 1. loops
for(0..10) { print $_, ' ' }
print "\n";

for(1..9) { print $_, ' ' }
print "\n";

for(0..4) { print 2 * $_, ' ' }
print "\n";

for(0..4) { print 2 * $_ + 1, ' ' }
print "\n";

for(2..6) { print 10 * $_, ' ' }
print "\n\n";

# while loop
my $star = 6;
while($star) {
    print '*' x $star, "\n";
    --$star;
}
print "\n";

# sum_list()
sub sum_list() {
    my $sum = shift @_;
    foreach(@_) {
        $sum += $_;
    }
    $sum;
}
print 'sum_list(4, -5, 0, 1, 6, 2): ', &sum_list(4, -5, 0, 1, 6, 2), "\n\n";

# factorial()
sub factorial {
    my ($num) = @_;
    if($num <= 0) {
        return -1;
    }

    if($num == 1) {
        return 1;
    }
    $num * factorial($num - 1);
}
open(DATA, '>factorial.txt') or die('Couldn\'t open a file');
print DATA 'factorial(5): ', &factorial(5);
print 'factorial(5): ', &factorial(5), "\n\n";

# list
my $arr_ref = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
my @arr = @$arr_ref;

for(0..3) { print $arr[$_], ' '; }
print "\n";

for(3..5) { print $arr[$_], ' '; }
print "\n";

print $arr[3], "\n";
print $arr[-3], ' ', $arr[-2], "\n";

for(3..$#arr) { print $arr[$_], ' '; }
print "\n";

for(5..$#arr) { print $arr[$_], ' '; }
print "\n\n";

# acronym()
sub acronym {
    my ($str) = @_;
    my $acronym;
    my @arr = split(' ', $str);
    foreach(@arr) {
        $acronym .= uc(substr($_, 0, 1));
    }
    $acronym;
}

print 'acronym(\'Random access memory\'): ', acronym('Random access memory'), "\n\n";

# divisors()
sub divisors {
    my ($num) = @_;
    if($num <= 0) {
        return -1;
    }

    my @divisors = (1);
    for(my $i = 2; $i <= $num / 2; ++$i) {
        if($num % $i == 0) {
            push(@divisors, $i);
        }
    }
    return @divisors;
}

print "divisors(104): ";
foreach(&divisors(104)) {
    print $_, ' ';
}
print "\n\n";

# bubbleSort()
sub bubbleSort {
    my (@arr) = @_;
    my $size = @_;

    foreach(1..$size) {
        foreach(0..$size - 2) {
            if($arr[$_] > $arr[$_ + 1]) {
                ($arr[$_], $arr[$_ + 1]) = ($arr[$_ + 1], $arr[$_]);
            }
        }
    }
    @arr;
}

print 'bubbleSort(5, -2, 4, 2, 9, 3, 0): ';
foreach(&bubbleSort(5, -2, 4, 2, 9, 3, 0)) {
    print $_, ' ';
}
print "\n\n";

# negative()
sub negative() {
    my @numbers = @_;
    foreach(0..$#numbers) {
        if($numbers[$_] < 0) {
            return $_;
        }
    }
    -1;
}
print 'negative(5, 7, 1, 0, 6 -2, -6, 4, 3): ', &negative(5, 7, 1, 0, 6 -2, -6, 4, 3), "\n\n";

# wordcount()
sub wordcount() {
    my ($str) = @_;
    my %hash;
    foreach(split(' ', $str)) {
        ++$hash{$_};
    }

    foreach(keys %hash) {
        print $_, ' => ', $hash{$_}, "\n";
    }
}

&wordcount('abc def def abcd abc def asd');
