if spd<terminal {spd+=grv}

y+=spd

image_angle+=spin

if place_meeting(x,y+spd,o_wall)
{
	instance_create_depth(x,y+sprite_width/2,depth,o_explosion)
	instance_destroy()
}