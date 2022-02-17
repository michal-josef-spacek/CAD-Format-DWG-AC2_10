use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 12;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/osnap')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->variables->osnap, 0, 'Osnap mode (0 - none/default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP1.DWG')->s,
);
is($obj->header->variables->osnap, 1, 'Osnap mode (1 - endpoint).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP2.DWG')->s,
);
is($obj->header->variables->osnap, 2, 'Osnap mode (2 - midpoint).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP3.DWG')->s,
);
is($obj->header->variables->osnap, 4, 'Osnap mode (4 - center).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP4.DWG')->s,
);
is($obj->header->variables->osnap, 8, 'Osnap mode (8 - node).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP5.DWG')->s,
);
is($obj->header->variables->osnap, 16, 'Osnap mode (16 - quadrant).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP6.DWG')->s,
);
is($obj->header->variables->osnap, 32, 'Osnap mode (32 - intersection).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP7.DWG')->s,
);
is($obj->header->variables->osnap, 64, 'Osnap mode (64 - intersection).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP8.DWG')->s,
);
is($obj->header->variables->osnap, 128, 'Osnap mode (128 - perpendicular).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP9.DWG')->s,
);
is($obj->header->variables->osnap, 256, 'Osnap mode (256 - tangent).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('OSNAP10.DWG')->s,
);
is($obj->header->variables->osnap, 512, 'Osnap mode (512 - nearest).');
