use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 11;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/arc')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('ARC1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 8, 'Get entity type (8).');
my $arc1_data = $entity1->data;
my $entity_common = $arc1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Arc layer index (0).');
is($entity_common->entity_size, 48, 'Entity size (48).');
# XXX Construct precise values
is($arc1_data->x, 1.5, 'Arc x (1.5).');
is($arc1_data->y, -0.5, 'Arc y (-0.5).');
is($arc1_data->radius, 1.58113883008419, 'Arc radius (1.58113883008419).');
is($arc1_data->angle_from, 1.24904577239825, 'Arc start angle in radians (1.24904577239825).');
is($arc1_data->angle_to, 2.81984209919315, 'Arc end angle in radians (2.81984209919315).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
