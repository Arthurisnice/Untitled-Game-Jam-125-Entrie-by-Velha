var enm = clamp(o_enemy_arcade.score_arc,0,10000)
draw_sprite(sprite_index,image_index,org_x,org_y)
if o_enemy_arcade.score_arc>o_player_arcade.score_arc && o_player_arcade.timer!=-2
{
	draw_sprite(s_crown,0,o_enemy_arcade.x+19,y-18)
}
else if o_player_arcade.timer!=-2 && o_enemy_arcade.sprite_index=s_arcade_enemy_show
{
	draw_sprite(s_crown,0,o_player_arcade.x+18,o_player_arcade.y-1)
	
}

if o_enemy_arcade.score_arc<0 {	o_enemy_arcade.dialogue=o_enemy_arcade.text_arr_4}