///scr_enemy_sniper_chase

var moveto

var attack_range

if class = RIFLE {
    attack_range = 200 //TEMPORARY
} else if class = PISTOL {
    attack_range = 100
}

if obj_player.crouch = false {
    if !collision_line(x, y, obj_player.x, obj_player.y, obj_viewblock, true, true) {
        if point_distance(x, y, obj_player.phy_position_x, obj_player.phy_position_y) < attack_range {
            alarm[0] = room_speed
            attacking = true
    }
}} else if obj_player.crouch = true {
    if point_distance(x, y, obj_player.phy_position_x, obj_player.phy_position_y) < attack_range {
        if !collision_line(x, y, obj_player.x, obj_player.y, obj_viewblock, true, true) and !collision_line(x, y, obj_player.x, obj_player.y, obj_viewblock_crouch, true, true) {
            alarm[0] = room_speed
            attacking = true
        } else attacking = false
    }
}


if attacking = true {
    path_end()
    //shoot arrow
    if arrowtimer != room_speed {
        image_blend = c_yellow
        arrowtimer += 1
    }
    if arrowtimer = room_speed {
        if !collision_line(x, y, obj_player.x, obj_player.y, obj_viewblock, true, true) {
            if obj_player.crouch = false or !collision_line(x, y, obj_player.x, obj_player.y, obj_viewblock_crouch, true, true)  { {
                    my_rifle.image_index = 1
                }
                obj_player.hp -= 1
                arrowtimer = 0
            }
        }
    } else {
        my_rifle.image_index = 0
    }
    if alarm[0] > 0 {
    image_index = 1
    }
    if alarm[0] = 0 {
    image_index = 0
    attacking = false
    }
} else {
    arrowtimer = 0
    scr_enemy_chase_path()
}
