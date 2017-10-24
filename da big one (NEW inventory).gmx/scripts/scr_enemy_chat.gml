///scr_enemy_chat
if(mp_grid_path(curgrid, path, x, y, x, y , true)) {
        path_start(path, spd, path_action_stop, false);
    }
    
chatting = true

//convo if captain is alive
//chatter A
if instance_exists(obj_enemy_captain) {
    if id = global.convo_a_chatter_a {
        if numboflines = 0 {
            if alarm[8] = -1 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = room_speed*3 {
                scr_text("AY MANG U HEAR DAT NOIZE MANG???!!", 1, x, y,)
            }
            if alarm[8] = 0 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
            }
        }
        if numboflines = 1 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 1 {
                numboflines += 1
            }
        }
        if numboflines = 2 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = room_speed*3 {
                if instance_exists(obj_enemy_captain) {
                    scr_text("*pulls out cool radio* yo dog, shit's going down", 1, x, y)
                } else {
                    scr_text("gosh dang, we're on our own. stick together", 1, x, y)
                }
            }
            if alarm[8] = 2 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
            }
        }
        if numboflines = 3 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 3 {
                numboflines += 1
            }
        }
    }  
    
    //chatter B
    if id = global.convo_a_chatter_b {
        if numboflines = 0 {
            if alarm[8] = -1 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 0 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
            }
        }
        if numboflines = 1 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = (room_speed*3) - 1{
                scr_text("yee", 1, x, y,)
            }
            if alarm[8] = 1 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
            }
        }
        if numboflines = 2 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 2 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
            }
        }
        if numboflines = 3 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 3 {
                numboflines += 1
            }
        }
    }
    
    //chatter CAPTAIN
    with (obj_enemy_captain) {
        if numboflines = 0 {
            if alarm[8] = -1 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 0 {
                numboflines += 1
            }
        }
        if numboflines = 1 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 1 {
                numboflines += 1
            }
        }
        if numboflines = 2 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 2 {
                numboflines += 1
            }
        }
        if numboflines = 3 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = room_speed*3 {
                scr_text("k, I'm sending some homies to help search the area", 1, x, y)
            }
            if alarm[8] = 3 {
                with(obj_text) {
                    instance_destroy();
                }
                numboflines += 1
                with(obj_enemy) {
                    enstate = scr_enemy_search_phase2
                    with(obj_enemy_captain) {
                        enstate = scr_enemy_patrol
                    }
                }
            }
        }
    }
} else if !instance_exists(obj_enemy_captain) {
    if id = global.convo_a_chatter_a {
        if numboflines = 0 {
            if alarm[8] = -1 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = room_speed*3 {
                scr_text("AY MANG U HEAR DAT NOIZE MANG???!!", 1, x, y)
            }
            if alarm[8] = 0 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
            }
        }
        if numboflines = 1 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 1 {
                numboflines += 1
            }
        }
        if numboflines = 2 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = room_speed*3 {
                scr_text("aight, we're on out own, be careful ma boi", 1, x, y)
            }
            if alarm[8] = 2 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
                with(obj_enemy) {
                    enstate = scr_enemy_search_phase2
                    with(obj_enemy_captain) {
                        enstate = scr_enemy_patrol
                    }
                }
            }
        }
    }  
    
    //chatter B
    if id = global.convo_a_chatter_b {
        if numboflines = 0 {
            if alarm[8] = -1 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 0 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
            }
        }
        if numboflines = 1 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = (room_speed*3) - 1{
                scr_text("yee", 1, x, y,)
            }
            if alarm[8] = 1 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
            }
        }
        if numboflines = 2 {
            if alarm[8] = 0 {
                alarm[8] = room_speed*3
            }
            if alarm[8] = 2 {
                with obj_text {
                    instance_destroy();
                }
                numboflines += 1
            }
        }
    }
}
