use strict;
use warnings;
use Module::Build;

Module::Build->new
  (
   license => 'perl',
   create_makefile_pl => 'traditional',
   create_readmore => 'Do it now. Do it harder.',
   sign => 1,

   module_name => 'Regexp::NamedCaptures',
   requires => {
		# This stuff comes with perl anyway.
		strict => 0,
		warnings => 0,
		Carp => 0,
		perl => '5.7.1',
		
		'Text::Balanced' => 0,
	       },
   recommends => {
		  'Params::Validate' => 0,
		 },
  )
  ->create_build_script();
   
