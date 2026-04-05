if start==true && timer>0
{
	anim++
	if anim>=10 {anim=0; frame++}
	timer--
	if size<500 {size+=5}
	o_player.state="none"
	o_player.image_speed=0
	image_speed=1
	draw_set_alpha(0.7)
	draw_circle_colour(o_player.x,o_player.y,size,c_black,c_black,false)
	alpha_to = lerp(alpha_to,1,0.1)
	draw_set_alpha(alpha_to)
	draw_sprite(s_tutorial_1,frame,o_player.x+sprite_width/2,o_player.y-100)
	draw_set_alpha(1)
}
if timer==0 && start==true
{	
	anim++
	if anim>=10 {anim=0; frame++}
	if size==500 {audio_play_sound(x_hint_leave,0,false,1,0,1)}
	if size>0 {size-=5}
	draw_set_alpha(0.7)
	draw_circle_colour(o_player.x,o_player.y,size,c_black,c_black,false)
	
	alpha_to = lerp(alpha_to,0,0.1)
	draw_set_alpha(alpha_to)
	draw_sprite(s_tutorial_1,frame,o_player.x+sprite_width/2,o_player.y-100)
	draw_set_alpha(1)
	if size<4
	{
		save_game.save_struc.tutorial_done=1
		save_game.save=true
		timer=-1
		start=false
		o_player.image_speed=1
		o_player.state="move"
	}
}