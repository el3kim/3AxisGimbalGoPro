// servoSG90(fn) fn = è la definizione delle curve da usare nel render
module servoSG90(fn) {
//    fn=32;
    L = 22.8;
    l = 12.6;
    h = 22.8;
    plateL = 32.5;
    plateH = 2.7;
    plateHPos = 16;
    topCylinderH = 3.4;
    smallTopCylinderD = 4.5;
    
    axisH = 2;
    axisD = 4;
    
    screwHoleCenter=2;
    screwHoleD=2;
    holeSize=1;
    
    difference() {
        union() {
            color("Blue", 0.7) {
                // main part
                cube([L, l, h]);
                // support
                translate([-(plateL - L) / 2, 0, plateHPos])    cube([plateL, l, plateH]);
                // top big cylinder
                translate([l/2,l/2,h])  cylinder(d=l, h=topCylinderH, $fn=fn);
                // top small cylinder
                translate([l, l/2, h])  cylinder(d=smallTopCylinderD, h=topCylinderH, $fn=fn);
            }
            color("white")  translate([l/2,l/2, h + topCylinderH])  cylinder(d=axisD,h=axisH, $fn=fn);
        }
        color("grey", 0.7) {
            // screwHole -
            translate([-(plateL - L) / 2 + screwHoleCenter, l/2, plateHPos])    cylinder(d=screwHoleD, h=10, $fn=fn, center=true);
            translate([-(plateL - L) / 2 - 1, l / 2 - holeSize / 2, plateHPos - 1]) cube([3,holeSize,4]);
            // screwHole +
            translate([plateL - (plateL - L) / 2 - screwHoleCenter, l / 2, plateHPos - 1])  cylinder(d=screwHoleD, h=10, $fn=fn, center=true);
            translate([plateL- (plateL - L) / 2 - screwHoleCenter, l / 2 - holeSize / 2, plateHPos -1]) cube([3,holeSize,4]);
        }
    }
}

servoSG90(32);