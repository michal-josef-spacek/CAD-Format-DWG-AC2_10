use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($CAD::Format::DWG::AC2_10::VERSION, undef, 'Version.');
