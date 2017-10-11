/// fd_rectangle_set_collision_mask_surface(instance id, surface id)
// Sets the collision mask to a surface.
// instance id: The instance id of the fluid dynamics rectangle.
// surface id: The id of the surface to use as the new collision mask.

with (argument0) {
    if (sf_world != argument1) {
        surface_free(sf_world);
        sf_world = argument1;
    }
    
    collision_mask_type = 1;
    collision_mask_sprite_index = -1;
    collision_mask_image_index = -1;
}
