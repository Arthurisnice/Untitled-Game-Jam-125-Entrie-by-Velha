draw_self()
var room_id = string_replace(room_get_name(room),"r_building_floor_","")-1
draw_sprite(s_elevator_lever,room_id,x,y)