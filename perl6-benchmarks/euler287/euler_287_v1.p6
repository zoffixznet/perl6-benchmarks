#!/usr/bin/env perl6

# The Expat License
#
# Copyright (c) 2018, Shlomi Fish
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

my $N = 24;
my $E = 1 +< ($N-1);
my $E2 = $E*$E;
my $M = (($E +< 1) - 1);


sub probe($x, $y)
{
    return ($x*$x + $y*$y <= $E2);
}

my %counts;

sub Len($x, $y, $w)
{
    # say $w, '=', ++%counts{$w};
    if $w == 1 {
        return 2;
    }
    my $x2 = $x + $w - 1;
    my $y2 = $y + $w - 1;
    if probe($x, $y) == probe($x, $y2) == probe($x2, $y2) == probe($x2, $y) {
        return 2;
    }
    return split_len($x, $y, $w);
}


sub split_len($x, $y, $w) {
    my $w2 = $w +> 1;
    my $xm = $x + $w2;
    my $ym = $y + $w2;
    return 1 + Len($x, $y, $w2) + Len($xm, $y, $w2) + Len($x, $ym, $w2) + Len($xm, $ym, $w2);
}

say split_len(-$E, -$E, $M+1);
