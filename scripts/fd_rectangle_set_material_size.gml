/// fd_rectangle_set_material_size(instance id, width, height);
// Sets the size of the material textures used for the fluid dynamics simulation. Usually you want to keep this the same size as the other textures.
// instance id: The instance id of the fluid dynamics rectangle.
// width, height: The width and height of the texture.

with (argument0) {
    surface_free(sf_material_0); surface_free(sf_material_0_temporary);
    surface_free(sf_material_1); surface_free(sf_material_1_temporary);
    sf_material_width = argument1;
    sf_material_height = argument2;
    sf_material_texel_width = 1 / sf_material_width;
    sf_material_texel_height = 1 / sf_material_height;
}
