use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/table/view/view_dir')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('VIEW1.DWG')->s,
);
is($obj->views->[0]->view_dir->x, 0, 'View dir x (0).');
is($obj->views->[0]->view_dir->y, 0, 'View dir y (0).');
is($obj->views->[0]->view_dir->z, 1, 'View dir z (0).');
