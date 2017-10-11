/// fd_rectangle_draw_part(instance id, left, top, width, height, x, y, xscale, yscale, color, alpha, use interpolation)
// Draws a part of the fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// left, top, width, height: See the manual on draw_surface_part for an explanation.
// x, y: The pixel position to draw at.
// xscale, yscale: The scale to draw at.
// color: The image blending color, the same as color in draw_surface_ext.
// alpha: The alpha to draw at, the same as alpha in draw_surface_ext.
// use interpolation: Set this to true if you want linear interpolation to be enabled, and false if you want nearest neighbor to be used instead.

with (argument0) {
    texture_set_interpolation(argument11);
    
    fd_rectangle_assure_surfaces_exist(id);
    
    switch (visualization_shader) {
        case FD_VISUALIZATION_SHADER.NO_SHADER:
            draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            break;
    
        case FD_VISUALIZATION_SHADER.DEBUG_VELOCITY:
            shader_set(sh_fd_visualize_velocity);
                shader_set_uniform_f(shader_get_uniform(sh_fd_visualize_velocity, "texel_size"), 1 / (argument3 * argument7), 1 / (argument4 * argument8));
                draw_surface_part_ext(sf_velocity, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.DEBUG_VELOCITY_DIVERGENCE:
            shader_set(sh_fd_visualize_divergence);
                draw_surface_part_ext(sf_pressure, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
        
        case FD_VISUALIZATION_SHADER.DEBUG_PRESSURE:
            shader_set(sh_fd_visualize_pressure);
                draw_surface_part_ext(sf_pressure, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.PIXEL_ART_FIRE:
            shader_set(sh_fd_visualize_pixel_art_fire);
                shader_set_uniform_f(shader_get_uniform(sh_fd_visualize_pixel_art_fire, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.COLORIZE:
            shader_set(sh_fd_visualize_colorize);
                draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.PIXEL_ART_FIERY_SMOKE:
            shader_set(sh_fd_visualize_pixel_art_fiery_smoke);
                shader_set_uniform_f(shader_get_uniform(sh_fd_visualize_pixel_art_fiery_smoke, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
            
        case FD_VISUALIZATION_SHADER.THICK_SMOKE:
            shader_set(sh_fd_visualize_thick_smoke);
                shader_set_uniform_f(shader_get_uniform(sh_fd_visualize_thick_smoke, "texel_size"), sf_material_texel_width, sf_material_texel_height);
                draw_surface_part_ext(sf_material_0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10);
            shader_reset();
            break;
    }
}
