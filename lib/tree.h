#ifndef PARSER_NODES
#define PARSER_NODES

#include <string>
#include <vector>
#include <cstdio>
using namespace std;

extern FILE* yyout;

enum NodeType
{
    Ter, Non
};

struct TreeNode
{
public:
    NodeType type;
    string str;
    TreeNode* parent;
    vector<TreeNode*> children;
    TreeNode* next;

    TreeNode(NodeType _type, string _str, TreeNode* _node);
    ~TreeNode();
    int addChild(TreeNode* _child);
    void printTree(int depth, FILE* outfile);
    string structuredTree(string out);
private:
    void printNode(int depth, FILE* outfile);
};

#endif // !PARSER_NODES