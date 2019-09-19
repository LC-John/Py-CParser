# -*- coding: utf-8 -*-
"""
Created on Wed Sept 18 20:03:50 2019

@author: DrLC
"""

import ctypes
import os
import sys
import io

_libparser = ctypes.cdll.LoadLibrary(os.path.join(os.path.abspath(os.path.curdir), "parser.so"))

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
    
    def setParent(self, _parent):

        if not isinstance(_parent, TreeNode):
            raise(TypeError("Invalid _parent: "+str(_parent)
                +".\nPlease use valid TreeNode type."))
        self._parent = _parent

    def getChildren(self):

        return self._children

    def getParent(self):

        return self._parent

    def printTree(self, _depth, _outfile=sys.stdout):

        if not isinstance(_depth, int):
            raise(TypeError("Invalid _depth: "+str(_depth)
                +".\nPlease use valid integer type."))
        if not isinstance(_outfile, io.IOBase):
            raise(TypeError("Invalid _outfile: "+str(_outfile)
                +".\nPlease use valid file type: sys.stdout or open(\"PATH/TO/YOUR/FILE\", \"w\"), etc."))
        self._printNode(_depth, _outfile)
        for _c in self._children:
            _c.printTree(_depth+1, _outfile)

    def structuredParsingTree(self, _outstr):

        if not isinstance(_outstr, str):
            raise(TypeError("Invalid _outstr: "+str(_outstr)
                +".\nPlease use valid string type."))
        _outstr += "{"+self._type+self._val
        for _c in self._children:
            _outstr = _c.structuredParsingTree(_outstr)
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
    inp = ctypes.create_string_buffer(str.encode(inp))
    _printParsingTree(inp)
    return None

def getParsingTree(_input):

    if not isinstance(_input, str):
            raise(TypeError("Invalid _input: "+str(_input)
                +".\nPlease use valid string type."))
    structedParsingTree = getStructuredParsingTree(_input)
    root = TreeNode("*", "<pseudo-root>")
    currNode = root
    currIdx = 0
    while currIdx < len(structedParsingTree):
        if structedParsingTree[currIdx] == '{':
            i = currIdx + 2
            while structedParsingTree[i] not in ['>', ']'] and structedParsingTree[i-1:i+2] not in ["[>]", "[]]"]:
                i += 1
            tmpNode = TreeNode(structedParsingTree[currIdx+1], structedParsingTree[currIdx+2:i+1])
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