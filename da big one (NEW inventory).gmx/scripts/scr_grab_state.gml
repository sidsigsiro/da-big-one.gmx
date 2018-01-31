///scr_grab_state
if alarm[3] = -1 {
    alarm[3] = room_speed
}
if !instance_exists(obj_spirit_grab) {
    if face = RIGHT {
        instance_create(x + 16, y, obj_spirit_grab)
    } else if face = LEFT {
        instance_create(x - 16, y, obj_spirit_grab)
    } else if face = DOWN {
        instance_create(x, y + 16, obj_spirit_grab)
    } else if face = UP {
        instance_create(x, y - 16, obj_spirit_grab)
    }
}

if alarm[3] = 0 {
    with(obj_spirit_grab) {
        instance_destroy();
    }
    state = scr_move_state
}
