///glr_mesh_get_vertex_count(mesh id)

if(debug_mode)
{
    if(!glr_debug_is_mesh(argument0))
        show_message(global.GLR_ERROR_ARGUMENT_MESH);
}


return argument0[| GLR_MESH.shadow_vertex_count]; 
