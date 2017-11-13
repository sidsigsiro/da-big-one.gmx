///scr_wall_hug_state_south
//hug wall
scr_hug_wall();
//limit movement
scr_move_controls_hor();
if (down_key) {
    phy_position_y += spd
    state = scr_move_state
}
if curfloor = 1 {
    if !place_meeting(phy_position_x, phy_position_y - 1, obj_block_floor1_top) {
        if !place_meeting(phy_position_x, phy_position_y - 1, obj_climb_top) {
            state = scr_move_state
        }
    }
}
if curfloor = 2 {
    if !place_meeting(phy_position_x, phy_position_y - 1, obj_block_floor2_top) {
        if !place_meeting(phy_position_x, phy_position_y - 1, obj_climb_top) {
            state = scr_move_state
        }
    }
}

if curfloor = 1 {
if (up_key) and vault_key {
    if place_meeting(phy_position_x, phy_position_y - 2, obj_vault_floor1_top) {
        phy_position_y -= 20
        }
    }
}
if curfloor = 2 or (curfloor = 1 and raised = true)  {
    if (up_key) and vault_key {
        if place_meeting(phy_position_x, phy_position_y - 2, obj_vault_floor2_top) {
            phy_position_y -= 20
        }
    }
}

if (up_key) and vault_key {
    if place_meeting(phy_position_x, phy_position_y - 2, obj_climb_top) {
        phy_position_y -= 20
    }
}

if (up_key) and vault_key {
    if place_meeting(phy_position_x, phy_position_y - 2, obj_dblock_top) {
        phy_position_y -= 20
    }
}

//equip scope
if scope_key and scope = false {
    if curfloor != 1 {
        scope = true
    }
}
