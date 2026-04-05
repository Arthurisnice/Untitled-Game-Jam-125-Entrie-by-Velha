var player_side = x+sprite_width/2>o_player.x? 1:-1;

var in_circle = collision_circle(x+sprite_width/2,y+sprite_height/2,circle_size,o_zone,true,true)

if in_circle 
{
	timer=max_timer
}

if timer>0 {timer--}

if type="horizontal"
{
	if in_circle && x!=target_x
	{
		target_spd=move_spd
	}

	if in_circle && x-spd_h>target_x
	{
		x=target_x
			if place_meeting(x+spd_h,y,o_player)
			{
				
				var midle_x = x+sprite_width/2
				var dir_s = o_player.x>midle_x? 1:-1;
				o_player.mov_h_spd=0
				o_player.x=midle_x+(sprite_width/2*dir_s)+4*dir_s
			}
		target_spd=0
		spd_h=0
	}

	//_________________________TRYING TO RETURN


	if !in_circle && spd_h!=target_spd
	{
		if x<target_x
		{
			target_spd=-return_spd
		}
		else 
		{
			x=target_x
			if place_meeting(x+spd_h,y,o_player)
			{
				
				var midle_x = x+sprite_width/2
				var dir_s = o_player.x>midle_x? 1:-1;
				o_player.mov_h_spd=0
				o_player.x=midle_x+(sprite_width/2*dir_s)+4*dir_s
			}
			target_spd=0
			spd_h=0
		}
	}

	//_________________________ RETURNING

	if !in_circle && x!=start_x && timer==0
	{
	
		target_spd=-return_spd
	
	}

	if !in_circle && x-spd_h<start_x
	{
		x=start_x
			if place_meeting(x+spd_h,y,o_player)
			{
				
				var midle_x = x+sprite_width/2
				var dir_s = o_player.x>midle_x? 1:-1;
				o_player.mov_h_spd=0
				o_player.x=midle_x+(sprite_width/2*dir_s)+4*dir_s
			}
		target_spd=0
		spd_h=0
	}
	
	if !place_meeting(x+spd_h,y,o_blocks_parent)
	{
		spd_h=lerp(spd_h,target_spd,0.01)

		x+=spd_h
	}
	else
	{
		spd_h=spd_h-0.1
	}
	
	var dir_s = sign(spd_h)
	var midle_x = x+sprite_width/2
	
	if place_meeting(x+spd_h,y,o_player)
	{
		o_player.mov_h_spd=0
		o_player.x=midle_x+(sprite_width/2*dir_s)+4*dir_s
	}
		
	var dir = sign(target_spd)
	if dir==0 {dir=1}

	if place_meeting(x,y-1,o_player)
	{
		with (o_player)
		{
			if !place_meeting(x+other.spd_h,y,o_wall)
			{
				x+=other.spd_h
			}
		}
	}
	
}
else if type=="vertical"
{
	if in_circle && y!=target_y
	{
		target_spd=move_spd
	}

	if in_circle && y-spd_h>target_y
	{
		y=target_y
		if place_meeting(x,y+spd_h,o_player)
		{
			var midle_y = y+sprite_height/2
			var dir_s = o_player.y>midle_y? 1:-1;
			o_player.y=midle_y+sprite_height/2*dir_s+o_player.sprite_height/2*dir_s
			o_player.mov_v_spd=0
		}
		target_spd=0
		spd_h=0
	}

	//_________________________TRYING TO RETURN


	if !in_circle && spd_h!=target_spd
	{
		if y<target_y
		{
			target_spd=-return_spd
		}
		else 
		{
			y=target_y
			if place_meeting(x,y+spd_h,o_player)
			{
				var midle_y = y+sprite_height/2
				var dir_s = o_player.y>midle_y? 1:-1;
				o_player.y=midle_y+sprite_height/2*dir_s+o_player.sprite_height/2*dir_s
				o_player.mov_v_spd=0
		}
			target_spd=0
			spd_h=0
		}
	}

	//_________________________ RETURNING

	if !in_circle && y!=start_y && timer==0
	{
	
		target_spd=-return_spd
	
	}

	if !in_circle && y-spd_h<start_y
	{
		y=start_y
		if place_meeting(x,y+spd_h,o_player)
		{
			var midle_y = y+sprite_height/2
			var dir_s = o_player.y>midle_y? 1:-1;
			o_player.y=midle_y+sprite_height/2*dir_s+o_player.sprite_height/2*dir_s
			o_player.mov_v_spd=0
		}
		target_spd=0
		spd_h=0
	}
	
	if !place_meeting(x,y+spd_h,o_blocks_parent)
	{
		spd_h=lerp(spd_h,target_spd,0.01)

		y+=spd_h
	}

	var dir = sign(target_spd)
	if dir==0 {dir=1}

	if place_meeting(x,y-2,o_player) && spd_h!=0
	{
		o_player.y=y-o_player.sprite_height/2+1
		o_player.on_box=true
	}
	else {o_player.on_box=false;}
}

