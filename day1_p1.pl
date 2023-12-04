#!/usr/bin/perl
use strict;
use warnings;

open(my $file, '<', 'file.txt'); 

my $sum = 0;
while (my $line = <$file>) {
    chomp $line;  
    my @digit = grep { $_ =~ /\d+/ } split //, $line; 
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
