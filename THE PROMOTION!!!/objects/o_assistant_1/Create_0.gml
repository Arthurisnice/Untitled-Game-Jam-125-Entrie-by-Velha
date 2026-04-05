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

scribble_anim_blink(60, 60, 30)

square_height=screen_y+screen_height+100

my_typist.sound_per_char(x_receptionist_talk, 0.9, 1.1)

text_arr_1=["Hi! Welcome to Buss...","[delay, 500].[delay, 500].[delay, 500].","Oh! And whats your name again??","I see i see, your intervew just started.","It's on the sixth floor.","Go quicklly!"]
text_arr_2=["Your gonna be late."]
dialogue=text_arr_1

