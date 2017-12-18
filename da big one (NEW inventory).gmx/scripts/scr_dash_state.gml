///scr_dash_state
scr_get_input();
scr_get_face();

var enemytar = instance_place(x, y, obj_enemy)
if enemytar {
    with(enemytar) {
    ///ADD VARIABLE TO PLAY STUN, KNOCKDOWN OR FROZEN ANIMATION. LINK VARIABLE TO ALARM[6] AMOUNT
        enstate = scr_enemy_frozen
        alarm[6] = room_speed
    }
}

dashtimer = room_speed*3

if len <= 0 {
    alarm[1] = room_speed/3
    if on_ice {
        state = scr_ice_slide_state
    } else {
        state = scr_move_state
    }
}

if place_meeting(x, y, obj_ice) {
    alarm[1] = room_speed*2
    state = scr_ice_slide_state
}

time += 1
len = ease_out_quad(time, dash_start_speed, -dash_start_speed, room_speed/2.5); 

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
