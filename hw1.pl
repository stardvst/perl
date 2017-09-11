#!/usr/bin/perl -w
use strict;

print '14.99 + 27.94 + 19.81 = ', 14.99 + 27.94 + 19.81, "\n";

print '20 * 15 = ', 20 * 15, "\n";

print '2^10 = ', 2 ** 10, "\n";

my @numbers = (3, 1, 8, -2, 5, -4);
my $size = $#numbers + 1;
my $min = $numbers[0];
for(my $i = 1; $i < $size; $i++) {
    if($numbers[$i] < $min) {
        $min = $numbers[$i];
    }
}
print 'min(3, 1, 8, -2, 5, -4) = ', $min, "\n";

if(3 == 4 - 2) {
    print "3 == 4-2? true\n";
} else {
    print "3 == 4-2? false\n";
}

if(19//5 == 3) {
    print "19//5 == 3? true\n";
} else {
    print "19//5 == 3? false\n";
}

if(286 % 2 == 0) {
    print "286 % 2 == 0? true\n";
} else {
    print "286 % 2 == 0? false\n";
}

if(286 % 2 == 0 && 286 % 3 == 0) {
    print "286 % 2 == 0 && 286 % 3 == 0? true\n";
} else {
    print "286 % 2 == 0 && 286 % 3 == 0? false\n";
}
