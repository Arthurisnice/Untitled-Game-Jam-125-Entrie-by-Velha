var player_side = x+sprite_width/2>o_player.x? 1:-1;

if place_meeting(x,y,o_player) {o_player.x-=player_side}