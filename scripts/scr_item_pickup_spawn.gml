///scr_item_pickup_spawn
if spd > 0 {
    dir = point_direction(x ,y, x1, y1)
    x += lengthdir_x(spd, dir)
    y += lengthdir_y(spd, dir)
    spd -= 1
}

if spd < 0 {
    spd = 0
}
