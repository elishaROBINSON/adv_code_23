#!/usr/bin/perl
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);
use List::Util qw(reduce);

open(my $file, '<', 'file.txt');
# 12 red cubes, 13 green cubes, and 14 blue cubes

use Data::Dump qw(pp);
my $sum = 0;
my $pattern = '(\\d+) red|(\\d+) green|(\\d+) blue';
while (my $line = <$file>) {
    chomp $line;
    my @games = split /:/, $line;
    my %limits = ("r" => 0,'g' => 0,'b' => 0);
    if ($games[0] =~ /(\d+)/) {
        my $game_number = $1;

        while ($games[1] =~ /$pattern/g) {
            $limits{'r'} = $1  if $1 and $1 > $limits{'r'};
            $limits{'g'} = $2  if $2 and $2 > $limits{'g'};
            $limits{'b'} = $3  if $3 and $3 > $limits{'b'};
        }

        $sum += reduce { $a * $b } values %limits;
    }
}
close($file);
print $sum;

