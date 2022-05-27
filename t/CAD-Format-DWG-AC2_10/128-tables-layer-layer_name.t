use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/table/layer/layer_name')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->layers->[0]->layer_name, 0, 'Layer name (0 - default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('LAYER3.DWG')->s,
);
is($obj->layers->[1]->layer_name, 'ABCDEFGHIJKLMNOPABCDEFGHIJKLMNO',,
	'Layer name (ABCDEFGHIJKLMNOPABCDEFGHIJKLMNO - maximum length of name).');
