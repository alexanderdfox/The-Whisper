//
// Allegorical Object: "The Weight of a Moment"
// Non-functional symbolic sculpture
//

$fn = 100;

// Main assembly
union() {

    // Core of intent
    color("black")
    cylinder(h = 12, r = 18);

    // Protection arc
    color("silver")
    translate([0,0,6])
    rotate_extrude(angle = 210)
        translate([28,0,0])
            circle(r = 3);

    // Harm arc
    color("gray")
    mirror([1,0,0])
    translate([0,0,6])
    rotate_extrude(angle = 210)
        translate([28,0,0])
            circle(r = 3);

    // Fragile bridge
    color("darkred")
    translate([-18,-2,5])
        cube([36,4,2]);

    // Destiny sphere
    color("gold")
    translate([0,0,24])
        sphere(r = 6);

    // Thin support suggesting restraint
    color("silver")
    translate([0,0,12])
        cylinder(h = 12, r = 1.5);
}