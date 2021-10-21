use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/header/ortho')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('BLANK.DWG')->s,
);
is($obj->header->ortho, 0, 'Ortho mode (0 - off/default).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('ORTHO_ON.DWG')->s,
);
is($obj->header->ortho, 1, 'Ortho mode (1 - on).');
