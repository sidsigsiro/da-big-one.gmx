///scr_view_search_phase1
//get direction
    if instance_exists(obj_player_ghost) {
        focus_dir = point_direction(x, y, obj_player_ghost.x, obj_player_ghost.y);
    }
    // Get the length
    if instance_exists(obj_player_ghost) {
        focus_len = point_distance(x, y, obj_player_ghost.x, obj_player_ghost.y);
    } else {
        focus_len = 0
    }

    
//Get the hspd and vspd
focus_hspd = lengthdir_x(focus_len, focus_dir);
focus_vspd = lengthdir_y(focus_len, focus_dir);
// Move
x += focus_hspd;
y += focus_vspd;
