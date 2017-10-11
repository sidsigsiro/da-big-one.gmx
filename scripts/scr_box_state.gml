///scr_box_state

//set hspd and vspd
hspd = lengthdir_x(spd, dir);
vspd = lengthdir_y(spd, dir);
///check if lifted
if mouse_check_button_pressed(mb_right) and place_meeting(phy_position_x, phy_position_y, obj_cursor) {
    state = scr_box_grabbed_state
}
