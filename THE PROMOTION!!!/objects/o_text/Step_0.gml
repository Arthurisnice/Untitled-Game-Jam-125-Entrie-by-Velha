	rew_timer += rew_frequency;
	
	var osc = dsin(rew_timer) * rew_amplitude;
	
	image_xscale=calc/(1+osc/2)
	image_yscale=calc/(1+osc/2)

