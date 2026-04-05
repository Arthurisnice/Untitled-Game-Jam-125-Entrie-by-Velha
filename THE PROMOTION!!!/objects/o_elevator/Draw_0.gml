
var dis = point_distance(o_player.x,o_player.y,x+sprite_width/2,y+sprite_height/2)

if dis<100 
{
	var amt = 1-dis/100
		
	draw_set_alpha(amt)
	draw_sprite(s_elevator_out,0,x,y)
	draw_set_alpha(1)
}

draw_self()
var room_id = string_replace(room_get_name(room),"r_building_floor_","")-1
draw_sprite(s_elevator_lever,room_id,x,y)

