use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 14;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/solid')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('SOLID1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 11, 'Get entity type (11).');
my $solid1_data = $entity1->data;
my $entity_common = $solid1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Point layer index (0).');
is($entity_common->entity_size, 72, 'Entity size (72).');
is($solid1_data->corner1->x, 0, 'Solid corner1 x (0).');
is($solid1_data->corner1->y, 1, 'Solid corner1 y (1).');
is($solid1_data->corner2->x, 1, 'Solid corner2 x (1).');
is($solid1_data->corner2->y, 6, 'Solid corner2 y (6).');
is($solid1_data->corner3->x, 4, 'Solid corner3 x (4).');
is($solid1_data->corner3->y, 5, 'Solid corner3 y (5).');
is($solid1_data->corner4->x, 1, 'Solid corner4 x (1).');
is($solid1_data->corner4->y, 0, 'Solid corner4 y (0).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
