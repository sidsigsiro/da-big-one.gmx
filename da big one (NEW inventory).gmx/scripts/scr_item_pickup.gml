///scr_item_pickup(item)
for (i = 0; i < obj_inventory.max_items; i++) {
    if (obj_inventory.boxes[i].item == -1) { //if slot "i" is empty
        obj_inventory.boxes[i].item = argument0;
        return true
    }
}
return false
