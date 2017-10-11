/// fd_rectangle_set_target(instance id, target type)
// Sets a surface of the fluid dynamics rectangle as a target to draw to. Use fd_rectangle_reset_target when done.
// instance id: The instance id of the fluid dynamics rectangle.
// target type: Enum type. From the enum FD_TARGET_TYPE. See an explanation of its enum elements below:
//     FD_TARGET_TYPE.REPLACE_MATERIAL: Draws to the material surface of the fluid dynamics rectangle, but replaces content that's already there.
//     FD_TARGET_TYPE.REPLACE_MATERIAL_ADVANCED: Like REPLACE_MATERIAL, but it takes care of issues with transparency related to surfaces. It can be a bit slower though.
//     FD_TARGET_TYPE.ADD_MATERIAL: Draws to the material surface of the fluid dynamics rectangle by adding to the content that's already there.
//     FD_TARGET_TYPE.REPLACE_VELOCITY: Draws to the velocity surface of the fluid dynamics rectangle and replaces the content that's already there. See fd_rectangle_get_velocity_surface for an explanation of the format.
//     FD_TARGET_TYPE.ADD_VELOCITY: Draws to the velocity surface of the fluid dynamics rectangle by adding to the content that's already there. See fd_rectangle_get_velocity_surface for an explanation of the format.

with (argument0) {
    target_type = argument1;
    
    fd_rectangle_assure_surfaces_exist(id);
    
    switch (argument1) {
        case FD_TARGET_TYPE.REPLACE_MATERIAL:
            surface_set_target(sf_material_0);
            break;
            
        case FD_TARGET_TYPE.REPLACE_MATERIAL_ADVANCED:
            surface_set_target(sf_material_0_temporary);
            draw_enable_alphablend(false);
            draw_surface(sf_material_0, 0, 0);
            shader_set(sh_fd_replace_material_advanced);
            shader_set_uniform_f(shader_get_uniform(sh_fd_replace_material_advanced, "addend"), 0.5 + 0.5 * sf_material_texel_width, 0.5 + 0.5 * sf_material_texel_height);
            texture_set_stage(shader_get_sampler_index(sh_fd_replace_material_advanced, "texture_material_0"), surface_get_texture(sf_material_0));
            break;
            
        case FD_TARGET_TYPE.ADD_MATERIAL:
            surface_set_target(sf_material_0);
            draw_set_blend_mode_ext(bm_one, bm_one);
            break;
        
        case FD_TARGET_TYPE.REPLACE_VELOCITY:
            surface_set_target(sf_velocity_temporary);
            break;
            
        case FD_TARGET_TYPE.ADD_VELOCITY:
            surface_set_target(sf_velocity_temporary);
            draw_enable_alphablend(false);
            draw_surface(sf_velocity, 0, 0);
            shader_set(sh_fd_add_velocity);
            shader_set_uniform_f(shader_get_uniform(sh_fd_add_velocity, "addend"), 0.5 + 0.5 * sf_velocity_texel_width, 0.5 + 0.5 * sf_velocity_texel_height);
            texture_set_stage(shader_get_sampler_index(sh_fd_add_velocity, "texture_velocity"), surface_get_texture(sf_velocity));
            break;
    }
}
