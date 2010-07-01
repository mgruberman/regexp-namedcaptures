#!perl -T
use Test::More tests => 3;
use Regexp::NamedCaptures;

is( qr/(?<\$a>pattern)/,
    qr/(?:(pattern)(?{$a=$^N})|(?{$a=undef}))/ );

is( qr/(?<\$a>(?<\$b>pattern))/,
    qr/(?:((?:(pattern)(?{$b=$^N})|(?{$b=undef})))(?{$a=$^N})|(?{$a=undef}))/ );

TODO: {
    local $TODO = "Perl doesn't inform me of \\Q when it starts right at the beginning of an expression.";
    
    is( qr/\Q(?<\$a>pattern)\E/,
	qr/\(\<\$a\>pattern\)/ );
}
