#!/usr/bin/perl

use strict;
use warnings;

use lib file(__FILE__)->dir->parent->subdir('lib')->stringify;

use Queens;

my $q2 = Queens->new(2);
my $q4 = Queens->new(4);

is_deeply($q2->solutions(),[]);
is_deeply($q4->solutions(),[[1,3,0,2],[2,0,3,1]]);
