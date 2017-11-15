///scr_view_patrol
//get direction
focus_dir = point_direction(x, y, tars[tar_num].x, tars[tar_num].y);

// Get the length
focus_len = point_distance(x, y, tars[tar_num].x, tars[tar_num].y)/60;
//Get the hspd and vspd
focus_hspd = lengthdir_x(focus_len, focus_dir);
focus_vspd = lengthdir_y(focus_len, focus_dir);
// Move
x += focus_hspd;
y += focus_vspd;


if place_meeting(x, y, tars[tar_num]) {
    alarm[0] = room_speed;
    state = scr_view_wait
}
