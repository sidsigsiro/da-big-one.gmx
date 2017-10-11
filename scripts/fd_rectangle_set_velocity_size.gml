/// fd_rectangle_set_velocity_size(instance id, width, height);
// Sets the size of the velocity texture used for the fluid dynamics simulation. Usually you want to keep this the same size as the other textures.
// instance id: The instance id of the fluid dynamics rectangle.
// width, height: The width and height of the texture.

with (argument0) {
    surface_free(sf_velocity); surface_free(sf_velocity_temporary);
    sf_velocity_width = argument1;
    sf_velocity_height = argument2;
    sf_velocity_texel_width = 1 / sf_velocity_width;
    sf_velocity_texel_height = 1 / sf_velocity_height;
}
