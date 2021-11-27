#!/usr/bin/python

import os, pathlib

class Drawer:
       ID = ''
       NAME = ''
       PATH = ''
       PATH_PARTS = ''
       
       def __init__(self,id,name,path):
          self.ID = id
          self.NAME = name
          p = pathlib.Path(path)
          self.PATH = p
          self.PATH_PARTS = p.parts
          self.PARENT = pathlib.parent(PUREPATH)