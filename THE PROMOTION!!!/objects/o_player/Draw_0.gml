rew_timer += rew_frequency;

var mov = dsin(rew_timer) * rew_amplitude/2;

var _x = x
var _y = y

if state!="rewind" && !click==true {mov=0}

mov=-abs(mov)

draw_set_alpha(0.1)
draw_circle_colour(x,y,circle_alpha,c_black,c_black,false)
draw_set_alpha(1)

draw_self()

if state=="rewind"
{
	circle_alpha=lerp(circle_alpha,1000,0.1)
	
	if click==true
	{	
		rew_prev_x=rewind_x
		rew_prev_y=rewind_y
		
		rewind_rot-=3*rewind_rand
		rewind_scale=lerp(rewind_scale,1,0.1)

		var osc = dsin(rew_timer) * rew_amplitude;
		
		var osc_2 = dsin(rew_timer*2) * osc*rew_change;
		
		if osc==0 && rew_change==1 {rew_change=-1}
		else if osc==0 && rew_change==-1 {rew_change=1}
		
		
		rewind_x = lerp(rewind_x,mouse_x,0.15)+osc/2
		rewind_y = lerp(rewind_y,mouse_y,0.15)+osc_2/2
		
	}
}
else
{
	circle_alpha=lerp(circle_alpha,0,0.1)
}

var c_val = (loading_in_timer-400)*-1
c_val = clamp(c_val,0,155)
var col = make_colour_rgb(c_val, c_val, c_val);



if loading_in_timer>0 
{
	//loading_in_timer=2
	//REMVOE THIS FOR NORMAL GAMER
	
	//IM SERIUS ABOUT IT!!!!!
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
	text_alpha = lerp(text_alpha,1,0.08)
}
else if loading_in_timer<200 
{
	text_alpha = lerp(text_alpha,0,0.08)
}

//if loading_in_timer<100 {alp=(100/loading_in_timer)}

if loading_in_timer==250 && room!=r_house && room!=r_building_floor_1 {audio_play_sound(x_elevator_go_arrive,0,false,1,0,1)}
	
if loading_in_timer<200 && loading_in_timer>10 
{
	draw_set_alpha(text_alpha)
	if room==r_house{ draw_text_ext(o_player.x,o_player.y-30,"I think im gonna be late...",15,100)}
	if room==r_building_floor_1{ draw_text_ext(o_player.x,o_player.y-30,"I can't miss this interview...",15,100)}
	if room==r_building_floor_2{ draw_text_ext(o_player.x,o_player.y-30,"First challenge, it can't be that hard...",15,100)}
	if room==r_building_floor_3{ draw_text_ext(o_player.x,o_player.y-30,"This place is so dangerus...",15,100)}
	if room==r_building_floor_4{ draw_text_ext(o_player.x,o_player.y-30,"Why do i hear music?",15,250)}
	if room==r_building_floor_5{ draw_text_ext(o_player.x,o_player.y-30,"All this for a cashier postion...",15,100)}
	if room==r_building_floor_6{ draw_text_ext(o_player.x,o_player.y-30,"This is the last one/n how hard can it be?",15,100)}	
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

/*
if keyboard_check_pressed(vk_shift) && room_try(1)==true
{
	room_goto_next()
}
if keyboard_check_pressed(vk_control) && room_try(-1)==true
{
	room_goto_previous()
}
*/

//Animation_Sound_Handler
{
	if sprite_index=s_player_walk && state=="move"
	{	
		var rand = random(0.6)-0.3
		if mov_h_spd!=0 {sound_per_aniim++}
		if sound_per_aniim==20
		{
			sound_per_aniim=0
			if !audio_is_playing(x_foot_step) {audio_play_sound(x_foot_step,0,false,1,0,1+rand)}
		}
	}
	else
	{
		audio_stop_sound(x_foot_step)
	}
	
	if sprite_index==s_player_falling
	{
		var rand = random(0.6)-0.3
		audio_play_sound(x_fall,0,false,1,0,1+rand)
	}
	else
	{
		audio_stop_sound(x_fall)
	}
	
	
	if state=="rewind"
	{
		var rand = random(0.2)-0.1
		if !audio_is_playing(x_mind_control) {audio_play_sound(x_mind_control,0,false,1,0,1+rand)}
		if !audio_is_playing(x_clock_tick) {audio_play_sound(x_clock_tick,0,false,1,0,1)}
	}
	else
	{
		audio_stop_sound(x_mind_control)
		audio_stop_sound(x_clock_tick)
	}
	
	if previus_v_spd!=mov_v_spd && mov_v_spd==0 && in_air==false && room_timer>10
	{
		if !audio_is_playing(x_player_land) {audio_play_sound(x_player_land,1,false,1,0,1+random(0.2)-0.1)}
	}
}


//if place_meeting(x,y,o_wall) {draw_text(x,y,"AAAAAAAAAAAAAAAAAAAAAAA")}



