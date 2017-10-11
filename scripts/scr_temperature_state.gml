///scr_temperature_state
if temp_key_pressed {
    temp = NEUTRAL
    state = scr_move_state
}

if mouse_wheel_up() {
    if temp = NEUTRAL {
        temp = HEAT
    }
    if temp = COOL {
        temp = NEUTRAL
    }
}

if mouse_wheel_down() {
    if temp = NEUTRAL {
        temp = COOL
    }
    if temp = HEAT {
        temp = NEUTRAL
    }
}

//spawn ice
if place_meeting(obj_cursor.x, obj_cursor.y, obj_water) {
    if temp = COOL {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if crouch = true {
                if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true) {
                    if stam > 0 {
                        stam -= 0.5
                        instance_create(obj_cursor.x + random_range(-1, 1), obj_cursor.y + random_range(-1, 1), obj_ice)
                    }
                }
            } else if crouch = false {
                if stam > 0 {
                    stam -= 0.5
                    instance_create(obj_cursor.x + random_range(-1, 1), obj_cursor.y + random_range(-1, 1), obj_ice)
                }
            }
        }
    }
}

//melt ice
var icetar = instance_place(obj_cursor.x, obj_cursor.y, obj_ice)
if position_meeting(obj_cursor.x, obj_cursor.y, obj_ice) {
    if temp = HEAT {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if crouch = true {
                if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true) {
                    if stam > 0 {
                        stam -= 1
                        with(icetar) {
                            instance_destroy();
                        }
                    }
                }
            } else if crouch = false {
                if stam > 0 {
                    stam -= 1
                    with(icetar) {
                        instance_destroy();
                    }
                }
            }
        }
    }
}

//heat barrel
var barreltar = instance_place(obj_cursor.x, obj_cursor.y, obj_barrel);
if place_meeting(obj_cursor.x, obj_cursor.y - 8, barreltar) {
    if stam > 0 {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if crouch = true {
                if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true) {
                    if temp = HEAT {
                        stam -= 1
                        with(barreltar) {
                            temp += 3
                        }
                    } else if temp = COOL {
                        stam -= 1
                        with(barreltar) {
                            temp -= 2
                        }
                    }
                }
            } else if crouch = false {
                if temp = HEAT {
                    stam -= 1
                    with(barreltar) {
                        temp += 3
                    }
                } else if temp = COOL {
                    stam -= 1
                    with(barreltar) {
                        temp -= 2
                    }
                }
            }
        }
    }
}

//heat ammo
var ammotar = instance_place(obj_cursor.x, obj_cursor.y, obj_rifle_ammo_throw);
if place_meeting(obj_cursor.x, obj_cursor.y - 8, ammotar) {
    if stam > 0 {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if crouch = true {
                if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true) {
                    if temp = HEAT {
                        stam -= 1
                        with(ammotar) {
                            temp += 3
                        }
                    } else if temp = COOL {
                        stam -= 1
                        with(ammotar) {
                            temp -= 2
                        }
                    }
                }
            } else if crouch = false {
                if temp = HEAT {
                    stam -= 1
                    with(ammotar) {
                        temp += 3
                    }
                } else if temp = COOL {
                    stam -= 1
                    with(ammotar) {
                        temp -= 2
                    }
                }
            }
        }
    }
}

//light black powder
var bptar = instance_place(obj_cursor.x, obj_cursor.y, obj_blackpowder)
if place_meeting(obj_cursor.x, obj_cursor.y, obj_blackpowder) {
    if temp = HEAT {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if crouch = true {
                if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true) {
                    if stam > 0 {
                        with(bptar) {
                            lit = true
                            if alarm[0] = -1 {
                                alarm[0] = room_speed/20
                            }
                        }
                    }
                    stam -= 1
                }
            } else if crouch = false {
                if stam > 0 {
                    with(bptar) {
                        lit = true
                        if alarm[0] = -1 {
                            alarm[0] = room_speed/20
                        }
                    }
                }
                stam -= 1
            }
        }
    }
}

//heat firebomb pickup
var firebombtar = instance_place(obj_cursor.x, obj_cursor.y, obj_pickup_firebomb)
if place_meeting(obj_cursor.x, obj_cursor.y, obj_pickup_firebomb) {
    if stam > 0 {
        if temp = HEAT {
            if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
                if crouch = true {
                    if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true) {
                        stam -= 1
                        with(firebombtar) {
                            temp += 3
                        }
                    }
                } else if crouch = false {
                stam -= 1
                with(firebombtar) {
                    temp += 3
                    }
                }
            }
        }
    }
}
//heat grass
//check obj_grass step event

//freeze enemy
var enemytar = instance_place(obj_cursor.x, obj_cursor.y, obj_enemy)
if position_meeting(obj_cursor.x, obj_cursor.y, obj_enemy) {
    if stam > 0 {
        if temp = COOL {
            if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
                if crouch = true {
                    if !collision_line(x, y, enemytar.x, enemytar.y, obj_viewblock_crouch, true, true) {
                        stam -= 1
                        with(enemytar) {
                            if wet = true {
                                temp -= 1
                            }
                        }
                    }
                } else if crouch = false {
                    stam -= 1
                    with(enemytar) {
                        temp -= 1
                    }
                }
            }
        }
    }
}

if temp = 60 {
    instance_destroy()
}
