use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/table/view/view_name')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('VIEW1.DWG')->s,
);
is($obj->views->[0]->view_name, 'VIEW1', 'View name (VIEW1).');
