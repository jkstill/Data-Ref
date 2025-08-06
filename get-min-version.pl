#!/usr/bin/env perl


use warnings;
use strict;
use      Perl::MinimumVersion;

# Create the version checking object
my $object = Perl::MinimumVersion->new( './lib/Data/Ref/JSON.pm' );
#$object = Perl::MinimumVersion->new( \$source  );
#$object = Perl::MinimumVersion->new( $ppi_document );

# Find the minimum version
my $version = $object->minimum_version;

print "minimum version: $version\n";

