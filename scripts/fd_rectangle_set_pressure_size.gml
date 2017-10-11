/// fd_rectangle_set_pressure_size(instance id, width, height);
// Sets the size of the pressure texture used for the fluid dynamics simulation. Usually you want to keep this the same size as the other textures.
// instance id: The instance id of the fluid dynamics rectangle.
// width, height: The width and height of the texture.

with (argument0) {
    surface_free(sf_pressure); surface_free(sf_pressure_temporary);
    sf_pressure_width = argument1;
    sf_pressure_height = argument2;
    sf_pressure_texel_width = 1 / sf_pressure_width;
    sf_pressure_texel_height = 1 / sf_pressure_height;
}
