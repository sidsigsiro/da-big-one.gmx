//load weapon

my_focus.state = scr_view_chase

if player_in_sight = true {
    if alarm[0] = -1 {
        image_index = 0
        alarm[0] = room_speed*3
    }
}

if alarm[0] = 0 {
    if player_in_sight = true {
        image_index = 1
        obj_player.hp -= 1
        
    }
}
