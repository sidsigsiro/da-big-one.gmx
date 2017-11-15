///scr_item_push
if !place_meeting(x, y, obj_ice) {
    len -= 0.05
} else if place_meeting(x, y, obj_ice) {
    len -= 0.02
}

if place_meeting(x, y, obj_wall) {
    dir -= 180
}

hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

x += hspd
y += vspd

if len <= 0 {
    pushed = false
}
