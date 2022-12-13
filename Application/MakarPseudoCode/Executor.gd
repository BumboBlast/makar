extends Node

var content: String
var display_path: String = "Application/GUI/LeftHalf/ViewportContainer/DisplayPort"
var custom_script_path: String = "res://Application/MakarPseudoCode/GeneratedCode.gd"

func set_content(new_content: String):
	content = new_content

func save_script():
	var generated_code = File.new()
	generated_code.open(custom_script_path, File.WRITE)
	generated_code.store_string(content)
	generated_code.close()


func run_script():
	
	for node in get_tree().get_root().get_node(display_path).get_children():
		if (node.get_name() == "Custom Script"):
			print("deleting a dupe")
			node.free()
	
	var Generated_code = load(custom_script_path)
	var run = Generated_code.new()
	run.set_name("Custom Script")
	get_tree().get_root().get_node(display_path).add_child(run)
	
	# make sure this works or else itll crash
	run.start()


func empty_script():
	print("called empty script")
	content = ""
	save_script()
