# Py-CParser

This is a file-level C++11 parser implemented with Flex and Bison, and wrapped as a Python3 module.

The parser takes a single c++ code file as input, discards the macros such as "#include" and "#define", and generates the parsing tree (NOT AST!). The source code can be restored by traversing the leaf nodes of the parsing tree.

## Requirements

You may successfully run the code under other versions of environments, but I still recommend to use exactly the same evironment as mine.

```sh
Python == 3.7
g++ == 5.4.0
Flex == 2.6.0
Bison == 3.0.4
```

## How2Use

1. Generate the `.so` dynamic library.

```sh
$> cd PATH/TO/THIS/DIRECTORY
$> make
```

Now, you can see the `parser.so` dynamic library under this directory.

2. Import the python module.

```sh
$> python3
>>> import myparser
```

3. Try it out!

## Examples

```bash
>>> import myparser
>>> myparser.
myparser.TreeNode(                  myparser.getParsingTree(            myparser.io                         myparser.printParsingTree(
myparser.ctypes                     myparser.getStructuredParsingTree(  myparser.os                         myparser.sys
>>> myparser.getStructuredParsingTree("int main()\n{\n    return 0;\n}")
'{*<translation_unit>{*<external_declaration>{*<function_definition>{*<declaration_specifiers>{*<type_specifier>{#[int]}}}{*<declarator>{*<direct_declarator>{*<direct_declarator>{#[main]}}{#[(]}{#[)]}}}{*<compound_statement>{#[{]}{*<block_item_list>{*<block_item>{*<statement>{*<jump_statement>{#[return]}{*<expression>{*<assignment_expression>{*<conditional_expression>{*<logical_or_expression>{*<logical_and_expression>{*<inclusive_or_expression>{*<exclusive_or_expression>{*<and_expression>{*<equality_expression>{*<relational_expression>{*<shift_expression>{*<additive_expression>{*<multiplicative_expression>{*<cast_expression>{*<unary_expression>{*<postfix_expression>{*<primary_expression>{*<constant>{#[0]}}}}}}}}}}}}}}}}}}}{#[;]}}}}}{#[}]}}}}}'
>>> root = myparser.getParsingTree("int main()\n{\n    return 0;\n}")
>>> root.printTree(0)
[*] <translation_unit>
	[*] <external_declaration>
		[*] <function_definition>
			[*] <declaration_specifiers>
				[*] <type_specifier>
					[#] [int]
			[*] <declarator>
				[*] <direct_declarator>
					[*] <direct_declarator>
						[#] [main]
					[#] [(]
					[#] [)]
			[*] <compound_statement>
				[#] [{]
				[*] <block_item_list>
					[*] <block_item>
						[*] <statement>
							[*] <jump_statement>
								[#] [return]
								[*] <expression>
									[*] <assignment_expression>
										[*] <conditional_expression>
											[*] <logical_or_expression>
												[*] <logical_and_expression>
													[*] <inclusive_or_expression>
														[*] <exclusive_or_expression>
															[*] <and_expression>
																[*] <equality_expression>
																	[*] <relational_expression>
																		[*] <shift_expression>
																		 [*] <additive_expression>
																		 [*] <multiplicative_expression>
																		 [*] <cast_expression>
																		 [*] <unary_expression>
																		 [*] <postfix_expression>
																		 [*] <primary_expression>
																		 [*] <constant>
																		 [#] [0]
								[#] [;]
				[#] [}]
```