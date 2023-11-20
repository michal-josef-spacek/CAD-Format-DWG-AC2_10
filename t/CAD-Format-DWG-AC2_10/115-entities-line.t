use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 19;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/line')->set;

# Test.
note("File 'LINE1.DWG'");
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('LINE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 1, 'Get entity type (1).');
my $line1_data = $entity1->data;
my $entity_common = $line1_data->entity_common;
is($line1_data->entity_layer_index, 0, 'Line layer index (0).');
is($line1_data->entity_size, 40, 'Entity size (40).');
is($line1_data->x1, 0, 'Line x1 (0).');
is($line1_data->y1, 0, 'Line y1 (0).');
is($line1_data->x2, 1, 'Line x2 (1).');
is($line1_data->y2, 1, 'Line y2 (1).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
note("File 'LINE2.DWG'");
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('LINE2.DWG')->s,
);
$entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 1, 'Get entity type (1).');
$line1_data = $entity1->data;
$entity_common = $line1_data->entity_common;
is($line1_data->entity_layer_index, 301, 'Line layer index (301).');
is($line1_data->entity_size, 40, 'Entity size (40).');
is($line1_data->x1, 0, 'Line x1 (0).');
is($line1_data->y1, 0, 'Line y1 (0).');
is($line1_data->x2, 1, 'Line x2 (1).');
is($line1_data->y2, 1, 'Line y2 (1).');
$entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
