use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/table/block')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK1.DWG')->s,
);
is($obj->blocks->[0]->block_name, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ12345',
	'Block name (ABCDEFGHIJKLMNOPQRSTUVWXYZ12345).');
is($obj->blocks->[1]->block_name, 'BLOCK', 'Block name (BLOCK).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK2.DWG')->s,
);
is($obj->blocks->[0]->block_name, '*X', 'Block name (*X).');
