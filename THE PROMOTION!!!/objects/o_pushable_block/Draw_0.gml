if !place_meeting(x,y+1,o_wall)
{
	if grv_spd<5
	{
		grv_spd+=0.3
	}
}
else {grv_spd=0;}
if place_meeting(x,y,o_wall) {y--}
y+=grv_spd



var side = x<o_player.x? 1:-1;

if place_meeting(x-o_player.mov_h_spd,y,o_player) && touching==false && o_player.bbox_bottom<bbox_bottom
{
	x=(o_player.x+(4*-side))-sprite_width/2*side
}

if touching==true && place_meeting(x,y,o_player)
{
	o_player.x=x+(sprite_width/2*side)+4*side
}

draw_self()
var tape_col = make_colour_rgb(153,116,75)
draw_line_width_colour(x,y+1,x,y+sprite_height-1,4,tape_col,tape_col)