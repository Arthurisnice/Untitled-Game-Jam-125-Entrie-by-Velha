if place_meeting(x,y,o_player) && start=false && timer==0 && save_game.save_struc.tutorial_done<1 {start=true; timer=5*60; audio_play_sound(x_hint_give,0,false,1,0,1)}
if place_meeting(x,y,o_player) {depth=o_fountain.depth-1; o_flower.depth=depth-1}
else {depth=o_fountain.depth+2; o_flower.depth=depth-1}