use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/entities_start')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->entities_start, 741, 'Start address of entities section.');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('LINE1.DWG')->s,
);
is($obj->header->entities_start, 741, 'Start address of entities section.');
