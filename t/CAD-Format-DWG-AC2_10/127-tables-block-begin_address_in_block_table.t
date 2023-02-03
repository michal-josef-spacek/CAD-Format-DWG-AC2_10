use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/table/block')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK1.DWG')->s,
);
is($obj->blocks->[0]->begin_address_in_block_table, 0,
	'Block begin address in block table (0).');
is($obj->blocks->[1]->begin_address_in_block_table, 72,
	'Block begin address in block table (72).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK2.DWG')->s,
);
is($obj->blocks->[0]->begin_address_in_block_table, 0,
	'Block begin address in block table (0).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK3.DWG')->s,
);
is($obj->blocks->[0]->begin_address_in_block_table, 0,
	'Block begin address in block table (0).');
