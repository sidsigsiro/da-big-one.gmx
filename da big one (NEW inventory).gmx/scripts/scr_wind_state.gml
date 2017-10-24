///scr_wind_state

if wind_key_released {
    if det_timer < room_speed/2 {
        if numb_of_mines = 2 {
            with(mine2) {
                instance_destroy()
            }
            numb_of_mines = 1
        } else if numb_of_mines = 1 {
            with(mine1) {
                instance_destroy()
            }
            numb_of_mines = 0
        }
    }
    det_timer = 0
    state = scr_move_state
}

det_timer += 1

if mouse_check_button_pressed(mb_left) {
    if !instance_exists(obj_wind_mine) {
        mine1 = instance_create(obj_wind_tar.x, obj_wind_tar.y, obj_wind_mine)
        numb_of_mines = 1
    } else if instance_exists(obj_wind_mine) and numb_of_mines = 1 {
        mine2 = instance_create(obj_wind_tar.x, obj_wind_tar.y, obj_wind_mine)
        numb_of_mines = 2
    }
}

if !instance_exists(obj_wind_tar) {
    instance_create(obj_cursor.x, obj_cursor.y, obj_wind_tar)
}
