#!/usr/bin/perl -w
use strict;

# Write a function that returns the sum of two numbers.
sub add {
    my ($param1, $param2) = @_;
    $param1 + $param2;
}

# Given a year, return the century it is in. 
sub centuryFromYear {
    my ($year) = @_;
    int(($year + 99) / 100);
}

# Given the string, check if it is a palindrome.
sub checkPalindrome {
	my ($inputString) = @_;
    
    # my @inputArray = split('', $inputString);
    # my $length = $#inputArray + 1;
    # for(my $i = 0; $i < int($length / 2); $i++) {
    #     if($inputArray[$i] ne $inputArray[$length - $i - 1]) {
    #         return "false";
    #     }
    # } 
    
    # "true";

    return $inputString eq reverse($inputString);
}

# Given an array of integers, find the pair of adjacent elements 
# that has the largest product and return that product.
sub adjacentElementsProduct {
    my (@inputArray) = @_;
    my $inputArraySize = $#inputArray;
    
    my $max_product = $inputArray[0] * $inputArray[1];

    foreach my $i (2..$inputArraySize) {
        if((my $product = $inputArray[$i] * $inputArray[$i - 1]) > $max_product) {
            $max_product = $product;
        }
    }
    
    return $max_product;
}

# Below we will define an n-interesting polygon. 
# Your task is to find the area of a polygon for a given n.
# A 1-interesting polygon is just a square with a side of length 1. 
# An n-interesting polygon is obtained by taking the n - 1-interesting 
# polygon and appending 1-interesting polygons to its rim, side by side. 
# You can see the 1-, 2-, 3- and 4-interesting polygons in the picture below.
#                #
#     #         ###
#                #
sub shapeArea {
	my ($n) = @_;

    if($n == 1) {
        return $n;
    }

    my $area = 1;
    foreach my $i (1..$n - 1) {
        $area += 4 * $i;
    }
    
    return $area;
}

# Ratiorg got statues of different sizes as a present from CodeMaster
# for his birthday, each statue having an non-negative integer size.
# Since he likes to make things perfect, he wants to arrange them from
# smallest to largest so that each statue will be bigger than the previous
# one exactly by 1. He may need some additional statues to be able to accomplish
# that. Help him figure out the minimum number of additional statues needed.
sub makeArrayConsecutive2 {
	my (@statues) = @_;
    my $size = scalar @statues;

    my $max = $statues[0];
    my $min = $max;
    foreach my $i (1..$size - 1) {
        if($statues[$i] > $max) {
            $max = $statues[$i];
        } elsif($statues[$i] < $min) {
            $min = $statues[$i];
        }
    }

    return ($max - $min + 1) - $size;
}

# subroutine calls
print "add(5, 12): ", &add(5, 12), "\n";
print "centuryFromYear(1905): ", &centuryFromYear(1905), "\n";
print "centuryFromYear(2000): ", &centuryFromYear(2000), "\n";
print "checkPalindrome(eemee): ", &checkPalindrome("eemee"), "\n";
print "checkPalindrome(h): ", &checkPalindrome('h'), "\n";
print "checkPalindrome(ww): ", &checkPalindrome('ww'), "\n";
print "checkPalindrome(wertyhg): ", &checkPalindrome('wertyhg'), "\n";
print "adjacentElementsProduct(3, 6, -2, -5, 7, 3): ", adjacentElementsProduct(3, 6, -2, -5, 7, 3), "\n";
print "adjacentElementsProduct(9, 5, 10, 2, 24, -1, -48): ", adjacentElementsProduct(9, 5, 10, 2, 24, -1, -48), "\n";
print "adjacentElementsProduct(1, 2, 3): ", adjacentElementsProduct(1, 2, 3), "\n";
print "shapeArea(1): ", shapeArea(1), "\n";
print "shapeArea(2): ", shapeArea(2), "\n";
print "shapeArea(3): ", shapeArea(3), "\n";
print "shapeArea(4): ", shapeArea(4), "\n";
print "shapeArea(8): ", shapeArea(8), "\n";
print "makeArrayConsecutive2(6, 2, 3, 8): ", makeArrayConsecutive2(6, 2, 3, 8), "\n";
print "makeArrayConsecutive2(6, 3): ", makeArrayConsecutive2(6, 3), "\n";
print "makeArrayConsecutive2(3): ", makeArrayConsecutive2(3), "\n";
