previus_v_spd=mov_v_spd

if loading_in_timer<=0
{
	room_timer++
}

if keyboard_check(ord("C")) or mouse_check_button(mb_left)
{
	with(o_cursor)
	{
		if !place_meeting(x,y,o_menu_button) && !place_meeting(x,y,o_restart_button)
		{
			o_player.click=true
		}
	}
	
}
else
{
	click=false
}

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
	var box_push = instance_nearest(x,y,o_pushable_block)
	
	if place_meeting(x,y+2,o_wall) or (place_meeting(x,y+2,o_pushable_block) && box_push.y>bbox_bottom)  {in_air=false; coyote_t=coyote_max_t}

		if keyboard_check_pressed(ord("W")) && jump_timer==0 && in_air==false
		{
			var rand = random(0.8)-0.4
			audio_play_sound(x_jump,0,false,1,0,1+rand)
			jump_timer=15
			mov_v_spd=-jump_spd
			on_box=false
		}
		if jump_timer>0 {jump_timer--}
	
		//Box Moving Code
	//________________	
		
				
				
		//Movment Speed Calculations
	//________________
	target_sdp = (h_spd*h_mov)*spd_mult
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
		
		
		
		if place_meeting(x+mov_h_spd,y,o_wall) or (place_meeting(x+mov_h_spd,y,o_pushable_block) && box_push.touching==true)
		{
			on_wall=true
			mov_h_spd=0
		}
		else {on_wall=false}
		
		//Main Movment Code
	//________________
	
		if on_box==true {mov_v_spd=0}
				
		x+=mov_h_spd
		y+=mov_v_spd

		//vertical Check
	//________________		
		
		
		if place_meeting(x,y+1,o_wall) or (place_meeting(x,y+2,o_pushable_block) && box_push.y>bbox_bottom) {in_air=false; coyote_t=coyote_max_t}
		else 
		{
			if coyote_t>0 {coyote_t--}
			if coyote_t<=0 {in_air=true}
		}


		if place_meeting(x,y+mov_v_spd+1,o_wall) or (place_meeting(x,y+mov_v_spd+2,o_pushable_block) && box_push.y>bbox_bottom)  {mov_v_spd=0;}
		else
		{
			if mov_v_spd<terminal_vel {mov_v_spd+=grv_streng}
		}
		
	
	
		
		
		//Animation Handler
	//________________
		
		if h_mov!=0 {image_xscale=h_mov}
		if round(mov_h_spd)!=0 && in_air==false
		{ 
			if sprite_index!=s_player_walk {sprite_index=s_player_walk}	
			image_speed=abs(mov_h_spd/h_spd)
			if image_speed==0{image_index=0}
			rando_timer=500+irandom(300)
			idle_play=false
		}
		if round(mov_h_spd)==0 && in_air==false
		{	
			image_speed=1
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
		if click==true
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
		
		camera.zoom_val=lerp(camera.zoom_val,camera.defalut_zoom_val,0.05)
	
	
	}
	break;
	
	case "rewind":
	{
		
		if click==true
		{
			//zooms in the camera slowly
				camera.zoom_val=lerp(camera.zoom_val,4,0.05)
			
				if image_index>=image_number-1 && sprite_index=s_player_mind_start
				{
					sprite_index=s_player_mind_1
				}
		
			//Jump Speed Code 2
		//________________	
			var box_push = instance_nearest(x,y,o_pushable_block)
	
			if place_meeting(x,y+2,o_wall) or (place_meeting(x,y+2,o_pushable_block) && box_push.y>bbox_bottom)  {in_air=false; coyote_t=coyote_max_t}

		
			if keyboard_check_pressed(ord("W")) && in_air==false && jump_timer==0
			{
				var rand = random(0.8)-0.4
				audio_play_sound(x_jump,0,false,1,0,0.8+rand)
				var temp_jump_amt = 3
				jump_timer=30
				mov_v_spd=-temp_jump_amt
				on_box=false
			}
			if jump_timer>0 {jump_timer--}
		
		
			//Movent speed Calc 2
		//________________
			var h_mov = (keyboard_check(ord("D"))-keyboard_check(ord("A")))
			
			if h_mov!=0 {image_xscale=h_mov}
		
			var temp_h_spd=0.5
			
			target_sdp = temp_h_spd*h_mov
			var lerp_amt = 0.05
			if mov_h_spd!=target_sdp
			{
				mov_h_spd=lerp(mov_h_spd,target_sdp,lerp_amt)
			}
			//horizontal Check 2
		//________________
		
		
			var sprite_w = (bbox_right - bbox_left + 1)/2 
			var sprite_h = (bbox_bottom - bbox_top + 1)/2
		
			if place_meeting(x+mov_h_spd,y,o_wall) or (place_meeting(x+mov_h_spd,y,o_pushable_block) && box_push.touching==true)
			{
				on_wall=true
				mov_h_spd=0
			}
			else {on_wall=false}
		
			//Main Movment Code 2
		//________________
		
			if on_box==true {mov_v_spd=0}	
			
			x+=mov_h_spd
			y+=mov_v_spd
			
			//vertical Check 2
		//________________			
			
			
			if place_meeting(x,y+2,o_wall) or (place_meeting(x,y+2,o_pushable_block) && box_push.y>bbox_bottom)  {in_air=false; coyote_t=coyote_max_t}
			else 
			{
				if coyote_t>0 {coyote_t--}
				if coyote_t==0 {in_air=true}
			}
			
			if place_meeting(x,y+mov_v_spd+1,o_wall) or (place_meeting(x,y+mov_v_spd+1,o_pushable_block) && box_push.y>bbox_bottom) {mov_v_spd=0}
			else
			{
				var temp_term = 3
				var temp_grv = 0.1
				if mov_v_spd<temp_term {mov_v_spd+=temp_grv}
			}
			
		}
		else {state = "move"; sprite_index=s_player_idle_m}
		
		
		
	}
	break;
	
	case "idle":
	{
		image_speed=1
		sprite_index=s_player_idle_m
	}
	break;
	
	case "animate":
	{
		
	}
	break;
	
	case "none":
	{
		
	}
	break;
} 




if keyboard_check_pressed(ord("R")) {room_restart()}

