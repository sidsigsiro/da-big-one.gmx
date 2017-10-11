/// fd_rectangle_clear(instance id);
// Clears the fluid dynamics rectangle, removing all its content.
// instance id: The instance id of the fluid dynamics rectangle.

with (argument0) {
    surface_free(sf_pressure);
    surface_free(sf_velocity);
    surface_free(sf_material_0); surface_free(sf_material_1);
    surface_free(sf_world);
}
