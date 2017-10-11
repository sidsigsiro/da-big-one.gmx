/// fd_draw_sprite_to_collision_mask_surface(instance id, sprite, subimg, x, y, xscale, yscale, rot, color, alpha);
// Draws a sprite to a fluid dynamics rectangle's collision mask surface. If a fluid dynamics rectangle is attached to a view (as obtained from fd_rectangle_create_view),
// this script should be called every step for the collision instances that block the fluid. This will draw the sprite at the correct position in the collision mask according
// to the new view position. Call it before fd_rectangle_update_view. If you e.g. call fd_rectangle_update_view in the step event, call this in the begin step event.
// instance id: The instance id of the fluid dynamics rectangle.
// sprite, subimg, x, y, xscale, yscale, rot, color, alpha: See draw_sprite_ext in the GameMaker manual.

surface_set_target(fd_rectangle_get_collision_mask_surface(argument0));
    draw_sprite_ext(argument1, argument2, fd_x(argument0, argument3), fd_y(argument0, argument4), argument5 / argument0.fd_wratio, argument6 / argument0.fd_hratio, argument7, argument8, argument9);
surface_reset_target();


