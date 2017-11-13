//glrtest_get_illumination()

if(instance_number(obj_glr_player) == 0)
    return 0;
    
    
    
//retrive information about illumination (use only once per frame)
glr_get_illumination_update();

//Player coordinates in screen space
var px = obj_glr_player.x - view_xview;
var py = obj_glr_player.y - view_yview;

var illum = 0;

//Get illumination around the player (5 points)
illum += glr_get_illumination(px, px);
illum += glr_get_illumination(px-16, py-16);
illum += glr_get_illumination(px+16, py-16);
illum += glr_get_illumination(px+16, py+16);
illum += glr_get_illumination(px-16, py+16);

illum /= 5; //mean value

return illum;
