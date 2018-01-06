///scr_turret_frozen
my_focus.state = noone
if alarm[6] = -1 {
    alarm[6] = room_speed*10
}
if alarm[6] = 0 {
    temp = 0
    state = scr_turret_patrol
}
