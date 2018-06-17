roundedCube(52,45,9,2,9.5);

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
 