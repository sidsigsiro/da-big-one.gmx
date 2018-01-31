///scr_enemy_wounded
/*
--Enemy
stop moving
look towards where they got hit
call out for help
raise suspicion value
put caution node on whoever dealt damage
look left to right

--Helper
hear cry
move to cry
dialogue with helping enemy
*/
path_endaction = path_action_stop

if help_called = false {
    instance_create(x, y, obj_noise_friend)
    help_called = true
}


