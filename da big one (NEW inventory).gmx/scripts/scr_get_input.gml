///scr_get_input
right_key = keyboard_check(ord('D'));
left_key = keyboard_check(ord('A'));
down_key = keyboard_check(ord('S'));
up_key = keyboard_check(ord('W'));
right_key_released = keyboard_check_released(ord('D'));
left_key_released = keyboard_check_released(ord('A'));
down_key_released = keyboard_check_released(ord('S'));
up_key_released = keyboard_check_released(ord('W'));
use_key = keyboard_check(ord('E'));
use_key_pressed = keyboard_check_pressed(ord('E'));
use_key_released = keyboard_check_released(ord('E'));
vault_key = keyboard_check(vk_space)
vault_key_pressed = keyboard_check_pressed(vk_space)
vault_key_released = keyboard_check_released(vk_space)
crouch_key = keyboard_check_pressed(vk_control);
crouch_key_held = keyboard_check(vk_control)
inv_key = keyboard_check_pressed(vk_tab)
wind_key = keyboard_check(vk_shift)
wind_key_pressed = keyboard_check_pressed(vk_shift)
wind_key_released = keyboard_check_released(vk_shift)
scope_key = keyboard_check_pressed(ord('B'))
flint_key = keyboard_check_pressed(ord('P'))
distract_key = keyboard_check_pressed(ord('J'))
birdcall_key = keyboard_check_pressed(ord('R'))
grab_key = keyboard_check(ord('F'))
grab_key_pressed = keyboard_check_pressed(ord('F'))
grab_key_released = keyboard_check_released(ord('F'))
bow_key_held = noone
bow_key_pressed = noone
bow_key_released = noone
bottle_key = noone
bottle_key_pressed = noone
bottle_key_released = noone
temp_key = noone
temp_key_pressed = noone
temp_key_released = noone
dblock_key = noone
dblock_key_held = noone
dblock_key_released = noone

hot_key1 = keyboard_check_pressed(ord('1'));
hot_key2 = keyboard_check_pressed(ord('2' ));
hot_key3 = keyboard_check_pressed(ord('3'));
hot_key4 = keyboard_check_pressed(ord('4'));
hot_key5 = keyboard_check_pressed(ord('5'));
hot_key6 = keyboard_check_pressed(ord('6'));
hot_key7 = keyboard_check_pressed(ord('7'));
hot_key8 = keyboard_check_pressed(ord('8'));
hot_key9 = keyboard_check_pressed(ord('9'));


die_key = keyboard_check(ord('K'))

cam_lock_key = noone
//item keys
item1_key_held = mouse_check_button(mb_left)
item1_key_pressed = mouse_check_button_pressed(mb_left)
item1_key_released = mouse_check_button_released(mb_left)
item2_key_held = mouse_check_button(mb_right)
item2_key_pressed = mouse_check_button_pressed(mb_right)
item2_key_released = mouse_check_button_released(mb_right)
item3_key_held = mouse_check_button(mb_middle)
item3_key_pressed = mouse_check_button_pressed(mb_middle)
item3_key_released = mouse_check_button_released(mb_middle)

// Get the axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

//Check for gamepad input
if (gamepad_is_connected(0)) {
    gamepad_set_axis_deadzone(0, .35);
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    item1_key_held = gamepad_button_check(0, gp_shoulderr);
    item1_key_pressed = gamepad_button_check_pressed(0, gp_shoulderr);
    item1_key_released = gamepad_button_check_released(0, gp_shoulderr);
    item2_key_held = gamepad_button_check(0, gp_shoulderrb);
    item2_key_pressed = gamepad_button_check_pressed(0, gp_shoulderrb);
    item2_key_released = gamepad_button_check_released(0, gp_shoulderrb);
    item3_key_held = gamepad_button_check(0, gp_shoulderl);
    item3_key_pressed = gamepad_button_check_pressed(0, gp_shoulderl);
    item3_key_released = gamepad_button_check_released(0, gp_shoulderl);
    item4_key_held = gamepad_button_check(0, gp_shoulderlb);
    item4_key_pressed = gamepad_button_check_pressed(0, gp_shoulderlb);
    item4_key_released = gamepad_button_check_released(0, gp_shoulderlb);
    vault_key = gamepad_button_check_pressed(0, gp_face1);
    crouch_key = gamepad_button_check_pressed(0, gp_face2);
    crouch_key_held = gamepad_button_check(0, gp_face2);
    inv_key = gamepad_button_check_pressed(0, gp_face4);
    cam_lock_key = gamepad_button_check_pressed(0, gp_stickr)
    dblock_key = gamepad_button_check_pressed(0, gp_shoulderl);
    temp_key = gamepad_button_check(0, gp_shoulderr);
    scope_key = gamepad_button_check_pressed(0, gp_padd);
}

//THIS DASH KEY IS A PLACE HOLDER, DELETE AFTER CODE IS FIXED
dash_key = noone
