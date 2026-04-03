var mult=1

var leng = path_get_length(p_path_1)

var x_leng = path_get_x(p_path_1,traveled/leng)
var y_leng = path_get_y(p_path_1,traveled/leng)

target_x=x_leng
target_y=y_leng


var in_circle = collision_circle(x_leng+sprite_width/2,y_leng,circle_size,o_zone,true,true)

var spd=move_spd/return_spd

if in_circle {mult=-1*spd}

rot+=(move_spd*rand)/mult

var my_path = p_path_1

var _num = path_get_number(my_path);
for (var i = 0; i < _num-1; i++) {
    var _px = path_get_point_x(my_path, i)+sprite_width/2
    var _py = path_get_point_y(my_path, i)
	var _px2 = path_get_point_x(my_path, i+1)+sprite_width/2
    var _py2 = path_get_point_y(my_path, i+1)

	draw_circle_path_bk(_px,_py,_px2,_py2)

}

for (var i = 0; i < _num-1; i++) {
    var _px = path_get_point_x(my_path, i)+sprite_width/2
    var _py = path_get_point_y(my_path, i)
	var _px2 = path_get_point_x(my_path, i+1)+sprite_width/2
    var _py2 = path_get_point_y(my_path, i+1)

	draw_circle_path_frnt(_px,_py,_px2,_py2)

}

var amnt = 0

var color = in_circle? 1: 0;

draw_sprite_ext(sprite_index,color,x+amnt,y+amnt,image_xscale,image_yscale,0,c_white,1)


draw_sprite_ext(s_block_move_icon,0,x_leng+sprite_width/2,y_leng,midle_size,midle_size,rot,c_white,1)

if spiked==true
{
	if spike_left==1
	{
		var amt = round(sprite_height/3)
		for (var i=0;i<amt;i++)
		{
			draw_sprite(s_block_spike,0,x-sprite_get_width(s_block_spike),y+i*3)
		}
		if collision_rectangle(x,y,x-sprite_get_width(s_block_spike)+4,y+sprite_height,o_player,false,true)
		{
			room_restart()
		}
	}
	
	
	if spike_right==1
	{
		var amt = round(sprite_height/3)
		for (var l=0;l<amt;l++)
		{
			draw_sprite(s_block_spike,1,x+sprite_width,y+l*3)
		}
		if collision_rectangle(x,y,x+sprite_width+sprite_get_width(s_block_spike)-4,y+sprite_height,o_player,false,true)
		{
			room_restart()
		}
	}
	
	if spike_up==1
	{
		var amt_2 = round(sprite_width/3)
		for (var j=0;j<amt_2;j++)
		{
			draw_sprite(s_block_spike_up,0,x+j*3,y-sprite_get_height(s_block_spike_up))
		}
		if collision_rectangle(x,y,x+sprite_width-0.5,y-sprite_get_width(s_block_spike)+4,o_player,false,true)
		{
			room_restart()
		}
	}
	
	if spike_down==1
	{
		var amt_2 = round(sprite_width/3)
		for (var f=0;f<amt_2;f++)
		{
			draw_sprite(s_block_spike_up,1,x+f*3,y+sprite_height)
		}
		if collision_rectangle(x,y+sprite_height,x+sprite_width-0.5,y+sprite_height+sprite_get_width(s_block_spike)-4,o_player,false,true)
		{
			room_restart()
		}
	}
}