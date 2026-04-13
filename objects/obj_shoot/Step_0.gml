x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

life_time--;

if(life_time <= 0) instance_destroy(id, false);