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

var water
var evil_water
var ice
var evil_ice
var black_powder
var barrel
var ammo
var enemy
var turret
var door
var firebomb

with obj_cursor {
    water = instance_place(obj_cursor.x, obj_cursor.y, obj_water)
    evil_water = instance_place(obj_cursor.x, obj_cursor.y, obj_evil_water)
    ice = instance_place(obj_cursor.x, obj_cursor.y, obj_ice)
    evil_ice = instance_place(obj_cursor.x, obj_cursor.y, obj_evil_ice)
    black_powder = instance_place(obj_cursor.x, obj_cursor.y, obj_blackpowder)
    barrel = instance_place(obj_cursor.x, obj_cursor.y, obj_barrel)
    ammo = instance_place(obj_cursor.x, obj_cursor.y, obj_rifle_ammo_throw)
    enemy = instance_place(obj_cursor.x, obj_cursor.y, obj_enemy)
    turret = instance_place(obj_cursor.x, obj_cursor.y, obj_turret)
    door = instance_place(obj_cursor.x, obj_cursor.y, obj_door)
    firebomb = instance_place(obj_cursor.x, obj_cursor.y, obj_firebomb)
}

if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
    if crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true) {
        if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
            if stam > 0 {
                
                if temp = HEAT {
                    // ice
                    if ice != noone {
                        stam -= 1
                        with(ice) {
                            instance_change(obj_water,true)
                        }
                    }
                    if evil_ice != noone {
                        stam -= 1
                        with(evil_ice) {
                            mp_grid_add_rectangle(global.grid_floor1, x - 20, y - 20, x + 19, y + 20)
                            instance_change(obj_evil_water, true)
                        }
                    }
                    
                    // black powder
                    if black_powder != noone {
                        stam -= 1
                        with(black_powder) {
                            instance_change(obj_lit_powder, true)
                        }
                    }
                    
                    // fire bomb
                    if firebomb != noone {
                        stam -= 1
                        firebomb.temp += 3
                    }
                }
                
                if temp = COOL {
                    //water
                    if water != noone {
                        stam -= 1
                        with(water) { 
                            instance_change(obj_ice,true)
                        }
                    }
                    if evil_water != noone {
                        stam -= 1
                        with(evil_water) {
                            mp_grid_clear_rectangle(global.grid_floor1, x - 20, y - 20, x + 19, y + 20)
                            instance_change(obj_evil_ice,true)
                        }
                    }
                    
                    // door
                    if door != noone {
                        stam -= 1
                        if door.wet = true {
                            door.temp -= 1
                        }
                    }
                }
                    
                // barrel
                if barrel != noone and barrel.image_index = 1 {
                    if temp = HEAT {
                        stam -= 1
                        barrel.temp += 3
                    } else if temp = COOL {
                        stam -= 1
                        barrel.temp -= 2
                    }
                }
                
                // ammo
                if ammo != noone {
                    if temp = HEAT {
                        stam -= 1
                        ammo.temp += 2
                    }
                    if temp = COOL {
                        stam -= 1
                        ammo.temp -= 2
                    }
                }
                
                // enemy
                if enemy != noone {
                    if temp = COOL {
                        if enemy.wet = true {
                            stam -= 1
                            enemy.temp -= 2
                        }
                    } if temp = HEAT {
                        stam -= 1
                        enemy.temp += 2
                    }
                }
                
                // turret
                if turret != noone {
                    if temp = COOL {
                        if turret.wet = true {
                            stam -= 1
                            turret.temp -= 2
                        }
                    } if temp = HEAT {
                        stam -= 1
                        turret.temp += 2
                    }
                }
                
                //heat grass
                //check obj_grass step event
            }
        }
    }
}
