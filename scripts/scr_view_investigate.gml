///scr_view_investigate
if look_ahead = false {
    focus_dir = point_direction(x, y, investar_x, investar_y);
} else {
    focus_dir = point_direction(x, y, x + lengthdir_x(64, direction), y + lengthdir_y(64, direction))
}

//get direction
if investar != noone {
    investar = obj_node_distraction {
        if investar_x != noone and investar_y != noone {
            focus_dir = point_direction(x, y, investar_x, investar_y);
            // Get the length
            if look_ahead = false {
                focus_len = point_distance(x, y, investar_x, investar_y)/30;
            } else {
                focus_len = 7
            }
            //Get the hspd and vspd
            focus_hspd = lengthdir_x(focus_len, focus_dir);
            focus_vspd = lengthdir_y(focus_len, focus_dir);
            // Move
            x += focus_hspd;
            y += focus_vspd;
        }
    }
}
