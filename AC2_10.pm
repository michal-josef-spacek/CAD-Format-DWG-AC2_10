# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package CAD::Format::DWG::AC2_10;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $COORDINATES_ABSOLUTE_COORDINATES = 0;
our $COORDINATES_ABSOLUTE_COORDINATES_REALTIME = 1;
our $COORDINATES_RELATIVE_POLAR_COORDINATES = 2;

our $ENTITIES_LINE = 1;
our $ENTITIES_POINT = 2;
our $ENTITIES_CIRCLE = 3;
our $ENTITIES_SHAPE = 4;
our $ENTITIES_REPEAT_BEGIN = 5;
our $ENTITIES_REPEAT_END = 6;
our $ENTITIES_TEXT = 7;
our $ENTITIES_ARC = 8;
our $ENTITIES_TRACE = 9;
our $ENTITIES_SOLID = 11;
our $ENTITIES_BLOCK_BEGIN = 12;
our $ENTITIES_BLOCK_END = 13;
our $ENTITIES_INSERT = 14;
our $ENTITIES_ATTDEF = 15;
our $ENTITIES_SEQEND = 17;
our $ENTITIES_POLYLINE = 18;
our $ENTITIES_POLYLINE2 = 19;
our $ENTITIES_VERTEX = 20;
our $ENTITIES_LINE3D = 21;
our $ENTITIES_FACE3D = 22;
our $ENTITIES_DIM = 23;

our $ISO_PLANE_LEFT = 0;
our $ISO_PLANE_TOP = 1;
our $ISO_PLANE_RIGHT = 2;

our $ATTRIBUTES_FALSE = 0;
our $ATTRIBUTES_NORMAL = 1;
our $ATTRIBUTES_TRUE = 2;

our $ANGLE_DIRECTION_COUNTERCLOCKWISE = 0;
our $ANGLE_DIRECTION_CLOCKWISE = 1;

our $CURRENT_COLOR_BYBLOCK = 0;
our $CURRENT_COLOR_RED = 1;
our $CURRENT_COLOR_YELLOW = 2;
our $CURRENT_COLOR_GREEN = 3;
our $CURRENT_COLOR_CYAN = 4;
our $CURRENT_COLOR_BLUE = 5;
our $CURRENT_COLOR_MAGENTA = 6;
our $CURRENT_COLOR_WHITE = 7;
our $CURRENT_COLOR_BYLAYER = 256;

our $UNIT_TYPES_SCIENTIFIC = 1;
our $UNIT_TYPES_DECIMAL = 2;
our $UNIT_TYPES_ENGINEERING = 3;
our $UNIT_TYPES_ARCHITECTURAL = 4;
our $UNIT_TYPES_FRACTIONAL = 5;

our $UNITS_FOR_ANGLES_DECIMAL_DEGREES = 0;
our $UNITS_FOR_ANGLES_DEGREES_MINUTES_SECONDS = 1;
our $UNITS_FOR_ANGLES_GRADIANS = 2;
our $UNITS_FOR_ANGLES_RADIANS = 3;
our $UNITS_FOR_ANGLES_SURVEYOR_S_UNITS = 4;

our $LIMITS_CHECK_OBJECTS_CAN_OUTSIDE_GRID = 0;
our $LIMITS_CHECK_OBJECTS_CANNOT_OUTSIDE_GRID = 1;

our $OSNAP_MODES_NONE = 0;
our $OSNAP_MODES_ENDPOINT = 1;
our $OSNAP_MODES_MIDPOINT = 2;
our $OSNAP_MODES_CENTER = 4;
our $OSNAP_MODES_NODE = 8;
our $OSNAP_MODES_QUADRANT = 16;
our $OSNAP_MODES_INTERSECTION = 32;
our $OSNAP_MODES_INSERTION = 64;
our $OSNAP_MODES_PERPENDICULAR = 128;
our $OSNAP_MODES_TANGENT = 256;
our $OSNAP_MODES_NEAREST = 512;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header} = CAD::Format::DWG::AC2_10::Header->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_entities} = $self->{_io}->read_bytes(($self->header()->entities_end() - $self->header()->entities_start()));
    my $io__raw_entities = IO::KaitaiStruct::Stream->new($self->{_raw_entities});
    $self->{entities} = CAD::Format::DWG::AC2_10::RealEntities->new($io__raw_entities, $self, $self->{_root});
    $self->{blocks} = ();
    my $n_blocks = $self->header()->number_of_table_blocks();
    for (my $i = 0; $i < $n_blocks; $i++) {
        $self->{blocks}[$i] = CAD::Format::DWG::AC2_10::Block->new($self->{_io}, $self, $self->{_root});
    }
    $self->{layers} = ();
    my $n_layers = $self->header()->number_of_table_layers();
    for (my $i = 0; $i < $n_layers; $i++) {
        $self->{layers}[$i] = CAD::Format::DWG::AC2_10::Layer->new($self->{_io}, $self, $self->{_root});
    }
    $self->{styles} = ();
    my $n_styles = $self->header()->number_of_table_styles();
    for (my $i = 0; $i < $n_styles; $i++) {
        $self->{styles}[$i] = CAD::Format::DWG::AC2_10::Style->new($self->{_io}, $self, $self->{_root});
    }
    $self->{linetypes} = ();
    my $n_linetypes = $self->header()->number_of_table_linetypes();
    for (my $i = 0; $i < $n_linetypes; $i++) {
        $self->{linetypes}[$i] = CAD::Format::DWG::AC2_10::Linetype->new($self->{_io}, $self, $self->{_root});
    }
    $self->{views} = ();
    my $n_views = $self->header()->number_of_table_views();
    for (my $i = 0; $i < $n_views; $i++) {
        $self->{views}[$i] = CAD::Format::DWG::AC2_10::View->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_raw_block_entities} = $self->{_io}->read_bytes($self->header()->blocks_size());
    my $io__raw_block_entities = IO::KaitaiStruct::Stream->new($self->{_raw_block_entities});
    $self->{block_entities} = CAD::Format::DWG::AC2_10::RealEntities->new($io__raw_block_entities, $self, $self->{_root});
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub entities {
    my ($self) = @_;
    return $self->{entities};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

sub layers {
    my ($self) = @_;
    return $self->{layers};
}

sub styles {
    my ($self) = @_;
    return $self->{styles};
}

sub linetypes {
    my ($self) = @_;
    return $self->{linetypes};
}

sub views {
    my ($self) = @_;
    return $self->{views};
}

sub block_entities {
    my ($self) = @_;
    return $self->{block_entities};
}

sub _raw_entities {
    my ($self) = @_;
    return $self->{_raw_entities};
}

sub _raw_block_entities {
    my ($self) = @_;
    return $self->{_raw_block_entities};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityRepeatBegin;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityTmp;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC2_10::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{xxx} = $self->{_io}->read_bytes(($self->entity_size() - 4));
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub xxx {
    my ($self) = @_;
    return $self->{xxx};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityLine3d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x1} = $self->{_io}->read_f8le();
    $self->{y1} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_8()) {
        $self->{z1} = $self->{_io}->read_f8le();
    }
    $self->{x2} = $self->{_io}->read_f8le();
    $self->{y2} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_7()) {
        $self->{z2} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x1 {
    my ($self) = @_;
    return $self->{x1};
}

sub y1 {
    my ($self) = @_;
    return $self->{y1};
}

sub z1 {
    my ($self) = @_;
    return $self->{z1};
}

sub x2 {
    my ($self) = @_;
    return $self->{x2};
}

sub y2 {
    my ($self) = @_;
    return $self->{y2};
}

sub z2 {
    my ($self) = @_;
    return $self->{z2};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityFace3d;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntitySolid;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{from_x} = $self->{_io}->read_f8le();
    $self->{from_y} = $self->{_io}->read_f8le();
    $self->{from_and_x} = $self->{_io}->read_f8le();
    $self->{from_and_y} = $self->{_io}->read_f8le();
    $self->{to_x} = $self->{_io}->read_f8le();
    $self->{to_y} = $self->{_io}->read_f8le();
    $self->{to_and_x} = $self->{_io}->read_f8le();
    $self->{to_and_y} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub from_x {
    my ($self) = @_;
    return $self->{from_x};
}

sub from_y {
    my ($self) = @_;
    return $self->{from_y};
}

sub from_and_x {
    my ($self) = @_;
    return $self->{from_and_x};
}

sub from_and_y {
    my ($self) = @_;
    return $self->{from_and_y};
}

sub to_x {
    my ($self) = @_;
    return $self->{to_x};
}

sub to_y {
    my ($self) = @_;
    return $self->{to_y};
}

sub to_and_x {
    my ($self) = @_;
    return $self->{to_and_x};
}

sub to_and_y {
    my ($self) = @_;
    return $self->{to_and_y};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityInsert;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{block_index} = $self->{_io}->read_s2le();
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_8()) {
        $self->{x_scale} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{y_scale} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{rotation_angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{z_scale} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{columns} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{rows} = $self->{_io}->read_u2le();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{column_spacing} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{row_spacing} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub block_index {
    my ($self) = @_;
    return $self->{block_index};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub x_scale {
    my ($self) = @_;
    return $self->{x_scale};
}

sub y_scale {
    my ($self) = @_;
    return $self->{y_scale};
}

sub rotation_angle_in_radians {
    my ($self) = @_;
    return $self->{rotation_angle_in_radians};
}

sub z_scale {
    my ($self) = @_;
    return $self->{z_scale};
}

sub columns {
    my ($self) = @_;
    return $self->{columns};
}

sub rows {
    my ($self) = @_;
    return $self->{rows};
}

sub column_spacing {
    my ($self) = @_;
    return $self->{column_spacing};
}

sub row_spacing {
    my ($self) = @_;
    return $self->{row_spacing};
}

########################################################################
package CAD::Format::DWG::AC2_10::Style;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag1_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag1_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag1_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag1_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag1_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag1_vertical} = $self->{_io}->read_bits_int_be(1);
    $self->{flag1_7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag1_load} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    $self->{text} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(31), 46, 0));
    $self->{height} = $self->{_io}->read_f8le();
    $self->{unknown1} = $self->{_io}->read_u1();
    $self->{width_factor} = $self->{_io}->read_f8le();
    $self->{obliquing_angle_in_radians} = $self->{_io}->read_f8le();
    $self->{flag2_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_upside_down} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_backwards} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_8} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    $self->{u12} = $self->{_io}->read_f8le();
    $self->{font_file} = $self->{_io}->read_bytes(64);
}

sub flag1_1 {
    my ($self) = @_;
    return $self->{flag1_1};
}

sub flag1_2 {
    my ($self) = @_;
    return $self->{flag1_2};
}

sub flag1_3 {
    my ($self) = @_;
    return $self->{flag1_3};
}

sub flag1_4 {
    my ($self) = @_;
    return $self->{flag1_4};
}

sub flag1_5 {
    my ($self) = @_;
    return $self->{flag1_5};
}

sub flag1_vertical {
    my ($self) = @_;
    return $self->{flag1_vertical};
}

sub flag1_7 {
    my ($self) = @_;
    return $self->{flag1_7};
}

sub flag1_load {
    my ($self) = @_;
    return $self->{flag1_load};
}

sub text {
    my ($self) = @_;
    return $self->{text};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub width_factor {
    my ($self) = @_;
    return $self->{width_factor};
}

sub obliquing_angle_in_radians {
    my ($self) = @_;
    return $self->{obliquing_angle_in_radians};
}

sub flag2_1 {
    my ($self) = @_;
    return $self->{flag2_1};
}

sub flag2_2 {
    my ($self) = @_;
    return $self->{flag2_2};
}

sub flag2_3 {
    my ($self) = @_;
    return $self->{flag2_3};
}

sub flag2_4 {
    my ($self) = @_;
    return $self->{flag2_4};
}

sub flag2_5 {
    my ($self) = @_;
    return $self->{flag2_5};
}

sub flag2_upside_down {
    my ($self) = @_;
    return $self->{flag2_upside_down};
}

sub flag2_backwards {
    my ($self) = @_;
    return $self->{flag2_backwards};
}

sub flag2_8 {
    my ($self) = @_;
    return $self->{flag2_8};
}

sub u12 {
    my ($self) = @_;
    return $self->{u12};
}

sub font_file {
    my ($self) = @_;
    return $self->{font_file};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityCommon;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode} = CAD::Format::DWG::AC2_10::EntityMode->new($self->{_io}, $self, $self->{_root});
    $self->{entity_size} = $self->{_io}->read_s2le();
    $self->{entity_layer_index} = $self->{_io}->read_s1();
    $self->{flag1} = $self->{_io}->read_s1();
    $self->{flag2_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag2_8} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_5} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_6} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_7} = $self->{_io}->read_bits_int_be(1);
    $self->{flag3_8} = $self->{_io}->read_bits_int_be(1);
    $self->{_io}->align_to_byte();
    if ($self->entity_mode()->entity_color_flag()) {
        $self->{entity_color} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->entity_linetype_flag()) {
        $self->{entity_linetype_index} = $self->{_io}->read_s1();
    }
    if ($self->entity_mode()->entity_elevation_flag()) {
        $self->{entity_elevation} = $self->{_io}->read_f8le();
    }
    if ($self->entity_mode()->entity_thickness_flag()) {
        $self->{entity_thickness} = $self->{_io}->read_f8le();
    }
}

sub entity_mode {
    my ($self) = @_;
    return $self->{entity_mode};
}

sub entity_size {
    my ($self) = @_;
    return $self->{entity_size};
}

sub entity_layer_index {
    my ($self) = @_;
    return $self->{entity_layer_index};
}

sub flag1 {
    my ($self) = @_;
    return $self->{flag1};
}

sub flag2_1 {
    my ($self) = @_;
    return $self->{flag2_1};
}

sub flag2_2 {
    my ($self) = @_;
    return $self->{flag2_2};
}

sub flag2_3 {
    my ($self) = @_;
    return $self->{flag2_3};
}

sub flag2_4 {
    my ($self) = @_;
    return $self->{flag2_4};
}

sub flag2_5 {
    my ($self) = @_;
    return $self->{flag2_5};
}

sub flag2_6 {
    my ($self) = @_;
    return $self->{flag2_6};
}

sub flag2_7 {
    my ($self) = @_;
    return $self->{flag2_7};
}

sub flag2_8 {
    my ($self) = @_;
    return $self->{flag2_8};
}

sub flag3_1 {
    my ($self) = @_;
    return $self->{flag3_1};
}

sub flag3_2 {
    my ($self) = @_;
    return $self->{flag3_2};
}

sub flag3_3 {
    my ($self) = @_;
    return $self->{flag3_3};
}

sub flag3_4 {
    my ($self) = @_;
    return $self->{flag3_4};
}

sub flag3_5 {
    my ($self) = @_;
    return $self->{flag3_5};
}

sub flag3_6 {
    my ($self) = @_;
    return $self->{flag3_6};
}

sub flag3_7 {
    my ($self) = @_;
    return $self->{flag3_7};
}

sub flag3_8 {
    my ($self) = @_;
    return $self->{flag3_8};
}

sub entity_color {
    my ($self) = @_;
    return $self->{entity_color};
}

sub entity_linetype_index {
    my ($self) = @_;
    return $self->{entity_linetype_index};
}

sub entity_elevation {
    my ($self) = @_;
    return $self->{entity_elevation};
}

sub entity_thickness {
    my ($self) = @_;
    return $self->{entity_thickness};
}

########################################################################
package CAD::Format::DWG::AC2_10::Linetype;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{u2} = $self->{_io}->read_u1();
    $self->{linetype_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(31), 46, 0));
    $self->{u3} = $self->{_io}->read_u1();
    $self->{description} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(44), 46, 0));
    $self->{u5} = $self->{_io}->read_bytes(4);
    $self->{alignment} = $self->{_io}->read_u1();
    $self->{num_dashes} = $self->{_io}->read_u1();
    $self->{pattern_len} = $self->{_io}->read_f8le();
    $self->{u9} = $self->{_io}->read_f8le();
    $self->{u10} = $self->{_io}->read_f8le();
    $self->{u11} = $self->{_io}->read_f8le();
    $self->{u12} = $self->{_io}->read_f8le();
    $self->{u13} = $self->{_io}->read_f8le();
    $self->{u14} = $self->{_io}->read_f8le();
    $self->{u15} = $self->{_io}->read_f8le();
    $self->{u16} = $self->{_io}->read_f8le();
    $self->{u17} = $self->{_io}->read_f8le();
    $self->{u18} = $self->{_io}->read_f8le();
    $self->{u19} = $self->{_io}->read_f8le();
    $self->{u20} = $self->{_io}->read_f8le();
}

sub u2 {
    my ($self) = @_;
    return $self->{u2};
}

sub linetype_name {
    my ($self) = @_;
    return $self->{linetype_name};
}

sub u3 {
    my ($self) = @_;
    return $self->{u3};
}

sub description {
    my ($self) = @_;
    return $self->{description};
}

sub u5 {
    my ($self) = @_;
    return $self->{u5};
}

sub alignment {
    my ($self) = @_;
    return $self->{alignment};
}

sub num_dashes {
    my ($self) = @_;
    return $self->{num_dashes};
}

sub pattern_len {
    my ($self) = @_;
    return $self->{pattern_len};
}

sub u9 {
    my ($self) = @_;
    return $self->{u9};
}

sub u10 {
    my ($self) = @_;
    return $self->{u10};
}

sub u11 {
    my ($self) = @_;
    return $self->{u11};
}

sub u12 {
    my ($self) = @_;
    return $self->{u12};
}

sub u13 {
    my ($self) = @_;
    return $self->{u13};
}

sub u14 {
    my ($self) = @_;
    return $self->{u14};
}

sub u15 {
    my ($self) = @_;
    return $self->{u15};
}

sub u16 {
    my ($self) = @_;
    return $self->{u16};
}

sub u17 {
    my ($self) = @_;
    return $self->{u17};
}

sub u18 {
    my ($self) = @_;
    return $self->{u18};
}

sub u19 {
    my ($self) = @_;
    return $self->{u19};
}

sub u20 {
    my ($self) = @_;
    return $self->{u20};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityBlockEnd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityPoint;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::AC2_10::AttdefFlags;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_5} = $self->{_io}->read_bits_int_be(1);
    $self->{invisible} = $self->{_io}->read_bits_int_be(1);
    $self->{constant} = $self->{_io}->read_bits_int_be(1);
    $self->{verify} = $self->{_io}->read_bits_int_be(1);
}

sub flag_1 {
    my ($self) = @_;
    return $self->{flag_1};
}

sub flag_2 {
    my ($self) = @_;
    return $self->{flag_2};
}

sub flag_3 {
    my ($self) = @_;
    return $self->{flag_3};
}

sub flag_4 {
    my ($self) = @_;
    return $self->{flag_4};
}

sub flag_5 {
    my ($self) = @_;
    return $self->{flag_5};
}

sub invisible {
    my ($self) = @_;
    return $self->{invisible};
}

sub constant {
    my ($self) = @_;
    return $self->{constant};
}

sub verify {
    my ($self) = @_;
    return $self->{verify};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityTrace;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{from_x} = $self->{_io}->read_f8le();
    $self->{from_y} = $self->{_io}->read_f8le();
    $self->{from_and_x} = $self->{_io}->read_f8le();
    $self->{from_and_y} = $self->{_io}->read_f8le();
    $self->{to_x} = $self->{_io}->read_f8le();
    $self->{to_y} = $self->{_io}->read_f8le();
    $self->{to_and_x} = $self->{_io}->read_f8le();
    $self->{to_and_y} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub from_x {
    my ($self) = @_;
    return $self->{from_x};
}

sub from_y {
    my ($self) = @_;
    return $self->{from_y};
}

sub from_and_x {
    my ($self) = @_;
    return $self->{from_and_x};
}

sub from_and_y {
    my ($self) = @_;
    return $self->{from_and_y};
}

sub to_x {
    my ($self) = @_;
    return $self->{to_x};
}

sub to_y {
    my ($self) = @_;
    return $self->{to_y};
}

sub to_and_x {
    my ($self) = @_;
    return $self->{to_and_x};
}

sub to_and_y {
    my ($self) = @_;
    return $self->{to_and_y};
}

########################################################################
package CAD::Format::DWG::AC2_10::Layer;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{frozen} = $self->{_io}->read_s1();
    $self->{layer_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(31), 46, 0));
    $self->{unknown1} = $self->{_io}->read_s1();
    $self->{color} = $self->{_io}->read_s1();
    $self->{unknown2} = $self->{_io}->read_s1();
    $self->{linetype_index} = $self->{_io}->read_s1();
    $self->{unknown3} = $self->{_io}->read_s1();
}

sub frozen {
    my ($self) = @_;
    return $self->{frozen};
}

sub layer_name {
    my ($self) = @_;
    return $self->{layer_name};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub color {
    my ($self) = @_;
    return $self->{color};
}

sub unknown2 {
    my ($self) = @_;
    return $self->{unknown2};
}

sub linetype_index {
    my ($self) = @_;
    return $self->{linetype_index};
}

sub unknown3 {
    my ($self) = @_;
    return $self->{unknown3};
}

########################################################################
package CAD::Format::DWG::AC2_10::AttdefFlags2;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{flag_1} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_2} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_3} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_4} = $self->{_io}->read_bits_int_be(1);
    $self->{flag_5} = $self->{_io}->read_bits_int_be(1);
    $self->{middle} = $self->{_io}->read_bits_int_be(1);
    $self->{right} = $self->{_io}->read_bits_int_be(1);
    $self->{center} = $self->{_io}->read_bits_int_be(1);
}

sub flag_1 {
    my ($self) = @_;
    return $self->{flag_1};
}

sub flag_2 {
    my ($self) = @_;
    return $self->{flag_2};
}

sub flag_3 {
    my ($self) = @_;
    return $self->{flag_3};
}

sub flag_4 {
    my ($self) = @_;
    return $self->{flag_4};
}

sub flag_5 {
    my ($self) = @_;
    return $self->{flag_5};
}

sub middle {
    my ($self) = @_;
    return $self->{middle};
}

sub right {
    my ($self) = @_;
    return $self->{right};
}

sub center {
    my ($self) = @_;
    return $self->{center};
}

########################################################################
package CAD::Format::DWG::AC2_10::Block;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{unknown1} = $self->{_io}->read_s1();
    $self->{block_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(31), 46, 0));
    $self->{u1} = $self->{_io}->read_s1();
    $self->{u2} = $self->{_io}->read_s1();
    $self->{u3} = $self->{_io}->read_s1();
    $self->{u4} = $self->{_io}->read_s1();
    $self->{u5} = $self->{_io}->read_s1();
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub block_name {
    my ($self) = @_;
    return $self->{block_name};
}

sub u1 {
    my ($self) = @_;
    return $self->{u1};
}

sub u2 {
    my ($self) = @_;
    return $self->{u2};
}

sub u3 {
    my ($self) = @_;
    return $self->{u3};
}

sub u4 {
    my ($self) = @_;
    return $self->{u4};
}

sub u5 {
    my ($self) = @_;
    return $self->{u5};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityText;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{height} = $self->{_io}->read_f8le();
    $self->{size} = $self->{_io}->read_s2le();
    $self->{value} = $self->{_io}->read_bytes($self->size());
    if ($self->entity_common()->flag2_8()) {
        $self->{angle} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{foo1} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{aligned_to_x} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{aligned_to_y} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub angle {
    my ($self) = @_;
    return $self->{angle};
}

sub foo1 {
    my ($self) = @_;
    return $self->{foo1};
}

sub aligned_to_x {
    my ($self) = @_;
    return $self->{aligned_to_x};
}

sub aligned_to_y {
    my ($self) = @_;
    return $self->{aligned_to_y};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityAttdef;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{start_point_x} = $self->{_io}->read_f8le();
    $self->{start_point_y} = $self->{_io}->read_f8le();
    $self->{height} = $self->{_io}->read_f8le();
    $self->{default_size} = $self->{_io}->read_s2le();
    $self->{default} = $self->{_io}->read_bytes($self->default_size());
    $self->{prompt_size} = $self->{_io}->read_s2le();
    $self->{prompt} = $self->{_io}->read_bytes($self->prompt_size());
    $self->{tag_size} = $self->{_io}->read_s2le();
    $self->{tag} = $self->{_io}->read_bytes($self->tag_size());
    $self->{flags} = CAD::Format::DWG::AC2_10::AttdefFlags->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_common()->flag2_7()) {
        $self->{rotation_angle_in_radians} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{width_scale_factor} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{unknown_index} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{flags2} = CAD::Format::DWG::AC2_10::AttdefFlags2->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{end_point_x} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_1()) {
        $self->{end_point_y} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub start_point_x {
    my ($self) = @_;
    return $self->{start_point_x};
}

sub start_point_y {
    my ($self) = @_;
    return $self->{start_point_y};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub default_size {
    my ($self) = @_;
    return $self->{default_size};
}

sub default {
    my ($self) = @_;
    return $self->{default};
}

sub prompt_size {
    my ($self) = @_;
    return $self->{prompt_size};
}

sub prompt {
    my ($self) = @_;
    return $self->{prompt};
}

sub tag_size {
    my ($self) = @_;
    return $self->{tag_size};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub rotation_angle_in_radians {
    my ($self) = @_;
    return $self->{rotation_angle_in_radians};
}

sub width_scale_factor {
    my ($self) = @_;
    return $self->{width_scale_factor};
}

sub unknown_index {
    my ($self) = @_;
    return $self->{unknown_index};
}

sub flags2 {
    my ($self) = @_;
    return $self->{flags2};
}

sub end_point_x {
    my ($self) = @_;
    return $self->{end_point_x};
}

sub end_point_y {
    my ($self) = @_;
    return $self->{end_point_y};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityBlockBegin;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityDim;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{block_index} = $self->{_io}->read_s2le();
    $self->{dimension_line_defining_point_x} = $self->{_io}->read_f8le();
    $self->{dimension_line_defining_point_y} = $self->{_io}->read_f8le();
    $self->{default_text_position_x} = $self->{_io}->read_f8le();
    $self->{default_text_position_y} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_7()) {
        $self->{unknown1} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{text_size} = $self->{_io}->read_s2le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{text} = $self->{_io}->read_bytes($self->text_size());
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{extension_defining_point1_x} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_5()) {
        $self->{extension_defining_point1_y} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{extension_defining_point2_x} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{extension_defining_point2_y} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{defining_point_x} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_3()) {
        $self->{defining_point_y} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{dimension_line_arc_definition_point_x} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_2()) {
        $self->{dimension_line_arc_definition_point_y} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag3_8()) {
        $self->{rotation_in_radians} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub block_index {
    my ($self) = @_;
    return $self->{block_index};
}

sub dimension_line_defining_point_x {
    my ($self) = @_;
    return $self->{dimension_line_defining_point_x};
}

sub dimension_line_defining_point_y {
    my ($self) = @_;
    return $self->{dimension_line_defining_point_y};
}

sub default_text_position_x {
    my ($self) = @_;
    return $self->{default_text_position_x};
}

sub default_text_position_y {
    my ($self) = @_;
    return $self->{default_text_position_y};
}

sub unknown1 {
    my ($self) = @_;
    return $self->{unknown1};
}

sub text_size {
    my ($self) = @_;
    return $self->{text_size};
}

sub text {
    my ($self) = @_;
    return $self->{text};
}

sub extension_defining_point1_x {
    my ($self) = @_;
    return $self->{extension_defining_point1_x};
}

sub extension_defining_point1_y {
    my ($self) = @_;
    return $self->{extension_defining_point1_y};
}

sub extension_defining_point2_x {
    my ($self) = @_;
    return $self->{extension_defining_point2_x};
}

sub extension_defining_point2_y {
    my ($self) = @_;
    return $self->{extension_defining_point2_y};
}

sub defining_point_x {
    my ($self) = @_;
    return $self->{defining_point_x};
}

sub defining_point_y {
    my ($self) = @_;
    return $self->{defining_point_y};
}

sub dimension_line_arc_definition_point_x {
    my ($self) = @_;
    return $self->{dimension_line_arc_definition_point_x};
}

sub dimension_line_arc_definition_point_y {
    my ($self) = @_;
    return $self->{dimension_line_arc_definition_point_y};
}

sub rotation_in_radians {
    my ($self) = @_;
    return $self->{rotation_in_radians};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityArc;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{radius} = $self->{_io}->read_f8le();
    $self->{angle_from} = $self->{_io}->read_f8le();
    $self->{angle_to} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub radius {
    my ($self) = @_;
    return $self->{radius};
}

sub angle_from {
    my ($self) = @_;
    return $self->{angle_from};
}

sub angle_to {
    my ($self) = @_;
    return $self->{angle_to};
}

########################################################################
package CAD::Format::DWG::AC2_10::Entity;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_type} = $self->{_io}->read_s1();
    my $_on = $self->entity_type();
    if ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_SOLID) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntitySolid->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_SHAPE) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityShape->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_SEQEND) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntitySeqend->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_REPEAT_BEGIN) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityRepeatBegin->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_DIM) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityDim->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_BLOCK_BEGIN) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityBlockBegin->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_LINE) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityLine->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_REPEAT_END) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityRepeatEnd->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_LINE3D) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityLine3d->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_TEXT) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityText->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_INSERT) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityInsert->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_POLYLINE2) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityPolyline->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_CIRCLE) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityCircle->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_ARC) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityArc->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_VERTEX) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityVertex->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_FACE3D) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityFace3d->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_ATTDEF) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityAttdef->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_BLOCK_END) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityBlockEnd->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_POINT) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityPoint->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_TRACE) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityTrace->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $CAD::Format::DWG::AC2_10::ENTITIES_POLYLINE) {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityPolyline->new($self->{_io}, $self, $self->{_root});
    }
    else {
        $self->{data} = CAD::Format::DWG::AC2_10::EntityTmp->new($self->{_io}, $self, $self->{_root});
    }
}

sub entity_type {
    my ($self) = @_;
    return $self->{entity_type};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntitySeqend;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{unknown} = $self->{_io}->read_bytes(4);
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

########################################################################
package CAD::Format::DWG::AC2_10::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(6);
    $self->{zeros} = $self->{_io}->read_bytes(6);
    $self->{zero_one_or_three} = $self->{_io}->read_s1();
    $self->{version_major} = $self->{_io}->read_s2le();
    $self->{version_minor} = $self->{_io}->read_s2le();
    $self->{version_micro} = $self->{_io}->read_s2le();
    $self->{dwg_version} = $self->{_io}->read_s1();
    $self->{entities_start} = $self->{_io}->read_s4le();
    $self->{entities_end} = $self->{_io}->read_s4le();
    $self->{blocks_start} = $self->{_io}->read_s4le();
    $self->{blocks_size} = $self->{_io}->read_s2le();
    $self->{unknown4a} = $self->{_io}->read_bytes(2);
    $self->{blocks_end} = $self->{_io}->read_s4le();
    $self->{unknown4b} = $self->{_io}->read_bytes(2);
    $self->{unknown4c} = $self->{_io}->read_bytes(2);
    $self->{block_table_item_size} = $self->{_io}->read_s2le();
    $self->{number_of_table_blocks} = $self->{_io}->read_s2le();
    $self->{unknown4e} = $self->{_io}->read_bytes(2);
    $self->{block_table_begin} = $self->{_io}->read_u4le();
    $self->{layer_table_item_size} = $self->{_io}->read_s2le();
    $self->{number_of_table_layers} = $self->{_io}->read_s2le();
    $self->{unknown4g} = $self->{_io}->read_bytes(2);
    $self->{layer_table_begin} = $self->{_io}->read_u4le();
    $self->{style_table_item_size} = $self->{_io}->read_s2le();
    $self->{number_of_table_styles} = $self->{_io}->read_s2le();
    $self->{unknown4i} = $self->{_io}->read_bytes(2);
    $self->{style_table_begin} = $self->{_io}->read_u4le();
    $self->{linetype_table_item_size} = $self->{_io}->read_s2le();
    $self->{number_of_table_linetypes} = $self->{_io}->read_s2le();
    $self->{unknown4k} = $self->{_io}->read_bytes(2);
    $self->{linetype_table_begin} = $self->{_io}->read_u4le();
    $self->{view_table_item_size} = $self->{_io}->read_s2le();
    $self->{number_of_table_views} = $self->{_io}->read_s2le();
    $self->{unknown4m} = $self->{_io}->read_bytes(2);
    $self->{view_table_begin} = $self->{_io}->read_u4le();
    $self->{insertion_base_x} = $self->{_io}->read_f8le();
    $self->{insertion_base_y} = $self->{_io}->read_f8le();
    $self->{insertion_base_z} = $self->{_io}->read_f8le();
    $self->{number_of_entities} = $self->{_io}->read_s2le();
    $self->{drawing_first_x} = $self->{_io}->read_f8le();
    $self->{drawing_first_y} = $self->{_io}->read_f8le();
    $self->{drawing_first_z} = $self->{_io}->read_f8le();
    $self->{drawing_second_x} = $self->{_io}->read_f8le();
    $self->{drawing_second_y} = $self->{_io}->read_f8le();
    $self->{drawing_second_z} = $self->{_io}->read_f8le();
    $self->{limits_min_x} = $self->{_io}->read_f8le();
    $self->{limits_min_y} = $self->{_io}->read_f8le();
    $self->{limits_max_x} = $self->{_io}->read_f8le();
    $self->{limits_max_y} = $self->{_io}->read_f8le();
    $self->{view_ctrl_x} = $self->{_io}->read_f8le();
    $self->{view_ctrl_y} = $self->{_io}->read_f8le();
    $self->{view_ctrl_z} = $self->{_io}->read_f8le();
    $self->{view_size} = $self->{_io}->read_f8le();
    $self->{snap} = $self->{_io}->read_s2le();
    $self->{snap_resolution_x} = $self->{_io}->read_f8le();
    $self->{snap_resolution_y} = $self->{_io}->read_f8le();
    $self->{snap_base_x} = $self->{_io}->read_f8le();
    $self->{snap_base_y} = $self->{_io}->read_f8le();
    $self->{snap_angle} = $self->{_io}->read_f8le();
    $self->{snap_style} = $self->{_io}->read_s2le();
    $self->{snap_iso_pair} = $self->{_io}->read_s2le();
    $self->{grid} = $self->{_io}->read_s2le();
    $self->{grid_unit_x} = $self->{_io}->read_f8le();
    $self->{grid_unit_y} = $self->{_io}->read_f8le();
    $self->{ortho} = $self->{_io}->read_s2le();
    $self->{regen} = $self->{_io}->read_s2le();
    $self->{fill} = $self->{_io}->read_s2le();
    $self->{qtext} = $self->{_io}->read_s2le();
    $self->{drag} = $self->{_io}->read_s2le();
    $self->{linetype_scale} = $self->{_io}->read_f8le();
    $self->{text_size} = $self->{_io}->read_f8le();
    $self->{trace_width} = $self->{_io}->read_f8le();
    $self->{current_layer} = $self->{_io}->read_s2le();
    $self->{unknown6} = $self->{_io}->read_f8le();
    $self->{unknown7a} = $self->{_io}->read_bytes(2);
    $self->{unknown7b} = $self->{_io}->read_bytes(2);
    $self->{unknown7c} = $self->{_io}->read_bytes(2);
    $self->{unknown7d} = $self->{_io}->read_bytes(2);
    $self->{unknown8} = $self->{_io}->read_f8le();
    $self->{linear_units_format} = $self->{_io}->read_s2le();
    $self->{linear_units_precision} = $self->{_io}->read_s2le();
    $self->{axis} = $self->{_io}->read_s2le();
    $self->{axis_value_x} = $self->{_io}->read_f8le();
    $self->{axis_value_y} = $self->{_io}->read_f8le();
    $self->{sketch_increment} = $self->{_io}->read_f8le();
    $self->{fillet_radius} = $self->{_io}->read_f8le();
    $self->{units_for_angles} = $self->{_io}->read_s2le();
    $self->{angular_precision} = $self->{_io}->read_s2le();
    $self->{text_style} = $self->{_io}->read_s2le();
    $self->{osnap} = $self->{_io}->read_s2le();
    $self->{attributes} = $self->{_io}->read_s2le();
    $self->{menu} = Encode::decode("ASCII", $self->{_io}->read_bytes(15));
    $self->{dim_scale} = $self->{_io}->read_f8le();
    $self->{dim_arrowhead_size} = $self->{_io}->read_f8le();
    $self->{dim_extension_line_offset} = $self->{_io}->read_f8le();
    $self->{dim_baseline_spacing} = $self->{_io}->read_f8le();
    $self->{dim_extension_line_extend} = $self->{_io}->read_f8le();
    $self->{dim_maximum_tolerance_limit} = $self->{_io}->read_f8le();
    $self->{dim_minimum_tolerance_limit} = $self->{_io}->read_f8le();
    $self->{dim_text_height} = $self->{_io}->read_f8le();
    $self->{dim_center_mark_control} = $self->{_io}->read_f8le();
    $self->{dim_oblique_stroke_size} = $self->{_io}->read_f8le();
    $self->{dim_tolerances} = $self->{_io}->read_s1();
    $self->{dim_limits_default_text} = $self->{_io}->read_s1();
    $self->{dim_text_ext_inside_line_position} = $self->{_io}->read_s1();
    $self->{dim_text_ext_outside_line_position} = $self->{_io}->read_s1();
    $self->{dim_extension_line_first_suppress} = $self->{_io}->read_s1();
    $self->{dim_extension_line_second_suppress} = $self->{_io}->read_s1();
    $self->{dim_text_vertical_position} = $self->{_io}->read_s1();
    $self->{limits_check} = $self->{_io}->read_s2le();
    $self->{unknown10} = $self->{_io}->read_bytes(45);
    $self->{elevation} = $self->{_io}->read_f8le();
    $self->{thickness} = $self->{_io}->read_f8le();
    $self->{view_point_x} = $self->{_io}->read_f8le();
    $self->{view_point_y} = $self->{_io}->read_f8le();
    $self->{view_point_z} = $self->{_io}->read_f8le();
    $self->{unknown11} = $self->{_io}->read_f8le();
    $self->{unknown12} = $self->{_io}->read_f8le();
    $self->{unknown13} = $self->{_io}->read_f8le();
    $self->{unknown14} = $self->{_io}->read_f8le();
    $self->{unknown15} = $self->{_io}->read_f8le();
    $self->{unknown16} = $self->{_io}->read_f8le();
    $self->{unknown17} = $self->{_io}->read_f8le();
    $self->{unknown18} = $self->{_io}->read_f8le();
    $self->{unknown19} = $self->{_io}->read_f8le();
    $self->{unknown20} = $self->{_io}->read_f8le();
    $self->{unknown21} = $self->{_io}->read_f8le();
    $self->{unknown22} = $self->{_io}->read_f8le();
    $self->{unknown23} = $self->{_io}->read_f8le();
    $self->{unknown24} = $self->{_io}->read_f8le();
    $self->{unknown25} = $self->{_io}->read_f8le();
    $self->{unknown26} = $self->{_io}->read_f8le();
    $self->{unknown27} = $self->{_io}->read_f8le();
    $self->{unknown28} = $self->{_io}->read_f8le();
    $self->{unknown29} = $self->{_io}->read_bytes(2);
    $self->{blip} = $self->{_io}->read_s1();
    $self->{unknown29a} = $self->{_io}->read_bytes(1);
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub zeros {
    my ($self) = @_;
    return $self->{zeros};
}

sub zero_one_or_three {
    my ($self) = @_;
    return $self->{zero_one_or_three};
}

sub version_major {
    my ($self) = @_;
    return $self->{version_major};
}

sub version_minor {
    my ($self) = @_;
    return $self->{version_minor};
}

sub version_micro {
    my ($self) = @_;
    return $self->{version_micro};
}

sub dwg_version {
    my ($self) = @_;
    return $self->{dwg_version};
}

sub entities_start {
    my ($self) = @_;
    return $self->{entities_start};
}

sub entities_end {
    my ($self) = @_;
    return $self->{entities_end};
}

sub blocks_start {
    my ($self) = @_;
    return $self->{blocks_start};
}

sub blocks_size {
    my ($self) = @_;
    return $self->{blocks_size};
}

sub unknown4a {
    my ($self) = @_;
    return $self->{unknown4a};
}

sub blocks_end {
    my ($self) = @_;
    return $self->{blocks_end};
}

sub unknown4b {
    my ($self) = @_;
    return $self->{unknown4b};
}

sub unknown4c {
    my ($self) = @_;
    return $self->{unknown4c};
}

sub block_table_item_size {
    my ($self) = @_;
    return $self->{block_table_item_size};
}

sub number_of_table_blocks {
    my ($self) = @_;
    return $self->{number_of_table_blocks};
}

sub unknown4e {
    my ($self) = @_;
    return $self->{unknown4e};
}

sub block_table_begin {
    my ($self) = @_;
    return $self->{block_table_begin};
}

sub layer_table_item_size {
    my ($self) = @_;
    return $self->{layer_table_item_size};
}

sub number_of_table_layers {
    my ($self) = @_;
    return $self->{number_of_table_layers};
}

sub unknown4g {
    my ($self) = @_;
    return $self->{unknown4g};
}

sub layer_table_begin {
    my ($self) = @_;
    return $self->{layer_table_begin};
}

sub style_table_item_size {
    my ($self) = @_;
    return $self->{style_table_item_size};
}

sub number_of_table_styles {
    my ($self) = @_;
    return $self->{number_of_table_styles};
}

sub unknown4i {
    my ($self) = @_;
    return $self->{unknown4i};
}

sub style_table_begin {
    my ($self) = @_;
    return $self->{style_table_begin};
}

sub linetype_table_item_size {
    my ($self) = @_;
    return $self->{linetype_table_item_size};
}

sub number_of_table_linetypes {
    my ($self) = @_;
    return $self->{number_of_table_linetypes};
}

sub unknown4k {
    my ($self) = @_;
    return $self->{unknown4k};
}

sub linetype_table_begin {
    my ($self) = @_;
    return $self->{linetype_table_begin};
}

sub view_table_item_size {
    my ($self) = @_;
    return $self->{view_table_item_size};
}

sub number_of_table_views {
    my ($self) = @_;
    return $self->{number_of_table_views};
}

sub unknown4m {
    my ($self) = @_;
    return $self->{unknown4m};
}

sub view_table_begin {
    my ($self) = @_;
    return $self->{view_table_begin};
}

sub insertion_base_x {
    my ($self) = @_;
    return $self->{insertion_base_x};
}

sub insertion_base_y {
    my ($self) = @_;
    return $self->{insertion_base_y};
}

sub insertion_base_z {
    my ($self) = @_;
    return $self->{insertion_base_z};
}

sub number_of_entities {
    my ($self) = @_;
    return $self->{number_of_entities};
}

sub drawing_first_x {
    my ($self) = @_;
    return $self->{drawing_first_x};
}

sub drawing_first_y {
    my ($self) = @_;
    return $self->{drawing_first_y};
}

sub drawing_first_z {
    my ($self) = @_;
    return $self->{drawing_first_z};
}

sub drawing_second_x {
    my ($self) = @_;
    return $self->{drawing_second_x};
}

sub drawing_second_y {
    my ($self) = @_;
    return $self->{drawing_second_y};
}

sub drawing_second_z {
    my ($self) = @_;
    return $self->{drawing_second_z};
}

sub limits_min_x {
    my ($self) = @_;
    return $self->{limits_min_x};
}

sub limits_min_y {
    my ($self) = @_;
    return $self->{limits_min_y};
}

sub limits_max_x {
    my ($self) = @_;
    return $self->{limits_max_x};
}

sub limits_max_y {
    my ($self) = @_;
    return $self->{limits_max_y};
}

sub view_ctrl_x {
    my ($self) = @_;
    return $self->{view_ctrl_x};
}

sub view_ctrl_y {
    my ($self) = @_;
    return $self->{view_ctrl_y};
}

sub view_ctrl_z {
    my ($self) = @_;
    return $self->{view_ctrl_z};
}

sub view_size {
    my ($self) = @_;
    return $self->{view_size};
}

sub snap {
    my ($self) = @_;
    return $self->{snap};
}

sub snap_resolution_x {
    my ($self) = @_;
    return $self->{snap_resolution_x};
}

sub snap_resolution_y {
    my ($self) = @_;
    return $self->{snap_resolution_y};
}

sub snap_base_x {
    my ($self) = @_;
    return $self->{snap_base_x};
}

sub snap_base_y {
    my ($self) = @_;
    return $self->{snap_base_y};
}

sub snap_angle {
    my ($self) = @_;
    return $self->{snap_angle};
}

sub snap_style {
    my ($self) = @_;
    return $self->{snap_style};
}

sub snap_iso_pair {
    my ($self) = @_;
    return $self->{snap_iso_pair};
}

sub grid {
    my ($self) = @_;
    return $self->{grid};
}

sub grid_unit_x {
    my ($self) = @_;
    return $self->{grid_unit_x};
}

sub grid_unit_y {
    my ($self) = @_;
    return $self->{grid_unit_y};
}

sub ortho {
    my ($self) = @_;
    return $self->{ortho};
}

sub regen {
    my ($self) = @_;
    return $self->{regen};
}

sub fill {
    my ($self) = @_;
    return $self->{fill};
}

sub qtext {
    my ($self) = @_;
    return $self->{qtext};
}

sub drag {
    my ($self) = @_;
    return $self->{drag};
}

sub linetype_scale {
    my ($self) = @_;
    return $self->{linetype_scale};
}

sub text_size {
    my ($self) = @_;
    return $self->{text_size};
}

sub trace_width {
    my ($self) = @_;
    return $self->{trace_width};
}

sub current_layer {
    my ($self) = @_;
    return $self->{current_layer};
}

sub unknown6 {
    my ($self) = @_;
    return $self->{unknown6};
}

sub unknown7a {
    my ($self) = @_;
    return $self->{unknown7a};
}

sub unknown7b {
    my ($self) = @_;
    return $self->{unknown7b};
}

sub unknown7c {
    my ($self) = @_;
    return $self->{unknown7c};
}

sub unknown7d {
    my ($self) = @_;
    return $self->{unknown7d};
}

sub unknown8 {
    my ($self) = @_;
    return $self->{unknown8};
}

sub linear_units_format {
    my ($self) = @_;
    return $self->{linear_units_format};
}

sub linear_units_precision {
    my ($self) = @_;
    return $self->{linear_units_precision};
}

sub axis {
    my ($self) = @_;
    return $self->{axis};
}

sub axis_value_x {
    my ($self) = @_;
    return $self->{axis_value_x};
}

sub axis_value_y {
    my ($self) = @_;
    return $self->{axis_value_y};
}

sub sketch_increment {
    my ($self) = @_;
    return $self->{sketch_increment};
}

sub fillet_radius {
    my ($self) = @_;
    return $self->{fillet_radius};
}

sub units_for_angles {
    my ($self) = @_;
    return $self->{units_for_angles};
}

sub angular_precision {
    my ($self) = @_;
    return $self->{angular_precision};
}

sub text_style {
    my ($self) = @_;
    return $self->{text_style};
}

sub osnap {
    my ($self) = @_;
    return $self->{osnap};
}

sub attributes {
    my ($self) = @_;
    return $self->{attributes};
}

sub menu {
    my ($self) = @_;
    return $self->{menu};
}

sub dim_scale {
    my ($self) = @_;
    return $self->{dim_scale};
}

sub dim_arrowhead_size {
    my ($self) = @_;
    return $self->{dim_arrowhead_size};
}

sub dim_extension_line_offset {
    my ($self) = @_;
    return $self->{dim_extension_line_offset};
}

sub dim_baseline_spacing {
    my ($self) = @_;
    return $self->{dim_baseline_spacing};
}

sub dim_extension_line_extend {
    my ($self) = @_;
    return $self->{dim_extension_line_extend};
}

sub dim_maximum_tolerance_limit {
    my ($self) = @_;
    return $self->{dim_maximum_tolerance_limit};
}

sub dim_minimum_tolerance_limit {
    my ($self) = @_;
    return $self->{dim_minimum_tolerance_limit};
}

sub dim_text_height {
    my ($self) = @_;
    return $self->{dim_text_height};
}

sub dim_center_mark_control {
    my ($self) = @_;
    return $self->{dim_center_mark_control};
}

sub dim_oblique_stroke_size {
    my ($self) = @_;
    return $self->{dim_oblique_stroke_size};
}

sub dim_tolerances {
    my ($self) = @_;
    return $self->{dim_tolerances};
}

sub dim_limits_default_text {
    my ($self) = @_;
    return $self->{dim_limits_default_text};
}

sub dim_text_ext_inside_line_position {
    my ($self) = @_;
    return $self->{dim_text_ext_inside_line_position};
}

sub dim_text_ext_outside_line_position {
    my ($self) = @_;
    return $self->{dim_text_ext_outside_line_position};
}

sub dim_extension_line_first_suppress {
    my ($self) = @_;
    return $self->{dim_extension_line_first_suppress};
}

sub dim_extension_line_second_suppress {
    my ($self) = @_;
    return $self->{dim_extension_line_second_suppress};
}

sub dim_text_vertical_position {
    my ($self) = @_;
    return $self->{dim_text_vertical_position};
}

sub limits_check {
    my ($self) = @_;
    return $self->{limits_check};
}

sub unknown10 {
    my ($self) = @_;
    return $self->{unknown10};
}

sub elevation {
    my ($self) = @_;
    return $self->{elevation};
}

sub thickness {
    my ($self) = @_;
    return $self->{thickness};
}

sub view_point_x {
    my ($self) = @_;
    return $self->{view_point_x};
}

sub view_point_y {
    my ($self) = @_;
    return $self->{view_point_y};
}

sub view_point_z {
    my ($self) = @_;
    return $self->{view_point_z};
}

sub unknown11 {
    my ($self) = @_;
    return $self->{unknown11};
}

sub unknown12 {
    my ($self) = @_;
    return $self->{unknown12};
}

sub unknown13 {
    my ($self) = @_;
    return $self->{unknown13};
}

sub unknown14 {
    my ($self) = @_;
    return $self->{unknown14};
}

sub unknown15 {
    my ($self) = @_;
    return $self->{unknown15};
}

sub unknown16 {
    my ($self) = @_;
    return $self->{unknown16};
}

sub unknown17 {
    my ($self) = @_;
    return $self->{unknown17};
}

sub unknown18 {
    my ($self) = @_;
    return $self->{unknown18};
}

sub unknown19 {
    my ($self) = @_;
    return $self->{unknown19};
}

sub unknown20 {
    my ($self) = @_;
    return $self->{unknown20};
}

sub unknown21 {
    my ($self) = @_;
    return $self->{unknown21};
}

sub unknown22 {
    my ($self) = @_;
    return $self->{unknown22};
}

sub unknown23 {
    my ($self) = @_;
    return $self->{unknown23};
}

sub unknown24 {
    my ($self) = @_;
    return $self->{unknown24};
}

sub unknown25 {
    my ($self) = @_;
    return $self->{unknown25};
}

sub unknown26 {
    my ($self) = @_;
    return $self->{unknown26};
}

sub unknown27 {
    my ($self) = @_;
    return $self->{unknown27};
}

sub unknown28 {
    my ($self) = @_;
    return $self->{unknown28};
}

sub unknown29 {
    my ($self) = @_;
    return $self->{unknown29};
}

sub blip {
    my ($self) = @_;
    return $self->{blip};
}

sub unknown29a {
    my ($self) = @_;
    return $self->{unknown29a};
}

########################################################################
package CAD::Format::DWG::AC2_10::RealEntities;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entities} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entities}}, CAD::Format::DWG::AC2_10::Entity->new($self->{_io}, $self, $self->{_root});
    }
}

sub entities {
    my ($self) = @_;
    return $self->{entities};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityCircle;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{radius} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub radius {
    my ($self) = @_;
    return $self->{radius};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityShape;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    $self->{height} = $self->{_io}->read_f8le();
    $self->{item_num} = $self->{_io}->read_u1();
    if ($self->entity_common()->flag2_8()) {
        $self->{angle} = $self->{_io}->read_f8le();
    }
    $self->{load_num} = $self->{_io}->read_u1();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub height {
    my ($self) = @_;
    return $self->{height};
}

sub item_num {
    my ($self) = @_;
    return $self->{item_num};
}

sub angle {
    my ($self) = @_;
    return $self->{angle};
}

sub load_num {
    my ($self) = @_;
    return $self->{load_num};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityVertex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
    if ($self->entity_common()->flag2_8()) {
        $self->{width} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{bulge} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_4()) {
        $self->{unknown_in_radians} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub width {
    my ($self) = @_;
    return $self->{width};
}

sub bulge {
    my ($self) = @_;
    return $self->{bulge};
}

sub unknown_in_radians {
    my ($self) = @_;
    return $self->{unknown_in_radians};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityMode;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_mode1} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_mode2} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_mode3} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_mode4} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_thickness_flag} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_elevation_flag} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_linetype_flag} = $self->{_io}->read_bits_int_be(1);
    $self->{entity_color_flag} = $self->{_io}->read_bits_int_be(1);
}

sub entity_mode1 {
    my ($self) = @_;
    return $self->{entity_mode1};
}

sub entity_mode2 {
    my ($self) = @_;
    return $self->{entity_mode2};
}

sub entity_mode3 {
    my ($self) = @_;
    return $self->{entity_mode3};
}

sub entity_mode4 {
    my ($self) = @_;
    return $self->{entity_mode4};
}

sub entity_thickness_flag {
    my ($self) = @_;
    return $self->{entity_thickness_flag};
}

sub entity_elevation_flag {
    my ($self) = @_;
    return $self->{entity_elevation_flag};
}

sub entity_linetype_flag {
    my ($self) = @_;
    return $self->{entity_linetype_flag};
}

sub entity_color_flag {
    my ($self) = @_;
    return $self->{entity_color_flag};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityLine;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{x1} = $self->{_io}->read_f8le();
    $self->{y1} = $self->{_io}->read_f8le();
    $self->{x2} = $self->{_io}->read_f8le();
    $self->{y2} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub x1 {
    my ($self) = @_;
    return $self->{x1};
}

sub y1 {
    my ($self) = @_;
    return $self->{y1};
}

sub x2 {
    my ($self) = @_;
    return $self->{x2};
}

sub y2 {
    my ($self) = @_;
    return $self->{y2};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityRepeatEnd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    $self->{columns} = $self->{_io}->read_s2le();
    $self->{rows} = $self->{_io}->read_s2le();
    $self->{x} = $self->{_io}->read_f8le();
    $self->{y} = $self->{_io}->read_f8le();
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub columns {
    my ($self) = @_;
    return $self->{columns};
}

sub rows {
    my ($self) = @_;
    return $self->{rows};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::AC2_10::EntityPolyline;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entity_common} = CAD::Format::DWG::AC2_10::EntityCommon->new($self->{_io}, $self, $self->{_root});
    if ($self->entity_common()->flag2_8()) {
        $self->{closed} = $self->{_io}->read_u1();
    }
    if ($self->entity_common()->flag2_7()) {
        $self->{x} = $self->{_io}->read_f8le();
    }
    if ($self->entity_common()->flag2_6()) {
        $self->{y} = $self->{_io}->read_f8le();
    }
}

sub entity_common {
    my ($self) = @_;
    return $self->{entity_common};
}

sub closed {
    my ($self) = @_;
    return $self->{closed};
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

########################################################################
package CAD::Format::DWG::AC2_10::View;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{u1} = $self->{_io}->read_bytes(4);
    $self->{view_name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(31), 46, 0));
    $self->{u2} = $self->{_io}->read_u1();
    $self->{view_size} = $self->{_io}->read_f8le();
    $self->{center_point_x} = $self->{_io}->read_f8le();
    $self->{center_point_y} = $self->{_io}->read_f8le();
    $self->{view_width} = $self->{_io}->read_f8le();
    $self->{view_dir_x} = $self->{_io}->read_f8le();
    $self->{view_dir_y} = $self->{_io}->read_f8le();
    $self->{view_dir_z} = $self->{_io}->read_f8le();
}

sub u1 {
    my ($self) = @_;
    return $self->{u1};
}

sub view_name {
    my ($self) = @_;
    return $self->{view_name};
}

sub u2 {
    my ($self) = @_;
    return $self->{u2};
}

sub view_size {
    my ($self) = @_;
    return $self->{view_size};
}

sub center_point_x {
    my ($self) = @_;
    return $self->{center_point_x};
}

sub center_point_y {
    my ($self) = @_;
    return $self->{center_point_y};
}

sub view_width {
    my ($self) = @_;
    return $self->{view_width};
}

sub view_dir_x {
    my ($self) = @_;
    return $self->{view_dir_x};
}

sub view_dir_y {
    my ($self) = @_;
    return $self->{view_dir_y};
}

sub view_dir_z {
    my ($self) = @_;
    return $self->{view_dir_z};
}

1;