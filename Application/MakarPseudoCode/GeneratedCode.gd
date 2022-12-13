extends Node
const ArrayNode = preload("res://Application/MakarPseudoCode/Classes/Array.tscn")
func start():
	var aaaa = ArrayNode.instance()
	aaaa.set_name("aaaa")
	self.add_child(aaaa)
