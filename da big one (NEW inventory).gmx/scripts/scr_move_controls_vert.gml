///scr_move_controls_vert
scr_get_input();
xaxis = (0)

//crouch
if (crouch_key) and crouch = true {
    crouch = false
} else
if crouch_key and crouch = false {
    crouch = true
}

//set spd
if crouch = true and !arrow_key{
   spd = basespd - 0.6
}

if crouch = false and !arrow_key{
    spd = basespd
}

// Get direction
dir = point_direction(0, 0, xaxis, yaxis);

// Get the length
if (xaxis == 0 and yaxis == 0) {
    len = 0;
} else {
    len = spd;
    scr_get_face();
}

// Get direction
dir = point_direction(0, 0, xaxis, yaxis);

// Get the length
if (xaxis == 0 and yaxis == 0) {
    len = 0;
} else {
    len = spd;
    scr_get_face();
}
//Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move
phy_position_x += hspd;
phy_position_y += vspd;
