$fs = 0.4;
$fa=1;

h = 12.5;
w = 65;
d = 4.7;

gap = 1.5;
duo = 4;
trio = 5.5;
slot = 7;

depth1 = 4;
depth2 = 2.5;
height = 2.5;

z1 = h/2-height/2 + 2.25;
z2 = h/2-height/2 - gap - height/2 + 0.75;

radius=4;


module hold(x, z, type, depth)
{
    hull()
    {
        translate([x+1.25, -0.001, z])
        rotate([-90,0,0])
        cylinder(h=depth, r=1.25);

        translate([x+type-1.25, -0.001, z])
        rotate([-90,0,0])
        cylinder(h=depth, r=1.25);
    }
}

minkowski()
{
    sphere(0.35);
    
    difference()
    {
        hull()
        {
            translate([radius,0,radius])
            rotate([-90,0,0])
            cylinder(h=d, r=radius);

            translate([w-radius,0,radius])
            rotate([-90,0,0])
            cylinder(h=d, r=radius);

            translate([radius,0,h-radius])
            rotate([-90,0,0])
            cylinder(h=d, r=radius);

            translate([w-radius,0,h-radius])
            rotate([-90,0,0])
            cylinder(h=d, r=radius);
        }
        
        
        // center slot  ----------------
        x1 = w/2-slot/2;
        hold(x1, z1, slot, depth1);
        
        // trios  -----------------------
        x2 = x1 - gap - trio;
        hold(x2, z1, trio, depth1);

        x3 = x1 + slot + gap;
        hold(x3, z1, trio, depth1);
        
        // duos -----------------------
        x4 = x2 - gap - duo;
        hold(x4, z1, duo, depth1);

        x5 = x3 + gap + trio;
        hold(x5, z1, duo, depth1);
        
        // slots -----------------------
        x6 = x4 - gap - slot;
        hold(x6, z1, slot, depth1);
        
        x7 = x5 + gap + duo;
        hold(x7, z1, slot, depth1);
            
            
        // trios  -----------------------
        xx1 = w/2 + gap/2;
        hold(xx1, z2, trio, depth2);
            
        xx2 = xx1 - gap - trio;
        hold(xx2, z2, trio, depth2);

        // duos  -----------------------
        xx3 = xx1 + gap + trio;
        hold(xx3, z2, duo, depth2);

        xx4 = xx2 - gap - duo;
        hold(xx4, z2, duo, depth2);

        // slots  -----------------------
        xx5 = xx3 + gap + duo;
        hold(xx5, z2, slot, depth2);

        xx6 = xx4 - gap - slot;
        hold(xx6, z2, slot, depth2);
            
            
        // left slopers  ----------------
        xxx1 = x6;
        translate([xxx1, -1, h-2.25])
        rotate([16, 0, 0])
            cube([slot, d+2, h]);
            
        xxx2 = xxx1 + gap + slot;
        translate([xxx2, -1, h-2.5])
        rotate([25, 0, 0])
            cube([slot, d+2, h]);
        
        
        // right slopers  ----------------
        xxx3 = x7;
        translate([xxx3, -1, h-2.5])
        rotate([25, 0, 0])
            cube([slot, d+2, h]);

        xxx4 = xxx3 - gap - slot;
        translate([xxx4, -1, h-2.25])
        rotate([16, 0, 0])
            cube([slot, d+2, h]);
    }
}