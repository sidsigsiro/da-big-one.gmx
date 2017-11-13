//hit by splash
if place_meeting(x, y, obj_splash) {
    alarm[6] = room_speed*5
    enstate = scr_enemy_frozen
}

if instance_exists(obj_enemy) {
    if(mp_grid_path(global.grid_floor1, path, x, y, obj_player.x, obj_player.y , true)) {
        path_start(path, (spd + 0.3), path_action_stop, false);
    } 
}
