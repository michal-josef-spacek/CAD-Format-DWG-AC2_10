use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/view_dir_x')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->variables->view_dir->x, 0, 'View dir x (0 - default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('VP1.DWG')->s,
);
is($obj->header->variables->view_dir->x, 1, 'View dir x (1).');
