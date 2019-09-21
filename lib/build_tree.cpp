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
TreeNode* curr;

void deleteTree(TreeNode* root)
{
    for (int i = 0; i < root->children.size(); i++)
        if (root->children[i] != NULL)
            deleteTree(root->children[i]);
    delete root;
}

void deleteChain(TreeNode* root)
{
    TreeNode* tmp;
    while(root != NULL)
    {
        tmp = root->next;
        delete root;
        root = tmp;
    }
}

extern "C"
{
    char* getStructuredParsingTree(char* input)
    {
        YY_BUFFER_STATE buffer = yy_scan_string(input);
        yy_switch_to_buffer(buffer);
        root = new TreeNode(Non, "<translation_unit>", NULL);
        curr = root;
        if (yyparse() == 0)
        {
            yy_delete_buffer(buffer);
            char* ret = strdup((root->structuredTree("")).c_str());
            deleteTree(root);
            return ret;
        }
        else
        {
            yy_delete_buffer(buffer);
            deleteChain(curr);
            return strdup("");
        }
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
        root = new TreeNode(Non, "<translation_unit>", NULL);
        curr = root;
        if (yyparse() == 0)
        {
            root->printTree(0, yyout);
            deleteTree(root);
        }
        else
        {
           fprintf(stderr, "Syntax Error!\n");
           deleteChain(curr);
        }
        yy_delete_buffer(buffer);
        return;
    }
}