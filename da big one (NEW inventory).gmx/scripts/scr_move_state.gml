///scr_move_state
scr_get_input();
//get move controls
scr_move_controls();

item_left = obj_inventory.equiped_item

///whistle/birdcall?
if birdcall_key {
    instance_create(x, y, obj_noise_med)
}

//set item key
//set bow key
if item_left = 2 {
    bow_key1_held = item1_key_held
    bow_key1_pressed = item1_key_pressed
    bow_key1_released = item1_key_released
} else {
    bow_key1_held = noone
    bow_key1_pressed = noone
    bow_key1_released = noone
}

// set dblock key
if item_left = 13 {
    dblock_key1_held = item1_key_held
    dblock_key1_pressed = item1_key_pressed
    dblock_key1_released = item1_key_released
} else {
    dblock_key1_held = noone
    dblock_key1_pressed = noone
    dblock_key1_released = noone
}

if item_left = 12 {
    wind_key1_held = item1_key_held
    wind_key1_pressed = item1_key_pressed
    wind_key1_released = item1_key_released
    wind_key2_held = item2_key_held
    wind_key2_pressed = item2_key_pressed
    wind_key2_released = item2_key_released
    scr_wind_state();
    if !instance_exists(obj_wind_tar) {
    instance_create(obj_cursor.x, obj_cursor.y, obj_wind_tar)
    }
} else {
    wind_key1_held = noone
    wind_key1_pressed = noone
    wind_key1_released = noone
    wind_key2_held = noone
    wind_key2_pressed = noone
    wind_key2_released = noone
    if instance_exists(obj_wind_tar) {
        with(obj_wind_tar) {
            instance_destroy();
        }
    }
}

//set temp key
if item_left = 11 {
    temp_key1 = item1_key_held
    temp_key1_pressed = item1_key_pressed
    temp_key1_released = item1_key_released
    temp_key2 = item2_key_held
    temp_key2_pressed = item2_key_pressed
    temp_key2_released = item2_key_released
    scr_temperature_state();
} else {
    temp_key1 = noone
    temp_key1_pressed = noone
    temp_key1_released = noone
    temp_key2 = noone
    temp_key2_pressed = noone
    temp_key2_released = noone
}

//set bottle key
var any_bottle_left = (item_left > 3 and item_left < 10)
 
if any_bottle_left {
    bottle_key1_held = item1_key_held
    bottle_key1_pressed = item1_key_pressed
    bottle_key1_released = item1_key_released
} else {
    bottle_key1_held = noone
    bottle_key1_pressed = noone
    bottle_key1_released = noone
}

//set snail key
if item_left = 10 {
    snail_key1_held = item1_key_held
    snail_key1_pressed = item1_key_pressed
    snail_key1_released = item1_key_released
} else {
    snail_key1_held = noone
    snail_key1_pressed = noone
    snail_key1_released = noone
}
if face = DOWN {
    var itemx1 = x
    var itemy1 = y + 30
} else if face = RIGHT {
    var itemx1 = x + 30
    var itemy1 = y
} else if face = LEFT {
    var itemx1 = x - 30
    var itemy1 = y
} else if face = UP {
    var itemx1 = x
    var itemy1 = y - 30
}

//spirit grab
if grab_key_pressed {
    state = scr_grab_state
}

//pickup snail
itemtouch = instance_place(x, y, obj_snail)
if itemtouch {
    if use_key_pressed {
        if scr_item_check(-1) = true {
            if scr_item_check(10) = false {
                scr_item_pickup(10)
            }
        }
        with(itemtouch) {
            instance_destroy()
        }
    }
}

//plant snail
if snail_key1_pressed {
    my_snail = instance_create(x, y+29, obj_snail) {
        with(my_snail) {
            wild = false
        }
        scr_item_drop(10)
        item_left = noone
        item_right = noone
    }
}

//goto wind state
if wind_key {
    state = scr_wind_state
}


//slice barrel (found in obj_barrel step event)


//use spark
if flint_key {
    if face = LEFT {
        var x1 = phy_position_x - 12
        var y1 = phy_position_y
    }
    if face = RIGHT {
        var x1 = phy_position_x + 12
        var y1 = phy_position_y
    }
    if face = UP {
        var x1 = phy_position_x
        var y1 = phy_position_y - 12
    }
    if face = DOWN {
        var x1 = phy_position_x
        var y1 = phy_position_y + 12
    }
    instance_create(x1, y1, obj_spark)
}
//fill bottle
///CURRENTLY FILLS BOTTLE AND USES BOTTLE AT THE SAME TIME. SHOULD WORK ONCE YOU ADD BOTTLE FILL ANIMATION
if bottle_key1_released {
    var water_touch = instance_place(x, y, obj_water)
    if water_touch {
        if water_touch.puddle = false {
            if !place_meeting(x, y, obj_ice) {
                if item_left = 4 {
                    scr_item_drop(4)
                    scr_item_pickup(6)
                    item_left = 6
                }
            }
        }
    } 
    if distance_to_object(obj_barrel) < 7 {
        if item_left = 4 {
            scr_item_drop(4)
            scr_item_pickup(5)
            with (obj_invbutton) {
                var item = obj_inventory.boxes[slot].item;
                if item = 5 {
                    item_left = item
                    obj_inventory.bp = 200
                }
            }
        } 
        if item_right = 4 {
            scr_item_drop(4)
            scr_item_pickup(5)
            with (obj_invbutton) {
                var item = obj_inventory.boxes[slot].item;
                if item = 5 {
                    item_right = item
                    obj_inventory.bp = 200
                }
            }
        }
    }
}

//drop black powder
if obj_inventory.bp > 0 {
    if bottle_key1_held {
        obj_inventory.bp -= 0.1
        instance_create(phy_position_x, phy_position_y, obj_blackpowder)
    }
}

//drop water
if scr_item_check(6) {
    if bottle_key1_pressed {
        instance_create(x, y, obj_water_puddle)
        instance_create(x ,y - 16, obj_water_puddle)
        instance_create(x ,y + 16, obj_water_puddle)
        instance_create(x - 16 ,y, obj_water_puddle)
        instance_create(x + 16 ,y, obj_water_puddle)
        instance_create(x + 16 ,y + 16, obj_water_puddle)
        instance_create(x + 16 ,y - 16, obj_water_puddle)
        instance_create(x - 16 ,y + 16, obj_water_puddle)
        instance_create(x - 16 ,y - 16, obj_water_puddle)
        scr_item_drop(6)
        scr_item_pickup(4)
    }
}
        
//charge dblock
if !place_meeting(x, y, obj_water) {
    if !place_meeting(x, y, obj_ice) {
        if dblock_key1_held {
            if dblock_charge < room_speed {
                dblock_charge += 1
            }
        }
    } if dblock_key1_released {
        if stam >= 50 {
            if dblock_charge = room_speed {
                if instance_exists(obj_cube) {
                    with(obj_cube) {
                        mp_grid_clear_cell(global.grid_floor1, floor(x/8), floor(y/8))
                        instance_destroy()
                    }
                }
                instance_create(x, y, obj_cube)
                with(obj_cube) {
                    mp_grid_add_cell(global.grid_floor1, floor(x/8), floor(y/8))
                }
                with (obj_climb_floor2) {
                    phy_active = false
                }
                with (obj_floor_2) {
                    phy_active = false
                }
                stam -= 50
                height += 32
                repeat(5) {
                    phy_position_y -= 10
                }
            }
        }
        dblock_charge = 0
    }
}
        

//switch to inventory state
if obj_inventory.active = true {
    state = scr_inventory_state
}

//switch to dash prepare state
if moving = true {
    if crouch_key {
        if crouch = false {
            if alarm[1] = -1 {
                dash_start_speed = spd*5
                len = dash_start_speed
                time = 0
                state = scr_dash_state
            }
        } else {
            crouch = false
        }
    }
}

///place distraction
var dtx, dty
if gamepad_is_connected(0) {
    dtx = obj_cursor.x
    dty = obj_cursor.y
} else if !gamepad_is_connected(0) {
    dtx = mouse_x
    dty = mouse_y
}

//distract key
if distract_key {
    if instance_exists(obj_node_distraction) {
        with (obj_node_distraction) {
            instance_destroy();
        }
    }
    if !collision_line(x, y, dtx, dty, obj_viewblock, true, true) {
        if !collision_line(x, y, dtx, dty, obj_viewblock_crouch, true, true) {
            instance_create(dtx, dty, obj_node_distraction)
        }
    }
}

//vault and climb

//climb
if (yaxis > 0) and vault_key {
    if place_meeting(phy_position_x, phy_position_y + 1, obj_climb_top) {
        phy_position_y += 40
        instance_create(x, y, obj_noise_foot_step)
    }
}

if (xaxis < 0) and vault_key {
    if place_meeting(phy_position_x - 1, phy_position_y, obj_climb_side) {
        phy_position_x -= 40
        instance_create(x, y, obj_noise_foot_step)
    }
}

if (xaxis > 0) and vault_key {
    if place_meeting(phy_position_x + 1, phy_position_y, obj_climb_side) {
        phy_position_x += 40
        instance_create(x, y, obj_noise_foot_step)
    }
}

if (yaxis < 0) and vault_key {
    if place_meeting(phy_position_x, phy_position_y - 1, obj_climb_top) {
        phy_position_y -= 40
        instance_create(x, y, obj_noise_foot_step)
    }
}

//climb dirtblock
if height < 24 {
    if (yaxis > 0) and vault_key {
        if place_meeting(phy_position_x, phy_position_y + 1, obj_dblock_top) {
            phy_position_y += 40
            instance_create(x, y, obj_noise_foot_step)
        }
    }
    if (xaxis < 0) and vault_key {
        if place_meeting(phy_position_x - 1, phy_position_y, obj_dblock_side) {
            phy_position_x -= 40
            instance_create(x, y, obj_noise_foot_step)
        }
    }
    if (xaxis > 0) and vault_key {
        if place_meeting(phy_position_x + 1, phy_position_y, obj_dblock_side) {
            phy_position_x += 40
            instance_create(x, y, obj_noise_foot_step)
        }
    }
    if (yaxis < 0) and vault_key {
        if place_meeting(phy_position_x, phy_position_y - 1, obj_dblock_top) {
            phy_position_y -= 40
            instance_create(x, y, obj_noise_foot_step)
        }
    }
}


//vault
if (yaxis > 0) and vault_key {
    if place_meeting(phy_position_x, phy_position_y + 8, obj_climb_floor1) {
        phy_position_y += 40
    }
}
if (xaxis < 0) and vault_key {
    if place_meeting(phy_position_x - 8, phy_position_y, obj_climb_side_floor1) {
        phy_position_x -= 40
    }
}
if (xaxis > 0) and vault_key {
    if place_meeting(phy_position_x + 8, phy_position_y, obj_climb_side_floor1) {
        phy_position_x += 40
    }
}
if (yaxis < 0) and vault_key {
    if place_meeting(phy_position_x, phy_position_y - 8, obj_climb_top_floor1) {
        phy_position_y -= 40
    }
}

//equip scope
if scope_key {
    if height >= 32 {
        state = scr_scope_state
    }
}
