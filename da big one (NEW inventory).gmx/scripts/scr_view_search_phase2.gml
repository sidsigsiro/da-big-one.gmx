///scr_view_search_phase2
focus_dir = point_direction(x, y, tars[tar_num].x, tars[tar_num].y);

//change enstate = wait to find next target
if place_meeting(x, y, cautar0) and (caunexttar = cautar0) {
    alarm[0] = room_speed;
    enstate = scr_enemy_search_phase2_wait
}

if place_meeting(x, y, cautar) and (caunexttar = cautar) {
    alarm[0] = room_speed;
    enstate = scr_enemy_search_phase2_wait
}
