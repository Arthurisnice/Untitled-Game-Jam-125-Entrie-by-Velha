x=screen_x+screen_width-4
y=screen_y+12

if place_meeting(x,y,o_cursor) && mouse_check_button_pressed(mb_left) && o_start_button.select_level==true
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
