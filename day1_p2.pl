#!/usr/bin/perl
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);
open(my $file, '<', 'file.txt'); 

my $sum = 0;
use Data::Dumper;
my %val_store =(
    'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
    'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9
); 

while (my $line = <$file>) {
    chomp $line;
    my $pattern = join "|", keys %val_store;
    my @digit;
    while ($line =~ /(?=($pattern|\d))/g) {
    push @digit, looks_like_number($1) ? $1 : $val_store{$1};
    }
    if (@digit) {
        if (scalar(@digit) > 1) 
        {   
    	$sum = $sum + int($digit[0].$digit[-1]); 
          }
        else
        {
    	$sum = $sum + int($digit[0].$digit[0]);
        } 
    }
}
close($file);
print $sum;

