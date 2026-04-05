function draw_box(boolean,sqr_size=40){
static square_height=screen_y+screen_height+sqr_size
if boolean==true
{
	square_height=screen_y+screen_height-sqr_size
	var c_lightgray = make_colour_rgb(120,120,120)
	draw_rectangle_colour(screen_x,square_height,screen_x+screen_width,square_height+sqr_size,c_black,c_black,c_black,c_black,false)
	draw_rectangle_colour(screen_x,square_height,screen_x+screen_width,square_height+sqr_size,c_lightgray,c_lightgray,c_lightgray,c_lightgray,true)
}
{
	square_height=screen_y+screen_height+sqr_size
}

return square_height;

}