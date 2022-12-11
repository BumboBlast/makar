extends Node

"""
The syntactic analyzer reports a syntax error if the syntax is incorrect.
A syntax analyzer uses tokens to construct a parse tree
"""

var tokens = [
	"keyword",
	"identifier",
	"operator",
	"literal",
	"punctuation"
]

var key_words = [
	"make",
	"array"
]


var lexems
var lex_token_pairs: Dictionary



func set_lexemes(new_lexems):
	lexems = new_lexems


# pair a lexeme with a particular token. Update class-scope dictionarty
func pair_lexeme_and_token():
	for lex in lexems:
		if (lex in key_words):
			lex_token_pairs[lex] = tokens[0]


# verify the grammar is correct
func syntax_correct():
	return true
	return false


# convert lexeme-token pairs into a parse tree to be executed
func make_parse_tree():
	pair_lexeme_and_token()
	
	# wtf is a parse tree and how to do turn it into code
	
	if (!syntax_correct()):
		print("Syntax incorrect")
