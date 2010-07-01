#!perl -T
use Test::More tests => 3;
use Regexp::NamedCaptures;

{
    # Unescaped lvalue in non-interpolating regexp
    my $expr = 'b';
    my $tgt;
    use re 'eval';
    "a b c" =~ m/a (?<\$tgt>$expr) c/;
    is( $tgt, 'b' );
}

# The following two tests attempt to make sure the failure condition
# code runs to empty out the bad targets. If I was sure that one case
# would work reliably, I'd use only one test.
{
    {
        my $expr = qr/\w+/;
	my $tgt;
        use re 'eval';
	"foo bar baz" =~ /foo (?<\$tgt>$expr) (\w+)(?:\s+(\w+))/;
	is( $tgt, undef );
    }
    {
	my $tgt;
	my $fail = "(?!)";
        my $expr = qr/\w+/;
        use re 'eval';
	"foo bar baz" =~ /foo (?<\$tgt>$expr) (??{ $fail })/;
	is( $tgt, undef );    
    }
}
