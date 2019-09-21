# -*- coding: utf-8 -*-
"""
Created on Wed Sept 18 20:03:50 2019

@author: DrLC
"""

import ctypes
import os
import sys
import io
import copy

from .error import SyntaxError

_libparser = ctypes.cdll.LoadLibrary(os.path.join(os.path.split(os.path.realpath(__file__))[0], "../lib/parser.so"))

_getStructuredParsingTree = _libparser.getStructuredParsingTree
_getStructuredParsingTree.restype = ctypes.POINTER(ctypes.c_char)
_getStructuredParsingTree.argtypes = [ctypes.POINTER(ctypes.c_char)]

_printParsingTree = _libparser.printParsingTree
_printParsingTree.argtypes = [ctypes.POINTER(ctypes.c_char)]

_freeCharPtr = _libparser.freeCharPtr
_freeCharPtr.argtypes = [ctypes.POINTER(ctypes.c_char)]

class TreeNode(object):

    def __init__(self, _type, _str):

        if _type not in ['*', '#']:
            raise(TypeError("Invalid _type: "+str(_type)
                +".\nPlease use valid string type: \"*\" (non-terminated) or \"#\" (terminated)."+str(_str)))
        if not isinstance(_str, str):
            raise(TypeError("Invalid _str: "+str(_str)
                +".\nPlease use valid string type."))
        if _type == '*':
            self._type = '*'
            self._non = True
            self._ter = False
        else: # _type == '#'
            self._type = '#'
            self._ter = True
            self._non = False
        self._val = _str
        self._parent = None
        self._children = []

    def addChild(self, _child):

        if not isinstance(_child, TreeNode):
            raise(TypeError("Invalid _child: "+str(_child)
                +".\nPlease use valid TreeNode type."))
        self._children.append(_child)

    def delChild(self, _child):

        if not isinstance(_child, TreeNode):
            raise(TypeError("Invalid _child: "+str(_child)
                +".\nPlease use valid TreeNode type."))
        self._children.remove(_child)
    
    def setParent(self, _parent):

        if not isinstance(_parent, TreeNode):
            raise(TypeError("Invalid _parent: "+str(_parent)
                +".\nPlease use valid TreeNode type."))
        self._parent = _parent

    def getChildren(self):

        return self._children

    def getParent(self):

        return self._parent

    def getValue(self):

        return self._val

    def getType(self):

        return self._type

    def printTree(self, _outfile=sys.stdout):

        if not isinstance(_outfile, io.IOBase):
            raise(TypeError("Invalid _outfile: "+str(_outfile)
                +".\nPlease use valid file type: sys.stdout or open(\"PATH/TO/YOUR/FILE\", \"w\"), etc."))
        self._printTree(0, _outfile)

    def getStructuredParsingTree(self, _outstr):

        if not isinstance(_outstr, str):
            raise(TypeError("Invalid _outstr: "+str(_outstr)
                +".\nPlease use valid string type."))
        _outstr += "{"+self._type
        if self._val in ['{', '}']:
            _outstr += "("+self._val+")"
        else:
            _outstr += self._val
        for _c in self._children:
            _outstr = _c.getStructuredParsingTree(_outstr)
        _outstr += "}"
        return _outstr

    def _printNode(self, _depth, _outfile=sys.stdout):

        if not isinstance(_depth, int):
            raise(TypeError("Invalid _depth: "+str(_depth)
                +".\nPlease use valid integer type."))
        if not isinstance(_outfile, io.IOBase):
            raise(TypeError("Invalid _outfile: "+str(_outfile)
                +".\nPlease use valid file type: sys.stdout or open(\"PATH/TO/YOUR/FILE\", \"w\"), etc."))
        print("\t"*_depth, end="")
        print("["+self._type+"] "+self._val)

    def _printTree(self, _depth, _outfile=sys.stdout):

        if not isinstance(_depth, int):
            raise(TypeError("Invalid _depth: "+str(_depth)
                +".\nPlease use valid integer type."))
        if not isinstance(_outfile, io.IOBase):
            raise(TypeError("Invalid _outfile: "+str(_outfile)
                +".\nPlease use valid file type: sys.stdout or open(\"PATH/TO/YOUR/FILE\", \"w\"), etc."))
        self._printNode(_depth, _outfile)
        for _c in self._children:
            _c._printTree(_depth+1, _outfile)

class SymTab(object):

    def __init__(self, _root):

        if not isinstance(_root, TreeNode):
            raise(TypeError("Invalid _root: "+str(_root)
                +".\nPlease use valid TreeNode type."))
        self._syms = set([])
        self._findSymbol(_root)

    def _findSymbol(self, _node):

        if not isinstance(_node, TreeNode):
            raise(TypeError("Invalid _node: "+str(_node)
                +".\nPlease use valid TreeNode type."))
        children = _node.getChildren()
        if (_node.getValue() == "direct_declarator" and len(children) == 1
            and children[0].getType() == '#' and children[0].getValue() not in self._syms):
            self._syms.add(children[0].getValue())
        for _c in children:
            self._findSymbol(_c)

    def getSymbols(self):

        return copy.deepcopy(self._syms)

    def removeSymbol(self, _sym):

        if not isinstance(_sym, str):
            raise(TypeError("Invalid _sym: "+str(_sym)
                +".\nPlease use valid string type."))
        try:
            self._syms.remove(_sym)
            return 0
        except KeyError:
            return -1
        return -2

    def addSymbol(self, _sym):

        if not isinstance(_sym, str):
            raise(TypeError("Invalid _sym: "+str(_sym)
                +".\nPlease use valid string type."))
        self._syms.add(_sym)

def getStructuredParsingTree(_input):

    if not isinstance(_input, str):
        raise(TypeError("Invalid _input: "+str(_input)
            +".\nPlease use valid string type."))
    inp = ctypes.create_string_buffer(str.encode(_input))
    char_ptr = _getStructuredParsingTree(inp)
    ret = ctypes.c_char_p.from_buffer(char_ptr).value
    _freeCharPtr(char_ptr)
    return ret.decode()

def printParsingTree(_input):

    if not isinstance(_input, str):
        raise(TypeError("Invalid _input: "+str(_input)
            +".\nPlease use valid string type."))
    inp = ctypes.create_string_buffer(str.encode(_input))
    _printParsingTree(inp)
    return None

def getParsingTree(_input):

    if not isinstance(_input, str):
        raise(TypeError("Invalid _input: "+str(_input)
            +".\nPlease use valid string type."))
    
    structedParsingTree = getStructuredParsingTree(_input)
    if structedParsingTree == "":
        return None
    root = TreeNode("*", "<pseudo-root>")
    currNode = root
    currIdx = 0
    while currIdx < len(structedParsingTree):
        if structedParsingTree[currIdx] == '{':
            i = currIdx + 2
            while structedParsingTree[i] not in ['}', '{'] or structedParsingTree[i-1:i+2] in ["({)", "(})"]:
                i += 1
            if structedParsingTree[currIdx+2:i] in ["({)", "(})"]:
                tmpNode = TreeNode(structedParsingTree[currIdx+1], structedParsingTree[currIdx+3:i-1])
            else:
                tmpNode = TreeNode(structedParsingTree[currIdx+1], structedParsingTree[currIdx+2:i])
            currNode.addChild(tmpNode)
            tmpNode.setParent(currNode)
            currNode = tmpNode
            currIdx = i
        elif structedParsingTree[currIdx] == '}':
            currNode = currNode.getParent()
            currIdx += 1
        else:
            currIdx += 1
    return root.getChildren()[0]

def getSymbolTable(_input):

    if isinstance(_input, str):
        root = getParsingTree(_input)
        return SymTab(root)
    elif isinstance(_input, TreeNode):
        return SymTab(_input)
    else:
        raise(TypeError("Invalid _input: "+str(_input)
            +".\nPlease use valid string or TreeNode type."))