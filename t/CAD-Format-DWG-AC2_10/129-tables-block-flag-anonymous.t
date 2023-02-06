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
is($obj->table_blocks->[0]->flag->anonymous, 0,
	'Block anonymous flag (0).');
is($obj->table_blocks->[1]->flag->anonymous, 0,
	'Block anonymous flag (0).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK2.DWG')->s,
);
is($obj->table_blocks->[0]->flag->anonymous, 1,
	'Block anonymous flag (1).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK3.DWG')->s,
);
is($obj->table_blocks->[0]->flag->anonymous, 0,
	'Block anonymous flag (0).');
