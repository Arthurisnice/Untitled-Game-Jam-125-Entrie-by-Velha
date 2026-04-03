if place_meeting(x,y,o_player) && image_index<image_number-0.5
{
	image_speed=1
}
else if !place_meeting(x,y,o_player) && image_index>0
{
	image_speed=-1
}
else {image_speed=0}

if place_meeting(x,y,o_player) && keyboard_check_pressed(ord("E")) {room_goto_next()}