event_inherited();

life = 10;
shake = 20;
piece_min = 15;
piece_max = 30;
min_state_timer = 5;
max_state_timer = 15;
explosion_damage = true;
piece_min_vel = 20;
piece_max_vel = 30;

egg_timer = 0;

reset_egg_timer = function() {
	egg_timer = random_range(5, 10) * game_get_speed(gamespeed_fps);
}

make_egg = function() {
	egg_timer--;
	
	if(egg_timer <= 0) {
		instance_create_layer(x, y, layer, obj_egg);
		
		reset_egg_timer();
	}
}

reset_egg_timer();
define_move();