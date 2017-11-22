///scr_wall_hug_state_north
//hug wall
scr_hug_wall();

//limit movement
scr_move_controls_hor();
if (up_key) {
    phy_position_y -= spd
    state = scr_move_state
}
if height < 24 {
if !place_meeting(phy_position_x, phy_position_y + 1, obj_block_floor1_top) {
    if !place_meeting(phy_position_x, phy_position_y + 1, obj_climb_top) {
        state = scr_move_state
        }
    }
}
if height >= 24 {
if !place_meeting(phy_position_x, phy_position_y + 1, obj_block_floor2_top) {
    if !place_meeting(phy_position_x, phy_position_y + 1, obj_climb_top) {
        state = scr_move_state
        }
    }
}

if height < 24 {
    if (down_key) and vault_key {
        if place_meeting(phy_position_x, phy_position_y + 2, obj_vault_floor1_top) {
            phy_position_y += 20
        }
    }
}

if height >= 24 or (height = 0 and raised = true)  {
    if (down_key) and vault_key {
        if place_meeting(phy_position_x, phy_position_y + 2, obj_vault_floor2_top) {
            phy_position_y += 20
        }
    }
}

if (down_key) and vault_key {
    if place_meeting(phy_position_x, phy_position_y + 2, obj_climb_top) {
        phy_position_y += 20
    }
}

if (down_key) and vault_key {
    if place_meeting(phy_position_x, phy_position_y + 2, obj_dblock_top) {
        phy_position_y += 20
    }
}

//equip scope
if scope_key and scope = false {
    if height != 1 {
        scope = true
    }
}
