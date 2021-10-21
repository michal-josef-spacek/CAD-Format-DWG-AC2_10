use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/snap')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->snap, 0, 'Snap mode (0 - off/default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('SNAP_ON.DWG')->s,
);
is($obj->header->snap, 1, 'Snap mode (1 - on).');
