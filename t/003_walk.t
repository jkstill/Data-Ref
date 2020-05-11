# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 3;

BEGIN { use_ok( 'Data::Ref::JSON' ); }

my $tcFile = 'test-files/tc02.pl';
my $fh = new IO::File;
$fh->open($tcFile,'r') || die "cannot open $tcFile = $!\n";
my $slurpSave=$/;
undef $/; # slurp mode for file read
my $tcStr = <$fh>;
my $tc;
eval $tcStr;

my $object = Data::Ref::JSON->new ({ DATA => $tc } );
isa_ok ($object, 'Data::Ref::JSON');

eval {
	$object->walk;
};
ok(! $@);

