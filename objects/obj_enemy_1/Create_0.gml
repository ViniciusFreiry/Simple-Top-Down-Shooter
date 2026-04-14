event_inherited();

follow_player = function() {
	if(instance_exists(obj_player)) {
		if(point_distance(x, y, obj_player.x, obj_player.y) <= follow_distance) {
			image_angle = point_direction(x, y, obj_player.x, obj_player.y);
			spd = 1;
		}
	}
}