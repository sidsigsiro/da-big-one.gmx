///scr_dblock_state
scr_get_input();

if place_meeting(x, y, obj_cube) {
    height = 32
}

if alarm[1] = -1 {
    if right_key {
        sprite_index = spr_player_right
    }
    if down_key {
        sprite_index = spr_player_down
    }
    if left_key {
        sprite_index = spr_player_left
    }
    if up_key {
        sprite_index = spr_player_up
    }
}

if dblock_charge < room_speed {
    dblock_charge += 1
}

if vault_key {
    alarm[1] = 5
}

if alarm[1] > -1 {
    height = 32
    if sprite_index = spr_player_up {
        phy_position_y -= 12
        phy_position_y += 10
    }
    if sprite_index = spr_player_down {
        phy_position_y += 10
        phy_position_y += 10
    }
    if sprite_index = spr_player_left {
        phy_position_x -= 10
        phy_position_y += 10
    }
    if sprite_index = spr_player_right {
        phy_position_x += 10
        phy_position_y += 10
    }
}

if dblock_key_released {
    if phy_active = true {
        if dblock_charge = room_speed {
            height = 32
            if stam >= 50 {
                if instance_exists(obj_cube) {
                    with(obj_cube) {
                        mp_grid_clear_cell(global.grid_floor1, floor(x/8), floor(y/8))
                        instance_destroy()
                    }
                }     
                instance_create(x, y, obj_cube)
                with(obj_cube) {
                    mp_grid_add_cell(global.grid_floor1, floor(x/8), floor(y/8))
                }
                phy_active = false
                ymax = 0
                stam -= 50
            } else {
                state = scr_move_state
                phy_active = true
            }
        } else {
        state = scr_move_state
        phy_active = true
        }
    }
}

if ymax < 50 {
    phy_position_y -= 10
    ymax += 10
}

if alarm[1] = 0 {
    phy_active = true
    state = scr_move_state
}
