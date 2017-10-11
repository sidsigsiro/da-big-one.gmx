/// fd_rectangle_draw(instance id, x, y, xscale, yscale, color, alpha, use interpolation)
// Draws the fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// x, y: The pixel position to draw at.
// xscale, yscale: The scale to draw at.
// color: The image blending color, the same as color in draw_surface_ext.
// alpha: The alpha to draw at, the same as alpha in draw_surface_ext.
// use interpolation: Set this to true if you want linear interpolation to be enabled, and false if you want nearest neighbor to be used instead.

fd_rectangle_draw_part(argument0, 0, 0, argument0.sf_material_width, argument0.sf_material_height, argument1, argument2, argument3, argument4, argument5, argument6, argument7);
