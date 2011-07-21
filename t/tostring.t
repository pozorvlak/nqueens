#!/usr/bin/perl

use strict;
use warnings;
use Test::More tests => 2;
use Queens;

my $q = Queens->new(4);
is $q->solution_as_string([0,1,2,3]), "A1 B2 C3 D4", "stringify A1 B2 C3 D4";
is $q->solution_as_string([1,1,3,2]), "A2 B2 C4 D3", "stringify A2 B2 C4 D3";
