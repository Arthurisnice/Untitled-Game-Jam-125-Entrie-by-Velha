var random_n = irandom(5)
var rand = random(1)-0.5
if random_n==0
{
	audio_play_sound(x_explosion,0,false,1+rand/5,0,1+rand)	
}
instance_destroy()