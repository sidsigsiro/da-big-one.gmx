///scr_temperature_state

if temp_key1 {
    temp = HEAT
}

if temp_key2 {
    temp = COOL
}

if !temp_key1 and !temp_key2 {
    temp = NEUTRAL
}

//spawn ice
if place_meeting(obj_cursor.x, obj_cursor.y, obj_water) or place_meeting(obj_cursor.x, obj_cursor.y, obj_evil_water) {
    if temp = COOL {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
                if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
                    if stam > 0 {
                        stam -= 1
                        var water_touch = instance_place(obj_cursor.x, obj_cursor.y, obj_water)
                        var water_touch_up = instance_place(obj_cursor.x, obj_cursor.y, obj_water)
                        var water_touch_down = instance_place(obj_cursor.x, obj_cursor.y, obj_water)
                        var water_touch_left = instance_place(obj_cursor.x, obj_cursor.y, obj_water)
                        var water_touch_right = instance_place(obj_cursor.x, obj_cursor.y, obj_water)
                        var evil_water_touch = instance_place(obj_cursor.x, obj_cursor.y, obj_evil_water)
                        if water_touch {
                            with(water_touch) { 
                                instance_change(obj_ice,true)
                            }
                        }
                        if evil_water_touch {
                            with(evil_water_touch) {
                                mp_grid_clear_rectangle(global.grid_floor1, x - 20, y - 20, x + 19, y + 20)
                                instance_change(obj_evil_ice,true)
                            }
                        }
                    }
                }
            }
        }
    }
}


//melt ice
if position_meeting(obj_cursor.x, obj_cursor.y, obj_ice) or position_meeting(obj_cursor.x, obj_cursor.y, obj_evil_ice) {
    if temp = HEAT {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
                if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
                    if stam > 0 {
                        stam -= 1
                        var icetar = instance_place(obj_cursor.x, obj_cursor.y, obj_ice)
                        var evil_icetar = instance_place(obj_cursor.x, obj_cursor.y, obj_evil_ice)
                        if icetar {
                            with(icetar) {
                                instance_change(obj_water,true)
                            }
                        }
                        if evil_icetar {
                            with(evil_icetar) {
                                mp_grid_add_rectangle(global.grid_floor1, x - 20, y - 20, x + 19, y + 20)
                                instance_change(obj_evil_water, true)
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

//heat barrel
var barreltar = instance_place(obj_cursor.x, obj_cursor.y, obj_barrel); 
if place_meeting(obj_cursor.x, obj_cursor.y - 8, barreltar) {
    if barreltar != noone { 
        if barreltar.image_index = 1 {
            if stam > 0 {
                if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
                    if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
                        if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
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
        }
    }
}

//heat ammo
var ammotar = instance_place(obj_cursor.x, obj_cursor.y, obj_rifle_ammo_throw);
if place_meeting(obj_cursor.x, obj_cursor.y - 8, ammotar) {
    if stam > 0 {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
                if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
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
}

//light black powder
var bptar = instance_place(obj_cursor.x, obj_cursor.y, obj_blackpowder)
if place_meeting(obj_cursor.x, obj_cursor.y, obj_blackpowder) {
    if temp = HEAT {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
                if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
                    if stam > 0 {
                        with(bptar) {
                            instance_change(obj_lit_powder, true)
                        }
                        stam -= 1
                    }
                }
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
                if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
                    if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
                        stam -= 1
                        with(firebombtar) {
                            temp += 3
                        }
                    }
                }
            }
        }
    }
}
//heat grass
//check obj_grass step event


//freeze/heat enemy
var enemytar = instance_place(obj_cursor.x, obj_cursor.y, obj_enemy)
if position_meeting(obj_cursor.x, obj_cursor.y, obj_enemy) {
    if stam > 0 {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
                if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
                    if temp = COOL {
                        stam -= 1
                        with(enemytar) {
                            if wet = true {
                                temp -= 2
                            }
                        }
                    } if temp = HEAT {
                        stam -= 1
                        with(enemytar) {
                            temp += 2
                        }
                    }
                }
            }
        }
    }
}

//freeze/heat turret
var turrettar = instance_place(obj_cursor.x, obj_cursor.y, obj_turret)
if position_meeting(obj_cursor.x, obj_cursor.y, obj_turret) {
    if stam > 0 {
        if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
            if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
                if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
                    if temp = COOL {
                        stam -= 1
                        with(turrettar) {
                            if wet = true {
                                temp -= 2
                            }
                        }
                    } if temp = HEAT {
                        stam -= 1
                        with(turrettar) {
                            temp += 2
                        }
                    }
                }
            }
        }
    }
}

//freeze door
var doortar = instance_place(obj_cursor.x, obj_cursor.y, obj_door)
if doortar {
    if stam > 0 {
        if temp = COOL {
            if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
                if (crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true)) {
                    if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
                        with(doortar) {
                            if wet = true {
                                temp -= 1
                                obj_player.stam -= 1
                            }
                        }
                    }
                }
            }
        }
    }
}

if temp = 60 {
    instance_destroy()
}
