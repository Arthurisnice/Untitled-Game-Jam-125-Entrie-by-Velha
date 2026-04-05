if room==r_menu 
{
	camera.zoom_val=2.5
	draw_set_alpha(0.5)
	draw_set_colour(c_black)
	draw_rectangle(screen_x,screen_y,screen_x+screen_width,screen_y+screen_height,false)
	draw_set_colour(c_white)
	draw_set_alpha(1)
}

draw_text(mouse_x,mouse_y,"")