use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/insertion_base_x')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->insertion_base_x, 0, 'Insertion base x (0).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BASE_X.DWG')->s,
);
is($obj->header->insertion_base_x, 123456789.123404, 'Insertion base x (123456789.123404).');
