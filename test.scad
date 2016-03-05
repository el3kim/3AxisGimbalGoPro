l_GoPro=38;
DIA_GoPro=l_GoPro/2*sqrt(3);
gira=[180,0,0];


scale([1.02,1.02,1.02]) rotate(gira) import("gp4seasson.stl", convexity=3);//    cylinder(h=5, d1=2, d2=5)
color([0.1,0.1,0.1,0.5]) rotate([0,90,-90]) cylinder(h=DIA_GoPro-1, d1=0, d2=30);
color([0.1,0.1,0.1,0.5]) sphere(DIA_GoPro-1);
