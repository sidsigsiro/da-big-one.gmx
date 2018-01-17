///scr_wind_state

if wind_key2_pressed and !wind_key1_held {
    if (mine1) != noone {
        with(mine1) {
            instance_destroy()
        }
        if numb_of_mines = 2 {
            mine1 = mine2
        }
        numb_of_mines -= 1
    } else {
    }
}

if wind_key1_held {
    if wind_key2_pressed {
        obj_wind_tar.image_angle -= 90
    }
}


if wind_key1_released {
    if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
        if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
            if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
                if !instance_exists(obj_wind_mine) {
                    mine1 = instance_create(obj_wind_tar.x, obj_wind_tar.y, obj_wind_mine)
                    numb_of_mines = 1
                } else if instance_exists(obj_wind_mine) and numb_of_mines = 1 {
                    mine2 = instance_create(obj_wind_tar.x, obj_wind_tar.y, obj_wind_mine)
                    numb_of_mines = 2
                }
            }
        }
    }
}

