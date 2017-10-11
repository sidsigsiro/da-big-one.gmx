///scr_box_grabbed_state
//set grab variables
if !instance_exists(obj_wind_grab) {
instance_create(phy_position_x, phy_position_y, obj_wind_grab)
}
hspd = lengthdir_x(spd, dir);
vspd = lengthdir_y(spd, dir);
//control object
///follow cursor
 if point_distance(phy_position_x, phy_position_y, obj_wind_grab.phy_position_x, obj_wind_grab.phy_position_y) < 2 {
    spd = 0} else {
    spd = 3
    dir = point_direction (x, y, obj_wind_grab.x, obj_wind_grab.y)
    phy_position_x += hspd;
    phy_position_y += vspd;
}
//let go of object
if mouse_check_button_released(mb_right) {
    with (obj_wind_grab) {
        instance_destroy();
    }
    state = scr_box_state
}
