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
var puddle

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
    puddle = instance_place(obj_cursor.x, obj_cursor.y, obj_water_puddle)
}

if !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock, true, true) {
    if !collision_line(x, y, obj_player.x, obj_player.y, obj_door, false, false) {
        if crouch = false or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_crouch, true, true) {
            if (height > 24 or !collision_line(x, y, obj_cursor.x, obj_cursor.y, obj_viewblock_floor2, true, true)) {
                if stam > 0 {
                    
                    if temp = HEAT {
                        // ice
                        if ice != noone {
                            stam -= 20
                            with(ice) {
                                instance_change(obj_water,true)
                            }
                        }
                        if evil_ice != noone {
                            stam -= 20
                            with(evil_ice) {
                                mp_grid_add_rectangle(global.grid_floor1, x - 20, y - 20, x + 19, y + 20)
                                instance_change(obj_evil_water, true)
                            }
                        }
                        
                        if water != noone {
                            stam -= 20
                            instance_create(water.x, water.y, obj_steam)
                        }
                        
                        if puddle != noone {
                            stam -= 20
                            instance_create(puddle.x, puddle.y, obj_steam)
                            with(puddle) {
                                instance_destroy();
                            }
                        }
                        
                        // black powder
                        if black_powder != noone {
                            stam -= 20
                            with(black_powder) {
                                instance_change(obj_lit_powder, true)
                            }
                        }
                        
                        // fire bomb 
                        if firebomb != noone {
                            if firebomb != 1 {
                                stam -= 20
                                firebomb.temp = 1
                            }
                        }
                    }
                    
                    if temp = COOL {
                        //water
                        if water != noone {
                            stam -= 20
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
                    }
                       
                    // door
                    if door != noone {
                        if temp = COOL {
                            if door.temp != -1 {
                                stam -= 20
                                door.temp = -1
                            }
                        }
                    }
                    
                    // barrel
                    if barrel != noone {
                        if temp = HEAT {
                            if barrel.temp != 1 {
                                stam -= 20
                                barrel.temp = 1
                            }
                        }
                    }
                    
                    // ammo 
                    if ammo != noone {
                        if temp = HEAT {
                            if ammo.temp != 1 {
                                stam -= 20
                                ammo.temp += 1
                            }
                        }
                    }
                    
                    // enemy
                    if enemy != noone {
                        if temp = COOL {
                            if enemy.wet = true {
                                if enemy.temp != -1 {
                                    stam -= 20
                                    enemy.temp = -1
                                }
                            }
                        } if temp = HEAT {
                            if enemy.temp != 1 {
                                stam -= 20
                                enemy.temp = 1
                            }
                        }
                    }
                    
                    // turret
                    if turret != noone {
                        if temp = COOL {
                            if turret.temp != -1 {
                                stam -= 20
                                turret.temp = -1
                            }
                        } if temp = HEAT {
                            if temp != 1 {
                                stam -= 20
                                turret.temp = 1
                            }
                        }
                    }
                    
                    //heat grass
                    //check obj_grass step event
                }
            }
        }
    }
}
