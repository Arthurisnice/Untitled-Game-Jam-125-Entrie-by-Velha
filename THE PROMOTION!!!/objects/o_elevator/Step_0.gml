if place_meeting(x,y,o_player) && image_index<image_number-0.5
{
	image_speed=1
}
else if !place_meeting(x,y,o_player) && image_index>0
{
	image_speed=-1
}
else {image_speed=0}

if place_meeting(x,y,o_player) && keyboard_check_pressed(ord("E")) 
{
	var room_id = string_replace(room_get_name(room),"r_building_floor_","")-1
	if save_game.save_struc.levels_unlcokd<room_id+1
	{
		save_game.save_struc.levels_unlcokd=room_id+1
		save_game.save=true
	}
	room_goto_next()
	 audio_play_sound(x_elevator_go_up,0,false,1,0,1)	
}