#!/usr/bin/perl
use strict;
use warnings;

open(my $file, '<', 'file.txt'); 

my $sum = 0;
my @grid = [];
while (my $line = <$file>) {
    chomp $line;  
    my @digit = split //, $line; 
    push @grid, \@digit;
}
shift @grid;
sub should_digit_be_added {
	my ($index, $y) = @_;
	for (; $index < scalar @grid; $index++) {
		return 0 if $grid[$index][$y] eq '.';
		for my $X (($index - 1)..($index + 1)) {
    		for my $Y (($y - 1)..($y + 1)) {
        		# Skip the coordinate itself
        		next if $X == $index && $Y == $y;
        		# Check if the indices are within the grid
        		if ($Y >= 0 && $Y < scalar @grid && $X >= 0 && $X < scalar @{$grid[0]}) {
					if ($grid[$X][$Y] !~ /\.|\d/ ) {
						return 1;
					} } } } }
}

for (my $y = 0; $y < scalar @grid; $y++) {
	my $string = join("", @{$grid[$y]});
	my @digits =  $string =~ /\d+/g ;
	for my $digit (@digits) {
		my $index = index($string, $digit);
		if (should_digit_be_added($index, $y)) {
			$sum += $digit;
		}
	}
}

close($file);
print $sum;
