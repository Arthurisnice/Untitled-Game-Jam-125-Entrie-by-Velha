if place_meeting(x,y,o_player) && keyboard_check_pressed(ord("E")) && done==false
{
	timer=5*60
	sprite_index = s_arcade_yours
	o_player.y = o_player.y-4
	o_player.x = x+sprite_width/2
	o_player.state = "idle"
	image_index = irandom(2)
}
	
if timer>0 {timer--}
if timer==0 {on=true; o_enemy_arcade.sprite_index=s_arcade_enemy}
	
if on=true 
{
	if image_index==0
	{
		if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
		{
			image_index=irandom(2)
			score_arc+=5
			color=c_green
		}
		else if keyboard_check_pressed(vk_anykey)
		{
			image_index=irandom(2)
			score_arc-=2
			color=c_red
		}
	}
	else if image_index==1
	{
		if keyboard_check_pressed(vk_right)  or keyboard_check_pressed(ord("D"))
		{
			image_index=irandom(2)
			score_arc+=5
			color=c_green
		}
		else if keyboard_check_pressed(vk_anykey)
		{
			image_index=irandom(2)
			score_arc-=2
			color=c_red
		}
	}
	else if image_index==2
	{
		if keyboard_check_pressed(vk_left)  or keyboard_check_pressed(ord("A"))
		{
			image_index=irandom(2)
			score_arc+=5
			color=c_green
		}
		else if keyboard_check_pressed(vk_anykey)
		{
			image_index=irandom(2)
			score_arc-=2
			color=c_red
		}
	}
	
}

if o_enemy_arcade.score_arc==1000 && done==false
{
	o_player.state="move"
	o_player.mov_h_spd=0
	o_player.mov_v_spd=0
	o_player.y=o_player.y+4
	done=true
	on=false
}