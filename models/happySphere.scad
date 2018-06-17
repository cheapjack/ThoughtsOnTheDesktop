//scale the beetleblocks export
scaleUp = 15;
//scale the logo when importing
scaleDown = 0.12;
wirevoid = 9;

// Build everything

/*translate([0,0,10])
difference() {
    lid(37, 47, 30, 3, 14, wirevoid);
    //Subtract the logo from the front//Needs some trig to calculate the angle to match the front plinth slope rather than have to state it
         //rotate([72,0,90])translate([0,-5,26])scale([scaleDown, scaleDown, scaleDown])surface(file = "/Users/Power5/DesktopFlunstellas/models/nmclogo.png", center = true, invert = true);
}
*/
//translate([0,0,59.5])
//stalk(40,3,wirevoid);
//translate([0,0,90])happySphere();
translate([0,0,-30])
difference(){
    base(37,47,5,3);
    translate([-15, 0, -5])rotate([90,0,90])cylinder(h=100, d=11, center=true, $fn=100);
}


// Define the modules
// Base for the microbit and 170 tie point mini breadboard
//Box Base
module base(x,y,z, thickness){
    difference() {
        cube([x +thickness , y+thickness, z+thickness], center=true);
        translate([0,0,thickness])
        cube([x, y, z], center=true);
        translate([x/2,0,thickness])
        cube([10, y, z], center=true);
        }
        translate([x+x/4+6.5-thickness,0,z/8])
        base2(45,52,9,2,9.5,thickness);
        translate([x-60,-y/2-4,-z-z/-5])
        cube([60,47+8,2]);
    }
    
 module base2(x, y, z, cornerRadius, filletHeight, thickness){
     difference() {
        roundedCube(x+thickness, y+thickness, z, cornerRadius, filletHeight+thickness);
        translate([0,0,thickness])
        roundedCube(x, y, z, cornerRadius, filletHeight);
        translate([x/-2+2,0,thickness])
        cube([15, y, z], center=true);
        }
    }
     

//The box lid base to allow for coiled wiring of rgb resistors etc, allowing for wiring into microbit
//Box lid(37,47,30,3)
module lid(x, y, z, thickness, baseSlantLimit, wireVoid) {
                //remove an area for the breadboard joining slot
            difference(){
                //subtract the breadboard size
                difference() {
                    cube([x+thickness, y+thickness, z+thickness], center=true);
                    translate([0, 0, -2])cube([x, y, z], center=true);
                    }
                //combine join breadboard join slot and space for usb out
                    union(){
                        union(){
                            translate([0, y/-2, z/-2])cube([4.5, 1.5, 5], center=true)translate([x/-2, y/-2, z/-2])cube([15.5, 5.5, 5], center=true);
                            translate([x/-2, 0, z/-2-2])rotate([90,0,90])cylinder(h=4, r=5, center=true, $fn=100);
                        }
                        translate([0,0,15])cylinder(h = 20, d = wireVoid + 2, center = true);
                    }
                    }
                    // remove an area for the microbit LED array 
                    difference(){
                            rotate([90,0,0])translate([x/2+thickness/2,z/-2-(thickness/2),y/-2-(thickness/2)])myPoly(y+3,z+thickness,14-thickness);
                        // include the adjustment to sit flush with microbit
                        union() {
                            translate([baseSlantLimit+x/2, 0, z/-2+2])cube([10, 20, 10], center=true);
                            translate([baseSlantLimit-2, 0, (z/-2)])cube([40, 51.5, 10], center=true);
                        }
                    }
    
                        //redundant rear angle on plinth
    //rotate([90,0,180])translate([20.5,2,-26.5])myPoly(53,16,14);
    }
    
// Build an angled plinth front by extruding from a 3 sided polygon/triangle
// myPoly
 module myPoly(length, polyHeight, baseSlantLimit) {
     //array of points for the polygon
     a=[[0,0],[baseSlantLimit,0],[0,polyHeight]];
         linear_extrude(height = length, center = false, convexity = 10, twist = 0)polygon(a);
       
 }


// Build the 'stalk' for the wires to go up into the beetleblocks shape
 // include a 'screw' to help secure
//Stalk

module stalk(height, screwHeight, void) {
    difference() {
        cylinder(h=height,d=void+3,center=true);
        cylinder(h=height+1,d=void,center=true);
    }
    translate([0,0,height/-2])
    difference() {
        cylinder(h=screwHeight,d=void+1,center=true);
        cylinder(h=screwHeight+1,d=void,center=true);
    }
}

// happySphere from the beetleblocks export
module happySphere() {
    difference(){
        scale([scaleUp, scaleUp, scaleUp])import("/Users/Power5/Downloads/FeelingPrinting.stl");
        sphere(15);
        }
    }




module roundedCube(x, y, z, cornerRadius, filletHeight){
    difference() {
        cube([x, y, z], center=true);
        rotate([0,0,0])translate([(x/-2),(y/-2),0])
        fillet(cornerRadius, filletHeight,10);
        rotate([0,0,180])translate([(x/-2),(y/-2),0])
        fillet(cornerRadius,10);
        rotate([0,0,90])translate([(y/-2),(x/-2),0])
        fillet(cornerRadius,10);
        rotate([0,0,270])translate([(y/-2),(x/-2),0])
        fillet(cornerRadius,10);
    }
}

module fillet(r, h) {
    translate([r / 2, r / 2, 0])
    difference() {
        cube([r + 0.01, r + 0.01, h], center = true);
        translate([r/2, r/2, 0])
        cylinder(r = r, h = h + 1, center = true, $fn=50);
        }
}
 