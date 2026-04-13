image_xscale = lerp(image_xscale, 1, 0.1);
image_yscale = image_xscale;

draw_self();

gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_tiro_efeito, 0, x, y, image_xscale * 1.5, image_yscale * 1.5, image_angle, c_red, 0.7);
gpu_set_blendmode(bm_normal);