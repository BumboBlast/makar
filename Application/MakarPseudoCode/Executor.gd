extends Node

var content: String = "extends \"res://Application/MakarPseudoCode/Executor.gd\""

func save_script():
	var generated_code = File.new()
	generated_code.open("res://Application/MakarPseudoCode/GeneratedCode.gd", File.WRITE)
	generated_code.store_string(content)
	generated_code.close()


func run_script():
	print("trying to run the script")
	
	content += "\nfunc foo():\n\tprint(\"called foo\")"
	save_script()
	
	$GeneratedCode.foo()
	
	pass


func empty_script():
	content.empty()
	save_script()
