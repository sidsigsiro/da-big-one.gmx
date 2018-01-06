///scr_enemy_frozen
if self = obj_enemy {
    if(mp_grid_path(global.grid_floor1, path, x, y, x, y , true)) {
        path_start(path, 1.6, path_action_stop, false);
    }
}

if alarm[6] = -1 {
    alarm[6] = room_speed*10
}

playerseen = false

temp = -1

if alarm[6] = 0 {
    temp = 0
    if !instance_exists(obj_player_ghost) {
        sus = 100
    }
    obj_enemy_hivemind.alarm[0] = -1
    enstate = scr_enemy_search_phase2
}
