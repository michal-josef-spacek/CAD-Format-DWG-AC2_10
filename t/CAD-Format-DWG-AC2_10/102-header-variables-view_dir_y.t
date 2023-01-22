use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/view_dir_y')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->variables->view_dir->y, 0, 'View dir y (0 - default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('VP1.DWG')->s,
);
is($obj->header->variables->view_dir->y, 1, 'View dir y (1).');
