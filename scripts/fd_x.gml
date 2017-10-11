/// fd_x(instance id, x)
// Returns the x coordinate on the fluid dynamics surface.

return ((argument1 - view_xview[argument0.fd_view_number]) / fd_rectangle.fd_wratio) + argument0.fd_edge_buffer_size;
