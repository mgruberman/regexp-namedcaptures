#!perl
use warnings;
use Test::More tests => 18;
use Regexp::NamedCaptures;

$OPEN_NAME = '<';
$CLOSE_NAME = '>';
do "t/basic";

$OPEN_NAME = '\'';
$CLOSE_NAME = '\'';
do "t/basic";
