if save==true
{
	save=false
	
	var struct_json = json_stringify(save_struc,false)
	
	var my_file_save = (game_save_id+"save.txt")
	
	if keyboard_check(vk_up) {var text = get_save_filename_ext(".txt","",game_save_id,"Save a song")}
	
	show_debug_message("File saved to: " + string(my_file_save))
	
	var _file = file_text_open_write(my_file_save)
	file_text_write_string(_file, struct_json)
	file_text_close(_file)
}

if keyboard_check_pressed(ord("F")) && window_get_fullscreen()==false
{
	window_set_fullscreen(true)
}
else if keyboard_check_pressed(ord("F")) && window_get_fullscreen()==true
{
	window_set_fullscreen(false)
}