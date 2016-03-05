use <servo.scad>;
$fn=180;
gira=[180,0,0];
l_GoPro=38;
DIA_GoPro=l_GoPro/2*sqrt(3);
difference() {
    intersection(){
        color([0.1,0.1,0.1,1]) sphere(DIA_GoPro-1);
        color([0.1,0.1,0.1,1]) cube([DIA_GoPro*2,DIA_GoPro*2,l_GoPro-1], center=true);
    }

    //GoPro//ingrandisce del 102%
    scale([1.02,1.02,1.02]) rotate(gira) import("gp4seasson.stl", convexity=3);
    //taglia sfera sotto per permettere ingresso GoPro
    translate([-DIA_GoPro,-DIA_GoPro,22.8/2]) cube([DIA_GoPro*2,DIA_GoPro*2,l_GoPro-1]);
    rotate([0,90,-90]) cylinder(h=DIA_GoPro-1, d1=0, d2=25);

}
//
r=DIA_GoPro;
s=10+r;
r1=s+1;
s1=10+r1;
r2=s1+1;
s2=10+r2;
h=22.8;

//1° braccio
difference() {
    intersection(){
        difference() {
            sphere(s);
            sphere(r);
        }
        union() {
            translate([0,0,-h/2]) cube([s,s,h]);
            translate([0,0,0]) rotate([0,90,0]) cylinder(h=s,d=h);
            translate([0,0,0]) rotate([-90,90,0]) cylinder(h=s,d=h);
        }
    }
    translate([r-1,0,0]) rotate([-90,0,180]) servoSG90();
}
//
difference() {
    intersection(){
        difference() {
            sphere(s1);
            sphere(r1);
        }
        mirror([1,0,0]) union() {
            translate([0,0,-h/2]) cube([s1,s1,h]);
            translate([0,0,0]) rotate([0,90,0]) cylinder(h=s1,d=h);
            translate([0,0,0]) rotate([-90,90,0]) cylinder(h=s1,d=h);
        }
    }
    translate([0,r1-1,0]) rotate([-90,0,270])servoSG90();
}
//
difference() {
    intersection(){
        difference() {
            sphere(s2);
            sphere(r2);
        }
        rotate([0,0,90]) mirror([1,0,0]) union() {
            translate([0,0,-h/2]) cube([s2,s2,h]);
            translate([0,0,0]) rotate([0,90,0]) cylinder(h=s2,d=h);
            translate([0,0,0]) rotate([-90,90,0]) cylinder(h=s2,d=h);
        }
    }
    translate([-r2+1,0,0]) rotate([-90,0,0])servoSG90();
}
//

/*
scale([1.02,1.02,1.02]) rotate(gira) import("gp4seasson.stl", convexity=3);
translate([r-1,0,0]) rotate([-90,0,180]) servoSG90();
translate([0,r1-1,0]) rotate([-90,0,270])servoSG90();    
translate([-r2+1,0,0]) rotate([-90,0,0])servoSG90();