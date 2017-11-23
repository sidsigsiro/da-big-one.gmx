///scr_create_masked_sprite(image_index, mask, x, y)

// all drawing will occur on surf until surface_free(surf)
var surf = surface_create(sprite_width, sprite_height)
surface_set_target(surf)

//draw alpha mask
draw_clear_alpha(c_white, 1)
draw_sprite(argument[1], 0, argument[2], argument[3])
var _mask = sprite_create_from_surface(surf, 0, 0, sprite_width, sprite_height, false, false, 0, 0)

//draw player sprite
draw_clear_alpha(c_black, 0) //transparent
draw_sprite(sprite_index, argument[0], sprite_xoffset, sprite_yoffset)
var _image = sprite_create_from_surface(surf, 0, 0, sprite_width, sprite_height, false, false, sprite_xoffset, sprite_yoffset)

//clean up
surface_reset_target();
surface_free(surf);

//apply mask to sprite
sprite_set_alpha_from_sprite(_image, _mask)
sprite_delete(_mask)

return _image
