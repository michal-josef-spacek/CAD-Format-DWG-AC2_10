use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 14;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/attrib')->set;

# Test.
note("File 'ATTRIB1.DWG'");
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('ATTRIB1.DWG')->s,
);
my $entity2 = $obj->entities->entities->[1];
isa_ok($entity2, 'CAD::Format::DWG::AC2_10::Entity');
is($entity2->entity_type, 16, 'Get entity type (16).');
my $attrib1_data = $entity2->data;
my $entity_common = $attrib1_data->entity_common;
is($attrib1_data->entity_layer_index, 0, 'Arc layer index (0).');
is($attrib1_data->entity_size, 66, 'Entity size (66).');
is($attrib1_data->point_from->x, 0, 'Attdef point from x (0).');
is($attrib1_data->point_from->y, 2, 'Attdef point from y (2).');
is($attrib1_data->height, 3.75, 'Attdef height (3.75).');
is($attrib1_data->value, 'bar', 'Attdef prompt (bar).');
is($attrib1_data->tag, 'ATTRIBUTE', 'Attdef attribute (ATTRIBUTE).');
is($attrib1_data->horiz_alignment, 3, 'Attdef horizontal alignment (3 - aligned).');
is($attrib1_data->aligned_to->x, 10, 'Attdef aligned to x (10).');
is($attrib1_data->aligned_to->y, 2, 'Attdef aligned to y (2).');
my $entities = @{$obj->entities->entities};
is($entities, 3, 'Number of entities (3).');
