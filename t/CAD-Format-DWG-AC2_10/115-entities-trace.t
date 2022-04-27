use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 14;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/trace')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('TRACE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 9, 'Get entity type (9).');
my $trace1_data = $entity1->data;
my $entity_common = $trace1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Point layer index (0).');
is($entity_common->entity_size, 72, 'Entity size (72).');
is($trace1_data->corner1->x, 0.75, 'Trace corner1 x (0.75).');
is($trace1_data->corner1->y, 1, 'Trace corner1 y (1).');
is($trace1_data->corner2->x, 1.25, 'Trace corner2 x (1.25).');
is($trace1_data->corner2->y, 1, 'Trace corner2 y (1).');
is($trace1_data->corner3->x, 0.75, 'Trace corner3 x (0.75).');
is($trace1_data->corner3->y, 3, 'Trace corner3 y (3).');
is($trace1_data->corner4->x, 1.25, 'Trace corner4 x (1.25).');
is($trace1_data->corner4->y, 3, 'Trace corner4 y (3).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
