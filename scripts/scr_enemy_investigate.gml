 ///scr_enemy_investigate

if !collision_line(x, y, investar_x, investar_y, obj_viewblock, false, false) {
    look_ahead = false
} else {
    look_ahead = true
}
if instance_exists(my_focus) {
    my_focus.state = scr_view_investigate
    my_focus.investar_x = investar_x
    my_focus.investar_y = investar_y
    my_focus.survey = true
}


if alarm[10] > -1 {
    alarm[0] = -1
}
if alarm[10] = -1 {
    if investar_x != noone and investar_y != noone {
        if point_distance(x, y, investar_x, investar_y) > 22 {
            if(mp_grid_path(global.grid_floor1, path, x, y, investar_x, investar_y , true)) {
                path_start(path, spd, path_action_stop, false);
            }
        } else {
            //if investigating, communicate with close by enemies
            var otherinvest = collision_circle(x, y, 30, obj_enemy, false, true)
            if otherinvest {
                if otherinvest.enstate = scr_enemy_investigate {
                    global.convo_a_chatter_a = id
                    with(otherinvest) {
                        global.convo_a_chatter_b = id
                        enstate = scr_enemy_chat
                    }
                    if instance_exists(obj_enemy_captain) {
                        with (obj_enemy_captain) {
                            enstate = scr_enemy_chat
                        }
                    }
                    enstate = scr_enemy_chat
                }
            }
            if point_distance(x, y, investar_x, investar_y) < 14 {
                if(mp_grid_path(global.grid_floor1, path, x, y, x, y , true)) {
                    path_start(path, spd, path_action_stop, false);
                }
                if alarm[0] = -1 {
                alarm[0] = room_speed*3
                }
            } else {
                alarm[0] = -1
            }
        }
    }
} else {
    path_end()
}

if alarm[0] = 0 {
    if sus = false {
        sus = true
        enstate = scr_enemy_patrol
    } else {
        with(obj_enemy) {
            enstate = scr_enemy_search_phase2
        }
    }
}

//set chatter c
if collision_circle(x, y, 30, global.convo_a_chatter_b, false, true) {
    if global.convo_a_chatter_b.enstate = scr_enemy_chat {
        global.convo_a_chatter_c = id
        enstate = scr_enemy_chat
    }
}
