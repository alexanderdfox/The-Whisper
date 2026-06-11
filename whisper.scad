// The Whisper - Allegorical Handheld Artifact
// Created to embody power, silence, and moral duality

length = 120;
barrel_length = 60;
grip_length = 70;
width = 25;
height = 40;

// Main body - the "frame"
module frame() {
    color("darkgray") 
        cube([length - barrel_length, width, height], center=true);
    
    translate([-(length - barrel_length)/2 + 5, 0, 0])
        color("darkgray") 
            minkowski() {
                cube([grip_length - 10, width - 10, height - 10], center=true);
                sphere(5);
            }
}

// Barrel
module barrel() {
    translate([ (length - barrel_length)/2 + barrel_length/2 - 5, 0, 5]) 
        rotate([0,90,0]) 
            color("dimgray") 
                cylinder(h=barrel_length, r=8, center=true);
    
    translate([length/2 - 8, 0, 5]) 
        color("silver") 
            cylinder(h=12, r=10, center=true);
}

// Trigger guard and trigger
module trigger_assembly() {
    color("black") 
        translate([10, 0, -height/2 + 8]) 
            rotate([90,0,0]) 
                difference() {
                    cylinder(h=width-5, r=15, center=true);
                    cylinder(h=width+2, r=10, center=true);
                    translate([0,15,0]) cube([30,30,width+2], center=true);
                }
    
    color("silver") 
        translate([8, 0, -height/2 + 10]) 
            rotate([0, 30, 0]) 
                cube([3, 4, 18], center=true);
}

// Grip with symbolic engravings
module grip() {
    translate([-(length - barrel_length)/2 + grip_length/2 - 5, 0, 0]) {
        color("saddlebrown") 
            cube([grip_length - 10, width - 8, height - 15], center=true);
        
        for(i = [-1:1:1]) {
            translate([0, 0, i*8]) 
                color("goldenrod") 
                    cube([grip_length - 15, width + 1, 1.5], center=true);
        }
    }
}

// Hammer (the forge's mark)
module hammer() {
    translate([20, 0, height/2 - 5]) {
        color("dimgray") 
            rotate([0, -30, 0]) 
                cube([8, 6, 25], center=true);
        translate([0,0,15]) color("silver") sphere(7);
    }
}

// Sights (for aiming destiny)
module sights() {
    translate([-length/2 + 20, 0, height/2 - 2]) 
        color("silver") 
            cube([8, width-18, 5], center=true);
    
    translate([length/2 - 15, 0, height/2 + 3]) 
        color("gold") 
            cube([3, 4, 8], center=true);
}

// Assembly
difference() {
    union() {
        frame();
        barrel();
        grip();
        hammer();
        sights();
    }
    translate([0,0,5]) 
        cube([length - 30, width - 12, height - 20], center=true);
}

trigger_assembly();

// Display base
translate([0, 0, -height/2 - 5]) 
    color("black") 
        cube([length + 20, width + 20, 5], center=true);

translate([0, 0, -height/2 - 10]) 
    linear_extrude(1) 
        text("The Whisper", size=8, halign="center", valign="center");
