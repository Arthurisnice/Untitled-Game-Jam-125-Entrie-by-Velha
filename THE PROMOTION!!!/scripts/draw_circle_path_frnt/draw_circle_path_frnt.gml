function draw_circle_path_frnt(path_x,path_y,path_x2,path_y2)
{

	var c_lightgray = make_colour_rgb(120,120,120)

	draw_line_width_colour(path_x,path_y,path_x2,path_y2,3,c_lightgray,c_lightgray)
	draw_circle_colour(path_x,path_y,3/2,c_lightgray,c_lightgray,false)
	draw_circle_colour(path_x2,path_y2,3/2,c_lightgray,c_lightgray,false)
	

}