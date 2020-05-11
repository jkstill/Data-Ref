#!/usr/bin/env perl

# using procedural interface

use strict;
use warnings;
use Data::Dumper;
use IO::File;
use Getopt::Long;
use Data::Ref::JSON qw(walk);

my $debugLevel=0;
# test case file
my $tcFile = 'test-files/tc02.pl';
my $help=0;

GetOptions (
	"l|debug-level=i" => \$debugLevel,
	"f|test-file=s" => \$tcFile,
	"h|help!" => \$help
) or die usage(1);

if ($help) {
	usage();
	exit;
}


Data::Ref::JSON::setDebugLevel($debugLevel);

my $fh = new IO::File;

$fh->open($tcFile,'r') || die "cannot open $tcFile = $!\n";

my $slurpSave=$/;
undef $/; # slurp mode for file read
my $tcStr = <$fh>;
$/ = $slurpSave;

my $tc;
eval $tcStr;
Data::Ref::JSON::pdebug(1,'Test Data tc: ' , Dumper($tc));

walk($tc);

sub usage {
	print qq{

  $0 -[l|-debug-level] -[f|-test-file]  -[h|-help]

};
}
