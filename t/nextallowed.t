#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 5;
use Queens;

my $q2 = Queens->new(2);
is_deeply([$q2->next_allowed(0)],[]);
my $q4 = Queens->new(4);
is_deeply([$q4->next_allowed(0)],[2,3]);
is_deeply([$q4->next_allowed(1)],[3]);
is_deeply([$q4->next_allowed(0,2)],[]);
is_deeply([$q4->next_allowed(2,0)],[3]);
