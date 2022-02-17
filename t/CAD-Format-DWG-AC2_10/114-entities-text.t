use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 14;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/text')->set;

# Test.
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('TEXT1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 7, 'Get entity type (7).');
my $text1_data = $entity1->data;
my $entity_common = $text1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Point layer index (0).');
is($entity_common->entity_size, 58, 'Entity size (58).');
is($text1_data->x, 0, 'Text x (0).');
is($text1_data->y, 1, 'Text y (1).');
is($text1_data->height, 2.5, 'Text height (2.5).');
is($text1_data->size, 7, 'Text size (7).');
is($text1_data->value, '%%UText', 'Text value (%%UText - %%U = underlined text).');
is($text1_data->aligned_to_x, 10, 'Text aligned to x (10).');
is($text1_data->aligned_to_y, 1, 'Text aligned to y (1).');
is($text1_data->type, 3, 'Text type (3 = aligned).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
