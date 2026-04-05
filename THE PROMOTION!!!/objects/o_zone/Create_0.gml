my_path=path_add()
path_p_1 = path_add_point(my_path,x,y,100)
path_p_2 = path_add_point(my_path,x,y,100)
path_p_3 = path_add_point(my_path,x,y,100)
path_p_4 = path_add_point(my_path,x,y,100)

path_set_closed(my_path, false);
path_set_kind(my_path,1)

path_set_precision(my_path,8)

_x=x
_last_x_1=0
_last_x_2=0
_last_x_3=0
	
_y=y
_last_y_1=0
_last_y_2=0
_last_y_3=0