spd = lerp(spd, 0, 0.1);
image_alpha = lerp(image_alpha, 0, 0.01);

x += lengthdir_x(spd, image_angle);
y += lengthdir_y(spd, image_angle);

if(image_alpha < 0.01) instance_destroy();