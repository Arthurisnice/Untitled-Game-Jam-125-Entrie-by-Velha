save=false
cursor_sprite=s_cursor
window_set_cursor(cr_none)
window_set_fullscreen(true)
save_struc=
{
	levels_unlcokd:0,
	tutorial_done:0
}

if file_exists(game_save_id+"save.txt")
{
	var _loaded_file = file_text_open_read(game_save_id+"save.txt");
	var _temp_vbuff_list = "";
	    while (!file_text_eof(_loaded_file))
	    {
	        _temp_vbuff_list += file_text_read_string(_loaded_file);
	        file_text_readln(_loaded_file);
	    }
	    file_text_close(_loaded_file);    delete(_loaded_file);

		var text = json_parse(_temp_vbuff_list)
		save_struc.levels_unlcokd=text.levels_unlcokd
		save_struc.tutorial_done=text.tutorial_done
}
