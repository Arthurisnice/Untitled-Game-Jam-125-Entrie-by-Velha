

if ok==false
{
	y= lerp(y,org_y,0.1)
	if y<org_y+1
	{
		y=org_y
		ok=true
	}
}
else
{
	rew_timer += rew_frequency;
	
	var osc = y+dsin(rew_timer) * rew_amplitude;
	
	y=osc
}

