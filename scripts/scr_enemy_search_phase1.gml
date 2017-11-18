///scr_enemy_search_phase1

obj_enemy_hivemind.enemies_in_room = instance_number(obj_enemy)

if obj_enemy_hivemind.enemies_in_squad < obj_enemy_hivemind.enemies_in_room {
    squad_number = (obj_enemy_hivemind.enemies_in_squad + 1)
    obj_enemy_hivemind.enemies_in_squad += 1
}
if squad_number = 1 or squad number = 2 {
    if !instance_exists(obj_player_ghost) {
    obj_enemy.enstate = scr_enemy_sniper_chase
    } else {
        if obj_enemy_hivemind.ghost_found = false {
            if (mp_grid_path(global.grid_floor1, path, x, y, obj_player_ghost.x, obj_player_ghost.y , true)) {
                path_start(path, (spd + 0.5), path_action_stop, false);
            }
        }
        if obj_enemy_hivemind.ghost_found = true {
            if point_distance(x, y, obj_player_ghost.x, obj_player_ghost.y) > 72 {
                if (mp_grid_path(global.grid_floor1, path, x, y, obj_player_ghost.x, obj_player_ghost.y , true)) {
                    path_start(path, (spd + 0.5), path_action_stop, false);
                }
            } else {
                if !collision_line(x, y, obj_player_ghost.x, obj_player_ghost.y, obj_viewblock, false, false) {
                    if !collision_line(x, y, obj_player_ghost.x, obj_player_ghost.y, obj_viewblock_crouch, false, false) {
                        if (mp_grid_path(global.grid_floor1, path, x, y, x, y , true)) {
                            path_start(path, (spd + 0.5), path_action_stop, false);
                        }
                    }
                }
            }
        }
    }
}

if squad_number = 3 {
    if !collision_line(x, y, obj_player_ghost.x, obj_player_ghost.y, obj_viewblock, false, false) {
        if !collision_line(x, y, obj_player_ghost.x, obj_player_ghost.y, obj_viewblock_crouch, false, false) {
            if (mp_grid_path(global.grid_floor1, path, x, y, x, y , true)) {
                path_start(path, (spd + 0.5), path_action_stop, false);
            }
        }
    }
}
