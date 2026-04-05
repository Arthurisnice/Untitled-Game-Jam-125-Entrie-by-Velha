if place_meeting(x,y,o_player) && keyboard_check_pressed(ord("E")) && done==false && o_enemy_arcade.dialogue==o_enemy_arcade.text_arr_2 && start==false
{
	start=true
	timer=5*60
	sprite_index = s_arcade_yours
	o_player.y = o_player.y-4
	o_player.x = x+sprite_width/2
	o_player.state = "idle"
	image_index = irandom(2)
}
	
if timer>0 {timer--}
if timer==0 && on==false {audio_play_sound(x_start,1,false,1,0,1); audio_play_sound(x_song_ddr,1,false,1,0,1)}
if timer==0 {on=true; o_enemy_arcade.sprite_index=s_arcade_enemy;}
	
if on=true 
{
	if image_index==0
	{
		if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
		{
			image_index=irandom(2)
			score_arc+=5
			color=c_green
			txt_timer=5
			audio_play_sound(x_ddr_right,1,false,1,0,1)
		}
		else if keyboard_check_pressed(vk_anykey)
		{
			image_index=irandom(2)
			score_arc-=2
			color=c_red
			txt_timer=5
			audio_play_sound(x_ddr_wrong,1,false,1,0,1)
		}
	}
	else if image_index==1
	{
		if keyboard_check_pressed(vk_right)  or keyboard_check_pressed(ord("D"))
		{
			image_index=irandom(2)
			score_arc+=5
			color=c_green
			txt_timer=5
			audio_play_sound(x_ddr_right,1,false,1,0,1)
		}
		else if keyboard_check_pressed(vk_anykey)
		{
			image_index=irandom(2)
			score_arc-=2
			color=c_red
			txt_timer=5
			audio_play_sound(x_ddr_wrong,1,false,1,0,1)
		}
	}
	else if image_index==2
	{
		if keyboard_check_pressed(vk_left)  or keyboard_check_pressed(ord("A"))
		{
			image_index=irandom(2)
			score_arc+=5
			color=c_green
			txt_timer=5
			audio_play_sound(x_ddr_right,1,false,1,0,1)
		}
		else if keyboard_check_pressed(vk_anykey)
		{
			image_index=irandom(2)
			score_arc-=2
			color=c_red
			txt_timer=5
			audio_play_sound(x_ddr_wrong,1,false,1,0,1)
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