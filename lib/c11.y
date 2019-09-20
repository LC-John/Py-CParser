%{
#include <stdio.h>
#include <string.h>
#include "tree.h"

extern char *yytext;
extern int yylex (void);
#define YYSTYPE TreeNode*
extern TreeNode* root;

int yyerror(const char*);
%}

%token	IDENTIFIER I_CONSTANT F_CONSTANT STRING_LITERAL FUNC_NAME SIZEOF PTR_OP INC_OP
%token	DEC_OP LEFT_OP RIGHT_OP LE_OP GE_OP EQ_OP NE_OP AND_OP OR_OP MUL_ASSIGN NORETURN
%token	MOD_ASSIGN ADD_ASSIGN SUB_ASSIGN LEFT_ASSIGN RIGHT_ASSIGN AND_ASSIGN XOR_ASSIGN 
%token	OR_ASSIGN TYPEDEF_NAME ENUMERATION_CONSTANT TYPEDEF EXTERN STATIC AUTO REGISTER
%token	INLINE CONST RESTRICT VOLATILE BOOL CHAR SHORT INT LONG SIGNED  UNSIGNED FLOAT
%token	DOUBLE VOID COMPLEX IMAGINARY STRUCT UNION ENUM ELLIPSIS CASE DEFAULT IF ELSE
%token	SWITCH WHILE DO FOR GOTO CONTINUE BREAK RETURN ALIGNAS ALIGNOF ATOMIC GENERIC
%token	STATIC_ASSERT THREAD_LOCAL DIV_ASSIGN SEMICOLON BRACE_L BRACE_R COMMA COLON
%token	EQUAL BRACKET_L BRACKET_R ARRAY_L ARRAY_R DOT BITWISE_AND_OP NOT_OP STAR
%token	BITWISE_COMPLEMENT_OP MINUS_OP PLUS_OP DIV_OP MOD_OP LT_OP GT_OP XOR_OP IF_OP
%token	BITWISE_OR_OP

// %left MINUS_OP PLUS_OP
// %left STAR DIV_OP

/*
%type<node>	identifier i_constant f_constant string_literal func_name sizeof ptr_op inc_op
%type<node>	dec_op left_op right_op le_op ge_op eq_op ne_op and_op or_op mul_assign noreturn
%type<node>	mod_assign add_assign sub_assign left_assign right_assign and_assign xor_assign 
%type<node>	or_assign typedef_name enumeration_constant_ typedef extern static auto register
%type<node>	inline const restrict volatile bool char short int long signed  unsigned float
%type<node>	double void complex imaginary struct union enum ellipsis case default if else
%type<node>	switch while do for goto continue break return alignas alignof atomic generic
%type<node>	static_assert thread_local div_assign semicolon brace_l brace_r comma colon if_op
%type<node>	equal bracket_l bracket_r array_l array_r dot bitwise_and_op not_op star xor_op
%type<node>	bitwise_complement_op minus_op plus_op div_op mod_op lt_op gt_op bitwise_or_op
%type<node>	primary_expression constant enumeration_constant string generic_selection
%type<node>	generic_assoc_list generic_association postfix_expression argument_expression_list
%type<node>	unary_expression unary_operator cast_expression multiplicative_expression
%type<node>	additive_expression shift_expression relational_expression equality_expression
%type<node>	and_expression exclusive_or_expression inclusive_or_expression logical_and_expression
%type<node>	logical_or_expression conditional_expression assignment_expression assignment_operator
%type<node>	expression constant_expression declaration_specifiers init_declarator_list declaration
%type<node>	init_declarator storage_class_specifier type_specifier struct_or_union_specifier 
%type<node>	struct_or_union struct_declaration_list struct_declaration specifier_qualifier_list
%type<node>	struct_declarator_list struct_declarator enum_specifier enumerator_list enumerator
%type<node>	atomic_type_specifier type_qualifier function_specifier alignment_specifier declarator
%type<node>	direct_declarator pointer type_qualifier_list parameter_type_list parameter_list
%type<node>	parameter_declaration identifier_list type_name abstract_declarator initializer
%type<node>	direct_abstract_declarator initializer_list designation designator_list designator
%type<node>	static_assert_declaration statement labeled_statement compound_statement block_item
%type<node>	block_item_list expression_statement selection_statement jump_statement declaration_list
%type<node>	iteration_statement translation_unit external_declaration function_definition
*/

%start translation_unit
%%

identifier	: IDENTIFIER		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
i_constant	: I_CONSTANT		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
f_constant	: F_CONSTANT		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
func_name	: FUNC_NAME		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
sizeof		: SIZEOF		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
ptr_op		: PTR_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
inc_op		: INC_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
dec_op		: DEC_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
left_op		: LEFT_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
right_op	: RIGHT_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
le_op		: LE_OP			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
ge_op		: GE_OP			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
eq_op		: EQ_OP			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
ne_op		: NE_OP			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
and_op		: AND_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
or_op		: OR_OP			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
mul_assign	: MUL_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
noreturn	: NORETURN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
mod_assign	: MOD_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
add_assign	: ADD_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
sub_assign	: SUB_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
left_assign	: LEFT_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
and_assign	: AND_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
xor_assign	: XOR_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); } 
or_assign	: OR_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
typedef		: TYPEDEF		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
extern		: EXTERN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
static		: STATIC		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
auto		: AUTO			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
register	: REGISTER		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
inline		: INLINE		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
const		: CONST			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
restrict	: RESTRICT		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
volatile	: VOLATILE		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
bool		: BOOL			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
char		: CHAR			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
short		: SHORT			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
int		: INT			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
long		: LONG			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
signed		: SIGNED		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
unsigned	: UNSIGNED		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
float		: FLOAT			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
double		: DOUBLE		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
void		: VOID			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
complex		: COMPLEX		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
imaginary	: IMAGINARY		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
struct		: STRUCT		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
union		: UNION			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
enum		: ENUM			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
ellipsis	: ELLIPSIS		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
case		: CASE			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
default		: DEFAULT		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
if		: IF			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
else		: ELSE			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
switch		: SWITCH		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
while		: WHILE			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
do		: DO			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
for		: FOR			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
goto		: GOTO			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
continue	: CONTINUE		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
break		: BREAK			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
return		: RETURN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
alignas		: ALIGNAS		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
alignof		: ALIGNOF		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
atomic		: ATOMIC		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
generic		: GENERIC		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
div_assign	: DIV_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
semicolon	: SEMICOLON		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
brace_l		: BRACE_L		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
brace_r		: BRACE_R		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
comma		: COMMA			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
colon		: COLON			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
if_op		: IF_OP			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
equal		: EQUAL			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
bracket_l	: BRACKET_L		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
bracket_r	: BRACKET_R		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
array_l		: ARRAY_L		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
array_r		: ARRAY_R		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
dot		: DOT			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
not_op		: NOT_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
star		: STAR			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
xor_op		: XOR_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
minus_op	: MINUS_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
plus_op		: PLUS_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
div_op		: DIV_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
mod_op		: MOD_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
lt_op		: LT_OP			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
gt_op		: GT_OP			{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
right_assign	: RIGHT_ASSIGN		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
typedef_name	: TYPEDEF_NAME		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
static_assert	: STATIC_ASSERT		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
thread_local	: THREAD_LOCAL		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
bitwise_or_op	: BITWISE_OR_OP		{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
string_literal	: STRING_LITERAL	{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
bitwise_and_op	: BITWISE_AND_OP	{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
bitwise_complement_op	: BITWISE_COMPLEMENT_OP	{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }
enumeration_constant_	: ENUMERATION_CONSTANT	{ $$ = new TreeNode(Ter, string("[") + string(yytext) + string("]")); }

primary_expression
	: identifier		{ $$ = new TreeNode(Non, "<primary_expression>"); $$->addChild($1); }
	| constant		{ $$ = new TreeNode(Non, "<primary_expression>"); $$->addChild($1); }
	| string		{ $$ = new TreeNode(Non, "<primary_expression>"); $$->addChild($1); }
	| bracket_l expression bracket_r	{
			$$ = new TreeNode(Non, "<primary_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| generic_selection		{ $$ = new TreeNode(Non, "<primary_expression>"); $$->addChild($1); }
	;

constant
	: i_constant			{ $$ = new TreeNode(Non, "<constant>"); $$->addChild($1); }
	| f_constant			{ $$ = new TreeNode(Non, "<constant>"); $$->addChild($1); }
	| enumeration_constant_		{ $$ = new TreeNode(Non, "<constant>"); $$->addChild($1); }
	;

enumeration_constant		/* before it has been defined as such */
	: identifier			{ $$ = new TreeNode(Non, "<enumeration_constant>"); $$->addChild($1); }
	;

string
	: string_literal		{ $$ = new TreeNode(Non, "<string>"); $$->addChild($1); }
	| func_name			{ $$ = new TreeNode(Non, "<string>"); $$->addChild($1); }
	;

generic_selection
	: generic bracket_l assignment_expression comma generic_assoc_list bracket_r	{
			$$ = new TreeNode(Non, "<generic_selection>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6);
		}
	;

generic_assoc_list
	: generic_association	{ $$ = new TreeNode(Non, "<generic_assoc_list>"); $$->addChild($1); }
	| generic_assoc_list comma generic_association	{
			$$ = $1;
			$$->addChild($2); $$->addChild($3);
		}
	;

generic_association
	: type_name colon assignment_expression	{
			$$ = new TreeNode(Non, "<generic_association>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| default colon assignment_expression	{
			$$ = new TreeNode(Non, "<generic_association>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

postfix_expression
	: primary_expression	{ $$ = new TreeNode(Non, "<postfix_expression>"); $$->addChild($1); }
	| postfix_expression array_l expression array_r	{
			$$ = new TreeNode(Non, "<postfix_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| postfix_expression bracket_l bracket_r	{
			$$ = new TreeNode(Non, "<postfix_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| postfix_expression bracket_l argument_expression_list bracket_r	{
			$$ = new TreeNode(Non, "<postfix_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);$$->addChild($4);
		}
	| postfix_expression dot identifier	{
			$$ = new TreeNode(Non, "<postfix_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| postfix_expression ptr_op identifier	{
			$$ = new TreeNode(Non, "<postfix_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| postfix_expression inc_op	{
			$$ = new TreeNode(Non, "<postfix_expression>");
			$$->addChild($1); $$->addChild($2);
		}
	| postfix_expression dec_op	{
			$$ = new TreeNode(Non, "<postfix_expression>");
			$$->addChild($1); $$->addChild($2);
		}
	| bracket_l type_name bracket_r brace_l initializer_list brace_r	{
			$$ = new TreeNode(Non, "<postfix_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6);
		}
	| bracket_l type_name bracket_r brace_l initializer_list comma brace_r	{
			$$ = new TreeNode(Non, "<postfix_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6); $$->addChild($7);
		}
	;

argument_expression_list
	: assignment_expression	{ $$ = new TreeNode(Non, "<argument_expression_list>"); $$->addChild($1); }
	| argument_expression_list comma assignment_expression	{ $$ = $1; $$->addChild($2); $$->addChild($3); }
	;

unary_expression
	: postfix_expression	{ $$ = new TreeNode(Non, "<unary_expression>"); $$->addChild($1); }
	| inc_op unary_expression	{
			$$ = new TreeNode(Non, "<unary_expression>");
			$$->addChild($1); $$->addChild($2);
		}
	| dec_op unary_expression	{
			$$ = new TreeNode(Non, "<unary_expression>");
			$$->addChild($1); $$->addChild($2);
		}
	| unary_operator cast_expression	{
			$$ = new TreeNode(Non, "<unary_expression>");
			$$->addChild($1); $$->addChild($2);
		}
	| sizeof unary_expression	{
			$$ = new TreeNode(Non, "<unary_expression>");
			$$->addChild($1); $$->addChild($2);
		}
	| sizeof bracket_l type_name bracket_r	{
			$$ = new TreeNode(Non, "<unary_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| alignof bracket_l type_name bracket_r	{
			$$ = new TreeNode(Non, "<unary_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	;

unary_operator
	: bitwise_and_op		{ $$ = new TreeNode(Non, "<unary_operator>"); $$->addChild($1); }
	| star				{ $$ = new TreeNode(Non, "<unary_operator>"); $$->addChild($1); }
	| plus_op			{ $$ = new TreeNode(Non, "<unary_operator>"); $$->addChild($1); }
	| minus_op			{ $$ = new TreeNode(Non, "<unary_operator>"); $$->addChild($1); }
	| bitwise_complement_op		{ $$ = new TreeNode(Non, "<unary_operator>"); $$->addChild($1); }
	| not_op			{ $$ = new TreeNode(Non, "<unary_operator>"); $$->addChild($1); }
	;

cast_expression
	: unary_expression	{ $$ = new TreeNode(Non, "<cast_expression>"); $$->addChild($1); }
	| bracket_l type_name bracket_r cast_expression	{
			$$ = new TreeNode(Non, "<cast_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	;

multiplicative_expression
	: cast_expression	{ $$ = new TreeNode(Non, "<multiplicative_expression>"); $$->addChild($1); }
	| multiplicative_expression star cast_expression	{
			$$ = new TreeNode(Non, "<multiplicative_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| multiplicative_expression div_op cast_expression	{
			$$ = new TreeNode(Non, "<multiplicative_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| multiplicative_expression mod_op cast_expression	{
			$$ = new TreeNode(Non, "<multiplicative_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

additive_expression
	: multiplicative_expression	{ $$ = new TreeNode(Non, "<additive_expression>"); $$->addChild($1); }
	| additive_expression plus_op multiplicative_expression	{
			$$ = new TreeNode(Non, "<additive_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| additive_expression minus_op multiplicative_expression	{
			$$ = new TreeNode(Non, "<additive_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

shift_expression
	: additive_expression	{ $$ = new TreeNode(Non, "<shift_expression>"); $$->addChild($1); }
	| shift_expression left_op additive_expression	{
			$$ = new TreeNode(Non, "<shift_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| shift_expression right_op additive_expression	{
			$$ = new TreeNode(Non, "<shift_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

relational_expression
	: shift_expression	{ $$ = new TreeNode(Non, "<relational_expression>"); $$->addChild($1); }
	| relational_expression lt_op shift_expression	{
			$$ = new TreeNode(Non, "<relational_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| relational_expression gt_op shift_expression	{
			$$ = new TreeNode(Non, "<relational_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| relational_expression le_op shift_expression	{
			$$ = new TreeNode(Non, "<relational_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| relational_expression ge_op shift_expression	{
			$$ = new TreeNode(Non, "<relational_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

equality_expression
	: relational_expression	{ $$ = new TreeNode(Non, "<equality_expression>"); $$->addChild($1); }
	| equality_expression eq_op relational_expression	{
			$$ = new TreeNode(Non, "<equality_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| equality_expression ne_op relational_expression	{
			$$ = new TreeNode(Non, "<equality_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

and_expression
	: equality_expression	{ $$ = new TreeNode(Non, "<and_expression>"); $$->addChild($1); }
	| and_expression bitwise_and_op equality_expression	{
			$$ = new TreeNode(Non, "<and_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

exclusive_or_expression
	: and_expression	{ $$ = new TreeNode(Non, "<exclusive_or_expression>"); $$->addChild($1); }
	| exclusive_or_expression xor_op and_expression	{
			$$ = new TreeNode(Non, "<exclusive_or_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

inclusive_or_expression
	: exclusive_or_expression	{ $$ = new TreeNode(Non, "<inclusive_or_expression>"); $$->addChild($1); }
	| inclusive_or_expression bitwise_or_op exclusive_or_expression	{
			$$ = new TreeNode(Non, "<inclusive_or_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

logical_and_expression
	: inclusive_or_expression	{ $$ = new TreeNode(Non, "<logical_and_expression>"); $$->addChild($1); }
	| logical_and_expression and_op inclusive_or_expression	{
			$$ = new TreeNode(Non, "<logical_and_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

logical_or_expression
	: logical_and_expression	{ $$ = new TreeNode(Non, "<logical_or_expression>"); $$->addChild($1); }
	| logical_or_expression or_op logical_and_expression	{
			$$ = new TreeNode(Non, "<logical_or_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

conditional_expression
	: logical_or_expression	{ $$ = new TreeNode(Non, "<conditional_expression>"); $$->addChild($1); }
	| logical_or_expression if_op expression colon conditional_expression	{
			$$ = new TreeNode(Non, "<conditional_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	;

assignment_expression
	: conditional_expression	{ $$ = new TreeNode(Non, "<assignment_expression>"); $$->addChild($1); }
	| unary_expression assignment_operator assignment_expression	{
			$$ = new TreeNode(Non, "<assignment_expression>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

assignment_operator
	: equal			{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| mul_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| div_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| mod_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| add_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| sub_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| left_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| right_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| and_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| xor_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	| or_assign		{ $$ = new TreeNode(Non, "<assignment_operator>"); $$->addChild($1); }
	;

expression
	: assignment_expression	{ $$ = new TreeNode(Non, "<expression>"); $$->addChild($1); }
	| expression comma assignment_expression	{ $$ = $1; $$->addChild($2); $$->addChild($3); }
	;

constant_expression		/* with constraints */
	: conditional_expression	{ $$ = new TreeNode(Non, "<constant_expression>"); $$->addChild($1); }
	;

declaration
	: static_assert_declaration	{ $$ = new TreeNode(Non, "<declaration>"); $$->addChild($1); }
	| declaration_specifiers semicolon	{
			$$ = new TreeNode(Non, "<declaration>");
			$$->addChild($1); $$->addChild($2);
		}
	| declaration_specifiers init_declarator_list semicolon	{
			$$ = new TreeNode(Non, "<declaration>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

declaration_specifiers
	: storage_class_specifier	{ $$ = new TreeNode(Non, "<declaration_specifiers>"); $$->addChild($1); }
	| type_specifier		{ $$ = new TreeNode(Non, "<declaration_specifiers>"); $$->addChild($1); }
	| type_qualifier		{ $$ = new TreeNode(Non, "<declaration_specifiers>"); $$->addChild($1); }
	| function_specifier		{ $$ = new TreeNode(Non, "<declaration_specifiers>"); $$->addChild($1);	}
	| alignment_specifier		{ $$ = new TreeNode(Non, "<declaration_specifiers>"); $$->addChild($1);	}
	| type_specifier declaration_specifiers	{
			$$ = new TreeNode(Non, "<declaration_specifiers>");
			$$->addChild($1); $$->addChild($2);
		}
	| type_qualifier declaration_specifiers	{
			$$ = new TreeNode(Non, "<declaration_specifiers>");
			$$->addChild($1); $$->addChild($2);
		}
	| function_specifier declaration_specifiers	{
			$$ = new TreeNode(Non, "<declaration_specifiers>");
			$$->addChild($1); $$->addChild($2);
		}
	| alignment_specifier declaration_specifiers	{
			$$ = new TreeNode(Non, "<declaration_specifiers>");
			$$->addChild($1); $$->addChild($2);
		}
	| storage_class_specifier declaration_specifiers	{
			$$ = new TreeNode(Non, "<declaration_specifiers>");
			$$->addChild($1); $$->addChild($2);
		}
	;

init_declarator_list
	: init_declarator	{ $$ = new TreeNode(Non, "<init_declarator_list>"); $$->addChild($1); }
	| init_declarator_list comma init_declarator	{ $$ = $1; $$->addChild($2); $$->addChild($3); }
	;

init_declarator
	: declarator	{ $$ = new TreeNode(Non, "<init_declarator>"); $$->addChild($1); }
	| declarator equal initializer	{
		$$ = new TreeNode(Non, "<init_declarator>");
		$$->addChild($1); $$->addChild($2); $$->addChild($3);
	}
	;

storage_class_specifier		/* identifiers must be flagged as TYPEDEF_NAME */
	: typedef		{ $$ = new TreeNode(Non, "<storage_class_specifier>"); $$->addChild($1); }
	| extern		{ $$ = new TreeNode(Non, "<storage_class_specifier>"); $$->addChild($1); }
	| static		{ $$ = new TreeNode(Non, "<storage_class_specifier>"); $$->addChild($1); }
	| thread_local		{ $$ = new TreeNode(Non, "<storage_class_specifier>"); $$->addChild($1); }
	| auto			{ $$ = new TreeNode(Non, "<storage_class_specifier>"); $$->addChild($1); }
	| register		{ $$ = new TreeNode(Non, "<storage_class_specifier>"); $$->addChild($1); }
	;

type_specifier
	: void				{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| char				{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| short				{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| int				{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| long				{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| float				{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| double			{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| signed			{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| unsigned			{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| bool				{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| complex			{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| imaginary			{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| atomic_type_specifier		{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| struct_or_union_specifier	{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| enum_specifier		{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	| typedef_name			{ $$ = new TreeNode(Non, "<type_specifier>"); $$->addChild($1); }
	;

struct_or_union_specifier
	: struct_or_union brace_l struct_declaration_list brace_r	{
			$$ = new TreeNode(Non, "<struct_or_union_specifier>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| struct_or_union identifier brace_l struct_declaration_list brace_r	{
			$$ = new TreeNode(Non, "<struct_or_union_specifier>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| struct_or_union identifier	{
			$$ = new TreeNode(Non, "<struct_or_union_specifier>");
			$$->addChild($1); $$->addChild($2);
		}
	;

struct_or_union
	: struct	{ $$ = new TreeNode(Non, "<struct_or_union>"); $$->addChild($1); }
	| union		{ $$ = new TreeNode(Non, "<struct_or_union>"); $$->addChild($1); }
	;

struct_declaration_list
	: struct_declaration	{ $$ = new TreeNode(Non, "<struct_declaration_list>"); $$->addChild($1); }
	| struct_declaration_list struct_declaration	{ $$ = $1; $$->addChild($2); }
	;

struct_declaration		/* for anonymous struct/union */
	: specifier_qualifier_list semicolon	{ 
			$$ = new TreeNode(Non, "<struct_declaration>");
			$$->addChild($1); $$->addChild($2);
		}
	| specifier_qualifier_list struct_declarator_list semicolon	{ 
			$$ = new TreeNode(Non, "<struct_declaration>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| static_assert_declaration	{ $$ = new TreeNode(Non, "<struct_declaration>"); $$->addChild($1); }
	;

specifier_qualifier_list
	: type_qualifier	{ $$ = new TreeNode(Non, "<specifier_qualifier_list>"); $$->addChild($1); }
	| type_specifier	{ $$ = new TreeNode(Non, "<specifier_qualifier_list>"); $$->addChild($1); }
	| specifier_qualifier_list type_specifier	{ $$ = $1; $$->addChild($2); }
	| specifier_qualifier_list type_qualifier	{ $$ = $1; $$->addChild($2); }
	;

struct_declarator_list
	: struct_declarator	{ $$ = new TreeNode(Non, "<struct_declarator_list>"); $$->addChild($1); }
	| struct_declarator_list comma struct_declarator	{ $$ = $1; $$->addChild($2); $$->addChild($3); }
	;

struct_declarator
	: colon constant_expression	{
			$$ = new TreeNode(Non, "<struct_declarator>");
			$$->addChild($1); $$->addChild($2);
		}
	| declarator colon constant_expression	{
			$$ = new TreeNode(Non, "<struct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| declarator	{ $$ = new TreeNode(Non, "<struct_declarator>"); $$->addChild($1); }
	;

enum_specifier
	: enum brace_l enumerator_list brace_r	{
			$$ = new TreeNode(Non, "<enum_specifier>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| enum brace_l enumerator_list comma brace_r	{
			$$ = new TreeNode(Non, "<enum_specifier>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| enum identifier brace_l enumerator_list brace_r	{
			$$ = new TreeNode(Non, "<enum_specifier>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| enum identifier brace_l enumerator_list comma brace_r	{
			$$ = new TreeNode(Non, "<enum_specifier>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6);
		}
	| enum identifier	{
			$$ = new TreeNode(Non, "<enum_specifier>");
			$$->addChild($1); $$->addChild($2);
		}
	;

enumerator_list
	: enumerator	{ $$ = new TreeNode(Non, "<enumerator_list>"); $$->addChild($1); }
	| enumerator_list comma enumerator	{ $$ = $1; $$->addChild($2); $$->addChild($3); }
	;

enumerator	/* identifiers must be flagged as ENUMERATION_CONSTANT */
	: enumeration_constant	{ $$ = new TreeNode(Non, "<enumerator>"); $$->addChild($1); }
	| enumeration_constant equal constant_expression	{
			$$ = new TreeNode(Non, "<enumerator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

atomic_type_specifier
	: atomic bracket_l type_name bracket_r	{
			$$ = new TreeNode(Non, "<atomic_type_specifier>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	;

type_qualifier
	: const		{ $$ = new TreeNode(Non, "<type_qualifier>"); $$->addChild($1); }
	| restrict	{ $$ = new TreeNode(Non, "<type_qualifier>"); $$->addChild($1); }
	| volatile	{ $$ = new TreeNode(Non, "<type_qualifier>"); $$->addChild($1); }
	| atomic	{ $$ = new TreeNode(Non, "<type_qualifier>"); $$->addChild($1); }
	;

function_specifier
	: inline	{ $$ = new TreeNode(Non, "<function_specifier>"); $$->addChild($1); }
	| noreturn	{ $$ = new TreeNode(Non, "<function_specifier>"); $$->addChild($1); }
	;

alignment_specifier
	: alignas bracket_l type_name bracket_r	{
			$$ = new TreeNode(Non, "<alignment_specifier>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| alignas bracket_l constant_expression bracket_r	{
			$$ = new TreeNode(Non, "<alignment_specifier>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	;

declarator
	: direct_declarator	{ $$ = new TreeNode(Non, "<declarator>"); $$->addChild($1); }
	| pointer direct_declarator	{
			$$ = new TreeNode(Non, "<declarator>");
			$$->addChild($1); $$->addChild($2);
		}
	;

direct_declarator
	: identifier	{ $$ = new TreeNode(Non, "<direct_declarator>"); $$->addChild($1); }
	| bracket_l declarator bracket_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| direct_declarator array_l array_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| direct_declarator array_l star array_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| direct_declarator array_l static type_qualifier_list assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6);
		}
	| direct_declarator array_l static assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| direct_declarator array_l type_qualifier_list star array_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| direct_declarator array_l type_qualifier_list static assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6);
		}
	| direct_declarator array_l type_qualifier_list assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| direct_declarator array_l type_qualifier_list array_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| direct_declarator array_l assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| direct_declarator bracket_l parameter_type_list bracket_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| direct_declarator bracket_l bracket_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| direct_declarator bracket_l identifier_list bracket_r	{
			$$ = new TreeNode(Non, "<direct_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	;

pointer
	: star type_qualifier_list pointer	{
			$$ = new TreeNode(Non, "<pointer>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| star type_qualifier_list	{
			$$ = new TreeNode(Non, "<pointer>");
			$$->addChild($1); $$->addChild($2);
		}
	| star pointer	{
			$$ = new TreeNode(Non, "<pointer>");
			$$->addChild($1); $$->addChild($2);
		}
	| star	{
			$$ = new TreeNode(Non, "<pointer>");
			$$->addChild($1);
		}
	;

type_qualifier_list
	: type_qualifier	{ $$ = new TreeNode(Non, "<type_qualifier_list>"); $$->addChild($1); }
	| type_qualifier_list type_qualifier	{
			$$ = $1; $$->addChild($2);
		}
	;


parameter_type_list
	: parameter_list comma ellipsis	{
			$$ = new TreeNode(Non, "<parameter_type_list>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| parameter_list	{ $$ = new TreeNode(Non, "<parameter_type_list>"); $$->addChild($1); }
	;

parameter_list
	: parameter_declaration	{ $$ = new TreeNode(Non, "<parameter_list>"); $$->addChild($1); }
	| parameter_list comma parameter_declaration	{
			$$ = $1; $$->addChild($2); $$->addChild($3);
		}
	;

parameter_declaration
	: declaration_specifiers declarator	{
			$$ = new TreeNode(Non, "<parameter_declaration>");
			$$->addChild($1); $$->addChild($2);
		}
	| declaration_specifiers abstract_declarator	{
			$$ = new TreeNode(Non, "<parameter_declaration>");
			$$->addChild($1); $$->addChild($2);
		}
	| declaration_specifiers	{
			$$ = new TreeNode(Non, "<parameter_declaration>");
			$$->addChild($1);
		}
	;

identifier_list
	: identifier	{
			$$ = new TreeNode(Non, "<identifier_list>");
			$$->addChild($1);
		}
	| identifier_list comma identifier	{
			$$ = $1; $$->addChild($2); $$->addChild($3);
		}
	;

type_name
	: specifier_qualifier_list abstract_declarator	{
			$$ = new TreeNode(Non, "<type_name>");
			$$->addChild($1); $$->addChild($2);
		}
	| specifier_qualifier_list	{
			$$ = new TreeNode(Non, "<type_name>");
			$$->addChild($1);
		}
	;

abstract_declarator
	: pointer direct_abstract_declarator	{
			$$ = new TreeNode(Non, "<abstract_declarator>");
			$$->addChild($1); $$->addChild($2);
		}
	| pointer	{
			$$ = new TreeNode(Non, "<abstract_declarator>");
			$$->addChild($1);
		}
	| direct_abstract_declarator	{
			$$ = new TreeNode(Non, "<abstract_declarator>");
			$$->addChild($1);
		}
	;

direct_abstract_declarator
	: bracket_l abstract_declarator bracket_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| array_l array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2);
		}
	| array_l star array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| array_l static type_qualifier_list assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| array_l static assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| array_l type_qualifier_list static assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| array_l type_qualifier_list assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| array_l type_qualifier_list array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| array_l assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| direct_abstract_declarator array_l array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| direct_abstract_declarator array_l star array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| direct_abstract_declarator array_l static type_qualifier_list assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6);
		}
	| direct_abstract_declarator array_l static assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| direct_abstract_declarator array_l type_qualifier_list assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| direct_abstract_declarator array_l type_qualifier_list static assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6);
		}
	| direct_abstract_declarator array_l type_qualifier_list array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| direct_abstract_declarator array_l assignment_expression array_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| bracket_l bracket_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2);
		}
	| bracket_l parameter_type_list bracket_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| direct_abstract_declarator bracket_l bracket_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| direct_abstract_declarator bracket_l parameter_type_list bracket_r	{
			$$ = new TreeNode(Non, "<direct_abstract_declarator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	;

initializer
	: brace_l initializer_list brace_r	{
			$$ = new TreeNode(Non, "<initializer>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| brace_l initializer_list comma brace_r	{
			$$ = new TreeNode(Non, "<initializer>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| assignment_expression	{
			$$ = new TreeNode(Non, "<initializer>");
			$$->addChild($1);
		}
	;

initializer_list
	: designation initializer	{
			$$ = new TreeNode(Non, "<initializer_list>");
			$$->addChild($1); $$->addChild($2);
		}
	| initializer	{
			$$ = new TreeNode(Non, "<initializer_list>");
			$$->addChild($1);
		}
	| initializer_list comma designation initializer	{
			$$ = new TreeNode(Non, "<initializer_list>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| initializer_list comma initializer	{
			$$ = new TreeNode(Non, "<initializer_list>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

designation
	: designator_list equal	{
			$$ = new TreeNode(Non, "<designation>");
			$$->addChild($1); $$->addChild($2);
		}
	;

designator_list
	: designator	{ $$ = new TreeNode(Non, "<designator_list>"); $$->addChild($1); }
	| designator_list designator	{
			$$ = $1; $$->addChild($2);
		}
	;

designator
	: array_l constant_expression array_r	{
			$$ = new TreeNode(Non, "<designator>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| dot identifier	{
			$$ = new TreeNode(Non, "<designator>");
			$$->addChild($1); $$->addChild($2);
		}
	;

static_assert_declaration
	: static_assert bracket_l constant_expression comma string_literal bracket_r semicolon	{
			$$ = new TreeNode(Non, "<static_assert_declaration>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6); $$->addChild($7);
		}
	;

statement
	: labeled_statement	{ $$ = new TreeNode(Non, "<statement>"); $$->addChild($1); }
	| compound_statement	{ $$ = new TreeNode(Non, "<statement>"); $$->addChild($1); }
	| expression_statement	{ $$ = new TreeNode(Non, "<statement>"); $$->addChild($1); }
	| selection_statement	{ $$ = new TreeNode(Non, "<statement>"); $$->addChild($1); }
	| iteration_statement	{ $$ = new TreeNode(Non, "<statement>"); $$->addChild($1); }
	| jump_statement	{ $$ = new TreeNode(Non, "<statement>"); $$->addChild($1); }
	;

labeled_statement
	: identifier colon statement	{
			$$ = new TreeNode(Non, "<labeled_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| case constant_expression colon statement	{
			$$ = new TreeNode(Non, "<labeled_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| default colon statement	{
			$$ = new TreeNode(Non, "<labeled_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

compound_statement
	: brace_l brace_r	{
			$$ = new TreeNode(Non, "<compound_statement>");
			$$->addChild($1); $$->addChild($2);
		}
	| brace_l  block_item_list brace_r	{
			$$ = new TreeNode(Non, "<compound_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

block_item_list
	: block_item	{ $$ = new TreeNode(Non, "<block_item_list>"); $$->addChild($1); }
	| block_item_list block_item	{
			$$ = $1; $$->addChild($2);
		}
	;

block_item
	: declaration	{ $$ = new TreeNode(Non, "<block_item>"); $$->addChild($1); }
	| statement	{ $$ = new TreeNode(Non, "<block_item>"); $$->addChild($1); }
	;

expression_statement
	: semicolon	{ $$ = new TreeNode(Non, "<expression_statement>"); $$->addChild($1); }
	| expression semicolon	{ $$ = new TreeNode(Non, "<expression_statement>"); $$->addChild($1); $$->addChild($2); }
	;

selection_statement
	: if bracket_l expression bracket_r statement else statement	{
			$$ = new TreeNode(Non, "<selection_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6); $$->addChild($7);
		}
	| if bracket_l expression bracket_r statement	{
			$$ = new TreeNode(Non, "<selection_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| switch bracket_l expression bracket_r statement	{
			$$ = new TreeNode(Non, "<selection_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	;

iteration_statement
	: while bracket_l expression bracket_r statement	{
			$$ = new TreeNode(Non, "<iteration_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5);
		}
	| do statement while bracket_l expression bracket_r semicolon	{
			$$ = new TreeNode(Non, "<iteration_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6); $$->addChild($7);
		}
	| for bracket_l expression_statement expression_statement bracket_r statement	{
			$$ = new TreeNode(Non, "<iteration_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6);
		}
	| for bracket_l expression_statement expression_statement expression bracket_r statement	{
			$$ = new TreeNode(Non, "<iteration_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6); $$->addChild($7);
		}
	| for bracket_l declaration expression_statement bracket_r statement	{
			$$ = new TreeNode(Non, "<iteration_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6);
		}
	| for bracket_l declaration expression_statement expression bracket_r statement	{
			$$ = new TreeNode(Non, "<iteration_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4); $$->addChild($5); $$->addChild($6); $$->addChild($7);
		}
	;

jump_statement
	: goto identifier semicolon	{
			$$ = new TreeNode(Non, "<jump_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	| continue semicolon	{
			$$ = new TreeNode(Non, "<jump_statement>");
			$$->addChild($1); $$->addChild($2);
		}
	| break semicolon	{
			$$ = new TreeNode(Non, "<jump_statement>");
			$$->addChild($1); $$->addChild($2);
		}
	| return semicolon	{
			$$ = new TreeNode(Non, "<jump_statement>");
			$$->addChild($1); $$->addChild($2);
		}
	| return expression semicolon	{
			$$ = new TreeNode(Non, "<jump_statement>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

translation_unit
	: external_declaration	{
		root = new TreeNode(Non, "<translation_unit>");
		root->addChild($1);
	}
	| translation_unit external_declaration	{
		root->addChild($2);
	}
	;

external_declaration
	: function_definition	{ $$ = new TreeNode(Non, "<external_declaration>"); $$->addChild($1); }
	| declaration		{ $$ = new TreeNode(Non, "<external_declaration>"); $$->addChild($1); }
	;

function_definition
	: declaration_specifiers declarator declaration_list compound_statement	{
			$$ = new TreeNode(Non, "<function_definition>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3); $$->addChild($4);
		}
	| declaration_specifiers declarator compound_statement	{
			$$ = new TreeNode(Non, "<function_definition>");
			$$->addChild($1); $$->addChild($2); $$->addChild($3);
		}
	;

declaration_list
	: declaration	{ $$ = new TreeNode(Non, "<declaration_list>"); $$->addChild($1); }
	| declaration_list declaration	{
			$$ = $1; $$->addChild($2);
		}
	;

%%

int yyerror(const char *s)
{
	fflush(stdout);
	fprintf(stderr, "*** %s\n", s);
	return -1;
}