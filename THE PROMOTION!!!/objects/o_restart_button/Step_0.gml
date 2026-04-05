x=o_menu_button.x-sprite_width*2.2
y=o_menu_button.y+3

if place_meeting(x,y,o_cursor) && mouse_check_button_pressed(mb_left) && room!=r_menu
{
		on_button=true

	}
	else if mouse_check_button(mb_left) && on_button==true
	{
		image_xscale=org_scale-0.01
		image_yscale=org_scale-0.01
	}
	else if place_meeting(x,y,o_cursor) && mouse_check_button_released(mb_left) && on_button==true
	{
		audio_play_sound(x_button_click,1,false,1,0,1+random(1)-0.5)
		on_button=false
		image_xscale=org_scale
		image_yscale=org_scale
		room_restart()
	}
	else 
	{
		on_button=false
		image_xscale=org_scale
		image_yscale=org_scale
	}
