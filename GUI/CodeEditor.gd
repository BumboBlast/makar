extends TextEdit




func _ready():
	add_keyword_color("make", ColorN("lightblue"))
	add_keyword_color("array", ColorN("lightblue"))
	add_keyword_color("step", ColorN("lightblue"))
	pass

func _input(event):
	if (event.is_action_pressed("ui_accept")):
		push_code()


func push_code():
	var editor_content: String = self.get_text();
	get_tree().get_root().get_node("Application/MakarPsuedoCode").set_editor_code(editor_content)
	get_tree().get_root().get_node("Application/GUI").emit_signal("try_execute")