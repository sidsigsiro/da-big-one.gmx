///scr_item_push
if !place_meeting(x, y, obj_ice) {
    len -= 0.05
} else if place_meeting(x, y, obj_ice) {
    len -= 0.02
}


var touching_floor_2 = place_meeting(x, y, obj_floor_2)

//bounce off wall
if place_meeting(x, y, obj_wall) or place_meeting(x, y, obj_barrel) or place_meeting(x, y, obj_crate) or (height < 30 and touching_floor_2 = true) {
    dir -= 180
}

show_debug_message(string(able_to_fall) + ", " + string(height))

// falling code
if (height > 0 and !touching_floor_2) {
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

hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

x += hspd
y += vspd

if len <= 0 {
    pushed = false
}
