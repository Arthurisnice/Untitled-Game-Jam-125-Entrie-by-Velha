rew_timer += rew_frequency;

var mov = dsin(rew_timer) * rew_amplitude/2;

var _x = x
var _y = y

if state!="rewind" && !mouse_check_button(mb_right) {mov=0}

mov=-abs(mov)

draw_self()

if state=="rewind"
{
	if mouse_check_button(mb_right)
	{	
		rew_prev_x=rewind_x
		rew_prev_y=rewind_y
		
		rewind_rot-=3*rewind_rand
		rewind_scale=lerp(rewind_scale,1,0.1)

		var osc = dsin(rew_timer) * rew_amplitude;
		
		var osc_2 = dsin(rew_timer*2) * osc*rew_change;
		
		if osc==0 && rew_change==1 {rew_change=-1}
		else if osc==0 && rew_change==-1 {rew_change=1}
		
		
		rewind_x = lerp(rewind_x,mouse_x,0.15)+osc
		rewind_y = lerp(rewind_y,mouse_y,0.15)+osc_2	
		
	}
}

var c_val = (loading_in_timer-400)*-1
c_val = clamp(c_val,0,155)
var col = make_colour_rgb(c_val, c_val, c_val);



if loading_in_timer>0 
{
	loading_in_timer=2
	loading_in_timer--; 
	o_player.state="idle"
}

if loading_in_timer==1 {o_player.state="move"; loading_in_timer=0}

if loading_in_timer==0
{
	loading_screen=lerp(loading_screen,0,0.05)
}

if loading_screen>0
{
	draw_set_alpha(loading_screen)
	draw_set_colour(col)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_colour(c_white)
	draw_set_alpha(1)
	
}

draw_set_valign(fa_bottom)
draw_set_halign(fa_center)

draw_set_font(real_small)


if loading_in_timer<200 && loading_in_timer>50
{
	text_alpha = lerp(text_alpha,1,0.1)
}
else if loading_in_timer<200
{
	text_alpha = lerp(text_alpha,0,0.1)
}

//if loading_in_timer<100 {alp=(100/loading_in_timer)}



if loading_in_timer<200 && loading_in_timer>10 
{
	draw_set_alpha(text_alpha)
	if room==r_house{ draw_text_ext(o_player.x,o_player.y-30,"I think im gonna be late...",15,100)}
	if room==r_building_floor_1{ draw_text_ext(o_player.x,o_player.y-30,"I can't miss this interview...",15,100)}
	if room==r_building_floor_2{ draw_text_ext(o_player.x,o_player.y-30,"I can open my eyes now...",15,100)}
	if room==r_building_floor_3{ draw_text_ext(o_player.x,o_player.y-30,"I can open my eyes now...",15,100)}
	if room==r_building_floor_4{ draw_text_ext(o_player.x,o_player.y-30,"I can open my eyes now...",15,100)}
	if room==r_building_floor_6{ draw_text_ext(o_player.x,o_player.y-30,"I can open my eyes now...",15,100)}
	if room==r_building_floor_7{ draw_text_ext(o_player.x,o_player.y-30,"I can open my eyes now...",15,100)}	
	draw_set_alpha(1)
}

function room_try(argument_to)
{
	var to_return = true
	try 
	{
		if argument_to==1
		{
			room_goto_next()
		}
		else {room_goto_previous()}
	}
	catch (_exception) {to_return=false}
	
	return to_return
}

if keyboard_check_pressed(vk_shift) && room_try(1)==true
{
	room_goto_next()
}
if keyboard_check_pressed(vk_control) && room_try(-1)==true
{
	room_goto_previous()
}


	