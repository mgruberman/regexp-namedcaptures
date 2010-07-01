#!perl
use Test::More tests => 18;
BEGIN {
    $no_validate = sub { die if "@_" =~ /Params.Validate/ };
    unshift @INC, $no_validate;
}
use Regexp::NamedCaptures;
BEGIN {
    @INC = grep $_ ne $no_validate, @INC;
}

$OPEN_NAME = '<';
$CLOSE_NAME = '>';
do "t/basic";

$OPEN_NAME = '\'';
$CLOSE_NAME = '\'';
do "t/basic";
