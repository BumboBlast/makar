extends Node
const ArrayNode = preload("res://Application/MakarPseudoCode/Classes/Array.tscn")
func start():
	var primes = ArrayNode.instance()
	primes.set_name("primes")
	self.add_child(primes)
	primes.append_value(2)
	primes.append_value(3)
