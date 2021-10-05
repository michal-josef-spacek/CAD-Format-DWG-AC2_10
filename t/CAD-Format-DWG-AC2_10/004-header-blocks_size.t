use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/blocks_size')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->blocks_size, 0, 'Size of blocks section (0).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK1.DWG')->s,
);
is($obj->header->blocks_size, 72, 'Size of blocks section (72).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK2.DWG')->s,
);
is($obj->header->blocks_size, 136, 'Size of blocks section (136).');
