#!/usr/bin/perl
use strict;
use warnings;

open(my $file, '<', 'file.txt'); 

my $sum = 0;
my %val_hash = {
one => 1,
two => 2,
three => 3,
four => 4,
five => 5,
six => 6,
seven => 7,
eight => 8,
nine => 9
};
while (my $line = <$file>) {
    chomp $line;  
    my @digit = grep { $_ =~ /\d+|one|two|three|four|five|six|seven|eight|nine/ } split //, $line; 
    
    
    
    if (@digit) {
	    if (scalar(@digit) > 1) 
	    {
		$sum = $sum + int($digit[0].$digit[-1]) ; 
	      }
	    else
	    {
		$sum = $sum + int($digit[0].$digit[0]);
	    } 
    }
}
close($file);
print $sum;

