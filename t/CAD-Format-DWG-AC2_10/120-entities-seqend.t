use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/seqend')->set;

# Test.
note("File 'PLINE1.DWG'");
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('PLINE1.DWG')->s,
);
my $entity6 = $obj->entities->entities->[5];
isa_ok($entity6, 'CAD::Format::DWG::AC2_10::Entity');
is($entity6->entity_type, 17, 'Get entity type (17).');
my $seqend1_data = $entity6->data;
my $entity_common = $seqend1_data->entity_common;
is($seqend1_data->entity_layer_index, 0, 'Point layer index (0).');
is($seqend1_data->entity_size, 12, 'Entity size (12).');
is($seqend1_data->begin_addr, 0x2e5, 'Begin address of sequence (0x2e5).');
my $entities = @{$obj->entities->entities};
is($entities, 6, 'Number of entities (6).');
