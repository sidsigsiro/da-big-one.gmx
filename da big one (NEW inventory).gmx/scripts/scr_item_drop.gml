///scr_item_drop(item)
for (i = 0; i < obj_inventory.max_items; i++) {
    if (obj_inventory.boxes[i].item == argument0) { //if slot "i" has item argument0
        obj_inventory.boxes[i].item = -1
        return true
    }
}
return false
