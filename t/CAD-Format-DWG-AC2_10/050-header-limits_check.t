use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/limits_check')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('LIM_OFF.DWG')->s,
);
is($obj->header->variables->limits_check, 0, 'Limits check (0 - off/default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('LIM_ON.DWG')->s,
);
is($obj->header->variables->limits_check, 1, 'Limits check (1 - on).');
