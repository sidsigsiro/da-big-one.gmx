///adjust depth
if place_meeting(x, y, obj_floor_2) {
    height = 32
    floorval = (-200)
    height = -32
} else {
    height = 0
    floorval = 0
}

depth = -y + floorval
