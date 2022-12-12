extends MarginContainer


# This code sample assumes the current script is extending MarginContainer.
var margin_value = 10

func _ready():
	add_constant_override("margin_top", margin_value)
	add_constant_override("margin_left", margin_value)
	add_constant_override("margin_bottom", margin_value)
	add_constant_override("margin_right", margin_value)
