#!/bin/sh

KSY_FILE=dwg_ac2_10.ksy
OUTPUT_PM_FILE=AC2_10.pm

ksc -t perl $KSY_FILE
mv DwgAc210.pm $OUTPUT_PM_FILE
sed -i s/DwgAc210/CAD::Format::DWG::AC2_10/g $OUTPUT_PM_FILE
