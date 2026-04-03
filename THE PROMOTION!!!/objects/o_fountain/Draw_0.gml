draw_self()

var dis = point_distance(o_player.x,o_player.y,x+sprite_width/2,y+sprite_height/2)

if dis<100 
{
	var amt = 1-dis/100
		
	draw_set_alpha(amt)
	draw_sprite(s_fountain_ovl,0,x,y)
	draw_set_alpha(1)
}

if place_meeting(x,y,o_player)
{	
	if timer<50 {timer++}
	if timer==50
	{	
		alpha_draw=lerp(alpha_draw,1,0.1)
	}
	
	if keyboard_check_pressed(ord("E"))
	{
		o_player.state="animate"
	}
	if o_player.state=="animate"
	{
		timer=0
		
		draw_text(x+sprite_width/2,y-10,"Throw a Coin?\n Y / N ")
		if keyboard_check_pressed(ord("N")) {o_player.state="move"}
		else if keyboard_check_pressed(ord("Y"))
		{
			o_player.state="animate"
			yes=true
		}
		if place_meeting(x,y,o_player) && yes=true
		{
			if o_player.sprite_index!=s_player_throw_coin
			{
				o_player.sprite_index=s_player_throw_coin
				o_player.image_index=0
				o_player.image_xscale=1
				o_player.image_speed=0.5
			}
			
			if o_player.sprite_index=s_player_throw_coin
			{
				camera.zoom_val=lerp(camera.zoom_val,4,0.1)
			}
			
			
			if o_player.image_index>=o_player.image_number-0.5 && o_player.sprite_index==s_player_throw_coin
			{
				camera.zoom_val=camera.defalut_zoom_val
				state="move"	
				var rnd = irandom(20)
				if rnd==0 {url_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ&list=RDdQw4w9WgXcQ&start_radio=1")}
				show_debug_message(rnd)
				o_player.state="move"
				o_player.sprite_index=s_player_idle_m
				yes=false
			}
		}
	}
}
else 
{
	timer=0
	alpha_draw=0
}