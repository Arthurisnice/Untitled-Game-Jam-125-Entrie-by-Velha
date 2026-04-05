
var dis = point_distance(o_player.x,o_player.y,x,y)

if dis<100 
{
	var amt = 1-dis/100
	amt=clamp(amt,0,1)
		
	draw_set_alpha(amt*2)
	draw_sprite(s_receptionist_out,image_index,x,y)
	draw_set_alpha(1)
}


draw_set_alpha(0.5)
draw_circle_colour(x,y,circle_alpha,c_black,c_black,false)
draw_set_alpha(1)

draw_self()

var c_lightgray = make_colour_rgb(120,120,120)
draw_rectangle_colour(screen_x,square_height,screen_x+screen_width,square_height+sqr_size,c_black,c_black,c_black,c_black,false)
draw_rectangle_colour(screen_x,square_height,screen_x+screen_width,square_height+sqr_size,c_lightgray,c_lightgray,c_lightgray,c_lightgray,true)


if place_meeting(x,y,o_player)
{		
	if keyboard_check_pressed(ord("E"))
	{
		o_player.state="idle"
		
		if array_pos<array_length(dialogue) {array_pos++}
	}
	
	if o_player.state=="idle" && array_pos<array_length(dialogue)
	{
		circle_alpha=lerp(circle_alpha,1000,0.1)
		square_height=lerp(square_height,screen_y+screen_height-sqr_size,0.2)
		scribble(dialogue[array_pos])	
		.align(fa_left, fa_top)
		.transform(0.7)
		.draw(screen_x+5, square_height+5, my_typist)
	
		
		if my_typist.get_state() >= 1
		{
			scribble("[blink]Press E to continue...[/]")
			.align(fa_right, fa_top)
			.transform(0.5)
			.draw(screen_x+screen_width-5,square_height+5)
		}
		
	}
	else if circle_alpha>0
	{
		circle_alpha=lerp(circle_alpha,0,0.1)
		square_height=lerp(square_height,screen_y+screen_height+100,0.2)
	}
	if circle_alpha<10 && o_player.state="idle" {o_player.state="move"; dialogue=text_arr_2; array_pos=-1}
}
else 
{
	timer=0
	alpha_draw=0
}
