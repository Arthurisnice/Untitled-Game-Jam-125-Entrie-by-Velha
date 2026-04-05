if o_player.loading_in_timer<=0
{
	if timer==0
	{
		timer=5
		var _x = start_x+irandom(end_x-start_x)
		var _y  = y+5-irandom(10)
		var choice = irandom(array_length(array_things)-1)
		instance_create_depth(_x,_y,depth,array_things[choice])
	}

	if timer>0 {timer--}
}