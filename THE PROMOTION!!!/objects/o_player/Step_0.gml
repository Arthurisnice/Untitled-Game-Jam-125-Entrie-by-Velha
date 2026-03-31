//STATE MACHINE

switch (state)
{
	case "move":
	{
		//Side Temp Variables
	//________________
		var h_mov = (keyboard_check(ord("D"))-keyboard_check(ord("A")))
		//var v_mov = (keyboard_check(ord("S"))-keyboard_check(ord("W")))
	

		//Jump Speed Code
	//________________	
		if keyboard_check_pressed(ord("W")) && jump_timer==0 && in_air==false
		{
			jump_timer=15
			mov_v_spd=-jump_spd
		}
		if jump_timer>0 {jump_timer--}
	

	
		//Movment Speed Calculations
	//________________
	var target_sdp = h_spd*h_mov
	var lerp_amt = 0.15
	if mov_h_spd!=target_sdp
	{
		mov_h_spd=lerp(mov_h_spd,target_sdp,lerp_amt)
	}

		//mov_v_spd=v_spd*v_mov
		
		//horizontal Check
	//________________
		var sprite_w = (bbox_right - bbox_left + 1)/2 
		var sprite_h = (bbox_bottom - bbox_top + 1)/2
		
		if place_meeting(x+mov_h_spd,y,o_wall)
		{
			mov_h_spd=0
		}
		
		//Main Movment Code
	//________________
		x+=mov_h_spd
		y+=mov_v_spd

		//vertical Check
	//________________		

		if place_meeting(x,y+1,o_wall) {in_air=false; coyote_t=coyote_max_t}
		else 
		{
			if coyote_t>0 {coyote_t--}
			if coyote_t<=0 {in_air=true}
		}


		if place_meeting(x,y+mov_v_spd+1,o_wall) {mov_v_spd=0}
		else
		{
			if mov_v_spd<terminal_vel {mov_v_spd+=grv_streng}
		}
		if place_meeting(x,y-1,o_wall) {y++}
	
	
		
		
		//Animation Handler
	//________________
		
		if h_mov!=0 {image_xscale=h_mov}
		if mov_h_spd!=0 && in_air==false
		{ 
			if sprite_index!=s_player_walk {sprite_index=s_player_walk}	
			image_speed=(mov_h_spd/h_spd)
			rando_timer=500+irandom(300)
			idle_play=false
		}
		if mov_h_spd==0 && in_air==false
		{	
			if sprite_index==s_player_walk || sprite_index==s_player_falling {sprite_index=s_player_idle_m}	
			if rando_timer>0 && idle_play==false {rando_timer--;}
			else if rando_timer==0 && idle_play==false
			{				
				rando_timer=irandom(1000)
				rando_nmb=irandom(3)
				idle_play=true
			}
			
			if idle_play==true
			{		
				switch (rando_nmb)
				{
					case 0: sprite_index=s_player_idle_1 
						break;
					case 1: sprite_index=s_player_idle_2 
						break;
					case 2: sprite_index=s_player_idle_3 
						break;
					case 3: sprite_index=s_player_idle_m
						break;
				}
			}
		
			
			if idle_play==true && image_index>=sprite_get_number(sprite_index)-0.5
			{
				idle_play=false
				sprite_index=s_player_idle_m				
			}
		}
		
		if mov_v_spd>2 {sprite_index=s_player_falling}

		if mov_v_spd<0 {sprite_index=s_player_jump}
		
			//Rewind start Code:
	//________________	
		if mouse_check_button_pressed(mb_right)
		{
			state="rewind"
			sprite_index=s_player_mind_start
			image_index=0
			image_speed=1
			mov_v_spd=0
			mov_h_spd=0
			rewind_rot=0
			rewind_scale=0
			rewind_x=x
			rewind_y=y
			rew_start_y = rewind_y;
			rewind_rand=irandom(1)==1? 1: -1;
		}
		
		camera.zoom_val=lerp(camera.zoom_val,2,0.1)
	}
	break;
	
	case "rewind":
	{
		if mouse_check_button(mb_right)
		{
			//zooms in the camera slowly
				camera.zoom_val=lerp(camera.zoom_val,4,0.1)
			
				if image_index>=image_number-1 && sprite_index=s_player_mind_start
				{
					sprite_index=s_player_mind_1
				}
		
			//Jump Speed Code 2
		//________________	
			if keyboard_check_pressed(ord("W")) && in_air==false && jump_timer==0
			{
				var temp_jump_amt = 1
				jump_timer=30
				mov_v_spd=-temp_jump_amt
			}
			if jump_timer>0 {jump_timer--}
		
		
			//Movent speed Calc 2
		//________________
			var h_mov = (keyboard_check(ord("D"))-keyboard_check(ord("A")))
		
			var temp_h_spd=0.5
			
			var target_sdp = temp_h_spd*h_mov
			var lerp_amt = 0.05
			if mov_h_spd!=target_sdp
			{
				mov_h_spd=lerp(mov_h_spd,target_sdp,lerp_amt)
			}
			//horizontal Check 2
		//________________
			var sprite_w = (bbox_right - bbox_left + 1)/2 
			var sprite_h = (bbox_bottom - bbox_top + 1)/2
		
			if place_meeting(x+mov_h_spd,y,o_wall)
			{
				mov_h_spd=0
			}
		
			//Main Movment Code 2
		//________________
			x+=mov_h_spd
			y+=mov_v_spd
			
			//vertical Check 2
		//________________			
			
			if place_meeting(x,y+1,o_wall) {in_air=false; coyote_t=coyote_max_t}
			else 
			{
				if coyote_t>0 {coyote_t--}
				if coyote_t==0 {in_air=true}
			}
			
			if place_meeting(x,y+mov_v_spd+1,o_wall){mov_v_spd=0}
			else
			{
				var temp_term = 0.5
				var temp_grv = 0.01
				if mov_v_spd<temp_term {mov_v_spd+=temp_grv}
			}
			if place_meeting(x,y-1,o_wall) {y++}
			
		}
		else {state = "move"; sprite_index=s_player_idle_m}
		
		
	}
	break;
	
	case "idle":
	{
		
	}
	break;
} 




