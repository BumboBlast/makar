extends TextEdit




func _ready():
	add_keyword_color("make", ColorN("lightblue"))
	add_keyword_color("array", ColorN("lightblue"))
	add_keyword_color("step", ColorN("lightblue"))
	pass



func push_code():
	var editor_content: Array
	for line_number in range(0, get_line_count()):
		editor_content.append(get_line(line_number))
	
	get_tree().get_root().get_node("Application/MakarPsuedoCode").set_editor_code(editor_content)
	get_tree().get_root().get_node("Application/GUI").emit_signal("try_execute")


func _on_Button_pressed():
	push_code()
