extends "res://Application/MakarPseudoCode/MakarPsuedoCode.gd"

"""
The syntactic analyzer reports a syntax error if the syntax is incorrect.
A syntax analyzer uses tokens to construct a parse tree
"""

var key_words = [
	"make",
	"array"
]

var tokens = [
	"identifier",
	"initalizer",
	"structure"
]

var initializers = [
	"make"
]
var structures  = [
	"array"
]



var these_lexemes
var lex_token_pairs: Dictionary

var parse_tree



func set_lexemes(new_lexems):
	these_lexemes = new_lexems


# pair a lexeme with a particular token. Update class-scope dictionarty
func pair_lexeme_and_token():
	
	lex_token_pairs.clear()
	
	for lex in these_lexemes:
		"""
		if lex is not a keyword, it must be one of the following:
			-> identifier
		"""
		
		"""
		if lex IS a keyword, it must be one of the following:
			-> initializer (make)
			-> structure (array)
		"""
		
		if (!lex in key_words):
			lex_token_pairs[lex] = tokens[0]
			
		if (lex in key_words):
			
			if (lex in initializers):
				lex_token_pairs[lex] = tokens[1]
			if (lex in structures):
				lex_token_pairs[lex] = tokens[2]


# verify the grammar is correct
func syntax_correct():
	return true


# convert lexeme-token pairs into a parse tree to be executed
func make_parse_tree():
	pair_lexeme_and_token()
	var these_tokens = lex_token_pairs.values()
	# if not every lexeme has a token, error
	

	
	"""
	make a tree, and reading it from left to right builds the string (output code)
	make the tree with grammar rules which disolve input string+tokens into 
		-> variables
		-> terminals
		-> empty string 
	"""
	"""
	assume if my statement has an initializer, then it is an initializion statement
	assume if first token is an initailizer, then it is an initalization statement
	"""
	# if first word was make, this is an initialization statement
	if (tokens[1] in these_tokens):
		if (these_tokens.size() != 3) ||  \
		(these_tokens[0] != tokens[1]) || \
		(these_tokens[1] != tokens[2]) || \
		(these_tokens[2] != tokens[0]):
			print("syntax error")		
		
		
		var new_tree = ParseTree.new()
		new_tree.root = "initialization"
		
		for t in range(0, these_tokens.size()):
			var new_node = TreeNode.new()
			new_node.lexeme = these_lexemes[t]
			new_node.token = these_tokens[t]
			new_tree.node.append(new_node)
		
		return new_tree
	
	# wtf is a parse tree and how to do turn it into code

