///scr_enemy_chase

var moveto

if point_distance(x, y, obj_player.phy_position_x, obj_player.phy_position_y) < 20 {
    alarm[0] = room_speed
    attacking = true
}

if attacking = true {
if(mp_grid_path(global.grid_floor1, path, x, y, x, y , true)) {
    path_start(path, (spd + 0.5), path_action_stop, false);
}
instance_create(x + lengthdir_x(12, direction),y + lengthdir_y(12, direction), obj_hitbox)
if alarm[0] > 0 {
    image_index = 1
}
if alarm[0] = 0 {
    image_index = 0
    attacking = false
} 
} else if attacking = false {
    scr_enemy_chase_path()
}
