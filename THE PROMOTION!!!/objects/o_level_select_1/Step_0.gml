if o_start_button.select_level==true && save_game.save_struc.levels_unlcokd>=my_indx
{
	if place_meeting(x,y,o_cursor) && mouse_check_button_pressed(mb_left) 
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
		on_button=false
		image_xscale=org_scale
		image_yscale=org_scale
		var room_index = my_indx+2
		room_goto(room_index)
	}
	else 
	{
		on_button=false
		image_xscale=org_scale
		image_yscale=org_scale
	}
}

