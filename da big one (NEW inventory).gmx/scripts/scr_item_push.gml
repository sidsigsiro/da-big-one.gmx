///scr_item_push
if !place_meeting(x, y, obj_ice) {
    len -= 0.05
} else if place_meeting(x, y, obj_ice) {
    len -= 0.02
}

//bounce off wall
if place_meeting(x, y, obj_wall) or place_meeting(x, y, obj_barrel) or place_meeting(x, y, obj_crate) or (height < 30 and place_meeting(x, y, obj_floor_2)) {
    dir -= 180
}

hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

x += hspd
y += vspd

if len <= 0 {
    pushed = false
}
