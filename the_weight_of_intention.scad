// The Blacksmith's Allegory: The Weight of Intention
// Adjust $fn for smoother rendering (e.g., 50 or 100), kept low for preview speed
$fn = 40; 

module object_of_destiny() {
    // 1. THE CORE (The Weight of a Heartbeat)
    // A dense, dual-pointed octahedron that represents heavy, irreversible choice.
    color("SlateGray") {
        rotate_extrude(angle = 360) {
            polygon(points = [[0, 15], [8, 0], [0, -15]]);
        }
    }
    
    // 2. THE RING OF RESPONSIBILITY
    // A perfectly smooth, golden ring that encircles the core, representing the fragile distance between protection and harm.
    color("Goldenrod") {
        rotate([45, 45, 0]) {
            rotate_extrude() {
                translate([18, 0, 0])
                circle(r = 1.5);
            }
        }
    }
    
    // 3. THE CAGE OF FEAR AND PROTECTION
    // Outer ribs that mimic both a protective shelter and a ribcage/trap.
    color("DarkCharcoal") {
        for (r = [0 : 45 : 350]) {
            rotate([0, 0, r]) {
                // Curved rib
                translate([22, 0, 0])
                rotate([0, 90, 0])
                rotate_extrude(angle = 180, convexity = 10) {
                    translate([22, 0, 0]) circle(r = 1);
                }
                
                // The Thorns / External Spikes
                // Pointing outward to keep wolves away, or inward to threaten the holder.
                translate([0, 0, 22])
                rotate([0, 45, 0])
                cylinder(h = 6, r1 = 1, r2 = 0);
                
                translate([0, 0, -22])
                rotate([0, -45, 0])
                cylinder(h = 6, r1 = 1, r2 = 0);
            }
        }
    }
}

// Render the final forged object
object_of_destiny();