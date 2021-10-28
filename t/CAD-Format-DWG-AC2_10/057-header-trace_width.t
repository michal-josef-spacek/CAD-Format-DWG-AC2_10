use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/trace_width')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->trace_width, 0.05, 'Trace width (0.05 - default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('TRACEW1.DWG')->s,
);
is($obj->header->trace_width, 1.2345, 'Trace width (1.2345).');
