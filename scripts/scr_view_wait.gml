///scr_view_wait

//select target
if place_meeting(x, y, tars[tar_num]) {
    tar_num++
    if !instance_exists(tars[tar_num]) {
        tar_num = 1
    }
}

if alarm[0] = 0 {
    state = scr_view_patrol
}
