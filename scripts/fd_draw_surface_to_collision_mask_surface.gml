///fd_draw_surface_to_collision_mask_surface(fd instance id, surface id, x, y, xscale, yscale, rot, color, alpha);
// Draws a surface to a fluid dynamics rectangle's collision mask surface. If a fluid dynamics rectangle is attached to a view (as obtained from fd_rectangle_create_view),
// this script should be called every step to draw the surface blocking the fluid. This will draw the surface at the correct position in the collision mask according to the
// new view position. Call it before fd_rectangle_update_view. If you e.g. call fd_rectangle_update_view in the step event, call this in the begin step event.
// instance id: The instance id of the fluid dynamics rectangle.
// surface id, x, y, xscale, yscale, rot, color, alpha: See draw_surface_ext in the GameMaker manual.

surface_set_target(fd_rectangle_get_collision_mask_surface(argument0));
    draw_surface_ext(argument1, fd_x(argument0, argument2), fd_y(argument0, argument3), argument4 / argument0.fd_wratio, argument5 / argument0.fd_hratio, argument6, argument7, argument8);
surface_reset_target();


