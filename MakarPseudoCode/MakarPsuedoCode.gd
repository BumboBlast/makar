extends Node


# keep track of "if its trying to execute"
var running_mutex_lock: bool = false
var editor_code: String



# pass the editor content to makar
func set_editor_code(content: String):
	editor_code = content




# attempt to resolve the syntax, and begin updating the display
# push each line onto a buffer. 
# If mutex_lock, then dont read. Otherwise start over
func _on_GUI_try_execute():
	try_execute()
func try_execute():
	print( " trying to run the cod e ")
	if (running_mutex_lock):
		pass
	
	pass




# return a token array for each line 
func get_lines():
	pass
