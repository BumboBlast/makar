extends Node
const ArrayNode = preload("res://Application/MakarPseudoCode/Classes/Array.tscn")
func start():
	var amelie = ArrayNode.instance()
	amelie.set_name("amelie")
	self.add_child(amelie)
	var stinky = ArrayNode.instance()
	stinky.set_name("stinky")
	self.add_child(stinky)
	print(amelie.name)
	amelie.assign_value(27)
	print(stinky.name)
	stinky.assign_value(742)
