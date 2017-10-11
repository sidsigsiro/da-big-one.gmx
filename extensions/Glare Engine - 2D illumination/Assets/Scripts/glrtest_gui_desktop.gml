///glrtest_gui_desktop()

var vw = display_get_gui_width();
var vh = display_get_gui_height();

var fxaa = glr_get_enabled_fxaa();
var directional = glr_get_enabled_directional();
var occlusion = glr_get_enabled_occlusion();
var blur = glr_get_enabled_blur();

//create light        
if(mouse_check_button_pressed(mb_right))
    instance_create(mouse_x,mouse_y,  obj_glr_light_random_static);
if(mouse_check_button_pressed(mb_middle)&& instance_number(obj_glr_light_mouse) == 0){
    instance_create(mouse_x,mouse_y,  obj_glr_light_mouse);
} 

//Change room
if(keyboard_check_pressed(vk_space)){
    if(room != room_last) room_goto_next();
    else room_goto(room_next(room_glare_init));
}


//toggle fxaa
if(keyboard_check_pressed(ord("1")))
{
    fxaa = !fxaa;
    glr_enable_fxaa(fxaa);
} 
//toggle directional
if(keyboard_check_pressed(ord("2")))
{
    directional = !directional;
    glr_enable_directional(directional);
}

//toggle occlusion
if(keyboard_check_pressed(ord("3")))
{
    occlusion = !occlusion;
    glr_enable_occlusion(occlusion);
}

//blur
if(keyboard_check_pressed(ord("4")))
{
    blur = !blur; 
    glr_enable_blur(blur);
}

//toggle illumination
if(keyboard_check_pressed(ord("5")))
    getillum = !getillum;
 
//gamma rendering system
if(keyboard_check_pressed(ord("6")))
    obj_glare_controller.new_rendering_mode =  !obj_glare_controller.new_rendering_mode;

//switch quality
var quality = glr_get_quality();
if(keyboard_check_pressed(vk_control))
{
    quality += 0.25;
    if(quality > 1)
        quality = 0.25;
    glr_set_quality(quality);
    glr_set_directional_quality(quality);
}


//edit daytime
if(keyboard_check(vk_pageup)){
    add_time += 100;
}
else if(keyboard_check(vk_down)){
    add_time -= 100;
}


//test of get illumination functions
if(getillum)
    illum = glrtest_get_illumination(); 
else 
    illum = "disabled";

//DEBUG 
str = 
"Glare Surf: "+string(global.GLR_MAIN_SURFACE_WIDTH)+"x"+string(global.GLR_MAIN_SURFACE_HEIGHT)+ "#"+
"App Surf: "+string(surface_get_width(application_surface))+"x"+string(surface_get_height(application_surface))+ "#"+
"DayTime: "+string(floor(daytime*24))+ "#"+
"Illum. at x,y: "+ string(illum)+"#"+
"New Render Mode: "+glrtest_string_onoff(obj_glare_controller.new_rendering_mode)+"#";
 
var col = draw_get_color();
var alpha = draw_get_alpha();
var sw = string_width(str);
var sh = string_height(str);
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(vw - sw - 25, 5, vw - 5, 20+ sh, 0);
draw_set_color(c_white);
draw_rectangle(vw - sw - 25, 5, vw - 5, 20+ sh, 1);
draw_text(vw - sw - 15, 15, str );
 
//Controls 
draw_set_color(c_black);
draw_rectangle(5,vh-55, vw-5,vh-5, 0);
draw_set_color(c_white);
draw_rectangle(5,vh-55, vw-5,vh-5, 1);
draw_text(10, vh-50, "CONTROLS:#"+
"[WASD: move] "+
"[CTRL: quality] "+
"[MOUSE: place light] "+
"[SPACE: change room] "+
"[F: Flashlight] "+
"[1: FXAA] "+
"[2: Directional] "+
"[3: Occlusion] "+
"[4: Blur] "+
"[5: Get Illumin.] "+
"[6: New Render System] "
);

draw_set_alpha(1);
draw_set_color(col);


 
