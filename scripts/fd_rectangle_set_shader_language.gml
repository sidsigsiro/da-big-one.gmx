/// fd_rectangle_set_shader_language(instance id, shader language)
// Sets the shader language being used for the fluid dynamics rectangle.
// instance id: The instance id of the fluid dynamics rectangle.
// shader language: Enum type. Set this to either FD_SHADER_LANGUAGE.HLSL_9 or FD_SHADER_LANGUAGE.GLSL_ES depending on what shader language you want the shaders used to be from.

with (argument0) {
    shader_language = argument1;
       
    switch (shader_language) {
        case FD_SHADER_LANGUAGE.HLSL_9:
            sh_fd_advect_material_a_16 = sh_fd_advect_material_a_16_hlsl;
            sh_fd_advect_material_rgba_8 = sh_fd_advect_material_rgba_8_hlsl;
            sh_fd_advect_material_a_8 = sh_fd_advect_material_a_8_hlsl;
            sh_fd_calculate_velocity_divergence = sh_fd_calculate_velocity_divergence_hlsl;
            sh_fd_advect_velocity_0 = sh_fd_advect_velocity_0_hlsl;
            sh_fd_advect_velocity_1 = sh_fd_advect_velocity_1_hlsl;
            sh_fd_calculate_pressure_jacobi = sh_fd_calculate_pressure_jacobi_hlsl;
            sh_fd_calculate_pressure_srj = sh_fd_calculate_pressure_srj_hlsl;
            sh_fd_subtract_pressure_gradient = sh_fd_subtract_pressure_gradient_hlsl; 
            sh_fd_visualize_velocity = sh_fd_visualize_velocity_hlsl;
            sh_fd_visualize_divergence = sh_fd_visualize_velocity_divergence_hlsl;
            sh_fd_visualize_pressure = sh_fd_visualize_pressure_hlsl;
            sh_fd_add_velocity = sh_fd_add_velocity_hlsl;
            sh_fd_replace_material_advanced = sh_fd_replace_material_advanced_hlsl;
            sh_fd_visualize_pixel_art_fire = sh_fd_visualize_pixel_art_fire_hlsl;
            sh_fd_visualize_colorize = sh_fd_visualize_colorize_hlsl;
            sh_fd_visualize_pixel_art_fiery_smoke = sh_fd_visualize_pixel_art_fiery_smoke_hlsl;
            sh_fd_visualize_thick_smoke = sh_fd_visualize_thick_smoke_hlsl;
            break;
            
        case FD_SHADER_LANGUAGE.GLSL_ES:
            sh_fd_advect_material_a_16 = sh_fd_advect_material_a_16_glsl;
            sh_fd_advect_material_rgba_8 = sh_fd_advect_material_rgba_8_glsl;
            sh_fd_advect_material_a_8 = sh_fd_advect_material_a_8_glsl;
            sh_fd_calculate_velocity_divergence = sh_fd_calculate_velocity_divergence_glsl;
            sh_fd_advect_velocity_0 = sh_fd_advect_velocity_0_glsl;
            sh_fd_advect_velocity_1 = sh_fd_advect_velocity_1_glsl;
            sh_fd_calculate_pressure_jacobi = sh_fd_calculate_pressure_jacobi_glsl;
            sh_fd_calculate_pressure_srj = sh_fd_calculate_pressure_srj_glsl;
            sh_fd_subtract_pressure_gradient = sh_fd_subtract_pressure_gradient_glsl;
            sh_fd_visualize_velocity = sh_fd_visualize_velocity_glsl;
            sh_fd_visualize_divergence = sh_fd_visualize_velocity_divergence_glsl;
            sh_fd_visualize_pressure = sh_fd_visualize_pressure_glsl;
            sh_fd_add_velocity = sh_fd_add_velocity_glsl;
            sh_fd_replace_material_advanced = sh_fd_replace_material_advanced_glsl;
            sh_fd_visualize_pixel_art_fire = sh_fd_visualize_pixel_art_fire_glsl;
            sh_fd_visualize_colorize = sh_fd_visualize_colorize_glsl;
            sh_fd_visualize_pixel_art_fiery_smoke = sh_fd_visualize_pixel_art_fiery_smoke_glsl;
            sh_fd_visualize_thick_smoke = sh_fd_visualize_thick_smoke_glsl;
            break;
    }
}
