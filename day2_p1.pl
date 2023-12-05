#!/usr/bin/perl
use strict;
use warnings;
use Scalar::Util qw(looks_like_number);
open(my $file, '<', 'file.txt');
# 12 red cubes, 13 green cubes, and 14 blue cubes

my %limits = ("r" => 12,'g' => 13,'b' => 14);
my $sum = 0;
my $pattern = '(\\d+) red|(\\d+) green|(\\d+) blue';
while (my $line = <$file>) {
    chomp $line;
    my @games = split /:/, $line;

    if ($games[0] =~ /(\d+)/) {
        my $game_number = $1;
        my $valid = 1;

        while ($games[1] =~ /$pattern/g) {
            $valid = 0 if $1 and $1 > $limits{'r'};
            $valid = 0 if $2 and $2 > $limits{'g'};
            $valid = 0 if $3 and $3 > $limits{'b'};
        }

        $sum += $game_number if $valid;
    }
}
close($file);
print $sum;

