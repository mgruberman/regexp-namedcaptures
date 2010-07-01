#!perl -T
use Test::More tests => 1;
use warnings;
use Regexp::NamedCaptures;

BEGIN {
    $warn = '';
    $SIG{__WARN__} = sub { $warn = "@_" };
}

$undef = undef;
qr/$undef/;

like( $warn,
      qr/Use of uninitialized value.+\Q$0\E/ );
