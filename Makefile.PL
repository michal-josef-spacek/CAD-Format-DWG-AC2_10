use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Read AutoCAD 2.10 DWG file.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'CAD-Format-DWG-AC2_10';
perl_version 5.008;
readme_from 'AC2_10.pod';
requires 'Encode' => 0;
requires 'IO::KaitaiStruct' => 0;
requires_external_bin 'ksc';
requires_external_bin 'mv';
requires_external_bin 'sed';
recursive_author_tests('xt');
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/CAD-Format-DWG-AC2_10/issues';
resources 'homepage' => 'https://github.com/michal-josef-spacek/CAD-Format-DWG-AC2_10';
resources 'repository' => 'git://github.com/michal-josef-spacek/CAD-Format-DWG-AC2_10';
test_requires 'English' => 0;
test_requires 'Error::Pure::Utils' => 0.22;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

my $KSY_FILE = 'dwg_ac2_10.ksy';
my $OUTPUT_PM_FILE = 'AC2_10.pm';

system "ksc -t perl $KSY_FILE";
system "mv DwgAc210.pm $OUTPUT_PM_FILE";
system "sed -i s/DwgAc210/CAD::Format::DWG::AC2_10/g $OUTPUT_PM_FILE";

# Run.
WriteAll();
