function scr_file_exists_init(in_root_path, out_paths_map) //gml_GlobalScript_scr_file_exists_stuff
{
	// do nothing for synchronous IO platforms
    if (!global.is_console) {
        return undefined;
    }
	// for a root call this will be undefined
    if (is_undefined(out_paths_map)) {
        if (!variable_global_exists("file_map")) {
            global.file_map = ds_map_create();
		} else {
            return global.file_map;
		}
        out_paths_map = global.file_map;
    }
    // on Switch, file_find_* returns both directories and files!
    var dirslist = 0, dirsidx = 0, name = file_find_first(in_root_path + "*", 0);
    while (name != "") {
        var pathname = in_root_path + name;
		// is this a directory? will need to look into it as well
        if (directory_exists(pathname)) {
            dirslist[dirsidx++] = pathname + "/";
		} else {
            ds_map_add(out_paths_map, pathname, true);
		}
        name = file_find_next();
    }
    file_find_close();
    // recursively enumerate all nested directories within the given path
    while (dirsidx > 0) {
        scr_file_exists_init(dirslist[--dirsidx], out_paths_map);
    }
	// returns the map where the paths have been written to
    return out_paths_map;
}

// mimics the file_exists function but fixes a bug in the LTS Deltarune Switch runner
function scr_file_exists(fname) //gml_GlobalScript_scr_file_exists_stuff
{
	// pass-through for synchronous IO platforms
	if (!global.is_console) {
		return file_exists(fname);
	}
	// this map must've been populated by scr_file_exists_init before
	// only check if the value isn't undefined (must be a boolean true)
	return !is_undefined(ds_map_find_value(global.file_map, fname));
}

// replaces all non-ASCII characters in a string with string(ord(CHAR))
function scr_letter_fix(test_asset_name) {
	var slen = string_length(test_asset_name), sidx = 1, sord = 0, schr = "", uniname = "";
	repeat (slen) {
		schr = string_char_at(test_asset_name, sidx++);
		sord = ord(schr);
		if (sord < 128) uniname += schr;
		else uniname += string(sord);
	}
	return uniname;
}

// ok, this is a wild one,
// Deltarune's LTS runner is using game_restart(),
// game_restart() keeps Switch savedata mounted,
// all functions that load videos, sprites, fonts, etc,
// have been swapped to use the ROM path first, but not buffer_load() !
function scr_buffer_load(test_file_name) {
	if (!global.is_console) {
		return buffer_load(test_file_name);
	}
	
	if (!variable_global_exists("buffer_cache_map")) {
		global.buffer_cache_map = ds_map_create();
	}
	
	var test_buf = -1;
	var test_base64 = ds_map_find_value(global.buffer_cache_map, test_file_name);
	if (is_string(test_base64)) {
		test_buf = buffer_base64_decode(test_base64);
	} else {
		test_buf = buffer_load(test_file_name);
		ds_map_add(global.buffer_cache_map, test_file_name, buffer_base64_encode(test_buf, 0, buffer_get_size(test_buf)));
	}
	
	buffer_seek(test_buf, buffer_seek_start, 0);
	return test_buf;
}
