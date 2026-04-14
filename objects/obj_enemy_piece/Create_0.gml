spd = 0;
image_angle = random(359);

do_damage = false;

collide = function() {
	if(!do_damage) return;
	
	var _enemy = instance_place(x, y, obj_enemy_parent);
	
	if(_enemy) {
		_enemy.explosion_damage = true;
		_enemy.take_damage(1);
		instance_destroy();
	}
}