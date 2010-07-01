#!perl -T
use Test::More tests => 5;
use Regexp::NamedCaptures;

{
    # Unescaped lvalue in non-interpolating regexp
    my $tgt;
    "a b c" =~ m'a (?<$tgt>b) c';
    is( $tgt, 'b' );
}
{
    # Escaped lvalue in non-interpolating regexp
    my $tgt;
    "a b c" =~ m'a (?<\$tgt>b) c';
    is( $tgt, 'b' );
}
{
    # Escaped lvalue in interpolating regexp
    my $tgt;
    "a b c" =~ m/a (?<\$tgt>b) c/;
    is( $tgt, 'b' );
}

# The following two tests attempt to make sure the failure condition
# code runs to empty out the bad targets. If I was sure that one case
# would work reliably, I'd use only one test.
{
    {
	my $tgt;
	"foo bar baz" =~ /foo (?<\$tgt>\w+) (\w+)(?:\s+(\w+))/;
	is( $tgt, undef );
    }
    {
	my $tgt;
	my $fail = "(?!)";
	"foo bar baz" =~ /foo (?<\$tgt>\w+) (??{ $fail })/;
	is( $tgt, undef );    
    }
}
