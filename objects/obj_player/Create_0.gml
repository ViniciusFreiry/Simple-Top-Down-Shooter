#region Variables
// Move Variables
hspd = 0;
vspd = 0;
spd = 2;

// Inputs
up = false;
left = false;
down = false;
right = false;
#endregion

#region Functions
inputs = function() {
	up = keyboard_check(ord("W"));
	left = keyboard_check(ord("A"));
	down = keyboard_check(ord("S"));
	right = keyboard_check(ord("D"));
}

apply_spd = function() {
	hspd = (right - left) * spd;
	vspd = (down - up) * spd;
}

move = function() {
	move_and_collide(hspd, 0, all);
	move_and_collide(0, vspd, all);
}
#endregion