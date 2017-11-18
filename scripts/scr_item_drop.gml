///scr_item_drop
for (i = 0; i < maxitems; i += 1) {
    if (global.inventory[i] == argument0) { //if slot "i" has item argument0
        global.inventory[i] = -1
        return(true);
    }
}
return(false);
