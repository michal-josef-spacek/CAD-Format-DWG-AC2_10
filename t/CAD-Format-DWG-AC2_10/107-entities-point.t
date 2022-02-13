use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/point')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('POINT1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 2, 'Get entity type (2).');
my $point1_data = $entity1->data;
my $entity_common = $point1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Point layer index (0).');
is($point1_data->x, 1, 'Point x (1).');
is($point1_data->y, 1, 'Point y (1).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('POINT2.DWG')->s,
);
$entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 2, 'Get entity type (2).');
my $point2_data = $entity1->data;
$entity_common = $point2_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Point layer index (0).');
is($point2_data->x, 1.2345, 'Point x (1.2345).');
is($point2_data->y, 6.789, 'Point y (6.789).');
$entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
