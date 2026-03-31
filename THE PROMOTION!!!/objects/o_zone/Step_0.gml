if o_player.state=="rewind" && mouse_check_button(mb_right)
{
	x=o_player.coll_x
	y=o_player.coll_y
}

else 
{
	x=-100
	y=-100
	
}

depth=o_player.depth+20