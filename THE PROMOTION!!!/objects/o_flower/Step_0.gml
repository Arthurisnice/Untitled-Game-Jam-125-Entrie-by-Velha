if o_player.state=="rewind" && o_player.click==true
{
	if place_meeting(x,y,o_zone)
	{
		if image_index<image_number-1
		{
			image_speed=1
		}
		else {image_speed=0}
	}
	else {image_speed=0}
}
else {image_speed=0}
