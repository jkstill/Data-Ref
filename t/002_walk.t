# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 3;

BEGIN { use_ok( 'Data::Ref::JSON' ); }

my %tc = (
   'HL01-01' => {
       'HL02-01' => [
           'element 0',
           'element 1',
           'element 2'
        ]
   },

   'HL01-02' => {
       'HL02-01' => {
           K4 => 'this is key 4',
           K5 => 'this is key 5',
           K6 => 'this is key 6'
       }
	}

);

my $object = Data::Ref::JSON->new ({ DATA => \%tc } );
isa_ok ($object, 'Data::Ref::JSON');

eval {
	$object->walk;
};
ok(! $@ );


