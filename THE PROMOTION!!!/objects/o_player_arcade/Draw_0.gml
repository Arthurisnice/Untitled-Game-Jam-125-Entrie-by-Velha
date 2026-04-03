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
	draw_text(x+sprite_width/2,y-30,round(timer/60))
}

if color!=c_white {color=c_white}