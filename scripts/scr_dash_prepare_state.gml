///scr_dash_prepare_state
scr_move_controls();
scr_get_input();

alarm[1] = room_speed/4

var dtarget_x
var dtarget_y
if gamepad_is_connected(0) {
    dtarget_x = obj_cursor.x
    dtarget_y = obj_cursor.y
} else if !gamepad_is_connected(0) {
    dtarget_x = mouse_x
    dtarget_y = mouse_y
}

if dash_key_released {
    if dashtimer = 0 {
        instance_create(dtarget_x, dtarget_y, obj_dash_target)
        instance_create(x, y, obj_dash_target_ext)
        state = scr_dash_state
    } else state = scr_move_state
}
