if o_player.state=="rewind" && o_player.click==true
{
	
	visible=true
	x=o_player.rewind_x
	y=o_player.rewind_y
	image_xscale=o_player.rewind_scale
	image_angle=o_player.rewind_rot
	var dist = point_distance(o_player.rewind_x,o_player.rewind_y,o_player.rew_prev_x,o_player.rew_prev_y)	

	
	var amt=0.2
	
	_last_x_1=lerp(_last_x_1,x,amt)
	_last_x_2=lerp(_last_x_2,_last_x_1,amt)
	_last_x_3=lerp(_last_x_3,_last_x_2,amt)
	
	_last_y_1=lerp(_last_y_1,y,amt)
	_last_y_2=lerp(_last_y_2,_last_y_1,amt)
	_last_y_3=lerp(_last_y_3,_last_y_2,amt)
	
	
	path_change_point(my_path,0,x,y,100)
	path_change_point(my_path,1,_last_x_1,_last_y_1,100)
	path_change_point(my_path,2,_last_x_2,_last_y_2,100)
	path_change_point(my_path,3,_last_x_3,_last_y_3,100)

	

	
}
else 
{
	visible=false
	x=o_player.x
	y=o_player.y
	o_player.rew_prev_x=x
	o_player.rew_prev_y=y
	_x=o_player.x
	_last_x_1=o_player.x
	_last_x_2=o_player.x
	_last_x_3=o_player.x
	
	_y=o_player.y
	_last_y_1=o_player.y
	_last_y_2=o_player.y
	_last_y_3=o_player.y
}
