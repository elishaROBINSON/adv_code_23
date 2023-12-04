#!/usr/bin/perl

use strict;
use warnings;

# Example string
my $string = "ninevbmltwo69";

# Regular expression to match words for digits and individual digits
my @matches = $string =~ /\b(one|two|three|four|five|six|seven|eight|nine)\b|\d/g;

# Print the matched elements
use Data::Dumper;
print "Matches: " . Dumper(@matches) . "\n";
