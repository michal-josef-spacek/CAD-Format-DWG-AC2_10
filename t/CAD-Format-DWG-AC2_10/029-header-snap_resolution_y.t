use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/snap_resolution_y')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->snap_resolution_y, 1, 'Snap resolution y (1 - default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('SNAP1.DWG')->s,
);
is($obj->header->snap_resolution_y, 9.8765, 'Snap resolution y (9.8765).');
