randomise();

restart_timer = game_get_speed(gamespeed_fps);

room_start = function() {
	room_width = irandom_range(2000, 5000);
	room_height = irandom_range(2000, 5000);
	layer_background_sprite(layer_background_get_id(layer_get_id("Background")), choose(spr_bg, spr_bg2, spr_bg3));
	
	instance_create_depth(0, 0, 0, obj_screen_shake);
	instance_create_layer(irandom_range(100, room_width - 100), irandom_range(100, room_height - 100), "Player", obj_player);
	generate_enemies();
}

generate_enemies = function() {
	var _qtd = irandom_range(3, 7) * global.level;
	
	repeat(_qtd) {
		var _x = irandom_range(100, room_width - 100),
		_y = irandom_range(100, room_height - 100),
		_enemy = instance_create_layer(_x, _y, "Enemies", obj_enemy_2);
		
		if(instance_exists(obj_player)) {
			var _dist = point_distance(_enemy.x, _enemy.y, obj_player.x, obj_player.y);
			
			if(_dist < 300) instance_destroy(_enemy, false);
		}
	}
}

next_level = function() {
	var _qtd_enemies = instance_number(obj_enemy_2);
	
	if(_qtd_enemies <= 0) {
		restart_timer--;
		
		if(restart_timer <= 0) {
			global.level++;
			restart_timer = game_get_speed(gamespeed_fps);
			global.life = 3;
			room_restart();
		}
	}
}