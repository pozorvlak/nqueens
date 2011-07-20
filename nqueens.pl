#!/usr/bin/perl

# n-queens problem: given an n*n chessboard and n queens (who may move as far
# as they like vertically, horizontally or diagonally) find all arrangements of
# pieces such that no queen may take any other.

use strict;
use warnings;
use Queens 'queens';
use 5.010;

say queens($ARGV[0]);
