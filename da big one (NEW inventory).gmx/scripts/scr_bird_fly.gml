///scr_bird_fly
depth = -9999
alarm[0] = -1
sprite_index = spr_robin_flight
image_speed = 0.5
if face = LEFT or face = DOWN {
    image_xscale = 1
    x += 1
} else if face = RIGHT or face = UP {
    image_xscale = -1
    x -= 0.6
}
y -= 3

if y < 0 {
    instance_destroy();
}
