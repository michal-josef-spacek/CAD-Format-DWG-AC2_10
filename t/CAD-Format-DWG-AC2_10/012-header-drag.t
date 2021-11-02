use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/drag')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->drag, 1, 'Drag mode (1 - on/default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('DRAG_OFF.DWG')->s,
);
is($obj->header->drag, 0, 'Drag mode (0 - off).');
