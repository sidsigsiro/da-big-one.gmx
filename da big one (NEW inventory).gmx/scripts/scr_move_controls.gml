///scr_move_controls
scr_get_input();

//crouch
if !place_meeting(x, y, obj_tunnel) {
    if moving = false {
        if crouch_key and crouch = true {
            crouch = false
        } else
        if crouch_key and crouch = false {
            crouch = true
        }
    }
}
//collide with low hanging object while not crouched
if place_meeting(x, y, obj_tunnel) {
    crouch = true
}

// Get direction
if on_ice = false {
    dir = point_direction(0, 0, xaxis, yaxis);
    } else if on_ice = true {
        if (xaxis == 0 and yaxis == 0) {
        dir = point_direction(0, 0, xaxisprev, yaxisprev)
    } else dir = point_direction(0, 0, xaxis, yaxis)
}

// Get the length
if on_ice = true {
    if (xaxis == 0 and yaxis == 0) {
        if len > 0 {
            len -= 0.05
        } else {
        len = 0;
        }
    } else { 
        xaxisprev = xaxis
        yaxisprev = yaxis
        if len < spd {
            len += 0.05
        }
        if len > spd {
            len = spd
        }
        scr_get_face();
    }
} else if on_ice = false {
    if (xaxis == 0 and yaxis == 0) {
        len = 0;
        image_speed = 0.15
        } else {
        if len < spd {
            len += 0.1
        }
        if len > spd {
            len = spd
        }
        scr_get_face();
        image_speed = 0.15
    }
}

//Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move
phy_position_x += hspd;
phy_position_y += vspd;

//control sprite
if xaxis > 0 { //walking right
    sprite_index = spr_player_right
} else if xaxis < 0 { //walking left
    sprite_index = spr_player_left
} else {
    switch(face) {
        case RIGHT:
            sprite_index = spr_player_right_idle
            break
        case LEFT:
            sprite_index = spr_player_left_idle
            break
        case DOWN:
            sprite_index = spr_player_down
            break
        case UP:
            sprite_index = spr_player_up
            break
    }
}

if distract_key {
    instance_create(mouse_x, mouse_y, obj_noise_med)
}
