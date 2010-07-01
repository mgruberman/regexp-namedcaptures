#!perl
use warnings;
use Test::More tests => 4;
use Regexp::NamedCaptures;
$SIG{__WARN__} = sub { $warn .= "\n@_" };

$undef = undef;
$undef = undef;

$warn = '';
like( do { Regexp::NamedCaptures::convert( undef ); $warn },
      qr/\QUse of uninitialized value in regexp compilation/ );

$warn = '';
like( eval( "#line ".(1+__LINE__)." \"".__FILE__."\"\n"
	    . "use Regexp::NamedCaptures;\n"
	    . "qr/\$undef/; \$warn" )
      || $@,
      qr/\QUse of uninitialized value in regexp compilation/ );

$warn = '';
like( eval( "#line ".(1+__LINE__)." \"".__FILE__."\"\n"
	    . "use Regexp::NamedCaptures;\n"
	    . "qr/...\$undef/; \$warn" )
      || $@,
      qr/\QUse of uninitialized value in concatenation (.) or string/ );

$warn = '';
like( eval( "#line ".(1+__LINE__)." \"".__FILE__."\"\n"
	    . "use Regexp::NamedCaptures;\n"
	    . "qr/\$undef.../; \$warn" )
      || $@,
      qr/\QUse of uninitialized value in concatenation (.) or string/ );
