///scr_enemy_radio
if alarm[0] = 0 { 
    if sus = 1 {
        enstate = scr_enemy_patrol
    } else if sus = 2 {
        caunexttar = instance_nearest(x, y, obj_caunode1) 
        cautar0 = caunexttar
        enstate = scr_enemy_search_sus2
    } else if sus = 3 {
        with(obj_enemy) {
            enstate = scr_enemy_search_phase2
        }
    }
}
