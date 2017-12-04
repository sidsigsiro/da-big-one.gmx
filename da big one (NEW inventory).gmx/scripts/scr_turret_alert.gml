//load weapon
if playerseen = true {
    if alarm[0] = -1 {
        alarm[0] = room_speed*3
    }
}

if alarm[0] = 0 {
    if player_in_sight = true {
        obj_player.hp -= 1
    }
}
