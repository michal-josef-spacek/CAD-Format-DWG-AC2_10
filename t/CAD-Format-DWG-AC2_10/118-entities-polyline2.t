use strict;
use warnings;

use CAD::Format::DWG::AC2_10;
use File::Object;
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Data directory.
my $data_dir = File::Object->new->up->dir('data/entity/polyline2')->set;

# Test.
note("File 'PLINE1.DWG'");
my $obj = CAD::Format::DWG::AC2_10->from_file(
	$data_dir->file('PLINE1.DWG')->s,
);
my $entity1 = $obj->entities->entities->[0];
isa_ok($entity1, 'CAD::Format::DWG::AC2_10::Entity');
is($entity1->entity_type, 19, 'Get entity type (19).');
my $pline1_data = $entity1->data;
my $entity_common = $pline1_data->entity_common;
is($pline1_data->entity_layer_index, 0, 'Point layer index (0).');
is($pline1_data->entity_size, 9, 'Entity size (9).');
is($pline1_data->flag->closed, 1, 'Polyline is closed.');
my $entities = @{$obj->entities->entities};
is($entities, 6, 'Number of entities (6).');
