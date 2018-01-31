///scr_enemy_nexttar
tar_num++
if !instance_exists(tars[tar_num]) {
    tar_num = 1
}

alarm[0] = wait_time/2
next_state = scr_enemy_patrol
enstate = scr_enemy_wait
