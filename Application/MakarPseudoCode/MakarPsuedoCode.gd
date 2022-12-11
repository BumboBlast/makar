extends Node


# keep track of "if its trying to execute"
var running_mutex_lock: bool = false
var editor_code: Array




# pass the editor content to makar
func set_editor_code(content: Array):
	editor_code = content


# attempt to resolve the syntax, and begin updating the display
# push each line onto a buffer. 
# If mutex_lock, then dont read. Otherwise start over
func _on_GUI_try_execute():
	try_execute()
func try_execute():
	
	# part of optimize plan ):
	if (running_mutex_lock):
		pass
	
	# free all resources
	
	var big_parse_tree
	
	for line in editor_code:
		$LexicalAnalyzer.set_input_code(line)
		var lexemes = $LexicalAnalyzer.make_lexems()
		
		$SyntacticAnalyzer.set_lexemes(lexemes)
		var new_parse_tree = $SyntacticAnalyzer.make_parse_tree()
	
	# wtf is a parse tree and how to do turn it into code
	$CodeGeneration.set_parse_tree(big_parse_tree)
	$CodeGeneration.generate_code()
	
	# set content in executor first
	$Executor.set_content($CodeGeneration.get_new_code())
	$Executor.save_script()
	
	$Executor.run_script()
	$Executor.empty_script()
