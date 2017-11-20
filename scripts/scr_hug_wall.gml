///scr_hug_wall
scr_get_input();

//stop at block floor 1
if height < 24{
    if place_meeting(phy_position_x + 2, phy_position_y, obj_block_floor1_side) and (right_key) {
        state = scr_wall_hug_state_west
    }
    if place_meeting(phy_position_x - 2, phy_position_y, obj_block_floor1_side) and (left_key) {
        state = scr_wall_hug_state_east
    }
    if place_meeting(phy_position_x, phy_position_y - 2, obj_block_floor1_top) and (up_key) {
        state = scr_wall_hug_state_south
    }
    if place_meeting(phy_position_x, phy_position_y + 2, obj_block_floor1_top) and (down_key) {
        state = scr_wall_hug_state_north
    }
}
//stop at block floor 2
if height >= 24 or (height = 0 and raised = true) {
    if place_meeting(phy_position_x + 2, phy_position_y, obj_block_floor2_side) and (right_key) {
        state = scr_wall_hug_state_west
    }
    if place_meeting(phy_position_x - 2, phy_position_y, obj_block_floor2_side) and (left_key) {
        state = scr_wall_hug_state_east
    }
    if place_meeting(phy_position_x, phy_position_y - 2, obj_block_floor2_top) and (up_key) {
        state = scr_wall_hug_state_south
    }
    if place_meeting(phy_position_x, phy_position_y + 2, obj_block_floor2_top) and (down_key) {
        state = scr_wall_hug_state_north
    }
}
//collide with low hanging object while not crouched
if crouch = false  {
    if place_meeting(phy_position_x, phy_position_y + 2, obj_tunnel) and (down_key) {
        state = scr_wall_hug_state_north
    }
    if place_meeting(phy_position_x, phy_position_y - 2, obj_tunnel) and (up_key) {
        state = scr_wall_hug_state_south
    }
    if place_meeting(phy_position_x - 2, phy_position_y, obj_tunnel) and (left_key) {
        state = scr_wall_hug_state_east
    }
    if place_meeting(phy_position_x + 2, phy_position_y, obj_tunnel) and (right_key) {
        state = scr_wall_hug_state_west
    }
}
