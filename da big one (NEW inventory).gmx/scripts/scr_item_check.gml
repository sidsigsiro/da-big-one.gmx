///scr_item_check(item)
for (i = 0; i < obj_inventory.max_items; i++) {
    if (obj_inventory.boxes[i].item == argument0) { //if slot "i" has item argument0
        return true
    }
}
return false
