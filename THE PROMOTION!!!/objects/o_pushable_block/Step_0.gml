if place_meeting(x+5,y,o_wall) or place_meeting(x-5,y,o_wall)
{
	touching=true
	var wall_left=instance_place(x-5,y,o_wall)
	var wall_right=instance_place(x+5,y,o_wall)
	if instance_exists(wall_left)
	{
		while (!place_meeting(x-1,y,o_wall))
		{
			x--
		}
	}
	else if instance_exists(wall_right)
	{
		while (!place_meeting(x+1,y,o_wall))
		{
			x++
		}
	}
}
else {touching=false}