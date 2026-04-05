if sprite_index=s_arcade_enemy
{
	image_speed=0
	image_index=irandom(3)
	score_arc++
}

if score_arc>=1000 && sprite_index!=s_arcade_enemy_show
{
	won=true
	dialogue=text_arr_3
	score_arc=1000
	sprite_index=s_arcade_enemy_standby
	image_speed=1
	o_player_arcade.timer=-1
}