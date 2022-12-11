extends Node

# using parse tree
# returns actual code to add to the GeneratedCode file in order to execute
# wtf is a parse tree and how to do turn it into code


var parse_tree
var new_code: String

func get_new_code():
	return new_code

func set_parse_tree(new_parse_tree):
	parse_tree = new_parse_tree

func generate_code():
	var header = "extends \"res://Application/MakarPseudoCode/Executor.gd\"\n\n"
	var start_function = "func start():\n\tprint(\"called generated code\")\n"
	
	
	new_code += header
	new_code += start_function
