extends "res://Application/MakarPseudoCode/MakarPsuedoCode.gd"

"""
The syntactic analyzer reports a syntax error if the syntax is incorrect.
A syntax analyzer uses tokens to construct a parse tree
"""

var key_words = [
	"make",
	"array",
	"=",
	"{",
	"}",
	","
]

var tokens = [
	"identifier",
	"literal",
	"initalizer",
	"structure",
	"assignment",
	"punctuation",
]

var initializers = [
	"make"
]
var structures  = [
	"array"
]
var assignment = [
	"="
]
var punctuation = [
	"{",
	"}",
	","
]



var these_lexemes
var these_tokens

func set_lexemes(new_lexems):
	these_lexemes = new_lexems
func set_tokens(new_tokens):
	these_tokens = new_tokens

var lex_token_pairs: Dictionary

var parse_tree





func only_ints(strg: String):
	for c in strg:
		if (ord(c) < 48 || ord(c) > 48 + 9): 
			return false
	return true

# pair a lexeme with a particular token. Update class-scope dictionarty
func pair_lexeme_and_token():
	
	lex_token_pairs.clear()
	
	for lex in these_lexemes:
		"""
		if lex is not a keyword, it must be one of the following:
			-> identifier
			-> literal
		"""
		
		"""
		if lex IS a keyword, it must be one of the following:
			-> initializer (make)
			-> structure (array)
			-> assignemnt (=)
			-> punctuation (,{})
		"""
		
		if (!lex in key_words):
			print ("trying to figure out : ", lex)
			if (only_ints(lex)):
				lex_token_pairs[lex] = tokens[1]
			else:
				lex_token_pairs[lex] = tokens[0]
			
		if (lex in key_words):
			
			if (lex in initializers):
				lex_token_pairs[lex] = tokens[2]
			if (lex in structures):
				lex_token_pairs[lex] = tokens[3]
			if (lex in assignment):
				lex_token_pairs[lex] = tokens[4]






func make_new_tree(statement_type: String):
	var new_tree = ParseTree.new()
	new_tree.root = statement_type
	
	for t in range(0, these_tokens.size()):
		var new_node = TreeNode.new()
		new_node.lexeme = these_lexemes[t]
		new_node.token = these_tokens[t]
		new_tree.node.append(new_node)
	
	return new_tree


# convert lexeme-token pairs into a parse tree to be executed
func make_parse_tree():
	pair_lexeme_and_token()
	set_tokens(lex_token_pairs.values())
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
	if (tokens[2] in these_tokens):
		if (these_tokens.size() != 3) ||  \
		(these_tokens[0] != tokens[2]) || \
		(these_tokens[1] != tokens[3]) || \
		(these_tokens[2] != tokens[0]):
			print("syntax error")
		
		return make_new_tree("initialization")
	
	
	# if '=' is in teh statement, then it is an assignment statement
	if (tokens[4] in these_tokens):
		
		if (these_tokens[0] != tokens[0]) || \
		(these_tokens[1] != tokens[4]) || \
		(these_tokens[2] != tokens[1]):
			print("syntax error")
		
		return(make_new_tree("assignment"))

	# wtf is a parse tree and how to do turn it into code

