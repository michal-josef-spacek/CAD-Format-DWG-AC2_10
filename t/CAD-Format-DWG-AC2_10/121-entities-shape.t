use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 12;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/shape')->set;

# Test.
note("File 'SHAPE1.DWG'");
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('SHAPE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 4, 'Get entity type (4).');
my $shape1_data = $entity1->data;
my $entity_common = $shape1_data->entity_common;
is($shape1_data->entity_layer_index, 0, 'Point layer index (0).');
is($shape1_data->entity_size, 42, 'Entity size (42).');
is($shape1_data->start_point->x, 1, 'Shape start point x (1).');
is($shape1_data->start_point->y, 1, 'Shape start point y (1).');
is($shape1_data->height, 1.2345, 'Shape height (1.2345).');
is($shape1_data->item_num, 131, 'Shape item number (131).');
is($shape1_data->angle_in_radians, 0.593411945678072, 'Shape angle in radians (0.593411945678072 = 34 deg).');
is($shape1_data->load_num, 1, 'Shape load num index (1).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
