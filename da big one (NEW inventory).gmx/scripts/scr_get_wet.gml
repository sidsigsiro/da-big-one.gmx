//frozen and water
if place_meeting(x, y, obj_water) {
    wet = true
} else {
    wet = false
}
if place_meeting(x, y, obj_splash) {
    wet = true
}
