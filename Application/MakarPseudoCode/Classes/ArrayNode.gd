extends MarginContainer

var margin_value = 10

# the actual array, storing the values
var array: Array

# each array has a visual pointer for visualizing data access
var pointer_index: int

var array_text: String

func assign_value(new_value: int):
	var new_string = "{{new_value}}"
	$ArrayDisplay.clear()
	$ArrayDisplay.add_text(new_string.format({"new_value" : new_value}))


func _ready():


	add_constant_override("margin_top", margin_value)
	add_constant_override("margin_left", margin_value)
	add_constant_override("margin_bottom", margin_value)
	add_constant_override("margin_right", margin_value)
	
	
	pointer_index = 0
	array_text = $ArrayDisplay.text
	$ArrayDisplay.clear()
	$ArrayDisplay.add_text("{}")
