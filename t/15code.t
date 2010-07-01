#!perl
use warnings;
use Test::More tests => 4;

is( eval( "#line ".(1+__LINE__)." \"".__FILE__."\"\n"
	  . "use Regexp::NamedCaptures;\n"
	  . "qr/(?<\\\$bar{\"(?<\\\$_>...)\"}>...)/" )
    || $@,
    '(?-xism:(?:(...)(?{$bar{"(?<$_>...)"}=$^N})|(?{$bar{"(?<$_>...)"}=undef})(?!)))' );
is( eval( "#line ".(1+__LINE__)." \"".__FILE__."\"\n"
	  . "use Regexp::NamedCaptures;\n"
	  . "qr/(?<\\\$bar{\"(?'\\\$_'...)\"}>...)/" )
    || $@,
    q[(?-xism:(?:(...)(?{$bar{"(?'$_'...)"}=$^N})|(?{$bar{"(?'$_'...)"}=undef})(?!)))] );
is( eval( "#line ".(1+__LINE__)." \"".__FILE__."\"\n"
	  . "use Regexp::NamedCaptures;\n"
	  . "qr/(?'\\\$bar{\"(?<\\\$_>...)\"}'...)/" )
    || $@,
    q[(?-xism:(?:(...)(?{$bar{"(?<$_>...)"}=$^N})|(?{$bar{"(?<$_>...)"}=undef})(?!)))] );
is( eval( "#line ".(1+__LINE__)." \"".__FILE__."\"\n"
	  . "use Regexp::NamedCaptures;\n"
	  . "qr/(?'\\\$bar{\"(?\\'\\\$_\\'...)\"}'...)/" )
    || $@,
    q[(?-xism:(?:(...)(?{$bar{"(?'$_'...)"}=$^N})|(?{$bar{"(?'$_'...)"}=undef})(?!)))] );
