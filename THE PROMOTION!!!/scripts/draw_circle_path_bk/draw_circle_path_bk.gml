function draw_circle_path_bk(path_x,path_y,path_x2,path_y2)
{

	var c_lightgray = make_colour_rgb(120,120,120)

	draw_line_width_colour(path_x,path_y,path_x2,path_y2,5,c_dkgray,c_dkgray)
	draw_circle_colour(path_x,path_y,5/2,c_dkgray,c_dkgray,false)
	draw_circle_colour(path_x2,path_y2,5/2,c_dkgray,c_dkgray,false)
	

}