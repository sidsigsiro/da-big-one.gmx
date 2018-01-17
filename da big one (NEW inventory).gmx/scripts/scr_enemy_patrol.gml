///scr_enemy_patrol

// walk to tar

if alarm[10] = -1 {
    if(mp_grid_path(curgrid, path, x, y, tars[tar_num].x, tars[tar_num].y , true)) {
        path_start(path, spd, path_action_stop, false);
    }
}

if instance_exists(my_focus) {
    if !collision_line(x, y, my_focus.x, my_focus.y, obj_viewblock, false, false) {
        look_ahead = false
    } else {
        look_ahead = true
    }
}

if place_meeting(x, y, tars[tar_num]) {
    look_ahead = true
}

if wait = false and place_meeting(x, y, tars[tar_num]) {
    // go into wait state
    alarm[0] = wait_time/2
    next_state = scr_enemy_look_nexttar
    enstate = scr_enemy_wait
}


