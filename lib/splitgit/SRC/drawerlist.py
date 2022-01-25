#!/usr/bin/python

import os, pathlib
from drawer import Drawer

class Drawerlist:

   
    def __init__(self, base):
        self.drwr_ls = []
        self.drwr_count = 0
        self.commonpath = base

    def add_drwr(str_drwrname):
        '''check that candidate is of type drawer. if no, throw TypeError'''
        self.drwr_ls.append(Drawer())