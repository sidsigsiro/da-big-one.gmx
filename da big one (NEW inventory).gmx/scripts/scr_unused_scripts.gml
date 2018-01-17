if enstate != scr_enemy_dead {
    draw_triangle_colour(x, y, x1, y1, x2, y2, c_black, c_black, c_black, true)
}

///barrel step event
if obj_player.state = scr_move_state {
    if collision_circle(x, y, 20, obj_player, true, false) {
        if use_key {
            image_index = 1
            lit = false
        }
    }
}

///obj_player step event
if !place_meeting(x, y, obj_floor_dblock) {
    raised = false
    raisedval = 0
}

//change to search phase 2 if sus is too high (obj_enemy_step event)
if sus > 100 {
    sus = 100
}

if sus > 98 {
        with(obj_enemy) {
                if enstate != scr_enemy_sniper_chase {
                    if enstate != scr_enemy_frozen {
                        enstate = scr_enemy_search_phase2
                    }
                }
        }
}

item4_key_held = keyboard_check(vk_shift)
item4_key_pressed = keyboard_check_pressed(vk_shift)
item4_key_released = keyboard_check_released(vk_shift)

//Lighting black powder with spark (BARREL OBJECT)
var touching_spark = place_meeting(x, y, obj_spark);
if image_index = 1 {
    if (touching_spark) && (lit == false) {
        lit = true;
        alarm[0] = room_speed/20 //Wait one second before spreading and burning out
    }
}

///plant wind mine
if obj_inventory_slot_right.item = WINDMINE {
    if item2_key_pressed {
        if !instance_exists(obj_wind_mine) {
                instance_create(x, y, obj_wind_mine)
        } else if instance_exists(obj_wind_mine) {
            with (obj_wind_mine) {
                instance_destroy();
                obj_inventory_slot_right.numberofitem -=1
            }
        }
    }
}

if dblock_key {
    if !instance_exists(obj_grid_cube) {
        instance_create(x, y, obj_grid_cube)
    }
    if instance_exists(obj_cube) {
        with(obj_cube) {
            instance_destroy()
        }
    } if instance_exists(obj_dblock_side) {
        with(obj_dblock_side) {
            instance_destroy()
        }
    }if instance_exists(obj_dblock_top) {
        with(obj_dblock_top) {
            instance_destroy()
        }
    }if instance_exists(obj_floor_dblock) {
        with(obj_floor_dblock) {
            instance_destroy()
        }
    }     
    instance_create(x, y, obj_cube)
}

if obj_inventory_slot_left.item = BOMB {
    if item1_key_released {
        instance_create(obj_player.x, obj_player.y, obj_firebomb)
        instance_create(mouse_x, mouse_y, obj_firebomb_target)
        obj_inventory_slot_left.numberofitem -= 1
    }
}

if obj_inventory_slot_right.item = BOMB {
    if item2_key_released {
        instance_create(obj_player.x, obj_player.y, obj_firebomb)
        instance_create(mouse_x, mouse_y, obj_firebomb_target)
        obj_inventory_slot_right.numberofitem -= 1
    }
}

//set searcher id (in enemy step event)
if squad = ALPHA {
    if search = ALPHA {
        global.enemyAA = id
    }
}
if squad = ALPHA {
    if search = BETA {
        global.enemyAB = id
    }
}
if squad = ALPHA {
    if search = CHARLIE {
        global.enemyAC = id
    }
}
if squad = ALPHA {
    if search = DELTA {
        global.enemyAD = id
    }
}

/// Move 10% towards the player
if obj_inventory.active = false {
    if obj_player.state != scr_scope_state {
        var xto, yto;
        var rstick_x, lstick_y;
        rstick_x = (obj_player.x + gamepad_axis_value(0, gp_axisrh))*10;
        rstick_y = (obj_player.y + gamepad_axis_value(0, gp_axisrv))*10;
        move_towards_point(obj_cursor.x, obj_cursor.y, 0);
        xto = obj_player.x + lengthdir_x(min(96, distance_to_point(obj_cursor.x, obj_cursor.y)), direction)
        yto = obj_player.y + lengthdir_y(min(96, distance_to_point(obj_cursor.x, obj_cursor.y)), direction)

        x += (xto - x)/10;
        y += (yto - y)/10;

        view_xview = -(view_wview/2) + x;
        view_yview = -(view_hview/2) = y;

        view_xview = clamp(view_xview, 0, room_width-view_wview);
        view_yview = clamp(view_yview, 0, room_height-view_hview);
    } else {
        if obj_player.state = scr_scope_state {
            x += (obj_cursor.x - x) / 20;
            y += (obj_cursor.y - y) / 20;
        }
    }
} else if obj_inventory.active = true {
    x = xprevious
    y = yprevious
}

//recharge stamina (auto recharge for testing purposes, change to life steal for final version)
if state != scr_temperature_state and state != scr_dblock_state {
    if stam < 100 {
        stam += 1
    }
}

if instance_exists(obj_arrow) {
            if enstate != scr_enemy_sniper_chase {  
                if !collision_line(x, y, obj_arrow.x, obj_arrow.y, obj_viewblock, false, false) {
                    if (height = obj_arrow.height) or (height = 2 and obj_arrow.height = 0) {
                        if obj_arrow.crouch = true {
                            if !collision_line(x, y, obj_arrow.x, obj_arrow.y, obj_viewblock_crouch, false, false) {
                                if point_in_triangle(obj_arrow.x, obj_arrow.y, x, y, x1, y1, x2, y2) {
                                    instance_create(obj_player.x, obj_player.y, obj_node_distraction)
                                    investar = obj_node_distraction
                                    if sustoken = 1 {
                                        sustoken = 0
                                        sus += 40
                                        alarm[7] = room_speed/12
                                    }
                                    enstate = scr_enemy_investigate
                                }
                            }
                        }
                        if obj_arrow.crouch = false {
                            if point_in_triangle(obj_arrow.x, obj_arrow.y, x, y, x1, y1, x2, y2) {
                                instance_create(obj_player.x, obj_player.y, obj_node_distraction)
                                investar = obj_node_distraction
                                if sustoken = 1 {
                                    sustoken = 0
                                    sus += 40
                                    alarm[7] = room_speed/12
                                }
                                enstate = scr_enemy_investigate
                            }
                        }
                    }
                }
            }
        }
        if instance_exists(obj_arrow_dropped) {
            if enstate != scr_enemy_sniper_chase {
                if !collision_line(x, y, obj_arrow_dropped.x, obj_arrow_dropped.y, obj_viewblock, false, false) {
                    if (height = obj_arrow_dropped.height) or (height = 2 and obj_arrow_dropped.height = 0) {
                        if obj_arrow_dropped.crouch = true {
                            if !collision_line(x, y, obj_arrow_dropped.x, obj_arrow_dropped.y, obj_viewblock_crouch, false, false) {
                                if point_in_triangle(obj_arrow_dropped.x, obj_arrow_dropped.y, x, y, x1, y1, x2, y2) {
                                    instance_create(obj_player.x, obj_player.y, obj_node_distraction)
                                    investar = obj_node_distraction
                                    if sustoken = 1 {
                                        sustoken = 0
                                        sus += 40
                                        alarm[7] = room_speed/12
                                    }
                                    enstate = scr_enemy_search_phase2
                                }
                            }
                        }
                        if obj_arrow_dropped.crouch = false {
                            if point_in_triangle(obj_arrow_dropped.x, obj_arrow_dropped.y, x, y, x1, y1, x2, y2) {
                                instance_create(obj_player.x, obj_player.y, obj_node_distraction)
                                investar = obj_node_distraction
                                if sustoken = 1 {
                                    sustoken = 0
                                    sus += 40
                                    alarm[7] = room_speed/12
                                }
                                enstate = scr_enemy_search_phase2
                            }
                        }
                    }
                }
            }
        } 

//plant flare
if place_meeting(x, y, obj_pickup_flare) {
    if use_key_pressed {
        with (instance_place(x, y, obj_pickup_flare)) {
            instance_destroy();
        }
        if obj_inventory_slot_right.item != noone {
            if obj_inventory_slot_right.item = FLARE {
                my_item1 = instance_create(x, y, obj_pickup_flare)
            } else if obj_inventory_slot_right.item = BOMB {
                my_item1 = instance_create(x, y, obj_pickup_firebomb)
            }
            my_item1.x1 = itemx1
            my_item1.y1 = itemy1
            with(my_item1) {
                spd = 8
            }
        obj_inventory_slot_right.item = FLARE
        obj_inventory_slot_right.numberofitem = 1
        } else {
            obj_inventory_slot_right.item = FLARE
            obj_inventory_slot_right.numberofitem = 1
        }
    }
}

///Fire Bomb
if place_meeting(x, y, obj_pickup_firebomb) {
    if use_key_pressed {
        with (instance_place(x, y, obj_pickup_firebomb)) {
            armed = false
            instance_destroy();
        }
        if obj_inventory_slot_right.item != noone {
            if obj_inventory_slot_right.item = FLARE {
                my_item1 = instance_create(x, y, obj_pickup_flare)
            }  else if obj_inventory_slot_right.item = BOMB {
                my_item1 = instance_create(x, y, obj_pickup_firebomb)
            }
            my_item1.x1 = itemx1
            my_item1.y1 = itemy1
            with(my_item1) {
                spd = 8
            }
            obj_inventory_slot_right.item = BOMB
            obj_inventory_slot_right.numberofitem = 1
        } else {
            obj_inventory_slot_right.item = BOMB
            obj_inventory_slot_right.numberofitem = 1
        }
    }
}

//flare key
if obj_inventory.item1 != FLARE {
    if obj_inventory.item2 != FLARE {
        if obj_inventory.item3 != FLARE {
            if obj_inventory.item4 != FLARE {
                flare_key = noone
            }
        }
    }
}
if obj_inventory.item1 = FLARE {
    flare_key = item1_key_pressed
} else if obj_inventory.item2 = FLARE {
    flare_key = item2_key_pressed
} else if obj_inventory.item3 = FLARE {
    flare_key = item3_key_pressed
} else if obj_inventory.item4 = FLARE {
    flare_key = item4_key_pressed
}

//arrow key
if obj_inventory.item1 != BOW {
    if obj_inventory.item2 != BOW {
        if obj_inventory.item3 != BOW {
            if obj_inventory.item4 != BOW {
                arrow_key = noone
                arrow_key_released = noone
            }
        }
    }
} 
if obj_inventory.item1 = BOW {
    arrow_key = item1_key_held
    arrow_key_released = item1_key_released
} else if obj_inventory.item2 = BOW { 
    arrow_key = item2_key_held
    arrow_key_released = item2_key_released
} else if obj_inventory.item3 = BOW { 
    arrow_key = item3_key_held
    arrow_key_released = item3_key_released
} else if obj_inventory.item4 = BOW { 
    arrow_key = item4_key_held
    arrow_key_released = item4_key_released
}
///draw big inventory
for (i2 = 0; i2 < biginv; i2 += 1) {
        draw_sprite(spr_inv_border,0, ix2, iy2)
    }
    
//use water freeze
if bottle_key_pressed {
    if obj_inventory_bottle.contents = obj_inventory_bottle.water {
        obj_inventory_bottle.contents = obj_inventory_bottle.empty
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
        instance_create(x1, y1, obj_splash)
    }
}

///pickup item
var item_get_right = instance_place(x, y, obj_pickup_any)
var item_have_right = noone
if obj_inventory_slot_right.item = BOMB {
    item_have_right = obj_pickup_firebomb
} else if obj_inventory_slot_right.item = FLARE {
    item_have_right = obj_pickup_flare
} else if obj_inventory_slot_right.item = WINDMINE {
    item_have_right = obj_pickup_wind_mine
}
var item_create = noone

if item_get_right {
    if use_key_pressed {
        if !place_meeting(x, y, obj_flare) {
            if instance_exists(obj_flare) {
                with(obj_flare) {
                    instance_destroy();
                    obj_inventory_slot_right.item = noone
                    item_have_right = noone
                }
            }
        }
        if place_meeting(x, y, obj_pickup_firebomb) {
            if item_have_right != noone {
                with(item_get_right) {
                    instance_change(item_have_right, true)
                }
            } else {
                with(item_get_right) {
                    instance_destroy();
                }
            } 
            obj_inventory_slot_right.item = BOMB
            obj_inventory_slot_right.numberofitem = 1
        } else if place_meeting(x, y, obj_pickup_flare) or place_meeting(x, y, obj_flare) {
            if item_have_right != noone and item_have_right != obj_pickup_flare {
                with(item_get_right) {
                    instance_change(item_have_right, true)
                    
                }
            } else {
                with(item_get_right) {
                    instance_destroy();
                }
            }    
            obj_inventory_slot_right.item = FLARE
            obj_inventory_slot_right.numberofitem = 1
        } else if place_meeting(x, y, obj_pickup_wind_mine) {
            if item_have_right != noone {
                with(item_get_right) {
                    instance_change(item_have_right, true)
                    
                }
            } else {
                with(item_get_right) {
                    instance_destroy();
                }
            }    
            obj_inventory_slot_right.item = WINDMINE
            obj_inventory_slot_right.numberofitem = 1
        }
    }
}

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

//pickpocket collision circle ( in enemy object step event)
if pocketitem = true {
    if collision_circle(x, y, 20, obj_player, false, true) {
        if enstate != scr_enemy_sniper_chase and enstate != scr_enemy_dead {
            if use_key_pressed {
                pocketitem = false
                instance_destroy();
                with(obj_player) {
                    stam += 60
                    hp -= 1
                }
            }
        }
    }
}

// cycle through array of blend modes
// 0 = bm_zero ( 0, 0, 0, 0)
// 1 = bm_one (1, 1, 1, 1)
// 2 = bm_src_color (Rs, Gs, Bs, As)
// 3 = bm_inv_src_color (1-Rs, 1-Gs, 1-Bs, 1-As)
// 4 = bm_src_alpha (As, As, As, As)
// 5 = bm_inv_src_alpha (1-As, 1-As, 1-As, 1-As)
// 6 = bm_dest_alpha (Ad, Ad, Ad, Ad)
// 7 = bm_inv_dest_alpha (1-Ad, 1-Ad, 1-Ad, 1-Ad)
// 8 = bm_dest_color (Rd, Gd, Bd, Ad)
// 9 = bm_inv_dest_color (1-Rd, 1-Gd, 1-Bd, 1-Ad)
// 10 = bm_src_alpha_sat (f, f, f, 1) where f = min(As, 1-Ad)
i1 = 0
i2 = 0

draw_set_blend_mode_ext(i1, i2)

if keyboard_check_pressed(vk_space) {
    i1++
    if i1 > 10 {
        i1 = 0
        i2++
    }
}
if keyboard_check_pressed(vk_enter) {
    show_debug_message(string(i1) + ", " + string(i2))
}

// ---------- stuff from scr_move_state ----------
//set flare key
if item_left = 7 {
    flare_key1_held = item1_key_held
    flare_key1_pressed = item1_key_pressed
    flare_key1_released = item1_key_released
    flare_key2_held = item2_key_held
    flare_key2_pressed = item2_key_pressed
    flare_key2_released = item2_key_released
} else {
    flare_key1_held = noone
    flare_key1_pressed = noone
    flare_key1_released = noone
    flare_key2_held = noone
    flare_key2_pressed = noone
    flare_key2_released = noone
}

//set detonator key
if item_left = 8 {
    det_key1_held = item1_key_held
    det_key1_pressed = item1_key_pressed
    det_key1_released = item1_key_released
    det_key2_held = item2_key_held
    det_key2_pressed = item2_key_pressed
    det_key2_released = item2_key_released
} else {
    det_key1_held = noone
    det_key1_pressed = noone
    det_key1_released = noone
    det_key2_held = noone
    det_key2_pressed = noone
    det_key2_released = noone
}

//set firebomb key
if item_left = 9 {
    firebomb_key_held = item1_key_held
    firebomb_key_pressed = item1_key_pressed
    firebomb_key_released = item1_key_released
    
} else {
    firebomb_key_held = noone
    firebomb_key_pressed = noone
    firebomb_key_released = noone
}

//set rifle ammo key
if item_left = 3 {
    rifle_ammo_key1_held = item1_key_held
    rifle_ammo_key1_pressed = item1_key_pressed
    rifle_ammo_key1_released = item1_key_released
    rifle_ammo_key2_held = item2_key_held
    rifle_ammo_key2_pressed = item2_key_pressed
    rifle_ammo_key2_released = item2_key_released
} else {
    rifle_ammo_key1_held = noone
    rifle_ammo_key1_pressed = noone
    rifle_ammo_key1_released = noone
    rifle_ammo_key2_held = noone
    rifle_ammo_key2_pressed = noone
    rifle_ammo_key2_released = noone
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


if bow_key1_released {
    if obj_inventory.rifle_ammo > 0 {
        if arrowtimer = room_speed*2 {
            instance_create(x, y, obj_arrow)
            instance_create(x, y, obj_caunode1)
            instance_create(x, y, obj_noise_large)
            obj_inventory.rifle_ammo -= 1
            arrowtimer = 0
        } else {
            arrowtimer = 0
        }
    }
}



if bow_key1_held {
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
    if det_key1_pressed {
        if instance_exists(obj_flare) {
            with(obj_flare) {
                instance_change(obj_flash, true)
            }
        }
    }
}

///plant flare
if scr_item_check(7) {
    if flare_key1_pressed {
        if obj_inventory.flare_ammo > 0 {
            instance_create(x, y, obj_flare)
            obj_inventory.flare_ammo -= 1
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
    if rifle_ammo_key1_pressed {
        ammo_throw = instance_create(x, y, obj_rifle_ammo_throw)
        with(ammo_throw) {
            ammo = true
        }
        obj_inventory.rifle_ammo -= 1
    }
}


