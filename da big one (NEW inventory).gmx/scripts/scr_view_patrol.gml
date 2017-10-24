///scr_view_patrol
//get direction
focus_dir = point_direction(x, y, nexttar.x, nexttar.y);

// Get the length
focus_len = point_distance(x, y, nexttar.x, nexttar.y)/60;
//Get the hspd and vspd
focus_hspd = lengthdir_x(focus_len, focus_dir);
focus_vspd = lengthdir_y(focus_len, focus_dir);
// Move
x += focus_hspd;
y += focus_vspd;


if place_meeting(x, y, tar1) and (nexttar = tar1) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar2) and (nexttar = tar2) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar3) and (nexttar = tar3) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar4) and (nexttar = tar4) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar5) and (nexttar = tar5) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar6) and (nexttar = tar6) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar7) and (nexttar = tar7) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar8) and (nexttar = tar8) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar9) and (nexttar = tar9) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar10) and (nexttar = tar10) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar11) and (nexttar = tar11) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar12) and (nexttar = tar12) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar13) and (nexttar = tar13) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar14) and (nexttar = tar14) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar15) and (nexttar = tar15) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar16) and (nexttar = tar16) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar17) and (nexttar = tar17) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar18) and (nexttar = tar18) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar19) and (nexttar = tar19) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
if place_meeting(x, y, tar20) and (nexttar = tar20) {
    alarm[0] = room_speed;
    state = scr_view_wait
}

