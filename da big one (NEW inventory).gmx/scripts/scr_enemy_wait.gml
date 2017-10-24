///scr_enemy_wait
//select target
if place_meeting(x, y, tar1) and nexttar = tar1 {
    if instance_exists(tar2) {
        nexttar = tar2;
    } else {
    nexttar = tar1
    }
}
if place_meeting(x, y, tar2) and nexttar = tar2 {
    if instance_exists(tar3) {
        nexttar = tar3;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar3) and nexttar = tar3 {
    if instance_exists(tar4) {
        nexttar = tar4;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar4) and nexttar = tar4 {
    if instance_exists(tar5) {
        nexttar = tar5;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar5) and nexttar = tar5 {
    if instance_exists(tar6) {
        nexttar = tar6;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar6) and nexttar = tar6 {
    if instance_exists(tar7) {
        nexttar = tar7;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar7) and nexttar = tar7 {
    if instance_exists(tar8) {
        nexttar = tar8;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar8) and nexttar = tar8 {
    if instance_exists(tar9) {
        nexttar = tar9;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar9) and nexttar = tar9 {
    if instance_exists(tar10) {
        nexttar = tar10;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar10) and nexttar = tar10 {
    if instance_exists(tar11) {
        nexttar = tar11;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar11) and nexttar = tar11 {
    if instance_exists(tar12) {
        nexttar = tar12;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar12) and nexttar = tar12 {
    if instance_exists(tar13) {
        nexttar = tar13;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar13) and nexttar = tar13 {
    if instance_exists(tar14) {
        nexttar = tar14;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar14) and nexttar = tar14 {
    if instance_exists(tar15) {
        nexttar = tar15;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar15) and nexttar = tar15 {
    if instance_exists(tar16) {
        nexttar = tar16;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar16) and nexttar = tar16 {
    if instance_exists(tar17) {
        nexttar = tar17;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar17) and nexttar = tar17 {
    if instance_exists(tar18) {
        nexttar = tar18;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar18) and nexttar = tar18 {
    if instance_exists(tar19) {
        nexttar = tar19;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar19) and nexttar = tar19 {
    if instance_exists(tar20) {
        nexttar = tar20;
    } else {
    nexttar = tar1;
    }
}
if place_meeting(x, y, tar20) and nexttar = tar20 {
    if instance_exists(tar1) {
        nexttar = tar1;
    }
}
if alarm[0] = 0 {
    alarm[6] = 2
    enstate = scr_enemy_patrol
}
