if timer==0
{
	timer=irandom(80)+20
	var choose_ = irandom(1)
	if choose_==0
	{
		var x_ = -90
		var y_ = room_height/2+random(50)-100
		var cloud = instance_create_depth(x_,y_,depth+irandom(6)-3,o_cloud)
	}
	else
	{
		var x_ = room_width+90
		var y_ = room_height/2+random(50)-100
		var cloud = instance_create_depth(x_,y_,depth+irandom(6)-3,o_cloud)	
		cloud.mult=-1
	}
}

if timer>0 {timer--}