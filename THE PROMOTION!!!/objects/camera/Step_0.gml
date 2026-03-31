var zoom = 1/zoom_val

var view_wid = view_wport[0]*zoom
var view_hei = view_hport[0]*zoom

x=lerp(x,follow.x,1)
y=lerp(y,follow.y,1)

view_enabled = true;
view_visible[0] = true;

view_camera[0] = camera_create_view(0, 0, view_wid, view_hei);

var cam_x  = x-view_wid/2
var cam_y = y-view_hei/2

cam_x=clamp(cam_x,0,room_width-view_wid)
cam_y=clamp(cam_y,0,room_height-view_hei)


camera_set_view_pos(view_camera[0],cam_x,cam_y)