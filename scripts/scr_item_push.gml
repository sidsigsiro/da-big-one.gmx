///scr_item_push
if !place_meeting(x, y, obj_ice) {
    len -= 0.05
} else if place_meeting(x, y, obj_ice) {
    len -= 0.02
}

if (place_meeting(x, y, obj_wall) or place_meeting(x, y, obj_barrel)) or place_meeting(x, y, obj_crate) {
    dir -= 180
}

if (place_meeting(x, y, obj_climb_side_floor2)) or place_meeting(x, y, obj_climb_top_floor2) {
    if curfloor = 1 {
        dir -= 180
    }
    if curfloor = 2 {
        falling = true
    }
}

if curfloor = 1 {
    if (place_meeting(x, y, obj_climb_side_floor2)) or place_meeting(x, y, obj_climb_top_floor2) {
            dir -= 180
    }
}

if falling = true {
    y += 3
    max_fall += 3
    if max_fall = 6 {
        falling = false
        max_fall = 0
    }
}

hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

x += hspd
y += vspd

if len <= 0 {
    pushed = false
}
