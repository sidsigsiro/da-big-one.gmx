///scr_enemy_dead

if(mp_grid_path(global.grid_floor1, path, x, y, x, y , true)) {
    path_start(path, 1.6, path_action_stop, false);
}

if item_dropped = false {
    instance_create(x, y, obj_pickup_bow)
    item_dropped = true
}

instance_destroy();
