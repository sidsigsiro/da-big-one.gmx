///scr_view_investigate

//get direction
if investar != noone {
    investar = obj_node_distraction {
        if investar_x != noone and investar_y != noone {
            if look_ahead = false {
                focus_dest_x = investar_x
                focus_dest_y = investar_y
            } else if look_ahead = true {
                focus_dest_x = owner.x + lengthdir_x(64, owner.direction)
                focus_dest_y = owner.y + lengthdir_y(64, owner.direction)  
            }
            focus_dir = point_direction(x, y, focus_dest_x, focus_dest_y)
            focus_len = point_distance(x, y, focus_dest_x, focus_dest_y)/60

            //Get the hspd and vspd
            // Move
            x += lengthdir_x(focus_len, focus_dir);;
            y += lengthdir_y(focus_len, focus_dir);
        }
    }
}
