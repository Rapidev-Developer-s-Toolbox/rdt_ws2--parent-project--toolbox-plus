#!/usr/bin/python

import os, getopt, pathlib
from sys import argv

PROG = argv[0]
NUMARGS = len(argv)
RDT_BASE = "~/CODING_PROJECTS/C_workspaces/rdt_workspaces"
SG_PARENT = pathlib.Path
SG_DRAWER = Drawer()
SG_PREFIX=''
SG_DRAWERLIST = {}
opts = []
args = []


rc = RepoCracker()

def getargs(args_array):
   try:
      getopt.getopt(argv, "hvVd:p:", ["drawer=","message-prefix="])
   except getopt.GetoptError:
      os.system("/usr/bin/bash; . ./liberrors-sh/*sh; throw_fatal_error 140")

def main(argv):
   args = getargs(argv)
         
def print_usage():
   print('USAGE:')
   print('#      splitgit DRWR')                                            
   print('#               ~ create a new git repository with DRWR as base directory')
   print('#      splitgit all')                                    
   print('#               ~ same as running an instance of `splitgit DRWR` for every SG_drawer')
   print('#      splitgit (-d|--drawer) DRWR ')                               
   print('#               ~ create a new git repository with DRWR as base directory')
   print('#      splitgit (-d|--drawer) DRWR (-p|--message-prefix) PRFX')               
   print('#               ~ create a new git repository with DRWR as base directory and PRFX used as a prefix for any commits')
   print('#')
   print('#      Anywhere DRWR is listed above, it can be replaced with "all" as in the second version.')
   return 0