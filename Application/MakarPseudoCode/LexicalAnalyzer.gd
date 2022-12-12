extends Node

"""
takes code and breaks it into sequences of characters called lexemes, 
each of which corresponds to a token. 
Tokens are units of grammar in the language that the compiler understands.

Lexical analyzers also remove white space characters, comments and errors.
"""


"""
[Token]       [Informal Description]                  [Sample Lexemes]
if            characters i, f                         if
else          characters e, l, s, e                   else
comparison    < or > or <= or >= or == or !=          <=, !=
id            letter followed by letters and digits   pi, score, D2
number        any numeric constant                    3.14159, 0, 6.02e23
literal       anything but ", surrounded by "'s       "core dumped"
"""



"""
This class will take the raw code and return an array of lexems
"""


var input_code: String

func set_input_code(content: String):
	input_code = content


# only returns one line (sentence) at a time
func make_lexems():
	if (!input_code):
		print("line was not passed to lexicalanalyzer")
	
	var lexeme_set: PoolStringArray = input_code.split(' ', false)
	return lexeme_set
