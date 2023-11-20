use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/table/view/flag_3d')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('VIEW1.DWG')->s,
);
is($obj->table_views->[0]->flag_3d, 0, 'View 3d flag (0).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('VIEW2.DWG')->s,
);
is($obj->table_views->[0]->flag_3d, 1, 'View 3d flag (1).');
