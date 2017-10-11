///scr_view_investigate
if look_ahead = false {
    focus_dir = point_direction(x, y, nexttar.x, nexttar.y);
} else {
    focus_dir = point_direction(x, y, x + lengthdir_x(64, direction), y + lengthdir_y(64, direction))
}

//get direction
if investar != noone {
    investar = obj_node_distraction {
        if instance_exists(investar) {
            focus_dir = point_direction(x, y, investar.x, investar.y);
            // Get the length
            if look_ahead = false {
                focus_len = point_distance(x, y, investar.x, investar.y)/30;
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
