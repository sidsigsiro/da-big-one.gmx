///scr_item_pickup_slot(item,slot)

if (obj_inventory.boxes[argument1].item == -1) { 
    obj_inventory.boxes[argument1].item = argument0;
    return true
}
return false
