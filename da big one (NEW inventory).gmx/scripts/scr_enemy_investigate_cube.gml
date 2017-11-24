///scr_enemy_investigate

if instance_exists(obj_cube_distraction){

if(mp_grid_path(global.grid_floor1, path, x, y, obj_cube_distraction.x, obj_cube_distraction.y , true)) {
    path_start(path, spd, path_action_stop, false);
}


if place_meeting(x, y, obj_cube_distraction) {  
    alarm[0] = room_speed*3  
    enstate = scr_enemy_wait
}
}
