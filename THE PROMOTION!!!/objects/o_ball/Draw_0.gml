image_xscale-=0.025
draw_set_alpha(0.1)
draw_set_colour(c_purple)
draw_circle(x,y,image_xscale,false)
draw_set_alpha(1)
if image_xscale<=0 {instance_destroy()}	