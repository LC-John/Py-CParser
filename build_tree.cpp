#include "y.tab.h"
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include "tree.h"
using namespace std;

extern FILE* yyin;
extern FILE* yyout;
typedef struct yy_buffer_state * YY_BUFFER_STATE;
extern YY_BUFFER_STATE yy_scan_string(const char * str); 
extern void yy_delete_buffer(YY_BUFFER_STATE buffer);
extern void yy_switch_to_buffer(YY_BUFFER_STATE buffer);
TreeNode* root;

extern "C"
{
    char* getStructuredParsingTree(char* input)
    {
        YY_BUFFER_STATE buffer = yy_scan_string(input);
        yy_switch_to_buffer(buffer);
        yyparse();
        yy_delete_buffer(buffer);
        return strdup((root->structuredTree("")).c_str());
    }
}

extern "C"
{
    void freeCharPtr(char* str)
    {
        if (str != NULL)
            free(str);
    }
}

extern "C"
{
    void printParsingTree(char* input)
    {
        YY_BUFFER_STATE buffer = yy_scan_string(input);
        yy_switch_to_buffer(buffer);
        yyparse();
        yy_delete_buffer(buffer);
        root->printTree(0, yyout);
        return;
    }
}