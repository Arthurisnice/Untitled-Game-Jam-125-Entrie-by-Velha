if spd<terminal {spd+=grv}

y+=spd

image_angle+=spin

if place_meeting(x,y+spd,o_wall)
{
	audio_play_sound(x_explosion,0,false,1+rand/5,0,1+rand)	
	instance_create_depth(x,y+sprite_width/2,depth,o_explosion_1)
	instance_destroy()
}