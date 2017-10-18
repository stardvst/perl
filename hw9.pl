#!/usr/bin/perl -w
use strict;
use List::Util qw(max);

#############################################
# 19
sub areEquallyStrong {
	my ($yourLeft, $yourRight, $friendsLeft, $friendsRight) = @_;
    
    $yourLeft + $yourRight == $friendsLeft + $friendsRight &&
    max($yourLeft, $yourRight) == max($friendsLeft, $friendsRight) ? "true" : "false";
}

#############################################
# 20
sub arrayMaximalAdjacentDifference {
	my ($inputArray) = @_;

    my $max_abs = abs($inputArray->[1] - $inputArray->[0]);

    foreach(2..$#{$inputArray}) {
        my $diff = abs($inputArray->[$_] - $inputArray->[$_ - 1]);
        if($diff > $max_abs) {
            $max_abs = $diff;
        }
    }

    $max_abs;
}

#############################################
# 21
sub isIPv4Address {
	my ($inputString) = @_;

    $inputString =~ m/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;

    defined($1) && $1 >= 0 && $1 <= 255 && 
    defined($2) && $2 >= 0 && $2 <= 255 && 
    defined($3) && $3 >= 0 && $3 <= 255 && 
    defined($4) && $4 >= 0 && $4 <= 255 ? "true" : "false";
}

#############################################
# 22
sub avoidObstacles {
	my ($inputArray) = @_;

    for(my $step = 1; ; ++$step) {
        my $count = 0;
        foreach(0..$#{$inputArray}) {
            if($inputArray->[$_] % $step == 0) {
                last;
            }
            
            ++$count;
            if($count >= scalar @{$inputArray}) {
                return $step;
            }
        }
    }
}

#############################################
# 23
sub boxBlur {
	my ($image) = @_;

    my @result = ();
    for(my $i = 0; $i < scalar @{$image} - 2; ++$i) {
        my @row = ();
        for(my $j = 0; $j < scalar @{$image->[0]} - 2; ++$j) {
            my $sum = $image->[$i][$j] + $image->[$i][$j + 1] + $image->[$i][$j + 2] +
                $image->[$i + 1][$j] + $image->[$i + 1][$j + 1] + $image->[$i + 1][$j + 2] +
                $image->[$i + 2][$j] + $image->[$i + 2][$j + 1] + $image->[$i + 2][$j + 2];

            push(@row, int($sum / 9));

        }
        push(@result, @row);
    }
    return @result;
}


#############################################
# 19
print "19\n";
print 'areEquallyStrong(10, 15, 15, 10): ', areEquallyStrong(10, 15, 15, 10), "\n";
print 'areEquallyStrong(15, 10, 15, 9): ', areEquallyStrong(15, 10, 15, 9), "\n\n";

#############################################
# 20
print "20\n";
print 'arrayMaximalAdjacentDifference([2, 4, 1, 0]): ', arrayMaximalAdjacentDifference([2, 4, 1, 0]), "\n";
print 'arrayMaximalAdjacentDifference([-1, 4, 10, 3, -2]): ', arrayMaximalAdjacentDifference([-1, 4, 10, 3, -2]), "\n\n";

#############################################
# 21
print "21\n";
print 'isIPv4Address(\'172.16.254.1\'): ', isIPv4Address('172.16.254.1'), "\n";
print 'isIPv4Address(\'.254.255.0\'): ', isIPv4Address('.254.255.0'), "\n";
print 'isIPv4Address(\'1.1.1.1a\'): ', isIPv4Address('1.1.1.1a'), "\n\n";

#############################################
# 22
print "22\n";
print 'avoidObstacles([5, 3, 6, 7, 9]): ', avoidObstacles([5, 3, 6, 7, 9]). "\n";
print 'avoidObstacles([1, 4, 10, 6, 2]): ', avoidObstacles([1, 4, 10, 6, 2]), "\n";
print 'avoidObstacles([2, 3]): ', avoidObstacles([2, 3]), "\n\n";

#############################################
# 23
print "23\n";
print 'boxBlur([[1,1,1], 
        [1,7,1], 
        [1,1,1]]): ';
foreach my $row (boxBlur([[1,1,1], 
                        [1,7,1], 
                        [1,1,1]])) {
    foreach($row) {
        print $_, ' ';
    }
}
print "\n\n";

print 'boxBlur([[7,4,0,1], 
        [5,6,2,2], 
        [6,10,7,8], 
        [1,4,2,0]]): ';
foreach my $row (boxBlur([[7,4,0,1], 
                        [5,6,2,2], 
                        [6,10,7,8], 
                        [1,4,2,0]])) {
    foreach($row) {
        print $_, ' ';
    }
}
print "\n\n";

print 'boxBlur([[36,0,18,9,9,45,27], 
        [27,0,54,9,0,63,90], 
        [81,63,72,45,18,27,0], 
        [0,0,9,81,27,18,45], 
        [45,45,27,27,90,81,72], 
        [45,18,9,0,9,18,45], 
        [27,81,36,63,63,72,81]]): ';
foreach my $row (boxBlur([[36,0,18,9,9,45,27], 
                        [27,0,54,9,0,63,90], 
                        [81,63,72,45,18,27,0], 
                        [0,0,9,81,27,18,45], 
                        [45,45,27,27,90,81,72], 
                        [45,18,9,0,9,18,45], 
                        [27,81,36,63,63,72,81]])) {
    foreach($row) {
        print $_, ' ';
    }
}
print "\n\n";
