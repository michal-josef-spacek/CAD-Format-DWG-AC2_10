use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 14;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/polyline2')->set;

# Test.
note("File 'PLINE1.DWG'");
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('PLINE1.DWG')->s,
);
my $entity2 = $obj->entities->entities->[1];
isa_ok($entity2, 'CAD::Format::DWG::AC2_10::Entity');
is($entity2->entity_type, 20, 'Get entity type (20).');
my $vertex1_data = $entity2->data;
my $entity_common1 = $vertex1_data->entity_common;
is($entity_common1->entity_layer_index, 0, 'Point layer index (0).');
is($entity_common1->entity_size, 24, 'Entity size (24).');
is($vertex1_data->x, 0, 'Vertex x (0).');
is($vertex1_data->y, 0, 'Vertex y (0).');
my $entity3 = $obj->entities->entities->[2];
isa_ok($entity3, 'CAD::Format::DWG::AC2_10::Entity');
is($entity3->entity_type, 20, 'Get entity type (20).');
my $vertex2_data = $entity3->data;
my $entity_common2 = $vertex2_data->entity_common;
is($entity_common2->entity_layer_index, 0, 'Point layer index (0).');
is($entity_common2->entity_size, 24, 'Entity size (24).');
is($vertex2_data->x, 1, 'Vertex x (1).');
is($vertex2_data->y, 1, 'Vertex y (1).');
my $entities = @{$obj->entities->entities};
is($entities, 6, 'Number of entities (6).');
