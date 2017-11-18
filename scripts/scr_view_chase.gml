//get direction
focus_dir = point_direction(x, y, obj_player.x, obj_player.y);
// Get the length
if point_distance(x, y, obj_player.x, obj_player.y) > 3 { 
    focus_len = 10
} else {
    focus_len = point_distance(x, y, obj_player.x, obj_player.y);
}
//Get the hspd and vspd
focus_hspd = lengthdir_x(focus_len, focus_dir);
focus_vspd = lengthdir_y(focus_len, focus_dir);
// Move
x += focus_hspd;
y += focus_vspd;
