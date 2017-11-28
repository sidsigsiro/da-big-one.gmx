///scr_item_fall

show_debug_message(string(able_to_fall) + ", " + string(height))

// falling code
if !place_meeting(x, y, obj_floor_2) {
    if (height > 0 and !place_meeting(x, y, obj_wall)) {
        velocity += 0.25 //acceleration
        y += velocity
        height -= velocity
        if height < 0 {
            // snap to ground
            y += height
            height = 0
            velocity = 0
        }
    }
}
