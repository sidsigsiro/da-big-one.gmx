///scr_item_pickup_spawn
if spd > 0 {
    dir = point_direction(x ,y, x1, y1)
    phy_speed_x = lengthdir_x(spd, dir)
    phy_speed_y = lengthdir_y(spd, dir)
    spd -= 1
} else {
    phy_speed_x = 0
    phy_speed_y = 0
}

if spd < 0 {
    spd = 0
}
