if(!instance_exists(obj_player)) exit;

var _dir = point_direction(obj_player.x, obj_player.y, x, y);

x += lengthdir_x(spd, _dir);
y += lengthdir_y(spd, _dir);