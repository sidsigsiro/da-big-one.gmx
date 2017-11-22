///glrtest_gui_mobile()


var vw = display_get_gui_width();
var vh = display_get_gui_height();

var fxaa = glr_get_enabled_fxaa();
var directional = glr_get_enabled_directional();
var occlusion = glr_get_enabled_occlusion();
var blur = glr_get_enabled_blur();

var ps = 10;


ps += 100;
//edit daytime
if(glrtest_text_pressed("Time++", ps, vh-50,2)){
    add_time+=1000;
}

ps += 100;
if(glrtest_text_pressed("Time--", ps, vh-50,2)){
    add_time-=1000;
}

ps += 100;
if(glrtest_text_pressed("New Render", ps, vh-50,2)){
    obj_glare_controller.new_rendering_mode = !obj_glare_controller.new_rendering_mode 
}

if(glrtest_text_hold(" < ", 40, vh-160, 5))
    keyboard_key_press(ord("A"));
else
    keyboard_key_release(ord("A"));
    
if(glrtest_text_hold(" > ", 190, vh-160, 5))
    keyboard_key_press(ord("D"));
else
    keyboard_key_release(ord("D"));
    
if(glrtest_text_hold("  ^  ", vw-150, vh-150, 5))
    keyboard_key_press(ord("W"));
else
    keyboard_key_release(ord("W"));
    
 
var col = draw_get_color();
var alpha = draw_get_alpha();


//DEBUG 
str = 
"Glare Surf: "+string(global.GLR_MAIN_SURFACE_WIDTH)+"x"+string(global.GLR_MAIN_SURFACE_HEIGHT)+ "#"+
"App Surf: "+string(surface_get_width(application_surface))+"x"+string(surface_get_height(application_surface))+ "#"+
"DayTime: "+string(floor(daytime*24))+ "#"+
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
 
draw_set_alpha(1);
draw_set_color(col);
 

 
