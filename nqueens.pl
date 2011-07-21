#!/usr/bin/perl

# n-queens problem: given an n*n chessboard and n queens (who may move as far
# as they like vertically, horizontally or diagonally) find all arrangements of
# pieces such that no queen may take any other.

use strict;
use warnings;
use 5.010;
use Path::Class qw/file/;
use lib file(__FILE__)->dir->subdir('lib')->absolute->stringify;

use Queens;

my $q = Queens->new($ARGV[0]);
say $q->solutions_as_string();
