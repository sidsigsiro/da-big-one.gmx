///scr_item_pickup
for (i = 0; i < maxitems; i += 1) {
    if (global.inventory[i] == -1) { //if slot "i" is empty
        global.inventory[i] = argument0;
        return(true);
    }
}
return(false);
