var dis = point_distance(o_player.x,o_player.y,x+sprite_width/2,y+sprite_height/2)

if dis<100 && timer==-2 && o_enemy_arcade.dialogue==o_enemy_arcade.text_arr_2
{
	var amt = 1-dis/100
		
	draw_set_alpha(amt)
	draw_sprite(s_arcade_base_out,0,x,y)
	draw_set_alpha(1)
}

draw_self()
draw_set_font(real_tiny)
if sprite_index = s_arcade_yours
{
	draw_set_colour(color)
	draw_text(x+sprite_width/2,y+10,score_arc)
	draw_set_colour(c_white)
}
draw_set_font(real_small)

if timer>0
{		
	var amt = (5-round(timer/60))/10

	
	if round(past_timer)!=round(timer/60) {if !audio_is_playing(x_timer_tick){audio_play_sound(x_timer_tick,1,false,1,0,1+amt)}}
}
past_timer=(timer-5)/60

if txt_timer>0 {txt_timer--}
if color!=c_white && txt_timer==0 {color=c_white}