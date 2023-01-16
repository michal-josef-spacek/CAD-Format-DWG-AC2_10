use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/repeat_begin')->set;

# Test.
note("File 'REPEAT1.DWG'");
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('REPEAT1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 5, 'Get entity type (5).');
my $repeat1_data = $entity1->data;
my $entity_common = $repeat1_data->entity_common;
is($repeat1_data->entity_layer_index, 0, 'Point layer index (0).');
is($repeat1_data->entity_size, 8, 'Entity size (8).');
my $entities = @{$obj->entities->entities};
is($entities, 3, 'Number of entities (3).');
