///scr_bird_hop
scr_set_depth();
scr_set_floor();
sprite_index = spr_robin_hop
image_speed = 0.4
if image_index < 1 {
    face = choose(LEFT, RIGHT, UP, DOWN)
}
if face = LEFT {
    dir = 0.3
    image_xscale = 1
    if !place_free(x + 1.8, y) {
        face = RIGHT
    }
} else if face = RIGHT {
    dir = -0.3
    image_xscale = -1
    if !place_free(x - 1.8, y) {
        face = LEFT
    }
} else if face = UP {
    dir = -0.3
    if !place_free(x, y - 1.8) {
        face = DOWN
    }
} else if face = DOWN {
    dir = 0.3
    if !place_free(x, y + 1.8) {
        face = UP
    }
}
if image_index > 1 and image_index < 7 {
    if face = LEFT or face = RIGHT {
        x += dir
    } else if face = UP or face = DOWN {
        y += dir
    }
}
if image_index = 8 {
    alarm[0] = random_range(room_speed*2, room_speed*4)
    state = scr_bird_idle
}
