draw_self();

if(instance_exists(obj_enemy_2)) {
	var _enemy = instance_nearest(x, y, obj_enemy_2),
	_dir = point_direction(x, y, _enemy.x, _enemy.y);
	
	draw_sprite_ext(spr_seta, 0, x + lengthdir_x(30, _dir), y + lengthdir_y(30, _dir), 1, 1, _dir, c_white, 1);
}