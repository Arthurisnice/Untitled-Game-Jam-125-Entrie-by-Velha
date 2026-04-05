var c_lightgray = make_colour_rgb(120,120,120)

var x_midle = x+sprite_width/2
var y_midle = y+sprite_height/2

if type = "horizontal"
{
draw_line_width_colour(start_x+sprite_width/2,y_midle,target_x+sprite_width/2,y_midle,5,c_dkgray,c_dkgray)
draw_circle_colour(start_x+sprite_width/2,y_midle,5/2,c_dkgray,c_dkgray,false)
draw_circle_colour(target_x+sprite_width/2,y_midle,5/2,c_dkgray,c_dkgray,false)

draw_line_width_colour(start_x+sprite_width/2,y_midle,target_x+sprite_width/2,y_midle,3,c_lightgray,c_lightgray)
draw_circle_colour(start_x+sprite_width/2,y_midle,3/2,c_lightgray,c_lightgray,false)
draw_circle_colour(target_x+sprite_width/2,y_midle,3/2,c_lightgray,c_lightgray,false)

}
else if type = "vertical"
{
draw_line_width_colour(x_midle,start_y+sprite_height/2,x_midle,target_y+sprite_height/2,5,c_dkgray,c_dkgray)
draw_circle_colour(x_midle,start_y+sprite_height/2,5/2,c_dkgray,c_dkgray,false)
draw_circle_colour(x_midle,target_y+sprite_height/2,5/2,c_dkgray,c_dkgray,false)

draw_line_width_colour(x_midle,start_y+sprite_height/2,x_midle,target_y+sprite_height/2,3,c_lightgray,c_lightgray)
draw_circle_colour(x_midle,start_y+sprite_height/2,3/2,c_lightgray,c_lightgray,false)
draw_circle_colour(x_midle,target_y+sprite_height/2,3/2,c_lightgray,c_lightgray,false)
}


var mult=1
var in_circle = collision_circle(x+sprite_width/2,y+sprite_height/2,circle_size,o_zone,true,true)


var timer_shake = 1-timer/max_timer
var amnt = 0

if timer<max_timer*0.3
{
	if x==target_x or y==target_y {amnt = random(timer_shake)}
}

if amnt!=0 
{
	var rand_1=irandom(15)
	var rand_2=irandom(14)
	if rand_1==rand_2
	{
		audio_play_sound(x_block_shake,1,false,1,0,1+random(0.1)-0.2)
	}
}

shake_prev=amnt

var color = in_circle? 1: 0;

draw_sprite_ext(sprite_index,color,x+amnt,y+amnt,image_xscale,image_yscale,0,c_white,1)


var spd=move_spd/return_spd

if in_circle {mult=-1*spd}

rot+=(move_spd*rand)/mult
draw_sprite_ext(s_block_move_icon,0,x+sprite_width/2,y+sprite_height/2,midle_size,midle_size,rot,c_white,1)

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

var spd_mov = (abs(point_distance(xprevious,yprevious,x,y)/target_spd)*-1+1)*10

if rew_timer<spd_mov {rew_timer++}

if rew_timer>=spd_mov && spd_mov!=0
{	
	rew_timer=0
	audio_play_sound(x_block_move,1,false,1,0,1+random(0.1)-0.2)
}
