extends Node

var content: String = "extends \"res://Application/MakarPseudoCode/Executor.gd\"\n\n"

func set_content(new_content: String):
	content = new_content

func save_script():
	var generated_code = File.new()
	generated_code.open("res://Application/MakarPseudoCode/GeneratedCode.gd", File.WRITE)
	generated_code.store_string(content)
	generated_code.close()


func run_script():
	
	var Generated_code = load("res://Application/MakarPseudoCode/GeneratedCode.gd")
	var run = Generated_code.new()
	run.set_name("Custom Script")
	get_tree().get_root().get_node("Application/GUI").add_child(run)
	
	# make sure this works or else itll crash
	run.start()


func empty_script():
	content = ""
	save_script()