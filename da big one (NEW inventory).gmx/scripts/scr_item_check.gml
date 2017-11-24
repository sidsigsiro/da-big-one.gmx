///scr_item_check

for (i = 0; i < maxitems; i += 1) {
    if (global.inventory[i] == argument0) { //if slot "i" has item argument0
        return(true);
    }
}
return(false);
