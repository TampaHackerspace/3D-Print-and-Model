/*
 * Author: Steve Graves
*
 * This file is a parametric file to create an encoder wheel for an optical sensor
 * for a servo motor
 */

//This factor controls the accuracy of the compile. 
//0.01 is very accurate at the expense of speed of compile
//Comment factor out to increase compile speed when proofing design
//Uncomment before generating stl file
$fs = 0.01;

m=25.4; //The program operates in mm. This factor allows us to work in inches.

discHeight = m * 1/16; //Height of encoding disc
discDia = m * 1.25; // Diameter of encoding disc
totalHeight = m * 5/16; // Total height of mount and disc
mountDia = m * 1/2; // Diameter of mount where set screw is threaded
shaftDia = m * 5/64; // Diameter of hole for motor shaft
setScrewHeight = m * 3/16; // Height of set screw above base of disc
setScrewDia = m * 1 / 16; // Diameter of set screw hole
slotWidth = m * 1/16;  //Width of optical slot
slotLength = m * 3/16; //Length of optical slot
slotDist = m * 3/8; // Distance from center of shaft to inside edge of slot

difference(){
	union(){
		cylinder(h=discHeight, r = discDia/2); //Create disc
		cylinder(h=totalHeight, r = mountDia/2); //Create mount
	}
	cylinder(h= 2 * totalHeight, r=shaftDia/2); // Drill hole for shaft
	//Drill hole for set screw
	translate([0,0,setScrewHeight])rotate([90,0,0])cylinder(h=mountDia, r=setScrewDia/2);
	for(i=[0:19]){
		rotate([0,0,i*18])translate([-slotWidth/2, slotDist,0])cube(size=[slotWidth, slotLength, m*0.125]);
	}
}