if o_player.state=="rewind" && mouse_check_button(mb_right)
{
	visible=true
	x=o_player.rewind_x
	y=o_player.rewind_y
	image_xscale=o_player.rewind_scale
	image_angle=o_player.rewind_rot
	var dist = point_distance(o_player.rewind_x,o_player.rewind_y,o_player.rew_prev_x,o_player.rew_prev_y)
		
		
		for (i=0;i<dist;i++)
		{
			var amt = i/dist
			
			var new_x = lerp(o_player.rew_prev_x,o_player.rewind_x,amt)
			var new_y = lerp(o_player.rew_prev_y,o_player.rewind_y,amt)
			o_player.coll_x=new_x
			o_player.coll_y=new_y
			
			instance_create_depth(new_x,new_y,depth+2,o_ball)
		}
}

else 
{
	visible=false
	x=o_player.x
	y=o_player.y
	o_player.rew_prev_x=x
	o_player.rew_prev_y=y
}