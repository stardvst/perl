#!/usr/bin/perl -w
use strict;

#############################################
# 24
sub minesweeper {
	my ($matrix) = @_;
    
    # init result matrix
    my @result = ();
    foreach(1..@{$matrix}) {
        my @row;
        foreach(1..@{$matrix->[0]}) {
            push(@row, 0);
        }
    
        push(@result, \@row);
    }
    
    foreach my $i (0..@{$matrix} - 1) {
        foreach my $j (0..@{$matrix->[0]} - 1) {
            if($matrix->[$i][$j] eq 'true') {
                if($j + 1 < @{$matrix->[$i]}) {
                    ++$result[$i][$j + 1];
                    if($i - 1 >= 0) {
                        ++$result[$i - 1][$j];
                        ++$result[$i - 1][$j + 1];
                    }
                    if($i + 1 < @{$matrix}) {
                        ++$result[$i + 1][$j];
                        ++$result[$i + 1][$j + 1];
                    }
                }
                if($j - 1 >= 0) {
                    ++$result[$i][$j - 1];
                    if($i - 1 >= 0) {
                        if($j + 1 >= @{$matrix->[$i]}) {
                            ++$result[$i - 1][$j];
                        }
                        ++$result[$i - 1][$j - 1];
                    }
                    if($i + 1 < @{$matrix}) {
                        if($j + 1 >= @{$matrix->[$i]}) {
                            ++$result[$i + 1][$j];
                        }
                        ++$result[$i + 1][$j - 1];
                    }
                }
            }
        }
    }

    \@result;
}

#############################################
# 25
sub arrayReplace {
	my ($inputArray, $elemToReplace, $substitutionElem) = @_;
    
    foreach(0..@{$inputArray} - 1) {
        if($inputArray->[$_] == $elemToReplace) {
            $inputArray->[$_] = $substitutionElem;
        }
    }

    $inputArray;
}

#############################################
# 26
sub evenDigitsOnly {
	my ($n) = @_;
    my $even = 'true';
    while($n) {
        if(($n % 10) % 2 == 1) {
            $even = 'false';
        }
        $n /= 10;
    }

    $even;
}

#############################################
# 27
sub variableName {
	my ($name) = @_;
    
    $name =~ m/^[a-zA-Z_]([a-zA-Z0-9_])*$/ ? 'true' : 'false';
}

#############################################
# 28
sub alphabeticShift {
	my ($inputString) = @_;
    my @inputArray = split('', $inputString);

    foreach(@inputArray) {
        $_ = $_ eq 'z' ? 'a' : chr(ord($_) + 1);
    }

    @inputArray;
}

#############################################
# 29
sub chessBoardCellColor {
	my ($cell1, $cell2) = @_;
    my @cell1 = split('', $cell1);
    my @cell2 = split('', $cell2);

    # if same row
    if($cell1[1] == $cell2[1]) {
        return abs(ord($cell1[0]) - ord($cell2[0])) % 2 == 0 ? 1 : 0;
    }
    
    # if same column
    if($cell1[0] eq $cell2[0]) {
        return abs($cell1[1] - $cell2[1]) % 2 == 0 ? 1 : 0;
    }

    # even columns between cells
    if(abs(ord($cell2[0]) - ord($cell1[0])) % 2 == 0) {
        return abs($cell1[1] - $cell2[1]) % 2 == 0 ? 1 : 0;
    }
    
    return abs($cell1[1] - $cell2[1]) % 2 == 1 ? 1 : 0;
}

#############################################
# tests

#############################################
# 24
print "24\n";
print 'minesweeper([[true,false,false], 
            [false,true,false], 
            [false,false,false]]): ';
my $ref = minesweeper([['true','false','false'], 
                      ['false','true','false'], 
                      ['false','false','false']]);
foreach my $row (@$ref) {
    foreach(@$row) {
        print $_, ' ';
    }
    print "\n";    
}
print "\n\n";

#############################################
# 25
print "25\n";
print 'arrayReplace([1, 2, 1], 1, 3): ';
my $ref = arrayReplace([1, 2, 1], 1, 3);
foreach(@$ref) {
    print $_, ' ';
}
print "\n\n";

#############################################
# 26
print "26\n";
print 'evenDigitsOnly(642386): ', evenDigitsOnly(642386), "\n";
print 'evenDigitsOnly(248842): ', evenDigitsOnly(248842), "\n\n";

#############################################
# 27
print "27\n";
print 'variableName(\'var_1__Int\'): ', variableName('var_1__Int'), "\n";
print 'variableName(\'variable0\'): ', variableName('variable0'), "\n";
print 'variableName(\' variable\'): ', variableName(' variable'), "\n\n";

#############################################
# 28
print "28\n";
print "alphabeticShift('abcde'): ", alphabeticShift('abcde'), "\n";
print "alphabeticShift('z'): ", alphabeticShift('z'), "\n\n";

#############################################
# 29
print "29\n";
print 'chessBoardCellColor("A1", "C3"): ', chessBoardCellColor("A1", "C3"), "\n";
print 'chessBoardCellColor("A1", "H3"): ', chessBoardCellColor("A1", "H3"), "\n";
print 'chessBoardCellColor("B3", "H8"): ', chessBoardCellColor("B3", "H8"), "\n";
