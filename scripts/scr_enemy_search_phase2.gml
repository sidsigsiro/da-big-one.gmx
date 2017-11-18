///scr_enemy_search_phase2
if cautar = noone {
    cautar = cautar0
}


with(obj_enemy_captain) {
    enstate = scr_enemy_patrol
}

if !collision_line(x, y, cautar.x, cautar.y, obj_viewblock, false, false) {
    look_ahead = false
} else {
    look_ahead = true
}

if alarm[10] = -1 {
    if(mp_grid_path(global.grid_floor1, path, x, y, caunexttar.x, caunexttar.y , true)) {
        path_start(path, (spd + 0.5), path_action_stop, false);
    }
}

//change enstate = wait to find next target
if place_meeting(x, y, cautar0) and (caunexttar = cautar0) {
    alarm[0] = room_speed;
    enstate = scr_enemy_search_phase2_wait
}

if place_meeting(x, y, cautar) and (caunexttar = cautar) {
    alarm[0] = room_speed;
    enstate = scr_enemy_search_phase2_wait
}

if !instance_exists(obj_caunode1) {
    obj_enemy_hivemind.search_complete = true
}
