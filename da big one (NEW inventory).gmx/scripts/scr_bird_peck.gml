///scr_bird_peck
sprite_index = spr_robin_peck
image_speed = 0.2
if image_index = 9 {
    alarm[0] = random_range(room_speed*2, room_speed*4)
    state = scr_bird_idle
}
