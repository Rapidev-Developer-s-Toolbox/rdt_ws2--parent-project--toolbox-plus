#!/usr/bin/python

import Drawer, Drawerlist
import os, sys, getopt, pathlib

PROG = argv[0]
NUMARGS = len(sys.argv)
RDT_BASE = "~/CODING_PROJECTS/C_workspaces/rdt_workspaces"
SG_PARENT = pathlib.Path
SG_DRAWER = Drawer()
SG_PREFIX=''
SG_DRAWERLIST = {}
opts = []
args = []


rc = RepoCracker()

class RepoCracker:
       
   def __init__():
          
       

   def resolve_relativepath(self, basepath, drawerpath):
      '''returns a string corresponding to the repative path for drawer directory from base directory.'''
      curr = os.getcwd()
  	   orig_path = pathlib.Path('.')
         
      drwr_path = pathlib.Path(drawerpath) 
      base_path = pathlib.Path(basepath)
         
      if(drwr_path.is_relative_to(base_path)):
         return drwr_path.relative_to(base_path)
      else:    
         bpl = list(base_path.parts())
         dpl = list(drwr_path.parts())
         rpl = []
         for i in range(len(dpl)):
            if()
	    
   # make a local targetlist including all children of `parent` that match `pattern`
   def mk_local_targetlist_frmchldrn(self, parent, pattern):
      if(parent[0] == '/'):
         if(parent[-1] != '/'):
            parent.append('/')
            base_path = pathlib.Path(parent)
         locals = []

	# TODO uncomment & define for public version; not needed for the first version
   # make a local targetlist including all children of `parent` except excluded
   # def mk_local_trgtls_fromchildren(self,parent,pattern):

       def mk_drawerlist_remoted():
          True
          
       def main(argv):   
         try:
   	      getopt.getopt(argv, "hvVd:p:", ["drawer=","message-prefix="])
         except getopt.GetoptError:
            os.system("/usr/bin/bash; . ./liberrors-sh/*sh; throw_fatal_error 140")
   

       def __list_to_path(pathlist):
         if(pathlist[0] == '/'):
            res = '/'
            for i in range(1, len(pathlist)):
               pathlist[i].append('/')
               res.append(pathlist[i])