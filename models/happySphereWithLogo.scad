//scale in case export too small. Best exporting correct size really
scaleUp = 15;
scaleDown = 0.04;

rotate([90,0,0])translate([19,3,24])scale([scaleDown, scaleDown, scaleDown])surface(file = "/Users/Power5/DesktopFlunstellas/models/nmclogo.png", center = false, invert = false);


//translate([0,0,0])base();
translate([0,0,10])lid(38, 50, 13);
translate([0,0,39.5])stalk();
translate([0,0,90])happySphere();

rotate([90,0,180]){
    translate([20.5,2,-26.5])myPoly(53,16);
        }
    rotate([90,0,0]){
    translate([20.5,2,-26.5])myPoly(53,16);
        }

//Box Base
module base(){
    difference() {
        cube([37.5, 49.5, 12.5], center=true);
        translate([0, 0, 4])
        cube([35, 47, 10], center=true);
        }
    }

//Box Lid
module lid(x, y, z) {
        difference() {
            //cube([41, 53, 16], center=true);
            cube([x+3, y+3, z+3], center=true);
            translate([0, 0, -3])
            //cube([38, 50, 13], center=true);
            cube([x, y, z], center=true);
        }
        
    }
    
// Poly
 module myPoly(length, polyHeight) {
     a=[[0,0],[polyHeight,0],[0,polyHeight]];
      linear_extrude(height = length, center = false, convexity = 10, twist = 0)
     polygon(a);
 }


//Stalk

module stalk() {
    difference() {
        cylinder(50,10,6,true);
        cylinder(50,8,5,true);
    }
}

// happySphere from beetleblocks export
module happySphere() {
    difference(){
        scale([scaleUp, scaleUp, scaleUp])import("/Users/Power5/Downloads/FeelingPrinting.stl");
        sphere(15);
        }
    }

 