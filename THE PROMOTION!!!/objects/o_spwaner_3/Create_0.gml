spin=irandom(1)==1? 7+random(3): -7-random(3) ;
grv=0.07
terminal=10-1+random(2)
spd=0
 _color = [
    c_aqua,
    c_black,
    c_blue,
    c_dkgray,
    c_fuchsia,
    c_gray,
    c_green,
    c_lime,
    c_ltgray,
    c_maroon,
    c_navy,
    c_olive,
    c_orange,
    c_purple,
    c_red,
    c_silver,
    c_teal,
    c_white,
    c_yellow
];

my_color = _color[irandom(array_length(_color)-1)]