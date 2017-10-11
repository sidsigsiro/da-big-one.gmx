/// fd_rectangle_destroy(instance id);
// Destroys a fluid dynamics rectangle.
// instance id: The fluid dynamics rectangle to destroy.

with (argument0) {
    surface_free(sf_pressure); surface_free(sf_pressure_temporary);
    surface_free(sf_velocity); surface_free(sf_velocity_temporary);
    surface_free(sf_material_0); surface_free(sf_material_0_temporary);
    surface_free(sf_material_1); surface_free(sf_material_1_temporary);
    surface_free(sf_world);
    instance_destroy();
}
