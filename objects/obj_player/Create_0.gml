#region Variables
// Move Variables
hspd = 0;
vspd = 0;
spd = 2;

// Shoot Variables
shoot_cd = game_get_speed(gamespeed_fps) * 0.2;
shoot_timer = shoot_cd;
shoot_sprite_cd = game_get_speed(gamespeed_fps) * 0.1;
shoot_sprite_timer = shoot_sprite_cd;

// Inputs
up = false;
left = false;
down = false;
right = false;
shoot = false;
#endregion

#region Functions
inputs = function() {
	up = keyboard_check(ord("W"));
	left = keyboard_check(ord("A"));
	down = keyboard_check(ord("S"));
	right = keyboard_check(ord("D"));
	shoot = mouse_check_button(mb_left);
}

apply_spd = function() {
	hspd = (right - left) * spd;
	vspd = (down - up) * spd;
	
	if(hspd != 0 or vspd != 0) image_speed = 1;
	else image_speed = 0;
}

move = function() {
	move_and_collide(hspd, 0, []);
	move_and_collide(0, vspd, []);
}

shooting = function() {
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	
	if(sprite_index == spr_player_tiro) {
		shoot_sprite_timer--;
		
		if(shoot_sprite_timer <= 0) {
			sprite_index = spr_player;
			shoot_sprite_timer = shoot_sprite_cd;
		}
	}
	
	if(shoot_timer > 0) shoot_timer--;
	else {
		if(shoot) {
			instance_create_layer(x, y, "Shoots", obj_shoot).image_angle = image_angle;

			shoot_timer += shoot_cd;
			sprite_index = spr_player_tiro;
		}
	}
}
#endregion