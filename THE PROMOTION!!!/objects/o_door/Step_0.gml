if closed==true && place_meeting(x,y,o_player) 
{
	closed=false
	if o_player.x>x {image_xscale=-1}
	else {image_xscale=1}
}
if closed=false
{
	if closed=false && image_index==0
	{
		image_speed=1
		timer=max_timer
	}
	else if closed==false && image_index>=image_number-1
	{
		image_speed=0
		image_index=3
	}

	if closed==false && timer>0  {timer--}

	if place_meeting(x,y,o_player) {timer=max_timer} 

	if timer==0 && closed==false && image_index!=0
	{
		image_speed=-1
	}
	
	if timer==0 && closed==false && image_index<1
	{
		image_index=0
		image_speed=0
		closed=true
	}
	if timer<=1 {show_debug_message(image_index)}
}

