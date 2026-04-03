var player_side = x+sprite_width/2>o_player.x? 1:-1;

var leng = path_get_length(p_path_1)

var x_leng = path_get_x(p_path_1,traveled/leng)
var y_leng = path_get_y(p_path_1,traveled/leng)

target_x=path_get_x(p_path_1,1)
target_y=path_get_x(p_path_1,2)


var in_circle = collision_circle(x_leng+sprite_width/2,y_leng,circle_size,o_zone,true,true)

if in_circle {timer=max_timer}

if timer>0 {timer--}

if in_circle 
{
	target_spd=move_spd
}
else if traveled>0
{
	target_spd=-move_spd
}
else if traveled<0
{
	target_spd=0
	traveled=0
	spd_h=0
}

if !place_meeting(x+target_spd,y,o_blocks_parent)
{
	spd_h=lerp(spd_h,target_spd,0.01)

	traveled+=spd_h
	
}

x=x_leng

var dir_s = sign(spd_h)
if dir_s==0 {dir_s = o_player.x>x?1:-1;}
var midle_x = x+sprite_width/2
	
if place_meeting(x+spd_h,y,o_player)
{
	o_player.mov_h_spd=0
	o_player.x=midle_x+(sprite_width/2*dir_s)+4*dir_s
}


if place_meeting(x,y-1,o_player)
{
	o_player.x+=spd_h
}
