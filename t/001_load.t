# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'Data::Ref' ); }

my $object = Data::Ref->new ({ DATA => {} } );
isa_ok ($object, 'Data::Ref');


