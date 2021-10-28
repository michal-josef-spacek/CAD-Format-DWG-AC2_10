use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/insertion_base_y')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->insertion_base_y, 0, 'Insertion base y.');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BASE_Y.DWG')->s,
);
is($obj->header->insertion_base_y, 123456789.1234, 'Insertion base y (123456789.1234).');
