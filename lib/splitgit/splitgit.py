#!/usr/bin/python

import os, sys, getopt

PROG = argv[0]
NUMARGS = len(sys.argv)
RDT_BASE = "~/CODING_PROJECTS/C_workspaces/rdt_workspaces"
SG_PARENT='{}'
SG_DRAWER=''
SG_PREFIX=''
opts = []
args = []

class RepoCracker:

	def resolve_relativepath(self, full_basepath, drawer_name):
		'''returns a string corresponding to the repative path for `drawer` directory from `base` directory.'''
  		orig, curr = os.getcwd()
  		if():
  			os.chdir()
  			return True

	# make a local targetlist including all children of `parent` that match `pattern`
	def mk_local_targetlist_frmchldrn(self, parent, pattern):
   	
   	locals = []

	# TODO uncomment & define for public version; not needed for the first version
# make a local targetlist including all children of `parent` except excluded
# def mk_local_trgtls_fromchildren(self,parent,pattern):

def mk_drawerlist_remoted():

def main(argv):
   
   try:
   	getopt.getopt(argv, "hvVd:p:", ["drawer=","message-prefix="])
   except getopt.GetoptError:
      os.system("/usr/bin/bash; . ./liberrors-sh/*sh; throw_fatal_error 140")
   
   
   