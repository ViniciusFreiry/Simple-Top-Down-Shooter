x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

var _enemy = instance_place(x, y, obj_enemy_parent);

if(_enemy) {
	_enemy.take_damage(damage);
	instance_create_layer(x, y, layer, obj_shoot_explosion);
	
	if(instance_exists(obj_screen_shake)) obj_screen_shake.set_shake(4);
	
	instance_destroy();
} else {
	life_time--;

	if(life_time <= 0) instance_destroy(id, false);
}