if o_player.bbox_left>256
{
	house_alpha=lerp(house_alpha,1,0.1)
	draw_set_alpha(house_alpha)
	draw_sprite(s_house_siding,0,0,192)	
}
else if house_alpha>0
{
	house_alpha=lerp(house_alpha,0,0.1)
	draw_set_alpha(house_alpha)
	draw_sprite(s_house_siding,0,0,192)	
}
	draw_set_alpha(1)