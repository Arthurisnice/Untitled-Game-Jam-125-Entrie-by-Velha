if o_start_button.select_level==true 
{
	var dis = point_distance(x,y,o_cursor.x,o_cursor.y)


	var alpha_to = 1-dis/100

	if dis<100 or image_index==0
	{
		if o_start_button.select_level==true
		{
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,alpha_to)
		}
	}

	if place_meeting(x,y,o_cursor)
	{
		image_index=1
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1)
	}	
	else
	{
		image_index=0
	}

}