#!/usr/bin/perl -w
use strict;

my @lst = (159.99, 160.00, 205.95, 128.83, 175.49);

push(@lst, 160);

# count 160s
my $size = $#lst + 1;
my $count = 0;

for(my $i = 0; $i < $size; $i++) {
    if($lst[$i] == 160) {
        $count += 1;
    }
}

print $count, " 160s\n";

# find min
my $min = $lst[0]; 

for(my $i = 1; $i < $size; $i++) {
    if($lst[$i] < $min) {
        $min = $lst[$i];
    }
}

print 'min: ', $min, "\n";

# index of min
my $min_index = 0;
for(my $i = 1; $i < $size; $i++) {
    if($lst[$i] == $min) {
        $min_index = $i;
        last;
    }
}

print 'index of min: ', $min_index, "\n";

# remove min
splice(@lst, $min_index, 1);
print 'removed min: ';
foreach my $element (@lst) {
    print $element, ' ';
}
print "\n";

# sort
$size = $#lst + 1;
for(my $i = 1; $i < $size; $i++) {
    for(my $j = 0; $j < $size - 1; $j++) {
        if($lst[$j] > $lst[$j + 1]) {
            my $tmp = $lst[$j];
            $lst[$j] = $lst[$j + 1];
            $lst[$j + 1] = $tmp;
        }
    }
}

print 'sorted list: ';
foreach my $element (@lst) {
    print $element, ' ';
}
print "\n";
