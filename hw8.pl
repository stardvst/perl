#!/usr/bin/perl -w
use strict;

#############################################
# 14
sub alternatingSums {
	my ($a) = @_;
    my @a = @$a;

    my @sums = (0, 0);
    for(my $i = 0; $i <= $#a; $i += 2) {
        $sums[0] += $a[$i];
        if($i + 1 <= $#a) {
            $sums[1] += $a[$i + 1];
        }
    }

    @sums;
}

#############################################
# 15
sub addBorder {
	my ($picture) = @_;
    
    my $line_size = length(@$picture[0]) + 2;

    my @result;
    
    push(@result, '*' x $line_size);
    foreach(@$picture) {
        push(@result, '*' . $_ . '*');
    }
    push(@result, '*' x $line_size);

    @result;
}

#############################################
# 16
sub areSimilar {
	my ($a, $b) = @_;

    my %hash;
    my $similar = 1;
    foreach(0..scalar @$a - 1) {
        if(@$a[$_] != @$b[$_]) {
            if(!exists $hash{@$a[$_]}) {
                my $hash_size = keys %hash;
                if($hash_size == 0) {
                    $hash{@$a[$_]} = @$b[$_]; 
                    $similar = 0;
                } elsif(exists $hash{@$b[$_]} && $hash{@$b[$_]} eq @$a[$_]) {
                    $hash{@$a[$_]} = @$b[$_];
                    $similar = 1;
                } else {
                    $hash{@$a[$_]} = @$b[$_]; 
                    $similar = 0;
                }
            } else {
                return 0;
            }
        }
    }

    my $size = keys %hash;
    $size ? $size == 2 && $similar : $similar;
}

#############################################
# 17
sub arrayChange {
	my ($inputArray) = @_;
    my @inputArray = @$inputArray;

    my $times = 0;
    foreach(1..$#inputArray) {
        if($inputArray[$_] <= $inputArray[$_ - 1]) {
            my $diff = $inputArray[$_ - 1] - $inputArray[$_] + 1;
            $times += $diff;
            $inputArray[$_] += $diff;
        }
    }

    $times;
}

#############################################
# 18
sub palindromeRearranging {
	my ($inputString) = @_;
    my @inputString = split('', $inputString);

    my @times = ();
    foreach(@inputString) {
        ++$times[ord($_) - ord('a')];
    }

    my $odd = 0;
    foreach(@times) {
        if(defined($_) && $_ & 1) {
            if($odd) {
                return 0;
            }
            $odd = 1;
        }
    }
    1;
}


#############################################
# tests

#############################################
# 14
print "14:\n";
foreach(alternatingSums([50, 60, 60, 45, 70])) {
    print $_, ' ';
}
print "\n\n";
foreach(alternatingSums([100, 50])) {
    print $_, ' ';
}
print "\n\n15:\n";

#############################################
# 15
foreach(addBorder(["abc", "ded"])) {
    print $_, "\n";
}
print "\n";
foreach(addBorder(["a"])) {
    print $_, "\n";
}

#############################################
# 16
print "\n16:\n", areSimilar([1, 2, 3], [1, 2, 3]) ? "true" : "false";
print "\n", areSimilar([1, 1, 4], [1, 2, 3]) ? "true" : "false", "\n\n";

#############################################
# 17
print "17:\n", arrayChange([1, 1, 1]);
print "\n", arrayChange([2, 1, 10, 1]);

#############################################
# 18
print "\n\n18:\n", palindromeRearranging('aabb') ? "true" : "false", "\n";
print palindromeRearranging('zyyzzzzz') ? "true" : "false", "\n";
print palindromeRearranging('abca') ? "true" : "false", "\n";
