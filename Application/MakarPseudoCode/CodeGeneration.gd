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


# only call once per session, not once per line
func build_header():
	var header = "extends Node\n"
	var array_node = "const ArrayNode = preload(\"res://Application/MakarPseudoCode/Classes/Array.tscn\")\n"
	var start_function = "func start():\n"
	
	new_code = ""
	new_code += header
	new_code += array_node
	new_code += start_function




func generate_code():
	
	if (parse_tree.root == "initialization"):
		
		var structure: String
		if (parse_tree.node[1].lexeme == "array"):
			structure = "ArrayNode"
		
		var initialize_structure = "\tvar {identifier} = {structure}.instance()\n"
		var name_node = "\t{identifier}.set_name(\"{identifier}\")\n"
		var add_child = "\tself.add_child({identifier})\n"
		
		initialize_structure = initialize_structure.format({
			"identifier" : parse_tree.node[2].lexeme,
			"structure" : structure
		})
		name_node = name_node.format({"identifier" : parse_tree.node[2].lexeme})
		add_child = add_child.format({"identifier" : parse_tree.node[2].lexeme})
		
		new_code += initialize_structure
		new_code += name_node
		new_code += add_child
	
	
	if (parse_tree.root == "assignment"):
		
		var access_identifier = "\tprint({identifier}.name)\n"
		var assignment_op = "\t{identifier}.assign_value({new_value})"
		
		access_identifier = access_identifier.format({"identifier" : parse_tree.node[0].lexeme})
		assignment_op = assignment_op.format({
			"identifier" : parse_tree.node[0].lexeme,
			"new_value" : parse_tree.node[2].lexeme
		})
		
		new_code += access_identifier
		new_code += assignment_op
	
	print(new_code)

