extends TextEdit




func _ready():
	add_keyword_color("make", ColorN("lightblue"))
	add_keyword_color("array", ColorN("lightblue"))
	add_keyword_color("step", ColorN("lightblue"))
	pass

func _input(event):
	if (event.is_action_pressed("ui_accept")):
		pass
