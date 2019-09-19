#include "y.tab.h"
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include "tree.h"
using namespace std;

extern FILE* yyin;
extern FILE* yyout;
TreeNode* root;

int main(int argc, char** argv)
{
    int i;
    for (i = 1; i < argc; i++)
    {
        if ((strcmp(argv[i], "-I") == 0) || (strcmp(argv[i], "--input") == 0))
        {
            yyin = fopen(argv[i+1], "r");
            if (yyin == NULL)
            {
                fprintf(stderr, "Cannot open %s\n", argv[i+1]);
                exit(-1);
            }
        }
        if ((strcmp(argv[i], "-O") == 0) || (strcmp(argv[i], "--output") == 0))
        {
            yyout = fopen(argv[i+1], "w");
            if (yyout == NULL)
            {
                fprintf(stderr, "Cannot open %s\n", argv[i+1]);
                exit(-1);
            }
        }
    }
    yyparse();
    root->printTree(0, yyout);
    return 0;
}