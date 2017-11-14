///scr_enemy_patrol
if alarm[10] = -1 {
    if !instance_exists(obj_grid_cube) {
        if(mp_grid_path(curgrid, path, x, y, tars[tar_num].x, tars[tar_num].y , true)) {
            path_start(path, spd, path_action_stop, false);
        }
    } else if instance_exists(obj_grid_cube) {
        if(mp_grid_path(global.grid_floor1_cube, path, x, y, tars[tar_num].x, tars[tar_num].y , true)) {
            path_start(path, spd, path_action_stop, false);
        }
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
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
