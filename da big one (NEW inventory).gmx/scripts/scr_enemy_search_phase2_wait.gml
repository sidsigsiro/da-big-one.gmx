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
        cautar = instance_nearest(x, y, cautar_uncleared)
        caunexttar = cautar
    }
}

if !instance_exists(obj_caunode1) {
    obj_enemy_hivemind.search_complete = true
}

if alarm[0] = 0 {
    enstate = scr_enemy_search_phase2
}
