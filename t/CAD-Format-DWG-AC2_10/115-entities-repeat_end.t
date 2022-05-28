use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 10;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/repeat_end')->set;

# Test.
note("File 'REPEAT1.DWG'");
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('REPEAT1.DWG')->s,
);
my $entity3 = $obj->entities->entities->[2];
isa_ok($entity3, 'CAD::Format::DWG::AC2_10::Entity');
is($entity3->entity_type, 6, 'Get entity type (6).');
my $repeat_end1_data = $entity3->data;
my $entity_common = $repeat_end1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Repeat end layer index (0).');
is($entity_common->entity_size, 28, 'Entity size (28).');
is($repeat_end1_data->rows, 3, 'Repeat end rows (3).');
is($repeat_end1_data->columns, 3, 'Repeat end rows (3).');
is($repeat_end1_data->x, 2, 'Repeat end x (2).');
is($repeat_end1_data->y, 2, 'Repeat end y (2).');
my $entities = @{$obj->entities->entities};
is($entities, 3, 'Number of entities (3).');
