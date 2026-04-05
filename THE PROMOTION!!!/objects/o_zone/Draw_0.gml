draw_sprite_ext(s_rewind_subzone,0,x,y,image_xscale,image_yscale,-o_player.rewind_rot,c_white,1)
draw_self()


if keyboard_check_pressed(ord("X")) && test==false
{
	test=true
}
else if keyboard_check_pressed(ord("X")) && test==true
{
	test=false
}


//draw_path(my_path,x,y,true)

var _path_len = path_get_length(my_path);
var _spacing = 1.5;


for (var i = 0; i <= _path_len; i += _spacing) 
{
	var amt=(i/_path_len)*1.
	
    var _pos = i / (_path_len-amt);
	
    
    var _x = path_get_x(my_path, _pos);
    var _y = path_get_y(my_path, _pos);
    
    draw_set_alpha(0.3);
    draw_circle_colour(_x, _y, 1.5-amt, c_purple, c_purple, false);
    draw_set_alpha(1);
}
