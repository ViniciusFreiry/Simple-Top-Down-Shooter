hspd = 0;
vspd = 0;
spd = 0;
life = 1;
follow_distance = 200;

new_state_timer = 0;

define_move = function() {
	var _fps = game_get_speed(gamespeed_fps);
	
	spd = random(2);
	image_angle = random(359);
	new_state_timer = random_range(_fps * 4, _fps * 10);
}

reset_state = function() {
	new_state_timer--;

	if(new_state_timer <= 0) define_move();
}

follow_player = function() {
	if(instance_exists(obj_player)) {
		if(point_distance(x, y, obj_player.x, obj_player.y) <= follow_distance) {
			image_angle = point_direction(x, y, obj_player.x, obj_player.y);
			spd = 1;
		}
	}
}

apply_spd = function() {
	hspd = lengthdir_x(spd, image_angle);
	vspd = lengthdir_y(spd, image_angle);
}

move = function() {
	var _new_x = x + hspd,
	_new_y = y + vspd;

	if(_new_x < 0 + sprite_width / 2 or _new_x > room_width - sprite_width / 2) {
		define_move();
	
		exit;
	}

	if(_new_y < 0 + sprite_height / 2 or _new_y > room_height - sprite_height / 2) {
		define_move();
	
		exit;
	}

	x = _new_x;
	y = _new_y;
}

take_damage = function(_damage = 1) {
	life -= _damage;
	
	if(life <= 0) {
		repeat(irandom_range(5, 10)) {
			instance_create_layer(x, y, "Shoots", obj_enemy_piece);
		}
		
		instance_create_layer(x, y, "Shoots", obj_enemy_trial).image_angle = image_angle;
		
		if(instance_exists(obj_screen_shake)) obj_screen_shake.set_shake(10);
		
		instance_destroy();
	}
}

define_move();