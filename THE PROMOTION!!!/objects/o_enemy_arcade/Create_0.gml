image_speed=1
score_arc=0
my_sprite=sprite_index
org_depth=depth

timer=0
alpha_draw=1
img_spd=0
img_ind=0
yes=false
array_pos=-1
scribble_font_set_default("real_small")
my_typist = scribble_typist()
my_typist.in(0.5, 0)

circle_alpha=0
met=false
sqr_size=40
won=false

scribble_anim_blink(60, 60, 30)
scribble_anim_wave(1, 0.5, 0.1)
square_height=screen_y+screen_height+100

my_typist.sound_per_char(x_man_talk, 0.9, 1.1)

text_arr_1=["Hey![delay,1000], you...","If you wanna get past me you gotta beat me in[delay,100].[delay,100].[delay,100].\n[wave][rainbow]DANCE[delay,500] DANCE[delay,500] REVOLTION[delay,500] 3000![delay,100]![delay,200]![delay,500]![delay,1000]![rainbow][/wave]","[delay,1000]Yes this is nessecery!"]
text_arr_2=["Why are you still here?","GO FIGHT ME (in game of corse)"]
text_arr_3=["HAHA[delay, 400] i[delay, 500] [shake]W[delay, 50]O[delay, 50]N[/]","Only way for you to beat me now is to go back in time or something..."]
text_arr_4=["[delay, 500].[delay, 500].[delay, 500]."]
dialogue=text_arr_1