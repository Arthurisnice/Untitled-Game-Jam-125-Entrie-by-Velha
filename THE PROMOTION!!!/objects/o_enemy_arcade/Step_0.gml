if sprite_index=s_arcade_enemy
{
	image_speed=0
	image_index=irandom(2)
	score_arc+=2
}

if score_arc>=1000
{
	score_arc=1000
	sprite_index=s_arcade_enemy_show
	image_speed=1
	o_player_arcade.timer=-1
}