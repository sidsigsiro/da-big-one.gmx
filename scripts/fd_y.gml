/// fd_y(instance id, y)
// Returns the y coordinate on the fluid dynamics surface.

return ((argument1 - view_yview[argument0.fd_view_number]) / fd_rectangle.fd_hratio) + argument0.fd_edge_buffer_size;
