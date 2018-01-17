///scr_enemy_wait

look_ahead = false
//set cautars depending on squad
if squad = ALPHA {
    var cautar_uncleared = obj_caunode1
    var cautar_cleared = obj_caunode2
} else if squad = BETA {
    var cautar_uncleared = obj_caunode3
    var cautar_cleared = obj_caunode4
}



if ((place_meeting(x, y, cautar0)) and (caunexttar = cautar0)) or ((place_meeting(x, y, cautar)) and (caunexttar = cautar)) { 
    if instance_exists(cautar_uncleared) {
        if cautars_searched < 3 {
            with(cautar)  {
                instance_change(cautar_cleared, true)
            }
        }
        cautar = instance_nearest(x, y, cautar_uncleared)
        caunexttar = cautar
    }
}

if alarm[0] = 0 {
    if cautars_searched < 3 {
        cautars_searched += 1
        enstate = scr_enemy_search_sus2
    } else {
        cautars_searched = 0
        with(obj_caunode2) {
            instance_change(obj_caunode1, true)
        }
        enstate = scr_enemy_patrol
    }
}
