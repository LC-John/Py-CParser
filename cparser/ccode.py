# -*- coding: utf-8 -*-
"""
Created on Fri Sept 20 11:45:12 2019

@author: DrLC
"""

import copy

from .myparser import TreeNode, SymTab
from .myparser import getParsingTree, getSymbolTable

class CCode(object):

    def __init__(self, _input):

        if isinstance(_input, str):
            root = getParsingTree(_input)
            symtab = getSymbolTable(root)
        elif isinstance(_input, TreeNode):
            root = _input
            symtab = getSymbolTable(_input)
        else:
            raise(TypeError("Invalid _input: "+str(_input)
                +".\nPlease use valid string or TreeNode type."))
        self._root = root
        self._syms = symtab

    def getParsingTree(self):

        return copy.deepcopy(self._root)

    def getSymbolTable(self):

        return copy.deepcopy(self._syms)