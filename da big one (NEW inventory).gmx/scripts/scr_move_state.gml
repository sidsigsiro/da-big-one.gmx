///scr_move_state
scr_get_input();
//get move controls
scr_move_controls();

//switch to temperature state
if temp_key_pressed {
    state = scr_temperature_state
}

///whistle/birdcall?
if birdcall_key {
    instance_create(x, y, obj_noise_med)
}

//set item key
//set bow key
if item_left = 2 {
    bow_key_held = item1_key_held
    bow_key_pressed = item1_key_pressed
    bow_key_released = item1_key_released
} else if item_right = 2 {
    bow_key_held = item2_key_held
    bow_key_pressed = item2_key_pressed
    bow_key_released = item2_key_released
} else {
    bow_key_held = noone
    bow_key_pressed = noone
    bow_key_released = noone
}

//set bottle key
var any_bottle_left = (item_left > 3 and item_left < 10)
var any_bottle_right = (item_right > 3 and item_right < 10)
 
if any_bottle_left {
    bottle_key_held = item1_key_held
    bottle_key_pressed = item1_key_pressed
    bottle_key_released = item1_key_released
} else if any_bottle_right {
    bottle_key_held = item2_key_held
    bottle_key_pressed = item2_key_pressed
    bottle_key_released = item2_key_released
} else {
    bottle_key_held = noone
    bottle_key_pressed = noone
    bottle_key_released = noone
}
//set flare key
if item_left = 7 {
    flare_key_held = item1_key_held
    flare_key_pressed = item1_key_pressed
    flare_key_released = item1_key_released
} else if item_right = 7 {
    flare_key_held = item2_key_held
    flare_key_pressed = item2_key_pressed
    flare_key_released = item2_key_released
} else {
    flare_key_held = noone
    flare_key_pressed = noone
    flare_key_released = noone
}

//set detonator key
if item_left = 8 {
    det_key_held = item1_key_held
    det_key_pressed = item1_key_pressed
    det_key_released = item1_key_released
} else if item_right = 8 {
    det_key_held = item2_key_held
    det_key_pressed = item2_key_pressed
    det_key_released = item2_key_released
} else {
    det_key_held = noone
    det_key_pressed = noone
    det_key_released = noone
}

//set firebomb key
if item_left = 9 {
    firebomb_key_held = item1_key_held
    firebomb_key_pressed = item1_key_pressed
    firebomb_key_released = item1_key_released
} else if item_right = 9 {
    firebomb_key_held = item2_key_held
    firebomb_key_pressed = item2_key_pressed
    firebomb_key_released = item2_key_released
} else {
    firebomb_key_held = noone
    firebomb_key_pressed = noone
    firebomb_key_released = noone
}

//set rifle ammo key
if item_left = 3 {
    rifle_ammo_key_held = item1_key_held
    rifle_ammo_key_pressed = item1_key_pressed
    rifle_ammo_key_released = item1_key_released
} else if item_right = 3 {
    rifle_ammo_key_held = item2_key_held
    rifle_ammo_key_pressed = item2_key_pressed
    rifle_ammo_key_released = item2_key_released
} else {
    rifle_ammo_key_held = noone
    rifle_ammo_key_pressed = noone
    rifle_ammo_key_released = noone
}

//set snail key
if item_left = 10 {
    snail_key_held = item1_key_held
    snail_key_pressed = item1_key_pressed
    snail_key_released = item1_key_released
} else if item_right = 10 {
    snail_key_held = item2_key_held
    snail_key_pressed = item2_key_pressed
    snail_key_released = item2_key_released
} else {
    snail_key_held = noone
    snail_key_pressed = noone
    snail_key_released = noone
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
//shoot arrow
itemtouch = instance_place(x, y, obj_pickup_bow)
if itemtouch {
    if use_key_pressed {
        if scr_item_check(2) = false {
            scr_item_pickup(2)
        } else if scr_item_check(3) = false {
            scr_item_pickup(3)
        }
        obj_inventory.rifle_ammo += 1
        with(itemtouch) {
            instance_destroy()
        }
    }
}


if bow_key_released {
    if obj_inventory.rifle_ammo > 0 {
        if arrowtimer = room_speed*2 {
            instance_create(x, y, obj_arrow)
            instance_create(x, y, obj_caunode1)
            instance_create(x, y, obj_noise_large_high)
            obj_inventory.rifle_ammo -= 1
            arrowtimer = 0
        } else {
            arrowtimer = 0
        }
    }
}



if bow_key_held {
    if obj_inventory.rifle_ammo > 0 {
        if arrowtimer != room_speed*2 {
            arrowtimer += 1
        }
    }
}

//pickup rifle ammo
itemtouch = instance_place(x, y, obj_rifle_ammo_throw)
if itemtouch {
    if use_key_pressed {
        if scr_item_check(3) = false {
            scr_item_pickup(3)
        }
        obj_inventory.rifle_ammo += 1
        with(itemtouch) {
            instance_destroy()
        }
    }
} 

//pickup flare
itemtouch = instance_place(x, y, obj_pickup_flare)
if itemtouch {
    if use_key_pressed {
        if scr_item_check(-1) = true {
            if scr_item_check(7) = false {
                scr_item_pickup(7)
            }
            obj_inventory.flare_ammo += 1
        }
        with(itemtouch) {
            instance_destroy()
        }
    }
}

//set off flare
if scr_item_check(8) {
    if det_key_pressed {
        if instance_exists(obj_flare) {
            with(obj_flare) {
                instance_change(obj_flash, true)
            }
        }
    }
}

///plant flare
if scr_item_check(7) {
    if flare_key_pressed {
        if obj_inventory.flare_ammo > 0 {
            instance_create(x, y, obj_flare)
            obj_inventory.flare_ammo -= 1
        }
    }
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
if snail_key_pressed {
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

///throw firebomb
if scr_item_check(9) {
    if obj_inventory.firebomb_ammo > 0 {
        if arrowtimer = room_speed {
            if firebomb_key_released {
                instance_create(obj_player.x, obj_player.y, obj_firebomb)
                instance_create(mouse_x, mouse_y, obj_firebomb_target)
                obj_inventory.firebomb_ammo -= 1
            }
        }
    }
}

//pickup firebomb
itemtouch = instance_place(x, y, obj_pickup_firebomb)
if itemtouch {
    if use_key_pressed {
        if scr_item_check(-1) = true {
            if scr_item_check(9) = false {
                scr_item_pickup(9)
            }
            obj_inventory.firebomb_ammo += 1
        }
        with(itemtouch) {
            instance_destroy()
        }
    }
}

///throw firebomb
if scr_item_check(9) {
    if obj_inventory.firebomb_ammo > 0 {
        if arrowtimer = room_speed {
            if firebomb_key_released {
                instance_create(obj_player.x, obj_player.y, obj_firebomb)
                instance_create(mouse_x, mouse_y, obj_firebomb_target)
                obj_inventory.firebomb_ammo -= 1
            }
        }
    }
}

if firebomb_key_held {
    if obj_inventory.firebomb_ammo > 0 {
        if arrowtimer != room_speed {
            arrowtimer += 1
        }
    }
}

///throw rifle ammo
if scr_item_check(3) {
    if rifle_ammo_key_pressed {
        ammo_throw = instance_create(x, y, obj_rifle_ammo_throw)
        with(ammo_throw) {
            ammo = true
        }
        obj_inventory.rifle_ammo -= 1
    }
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
if bottle_key_released {
    var water_touch = instance_place(x, y, obj_water)
    if water_touch {
        if water_touch.puddle = false {
            if !place_meeting(x, y, obj_ice) {
                if item_left = 4 {
                    scr_item_drop(4)
                    scr_item_pickup(6)
                    with (obj_invbutton) {
                        var item = global.inventory[slot];
                        if item = 6 {
                            item_left = item
                        }
                    }
                } 
                if item_right = 4 {
                    scr_item_drop(4)
                    scr_item_pickup(6)
                    with (obj_invbutton) {
                        var item = global.inventory[slot];
                        if item = 6 {
                            item_right = item
                        }
                    }
                }
            }
        }
    } 
    if distance_to_object(obj_barrel) < 7 {
        if item_left = 4 {
            scr_item_drop(4)
            scr_item_pickup(5)
            with (obj_invbutton) {
                var item = global.inventory[slot];
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
                var item = global.inventory[slot];
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
    if bottle_key_held {
        obj_inventory.bp -= 0.1
        instance_create(phy_position_x, phy_position_y, obj_blackpowder)
    }
}

//drop water
if scr_item_check(6) {
    if bottle_key_pressed {
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
        
//spawn dblock
dblock_charge = 0
if !place_meeting(x, y, obj_water) {
    if !place_meeting(x, y, obj_ice) {
        if dblock_key {
            state = scr_dblock_state
        }
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

//vault down from floor2 to floor1
if height >= 24 {
    if (yaxis > 0) and vault_key {
        if place_meeting(phy_position_x, phy_position_y + 4, obj_climb_top_floor2) {
            phy_position_y += 40
            instance_create(x, y, obj_noise_foot_step)
        }
    }
    if (xaxis < 0) and vault_key {
        if place_meeting(phy_position_x - 4, phy_position_y, obj_climb_side_floor2) {
            phy_position_x -= 40
            instance_create(x, y, obj_noise_foot_step)
        }
    }
    if (xaxis > 0) and vault_key {
        if place_meeting(phy_position_x + 4, phy_position_y, obj_climb_side_floor2) {
            phy_position_x += 40
            instance_create(x, y, obj_noise_foot_step)
        }
    }
    if (yaxis < 0) and vault_key {
        if place_meeting(phy_position_x, phy_position_y - 4, obj_climb_top_floor2) {
            phy_position_y -= 40
            instance_create(x, y, obj_noise_foot_step)
        }
    }
}

//climb up from dirt block to floor 2
if raised = true {
    if (yaxis > 0) and vault_key {
        if place_meeting(phy_position_x, phy_position_y + 3, obj_climb_top_floor2) {
            phy_position_y += 40
        }
    }
    if (xaxis < 0) and vault_key {
        if place_meeting(phy_position_x - 3, phy_position_y, obj_climb_side_floor2) {
            phy_position_x -= 40
        }
    }
    if (xaxis > 0) and vault_key {
        if place_meeting(phy_position_x + 3, phy_position_y, obj_climb_side_floor2) {
            phy_position_x += 40
        }
    }
    if (yaxis < 0) and vault_key {
        if place_meeting(phy_position_x, phy_position_y - 3, obj_climb_top_floor2) {
            phy_position_y -= 40
        }
    }
}

//vault
if (yaxis > 0) and vault_key {
    if place_meeting(phy_position_x, phy_position_y + 8, obj_climb_top_floor1) {
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

//equip quick select item
if quick1_key_held {
    if item1_key_pressed {
        item_left = item_quick1
    }
}
if quick1_key_held {
    if item2_key_pressed {
        item_right = item_quick1
    }
}
if quick2_key_held {
    if item1_key_pressed {
        item_left = item_quick2
    }
}
if quick2_key_held {
    if item2_key_pressed {
        item_right = item_quick2
    }
}
if quick3_key_held {
    if item1_key_pressed {
        item_left = item_quick3
    }
}
if quick3_key_held {
    if item2_key_pressed {
        item_right = item_quick3
    }
}
if quick4_key_held {
    if item1_key_pressed {
        item_left = item_quick4
    }
}
if quick4_key_held {
    if item2_key_pressed {
        item_right = item_quick4
    }
}
if quick5_key_held {
    if item1_key_pressed {
        item_left = item_quick5
    }
}
if quick5_key_held {
    if item2_key_pressed {
        item_right = item_quick5
    }
}
if quick6_key_held {
    if item1_key_pressed {
        item_left = item_quick6
    }
}
if quick6_key_held {
    if item2_key_pressed {
        item_right = item_quick6
    }
}
