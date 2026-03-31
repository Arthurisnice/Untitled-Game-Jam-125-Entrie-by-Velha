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
		
		show_debug_message(osc)
		
		rewind_x = lerp(rewind_x,mouse_x,0.15)+osc
		rewind_y = lerp(rewind_y,mouse_y,0.15)+osc_2
		
		var dist = point_distance(rewind_x,rewind_y,rew_prev_x,rew_prev_y)
		
		
		for (i=0;i<dist;i++)
		{
			var amt = i/dist
			
			var new_x = lerp(rew_prev_x,rewind_x,amt)
			var new_y = lerp(rew_prev_y,rewind_y,amt)
			coll_x=new_x
			coll_y=new_y
			
			instance_create_depth(new_x,new_y,depth,o_ball)
		}
			
		draw_sprite_ext(s_rewind_zone,0,rewind_x,rewind_y,rewind_scale,rewind_scale,rewind_rot,c_white,1)
	}
}



if loading_in_timer>0 
{
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
	draw_set_colour(c_gray)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_colour(c_white)
	draw_set_alpha(1)
}

draw_set_font(real_small)
if loading_in_timer<150 && loading_in_timer>10 
{
	if room==r_house{ draw_text(o_player.x-25,o_player.y-30,"I think im late...")}
	if room==r_building_floor_1{ draw_text(o_player.x-25,o_player.y-30,"I can't miss the interview...")}
	if room==r_building_floor_2{ draw_text(o_player.x-25,o_player.y-30,"I can open my eyes now...")}
	if room==r_building_floor_3{ draw_text(o_player.x-25,o_player.y-30,"I can open my eyes now...")}
	if room==r_building_floor_4{ draw_text(o_player.x-25,o_player.y-30,"I can open my eyes now...")}
	if room==r_building_floor_6{ draw_text(o_player.x-25,o_player.y-30,"I can open my eyes now...")}
	if room==r_building_floor_7{ draw_text(o_player.x-25,o_player.y-30,"I can open my eyes now...")}
}







	