if o_start_button.select_level==false
{
	timer++
	if timer>=20
	{
		timer=0
		color_id++
	}
	
	if color_id>array_length(color)-1 {color_id=0}
	
	var ghost = instance_create_depth(x,y,depth+1,o_title_ghost)
	ghost.image_xscale=image_xscale
	ghost.image_yscale=image_yscale
	ghost.my_color = color[color_id]
	draw_self()
}