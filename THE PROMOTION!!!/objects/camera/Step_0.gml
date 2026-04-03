var zoom = 1/zoom_val

var follow_x = follow.x
var follow_y = follow.y
if o_player.state="rewind"
{
	var dis = point_distance(follow.x,follow.y,mouse_x,mouse_y)/2
	dis = clamp(dis,0,150)
	var dir = point_direction(follow.x,follow.y,mouse_x,mouse_y)
	follow_x = follow.x+lengthdir_x(dis,dir)
	follow_y = follow.y+lengthdir_y(dis,dir)
}


var view_wid = view_wport[0]*zoom
var view_hei = view_hport[0]*zoom

x=lerp(x,follow_x,0.15)
y=lerp(y,follow_y,0.15)

view_enabled = true;
view_visible[0] = true;

view_camera[0] = camera_create_view(0, 0, view_wid, view_hei);

var cam_x  = x-view_wid/2
var cam_y = y-view_hei/2

cam_x=clamp(cam_x,0,room_width-view_wid)
cam_y=clamp(cam_y,0,room_height-view_hei)


camera_set_view_pos(view_camera[0],cam_x,cam_y)