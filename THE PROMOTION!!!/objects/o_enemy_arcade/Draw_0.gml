
if sprite_index==s_arcade_enemy
{
	draw_self()
	
	draw_set_font(real_tiny)
	draw_text(x+sprite_width/2+1,y+14,score_arc)
	draw_set_font(real_small)	
}
else if sprite_index=s_arcade_enemy_show
{	
	draw_sprite(s_arcade_enemy_won,image_index,x,y)
	draw_self()
	
	draw_set_font(real_tiny)
	draw_set_colour(c_white)
	draw_text(x+20,y+14,score_arc)
	draw_set_font(real_small)	
	
	
	
	if place_meeting(x,y,o_zone) && score_arc>-998
	{
		image_index=1
		image_speed=0
		score_arc-=2
	}
	else {image_speed=1}
	
}
else {draw_self()}

draw_set_font(real_small)
