///fd_rectangle_draw_view(instance id, color, alpha, use interpolation)
// Draws a fluid dynamics rectangle that has been attached to a view.
// instance id: The instance id of the fluid dynamics rectangle.
// color: The image blending color, the same as color in draw_surface_ext.
// alpha: The alpha to draw at, the same as alpha in draw_surface_ext.
// use interpolation: Set this to true if you want linear interpolation to be enabled, and false if you want nearest neighbor to be used instead.

with (argument0) {

    fd_rectangle_shift_content(argument0,
            (view_xview_previous-view_xview[fd_view_number]) / fd_wratio,
            (view_yview_previous-view_yview[fd_view_number]) / fd_hratio);
    
    fd_rectangle_draw_part(id, fd_edge_buffer_size, fd_edge_buffer_size, 
            view_wview[fd_view_number] / fd_wratio, view_hview[fd_view_number] / fd_hratio, 
            view_xview[fd_view_number], view_yview[fd_view_number], 
            fd_wratio, fd_hratio, argument1, argument2, argument3);

    view_xview_previous = view_xview[fd_view_number];
    view_yview_previous = view_yview[fd_view_number];
}

