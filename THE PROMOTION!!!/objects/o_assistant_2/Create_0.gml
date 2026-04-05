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

text_arr_1=["[delay,500]!","Oh wow! Y-[delay, 500]you actually made it...?","I MEAN congratulations, you just passed the interview!","Yes that was all a test ;]","Well i guess you deserve the position now!","You start tomorow!","Be here 6am sharp!"]
text_arr_2=["Your free to leave."]
dialogue=text_arr_1
