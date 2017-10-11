/// fd_rectangle_create(sf width, sf height, shader language)
// Creates a fluid dynamics rectangle and returns its instance id. This instance id should be stored and be used together with the other scripts of this asset.
// sf width, sf height: The width and height of the fluid dynamics rectangle. This does not need to be the same as the amount of pixels it will cover. It's usually a good idea to make
//     it about a third the size of what it will actually cover on screen.
// shader language: Enum type. Set this to either FD_SHADER_LANGUAGE.HLSL_9 or FD_SHADER_LANGUAGE.GLSL_ES depending on what shader language you want the shaders used to be from.

var instance = instance_create(0, 0, obj_fd_rectangle);

with (instance) {
    sf_pressure = -1; sf_pressure_temporary = -1;
    sf_velocity = -1; sf_velocity_temporary = -1;
    sf_material_0 = -1; sf_material_0_temporary = -1;
    sf_material_1 = -1; sf_material_1_temporary = -1;
    sf_world = -1;
    
    material_surface_was_created = false;
    
    collision_mask_type = 2;
    
    fd_rectangle_inherit_velocity(id, -1, false);
    fd_rectangle_set_visualization_shader(id, FD_VISUALIZATION_SHADER.NO_SHADER);
    fd_rectangle_set_acceleration(id, 0, 0);
    fd_rectangle_set_shader_language(id, argument2);
    fd_rectangle_set_material_type(id, FD_MATERIAL_TYPE.RGBA_16);
    fd_rectangle_set_velocity_time_step(id, 1.4);
    fd_rectangle_set_material_time_step(id, 1.4);
    fd_rectangle_set_material_dissipation_type(id, 0);
    fd_rectangle_set_material_dissipation_value(id, 1);
    fd_rectangle_set_velocity_dissipation_type(id, 1);
    fd_rectangle_set_velocity_dissipation_value(id, 0);
    fd_rectangle_set_velocity_maccormack_weight(id, 0.5);
    fd_rectangle_set_material_maccormack_weight(id, 0);
    fd_rectangle_set_pressure_iteration_type(id, -3);
    fd_rectangle_set_pressure_size(id, argument0, argument1);
    fd_rectangle_set_velocity_size(id, argument0, argument1);
    fd_rectangle_set_material_size(id, argument0, argument1);
    fd_rectangle_set_initial_value_pressure(id, 0.5);
    fd_rectangle_set_repeat(id, false);
}

return instance;
