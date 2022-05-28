use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 38;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/attdef')->set;

# Test.
note("File 'ATTDEF1.DWG'");
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('ATTDEF1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 15, 'Get entity type (15).');
my $attdef1_data = $entity1->data;
my $entity_common = $attdef1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Arc layer index (0).');
is($entity_common->entity_size, 70, 'Entity size (70).');
is($attdef1_data->start_point->x, 0, 'Attdef start point x (0).');
is($attdef1_data->start_point->y, 2, 'Attdef start point y (2).');
is($attdef1_data->height, 1.2, 'Attdef height (1.2).');
is($attdef1_data->default, 'foo', 'Attdef default (foo).');
is($attdef1_data->prompt, 'q?', 'Attdef prompt (q?).');
is($attdef1_data->tag, 'ATTRIBUTE', 'Attdef attribute (ATTRIBUTE).');
is($attdef1_data->flags->verify, 0, 'Attdef flags - verify (0).');
is($attdef1_data->flags->constant, 0, 'Attdef flags - constant (0).');
is($attdef1_data->flags->invisible, 0, 'Attdef flags - invisible (0).');
is($attdef1_data->text_type, 3, 'Attdef text type (3 - text_type_aligned).');
is($attdef1_data->end_point->x, 10, 'Attdef end point x (10).');
is($attdef1_data->end_point->y, 2, 'Attdef end point y (2).');
my $entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');

# Test.
note("File 'ATTDEF2.DWG'");
$obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('ATTDEF2.DWG')->s,
);
$entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 15, 'Get entity type (15).');
$attdef1_data = $entity1->data;
$entity_common = $attdef1_data->entity_common;
is($entity_common->entity_layer_index, 0, 'Arc layer index (0).');
is($entity_common->entity_size, 88, 'Entity size (88).');
is($attdef1_data->start_point->x, 9, 'Attdef start point x (9).');
is($attdef1_data->start_point->y, 5, 'Attdef start point y (5).');
is($attdef1_data->height, 1.2345, 'Attdef height (1.2345).');
is($attdef1_data->default, 'default text', 'Attdef default (default text).');
is($attdef1_data->prompt, 'PROMPT', 'Attdef prompt (PROMPT).');
is($attdef1_data->tag, 'ATTR1', 'Attdef attribute (ATTR1).');
is($attdef1_data->flags->verify, 0, 'Attdef flags - verify (0).');
is($attdef1_data->flags->constant, 0, 'Attdef flags - constant (0).');
is($attdef1_data->flags->invisible, 0, 'Attdef flags - invisible (0).');
is($attdef1_data->rotation_angle_in_radians, 0.785398163397448,
	'Attdef rotation angle in radians (0.785398163397448 = 45 deg).');
is($attdef1_data->width_scale_factor, 2, 'Attdef width scale factor (2).');
is($attdef1_data->obliquing_angle_in_radians, 0.523598775598299,
	'Attdef obliquing angle in radins (0.523598775598299 = 30 deg).');
is($attdef1_data->text_style_index, 1, 'Attdef text style index (1).');
is($attdef1_data->generation->upside_down, 1, 'Attdef generation flags - upside/down (1).');
is($attdef1_data->generation->backwards, 1, 'Attdef generation flags - backwards (1).');
$entities = @{$obj->entities->entities};
is($entities, 1, 'Number of entities (1).');
