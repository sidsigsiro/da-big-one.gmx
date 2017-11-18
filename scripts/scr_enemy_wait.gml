///scr_enemy_wait
//select target
if place_meeting(x, y, tars[tar_num]) {
    if alarm[0] < wait_time/2 {
        tar_num++
        if !instance_exists(tars[tar_num]) {
            tar_num = 1
        }
    } else {
        look_ahead = true
    }
}
if alarm[0] = 0 {
    //alarm[6] = 2
    enstate = scr_enemy_patrol
}
