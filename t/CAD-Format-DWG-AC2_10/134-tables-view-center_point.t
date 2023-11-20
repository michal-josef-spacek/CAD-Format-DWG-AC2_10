use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/table/view/center_point')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('VIEW1.DWG')->s,
);
is($obj->table_views->[0]->center_point->x, 3, 'View center point x (0).');
is($obj->table_views->[0]->center_point->y, 3, 'View center point y (0).');
