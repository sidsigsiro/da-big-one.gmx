///adjust depth
if place_meeting(x, y, obj_floor_2) or place_meeting(x, y, obj_floor2_dblock) {
    height = 32
    floorval = (-200)
} else {
    height = 0
    floorval = 0
}

/*
if !place_meeting(x, y, obj_side_stairs) {
    height = 0
}
*/
if height < 0 {
    height = 0
}

depth = -y + floorval
