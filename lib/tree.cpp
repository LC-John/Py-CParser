#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <vector>
#include "tree.h"
using namespace std;

TreeNode::TreeNode(NodeType _type, string _str, TreeNode* _node)
{
    type = _type;
    str = _str;
    parent = NULL;
    children = vector<TreeNode*>();
    next = _node;
#ifdef TREE_NODE_DEBUG
    printNode(0);
#endif // TREE_NODE_DEBUG
}

TreeNode::~TreeNode()
{
#ifdef TREE_NODE_DEBUG
    cout << "del " << str << endl;
#endif // TREE_NODE_DEBUG
}

int TreeNode::addChild(TreeNode* _child)
{
    if (type == Ter)
        return -1;
    children.push_back(_child);
    return children.size();
}

void TreeNode::printNode(int _depth, FILE* outfile)
{
    for (int i = 0; i < _depth; i++)
        fprintf(outfile, "\t");
    switch(type)
    {
        case Ter: fprintf(outfile, "[#] "); break;
        case Non: fprintf(outfile, "[*] "); break;
        default: break;
    }
    fprintf(outfile, "%s\n", str.c_str());
}

void TreeNode::printTree(int _depth, FILE* outfile)
{
    printNode(_depth, outfile);
    for (int i = 0; i < children.size(); i++)
        children[i]->printTree(_depth+1, outfile);
}

string TreeNode::structuredTree(string out)
{
    out += "{";
    switch(type)
    {
        case Ter: out += "#"; break;
        case Non: out += "*"; break;
        default: break;
    }
    if (str[1] == '{' || str[1] == '}')
    {
        out += "(";
        out += str.substr(1, str.length()-2);
        out += ")";
    }
    else
        out += str.substr(1, str.length()-2);
    for (int i = 0; i < children.size(); i++)
        out = children[i]->structuredTree(out);
    out += "}";
    return out;
}

#ifdef TREE_NODE_DEBUG
int main()
{
    TreeNode* root = new TreeNode(Non, "root");
    root->addChild(new TreeNode(Non, "1-1"));
    root->addChild(new TreeNode(Non, "1-2"));
    root->addChild(new TreeNode(Ter, "1-3"));
    root->children[0]->addChild(new TreeNode(Non, "2-1"));
    root->children[0]->addChild(new TreeNode(Ter, "2-2"));
    root->children[1]->addChild(new TreeNode(Ter, "2-3"));
    root->children[1]->addChild(new TreeNode(Non, "2-4"));
    root->children[0]->children[0]->addChild(new TreeNode(Ter, "3-1"));
    root->children[1]->children[1]->addChild(new TreeNode(Ter, "3-1"));
    printf("\n");
    root->printTree(0);
    printf("\n");
    delete root;
    return 0;
}
#endif // TREE_NODE_DEBUG