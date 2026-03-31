if o_player.state=="rewind" && mouse_check_button(mb_right)
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


var dist = point_distance(x,y,o_player.x,o_player.y)
var mult = 0
if dist<100 
{
	mult = abs((dist/100)-1); 
	num = irandom(dist+20)
	if num==0
	{
		if touching==false && image_index<image_number-1.5
		{
			part_particles_burst(global.p_sys, x, y, p_usable);
		}
	}
}

if place_meeting(x,y,o_zone) {touching=true}
else {touching=false}
