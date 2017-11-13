///scr_enemy_patrol
if alarm[10] = -1 {
    if !instance_exists(obj_grid_cube) {
        if(mp_grid_path(curgrid, path, x, y, nexttar.x, nexttar.y , true)) {
            path_start(path, spd, path_action_stop, false);
        }
    } else if instance_exists(obj_grid_cube) {
        if(mp_grid_path(global.grid_floor1_cube, path, x, y, nexttar.x, nexttar.y , true)) {
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

if place_meeting(x, y, nexttar) {
    look_ahead = true
}

if wait = false {
if place_meeting(x, y, tar1) and (nexttar = tar1) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar2) and (nexttar = tar2) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar3) and (nexttar = tar3) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar4) and (nexttar = tar4) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar5) and (nexttar = tar5) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar6) and (nexttar = tar6) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar7) and (nexttar = tar7) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar8) and (nexttar = tar8) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar9) and (nexttar = tar9) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar10) and (nexttar = tar10) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar11) and (nexttar = tar11) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar12) and (nexttar = tar12) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar13) and (nexttar = tar13) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar14) and (nexttar = tar14) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar15) and (nexttar = tar15) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar16) and (nexttar = tar16) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar17) and (nexttar = tar17) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar18) and (nexttar = tar18) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar19) and (nexttar = tar19) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
if place_meeting(x, y, tar20) and (nexttar = tar20) {
    alarm[0] = wait_time;
    enstate = scr_enemy_wait;
}
}
