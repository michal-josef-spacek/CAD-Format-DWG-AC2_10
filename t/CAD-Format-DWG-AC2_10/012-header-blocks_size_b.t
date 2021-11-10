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
is($obj->header->blocks_size_b, 0, 'Size of blocks section - 1-3 words (0).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK1.DWG')->s,
);
is($obj->header->blocks_size_b, 72, 'Size of blocks section - 1-3 words (72).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLOCK2.DWG')->s,
);
is($obj->header->blocks_size_b, 136, 'Size of blocks section - 1-3 words (136).');
