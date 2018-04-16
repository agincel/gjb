///@argument path the path to the json file starting from /IncludedFiles as a string

show_debug_message(argument0);
var theJsonFile = file_text_open_read(argument0);
var theData = "";
while (!file_text_eof(theJsonFile)) {
    theData += file_text_read_string(theJsonFile);
    file_text_readln(theJsonFile);
}
file_text_close(theJsonFile);
var theJsonMap = json_decode(theData);
var theList = ds_map_find_value(theJsonMap, "default");

var ret = -1;
ret[0] = theList;
ret[1] = theJsonMap;

return ret;