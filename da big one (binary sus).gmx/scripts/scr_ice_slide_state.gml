///scr_ice_slide_state
scr_get_input();

if on_ice = false {
    state = scr_move_state
}

//check for wall collision
if place_meeting(x, y, obj_viewblock) {
    len = spd
}

if place_meeting(x, y - 2, obj_viewblock) {
    len = spd
}

if place_meeting(x + 2, y, obj_viewblock) {
    len = spd
}

if place_meeting(x - 2, y, obj_viewblock) {
    len = spd
}

if place_meeting(x, y + 2, obj_viewblock_crouch) {
    len = spd
}

if place_meeting(x, y - 2, obj_viewblock_crouch) {
    len = spd
}

if place_meeting(x + 2, y, obj_viewblock_crouch) {
    len = spd
}

if place_meeting(x - 2, y, obj_viewblock_crouch) {
    len = spd
}

if crouch_key_held {
   brake_speed = 0.15
}

if !crouch_key_held {
    brake_speed = 0.05
}

len -= brake_speed

if len = spd or len < spd {
    len = 0
    state = scr_move_state
}

//Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);
// Move
phy_position_x += hspd;
phy_position_y += vspd;
