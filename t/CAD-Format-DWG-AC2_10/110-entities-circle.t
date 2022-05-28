use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 9;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/circle')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('CIRCLE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 3, 'Get entity type (3).');
my $circle1_data = $entity1->data;
my $entity_common = $circle1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Line layer index (0).');
is($entity_common->entity_size, 32, 'Entity size (32).');
is($circle1_data->center_point->x, 1.2345, 'Circle center point x (1.2345).');
is($circle1_data->center_point->y, 2.3456, 'Circle center point y (2.3456).');
is($circle1_data->radius, 15, 'Circle radius (15).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
