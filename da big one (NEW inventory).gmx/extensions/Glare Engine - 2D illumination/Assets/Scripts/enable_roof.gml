///enable_roof(enable)
// example to toggle the roof on and off
with(obj_glr_roof)
{
    image_alpha = argument0;

    with(obj_glr_roof_shadow)
    {
       glr_shadowdepth_set_active(shadowdepth, argument0);
       glr_shadowarea_set_active(shadowarea, !argument0);  
       glr_mesh_set_active(mesh_id, argument0);
    } 
}
