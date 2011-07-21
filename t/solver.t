#!/usr/bin/perl

use strict;
use warnings;
use Test::More 'no_plan';
use List::MoreUtils qw/uniq/;

use Queens;

my $q2 = Queens->new(2);
my $q4 = Queens->new(4);

is_deeply([$q2->solutions()],[], "2-queens problem has no solutions");
is_deeply([$q4->solutions()],[[1,3,0,2],[2,0,3,1]], "4-queens problem");

my $tests = 2;

for my $size (1 .. 6) {
	my $q = Queens->new($size);
	for my $soln ($q->solutions()) {
		# Each row must be used exactly once
		is($size, scalar(uniq(@$soln)),
		   "Solution @$soln has row interference, size $size");
		$tests++;
		# Queens must not interfere diagonally
		for my $i (0 .. ($size - 1)) {
			my $pos = $soln->[$i];
			for my $j (0 .. ($size - 1)) {
				next if $i == $j;
				my $vdiff = abs($soln->[$i] - $soln->[$j]);
				ok (abs($i - $j) != $vdiff,
					"Diagonal interference in @$soln");
				$tests++;
			}
		}
	}
}

done_testing($tests);
