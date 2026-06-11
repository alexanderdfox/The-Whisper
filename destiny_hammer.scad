// Mysterious Artifact: The Destiny Hammer (Allegorical "Voice of Intent")
// Small enough to fit in a traveler's hand. A stylized revolver-like object
// symbolizing power, responsibility, silence, and irreversible destiny.
// Ornate blacksmith-forged appearance with runes, balanced grip, and a sense
// of contained danger. Render with F6 for preview.

$fn = 60; // Smoothness

// Main parameters
length = 120;   // Barrel + frame length (mm)
grip_height = 80;
barrel_diam = 12;
grip_width = 25;
handle_thickness = 18;

// Colors for visualization (metal, wood, engravings)
module artifact() {
    // Barrel - cold forged steel with subtle runes
    color("silver") {
        // Main barrel
        translate([0, 0, 0])
            rotate([0, 90, 0])
                cylinder(h = length * 0.65, r = barrel_diam / 2, center = false);
        
        // Reinforced muzzle
        translate([length * 0.65 - 5, 0, 0])
            rotate([0, 90, 0])
                cylinder(h = 20, r = barrel_diam / 2 + 2);
        
        // Subtle ring details near chamber
        for (i = [0:3]) {
            translate([length * 0.45 + i*8, 0, 0])
                rotate([0, 90, 0])
                    difference() {
                        cylinder(h = 3, r = barrel_diam / 2 + 3);
                        cylinder(h = 4, r = barrel_diam / 2 + 1);
                    }
        }
    }
    
    // Frame / Receiver - forged with mystical engravings
    color("#c0c0c0") {
        // Main body
        hull() {
            translate([15, -8, -10]) cube([length * 0.45, 28, 22], center = false);
            translate([length * 0.55, -6, -8]) cube([30, 24, 18]);
        }
        
        // Cylinder (revolver style) - symbol of fate's cycle
        translate([length * 0.38, 0, 0])
            rotate([90, 0, 0])
                difference() {
                    cylinder(h = grip_width + 4, r = 22, center = true);
                    cylinder(h = grip_width + 6, r = 14, center = true);
                }
    }
    
    // Grip / Handle - dark wood with iron inlays, ergonomic for a traveler's hand
    color("#3c2f2f") {
        translate([20, -grip_width/2 + 2, -grip_height/2 + 5])
            hull() {
                // Tapered grip shape
                cube([grip_width * 1.1, grip_width - 4, grip_height * 0.7]);
                translate([8, 2, -15]) 
                    cube([grip_width * 0.6, grip_width - 8, 25], center = true);
            }
    }
    
    // Metal reinforcement on grip
    color("silver") {
        translate([25, 0, -grip_height/2 + 12])
            rotate([90, 0, 0])
                cylinder(h = grip_width - 6, r = 8, center = true);
    }
    
    // Trigger - delicate yet decisive
    color("#555555") {
        translate([length * 0.42, 0, -5]) {
            // Trigger guard
            rotate([0, 0, 20])
                difference() {
                    cylinder(h = 4, r = 18);
                    translate([8, -12, -1]) cube([30, 30, 10]);
                }
            // Trigger blade
            translate([3, -4, -3])
                cube([6, 3, 18]);
        }
    }
    
    // Symbolic engravings / runes on the frame (representing destiny, fear, protection)
    color("#222222") {
        // Rune-like lines on top of frame
        for (i = [0:4]) {
            translate([35 + i*12, 10, 8])
                rotate([0, 0, 35])
                    cube([18, 1.5, 1], center = true);
        }
        
        // Wolf / storm motif near muzzle (subtle)
        translate([length * 0.6, 0, 10])
            rotate([90, 0, 45])
                linear_extrude(1.5)
                    text("⚡", size = 8, halign = "center", valign = "center");
    }
    
    // Hammer (the striking part) - cocked position, ready to deliver destiny
    color("silver") {
        translate([length * 0.35, 0, 12]) {
            rotate([0, 30, 0]) {
                cube([6, 8, 22], center = true);
                translate([0, 0, 14]) sphere(r = 6);
            }
        }
    }
}

// Base stand (optional, for display)
module display_base() {
    color("#4a3c2e") {
        translate([-15, -25, -45])
            cube([length + 30, 50, 8]);
    }
}

// Full assembly
difference() {
    artifact();
    // Hollow barrel slightly for realism
    translate([-1, 0, 0])
        rotate([0, 90, 0])
            cylinder(h = length * 0.68, r = 6);
}

// Display base
display_base();

// Text label (optional - remove or comment for clean model)
translate([length/2 - 10, 0, -48]) {
    rotate([0, 0, 90])
        linear_extrude(2)
            text("Destiny's Whisper", size = 6, halign = "center");
}
