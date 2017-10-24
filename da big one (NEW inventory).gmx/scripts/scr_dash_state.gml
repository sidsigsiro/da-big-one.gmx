///scr_dash_state
scr_get_input();
scr_get_face();

dashtimer = room_speed*3

if alarm[1] = 0 {
    if on_ice = true {
        state = scr_ice_slide_state
    }
    if on_ice = false {
        state = scr_move_state
    }
}

if place_meeting(x, y, obj_ice) {
    state = scr_ice_slide_state
}

len = spd*5

//Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move
phy_position_x += hspd;
phy_position_y += vspd;

switch(face) {
    case RIGHT:
        sprite_index = spr_player_right
        break;
    
    case LEFT:
        sprite_index = spr_player_left
        break;
        
    case DOWN:
        sprite_index = spr_player_down
        break;
        
    case UP:
        sprite_index = spr_player_up
        break;
}
