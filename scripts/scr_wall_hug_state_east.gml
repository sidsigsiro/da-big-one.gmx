///scr_wall_hug_state_east
//hug wall
scr_hug_wall();

//limit movement
scr_move_controls_vert();
if (right_key) {
    phy_position_x += spd
    state = scr_move_state
}
if height < 24 {
    if !place_meeting(phy_position_x - 1, phy_position_y, obj_block_floor1_side) {
        if !place_meeting(phy_position_x - 1, phy_position_y, obj_climb_side) {
            state = scr_move_state
        }
    }
}
if height >= 24 {
    if !place_meeting(phy_position_x - 1, phy_position_y, obj_block_floor2_side) {
        if !place_meeting(phy_position_x - 1, phy_position_y, obj_climb_side) {
            state = scr_move_state
        }
    }
}

if height < 24 {
    if (left_key) and vault_key {
        if place_meeting(phy_position_x - 2, phy_position_y, obj_vault_floor1_side) {
            phy_position_x -= 20
        }
    }
}
if height >= 24 or (height = 0 and raised = true)  {
    if (left_key) and vault_key {
        if place_meeting(phy_position_x - 2, phy_position_y, obj_vault_floor2_side) {
            phy_position_x -= 20
        }
    }
}


if (left_key) and vault_key {
    if place_meeting(phy_position_x - 2, phy_position_y, obj_climb_side) {
        phy_position_x -= 20
    }
}

if (left_key) and vault_key {
    if place_meeting(phy_position_x - 2, phy_position_y, obj_dblock_side) {
        phy_position_x -= 20
    }
}
//equip scope
if scope_key and scope = false {
    if curfloor != 1 {
        scope = true
    }
}
