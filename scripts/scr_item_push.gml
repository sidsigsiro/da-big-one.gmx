///scr_item_push
if !place_meeting(x, y, obj_ice) {
    len -= 0.05
} else if place_meeting(x, y, obj_ice) {
    len -= 0.02
}

if (place_meeting(x, y, obj_wall) or place_meeting(x, y, obj_barrel)) or place_meeting(x, y, obj_crate) {
    dir -= 180
}

if able_to_fall = false {
    if (place_meeting(x, y, obj_climb_side_floor2)) or place_meeting(x, y, obj_climb_top_floor2) {
        if height < 24 {
            dir -= 180
        }
        if height >= 24 {
            able_to_fall = true
        }
    }
}

if able_to_fall = true {
    height = 0 {
        if height < 0 {
            y += 3
            height += 32
        }
    }
}

hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

x += hspd
y += vspd

if len <= 0 {
    pushed = false
}
